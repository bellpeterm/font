require 'zip/zipfilesystem'

def load_current_resource  
  @current_resource = Chef::Resource::Font.new(@new_resource.name)
  
  zipfile = "#{@current_resource.name}.zip"
  fontdir = case node["platform"]
    when "debian", "ubuntu"
      "/usr/local/share/fonts"
    when "mac_os_x", "mac_os_x_server"
      "/Library/Fonts"
    when "windows"
      "C:\Windows\Fonts"
  end
  
  if ::File.exist?("#{Chef::Config[:file_cache_path]}/#{zipfile}")
    list = Array.new
    
    Zip::ZipFile.open("#{Chef::Config[:file_cache_path]}/#{zipfile}") do |zipfile|
      zipfile.each do |f|
        list << f.name if f.name.match(/\.(ttf|ttc|dfon|dfont|otf)/)
      end
    end
    currentlist = Dir.new(fontdir).entries
    list.each do |filename|
      @current_resource.exists = false unless currentlist.include?(filename)
    end
    puts @current_resource.exists.to_s
    @current_resource.exists = true unless [ true , false ].include?(@current_resource.exists)
    puts @current_resource.exists.to_s
  end
  
end

action :install do
  if @current_resource.exists then
    Chef::Log.info "Font #{new_resource.name} already installed"
  else
    
    fontdir = case node["platform"]
      when "debian", "ubuntu"
        "/usr/local/share/fonts"
      when "mac_os_x", "mac_os_x_server"
        "/Library/Fonts"
      when "windows"
        "C:\Windows\Fonts"
    end
    zipfile = "#{new_resource.name}.zip"
    
    remote_file "#{Chef::Config[:file_cache_path]}/#{zipfile}" do
      source new_resource.source
      action :create
    end
    
    ruby_block "install_font" do
      block do
        Zip::ZipFile.open("#{Chef::Config[:file_cache_path]}/#{zipfile}") do |zipfile|
          zipfile.each do |f|
            zipfile.extract(f , "#{fontdir}/#{f.name}") if f.name.match(/\.(ttf|ttc|dfon|dfont|otf)/)
          end
        end
      end
      action :create
    end
    
  end
end

action :delete do
end
font Cookbook
=============

This cookbook provides an LWRP to download and install fonts from a given zip file.

Requirements
------------
This cookbook is currently tested on Ubuntu 12.04 and Mac OSX 11.8.  You need a zip file with the desired fonts in a location compatible with remote_file.

#### packages
- `rubyzip` - needed to unzip files and test whether fonts are already installed

Attributes
----------
#### font::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['font']['font_reg_source']</tt></td>
    <td>String</td>
    <td>Download path of fontreg.exe, required for Windows</td>
    <td><tt>nil</tt></td>
  </tr>
</table>

Usage
-----
#### font::default
Include this recipe prior to using the LWRP either in a node's run_list or in your recipe.

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Peter Bell <bellpeterm@gmail.com>

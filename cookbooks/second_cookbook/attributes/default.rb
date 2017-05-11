default['second_cookbook']['testvalue'] = "my test values of cookbook"
default['second_cookbook']['local_download_dir'] = "C:/chef"
default['second_cookbook']['installer_name'] = "Git-2.12.2.2-64-bit.exe"
default['second_cookbook']['remote_url'] = "https://github.com/git-for-windows/git/releases/download/v2.12.2.windows.2/#{node['second_cookbook']['installer_name']}"
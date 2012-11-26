case node['platform']
when 'ubuntu'
  node.set['nginx']['install_pkgs'] = %w{nginx}
end

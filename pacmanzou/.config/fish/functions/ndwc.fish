# Defined in - @ line 1
function ndwc --wraps='nmcli device wifi connect' --description 'alias ndwc nmcli device wifi connect'
  nmcli device wifi connect $argv;
end

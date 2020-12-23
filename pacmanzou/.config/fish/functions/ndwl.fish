# Defined in - @ line 1
function ndwl --wraps='nmcli device wifi list' --description 'alias ndwl nmcli device wifi list'
  nmcli device wifi list $argv;
end

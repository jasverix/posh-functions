
#example of getting task id of all "chromedriver" tasks
# ps | grep chromedriver | regex "\.\d+\s+(\d+)"

# to kill them all
# ps | grep chromedriver | regex "\.\d+\s+(\d+)" | foreach { kill -Id $_ }

# usage - as grep in linux
function grep {
  $input | out-string -stream | select-string $args
}

# usage: "ps | regex '(\d+')" will output all numbers of each line
function regex {
  $input | out-string -stream | select-string $args -AllMatches | Foreach-Object { $_.Matches | Foreach-Object { $out = ""; $first = 1; $_.Groups | Foreach-Object { if($First) {$First = 0;} else { $out += $_.Value + "    " } }; $out.Trim() } }
}

function tail {
	Get-Content -Path $args[0] -Wait
}

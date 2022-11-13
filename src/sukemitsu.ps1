# Shift-JIS でコード記述

##
# Assert-ExistFile: ファイル存在チェック
#
# @param {String} $filePath: ファイルパス
#
# @return {Boolean} : ファイルが存在すれば True, そうれなければ False
#
function Assert-ExistFile([String]$filePath) {
    return (Test-Path $filePath)
}

######################
# main process       #
######################
$year = (Get-Date).Year
$nextYear = $year + 1
if (-not (Assert-ExistFile $nextYear)) {
    New-Item $nextYear -ItemType Directory
}
Set-Location -path $nextYear

for ($month = 1; $month -lt 13; $month++){
    if (-not (Assert-ExistFile ([string]$month).PadLeft(2,"0"))) {
        New-Item ([string]$month).PadLeft(2,"0") -ItemType Directory
    }
}

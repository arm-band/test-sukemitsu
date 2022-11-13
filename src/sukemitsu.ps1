# Shift-JIS �ŃR�[�h�L�q

##
# Assert-ExistFile: �t�@�C�����݃`�F�b�N
#
# @param {String} $filePath: �t�@�C���p�X
#
# @return {Boolean} : �t�@�C�������݂���� True, ������Ȃ���� False
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

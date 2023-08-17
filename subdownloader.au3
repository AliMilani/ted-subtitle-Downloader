#include <String.AU3>
#include <array.au3>
#include <WinAPIFiles.au3>

Global $inurl = InputBox("TedSubDownloader","Enter URL","https://www.ted.com/talks/..................")

Func geturl($surl)
Global $Bin = InetRead ($surl)
Global $Page = BinaryToString ($Bin)
$icode = _StringBetween($page, '"stream":"https://hls.ted.com/talks/' , '.m3u8?preroll="')
Return $icode[0]
EndFunc

Func subdownload($iPageid)
    ShellExecute("https://hls.ted.com/talks/" & $iPageid & "/subtitles/fa/full.vtt?preroll=&qr")
EndFunc

$iPageid = geturl($inurl)
subdownload($iPageid)
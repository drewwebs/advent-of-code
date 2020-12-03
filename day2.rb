# Our sponsors help make Advent of Code possible:
# American Express - We architect, code and ship software that makes us an essential part of our customers’ digital lives. Work with the latest tech and back the engineering community through open source. Find your place in tech on #TeamAmex.
# --- Day 2: Password Philosophy ---
# Your flight departs in a few days from the coastal airport; the easiest way down to the coast from here is via toboggan.

# The shopkeeper at the North Pole Toboggan Rental Shop is having a bad day. "Something's wrong with our computers; we can't log in!" You ask if you can take a look.

# Their password database seems to be a little corrupted: some of the passwords wouldn't have been allowed by the Official Toboggan Corporate Policy that was in effect when they were chosen.

# To try to debug the problem, they have created a list (your puzzle input) of passwords (according to the corrupted database) and the corporate policy when that password was set.

# For example, suppose you have the following list:

# 1-3 a: abcde
# 1-3 b: cdefg
# 2-9 c: ccccccccc
# Each line gives the password policy and then the password. The password policy indicates the lowest and highest number of times a given letter must appear for the password to be valid. For example, 1-3 a means that the password must contain a at least 1 time and at most 3 times.

# In the above example, 2 passwords are valid. The middle password, cdefg, is not; it contains no instances of b, but needs at least 1. The first and third passwords are valid: they contain one a or nine c, both within the limits of their respective policies.

# How many passwords are valid according to their policies?

# Your puzzle answer was 410.

# --- Part Two ---
# While it appears you validated the passwords correctly, they don't seem to be what the Official Toboggan Corporate Authentication System is expecting.

# The shopkeeper suddenly realizes that he just accidentally explained the password policy rules from his old job at the sled rental place down the street! The Official Toboggan Corporate Policy actually works a little differently.

# Each policy actually describes two positions in the password, where 1 means the first character, 2 means the second character, and so on. (Be careful; Toboggan Corporate Policies have no concept of "index zero"!) Exactly one of these positions must contain the given letter. Other occurrences of the letter are irrelevant for the purposes of policy enforcement.

# Given the same example list from above:

# 1-3 a: abcde is valid: position 1 contains a and position 3 does not.
# 1-3 b: cdefg is invalid: neither position 1 nor position 3 contains b.
# 2-9 c: ccccccccc is invalid: both position 2 and position 9 contain c.
# How many passwords are valid according to the new interpretation of the policies?

# Your puzzle answer was 694.

# Both parts of this puzzle are complete! They provide two gold stars: **

# At this point, you should return to your Advent calendar and try another puzzle.

# If you still want to see it, you can get your puzzle input.

# You can also [Share] this puzzle.

INPUT = [
    ["13-15 c", "cqbhncccjsncqcc"],
    ["2-3 v", "zvdvfd"],
    ["9-14 b", "rbrbnbbbqdfrht"],
    ["11-12 k", "kkkkkkkkkkxqk"],
    ["4-5 b", "bqbbdm"],
    ["10-12 w", "kwwkwwwrwzzwwwwzwswx"],
    ["1-11 g", "grrmgmqgghw"],
    ["4-5 m", "mbmhmvmwdvxmvpw"],
    ["1-13 n", "ndnnnnnnnnnns"],
    ["11-18 l", "lllllllllllllllllll"],
    ["4-5 c", "cccscc"],
    ["2-4 k", "bkfr"],
    ["9-13 k", "lcmsvkknrxtkkksgvkjg"],
    ["1-2 b", "bhwgb"],
    ["1-4 j", "zjjcjj"],
    ["7-11 g", "nnffggdmggr"],
    ["3-4 z", "zzhzz"],
    ["4-10 g", "mggkgvgggmggkggmqg"],
    ["4-5 n", "dcmnl"],
    ["11-15 s", "gzpdvsmnzsshswzs"],
    ["10-14 x", "xmvpxjtlxxhxtpdhsnx"],
    ["5-15 v", "zzhjdpgxlsvphzv"],
    ["4-8 k", "dsfktqchpkk"],
    ["6-7 j", "jzjgjqld"],
    ["12-16 r", "rrrrrrrrrrrhrrrrhrr"],
    ["1-2 l", "lllllll"],
    ["2-3 q", "jqxwtggmgqmzpljdvkt"],
    ["8-11 p", "xpmcppppwvzp"],
    ["7-8 c", "vwcvkcct"],
    ["4-10 d", "lsmdffzdsrk"],
    ["2-3 p", "sxpg"],
    ["4-11 p", "rzlgxshhpbp"],
    ["1-4 b", "qbbbbbbbbbbb"],
    ["6-11 m", "zwmzmmlbmxgphkks"],
    ["1-4 n", "lnnnn"],
    ["15-16 h", "hhbdmbhchhhkhhrw"],
    ["10-11 k", "kkkqtwkkkkkkkkn"],
    ["2-13 m", "mggmmxmrzmwglbmmm"],
    ["12-14 g", "ggggrggggxgwhggggd"],
    ["7-11 l", "llbqsqlkvll"],
    ["1-3 f", "ffff"],
    ["4-9 h", "qvnhvcmpmfdbqhkdsg"],
    ["3-8 d", "ddsdddddd"],
    ["14-15 j", "qjjjzjjjjjbxmjs"],
    ["3-5 j", "jjjjtctjjjs"],
    ["12-13 q", "qqqqqqqqqqqqgqqq"],
    ["1-8 p", "xpppzdpp"],
    ["13-15 f", "lnlnlkcwgnfqgmfhlwm"],
    ["12-17 g", "gfgtgrvcxggggtggjg"],
    ["6-8 r", "rrrrtwrqrrr"],
    ["9-12 r", "ctldssjlrzhvpmqrtxd"],
    ["1-6 k", "qkkkdkkkkkk"],
    ["17-18 x", "bxrxxbxxzpbxnqxcsmn"],
    ["2-4 c", "ccmr"],
    ["1-7 m", "mmmmfrdmmmhl"],
    ["9-12 d", "ddddddddxddhd"],
    ["13-14 f", "ffffffffjffbbff"],
    ["4-6 c", "ccchcc"],
    ["6-7 r", "rrsrrrrcrrjbrrrr"],
    ["9-15 w", "wzfbtqrwwgtmbxn"],
    ["6-7 q", "qqqqqqrq"],
    ["1-7 l", "lgpqzhlkb"],
    ["6-8 d", "dhddkndp"],
    ["2-5 m", "bjxmmmmm"],
    ["5-16 t", "nbgjntfhpwtbrcftxt"],
    ["5-7 k", "kkkkkhbkkkkk"],
    ["8-19 t", "dsdstttfjhnttttvgttt"],
    ["3-4 t", "ttltttt"],
    ["1-5 l", "flfllllllllbhldll"],
    ["7-10 x", "xxxxxxcxxxx"],
    ["2-7 t", "ttttttctttt"],
    ["3-12 x", "vlxfwpdncxzkmkxt"],
    ["1-5 b", "mbbbbbdbbbtbwbhpbt"],
    ["3-16 q", "fpqkkkqfkqdbrxlq"],
    ["5-6 p", "lpcbtppjpt"],
    ["6-7 w", "wcwwhwv"],
    ["9-13 v", "vvvvvvvvvvvvvvv"],
    ["1-4 g", "vgggtggghgggggggg"],
    ["2-9 p", "mppsrrzwxdt"],
    ["4-5 f", "ffffdfffffdf"],
    ["2-5 x", "xkjss"],
    ["13-14 z", "zzzzzzzzzzzzbhzz"],
    ["2-10 p", "xmtkzpbrrj"],
    ["17-18 t", "ttttttttttttttttttt"],
    ["2-8 j", "cjjqbzpd"],
    ["4-12 z", "zzzkzzhzzpzzdzz"],
    ["1-2 d", "rdcdt"],
    ["2-3 j", "wnltj"],
    ["7-9 r", "rlrfbrdrqrbdr"],
    ["3-4 s", "bcsss"],
    ["12-14 h", "hhhhhhhhhhhbhhh"],
    ["3-5 h", "rfhlc"],
    ["8-15 f", "ffffffflffffffff"],
    ["3-15 s", "ssxsssssssssssss"],
    ["2-4 h", "hlbhshhmhhhg"],
    ["12-13 r", "rrrrrrrrmrvrnrr"],
    ["3-5 p", "ppppjp"],
    ["1-2 z", "zqhdkgqqzfsxkjjzg"],
    ["6-8 k", "kkkkkkzd"],
    ["1-12 h", "qhhhhhhhhxhhhhh"],
    ["9-14 p", "ppppppppqppppfp"],
    ["2-4 t", "tsttt"],
    ["18-19 t", "cttttllttttwxtttttt"],
    ["10-11 t", "rkdbpntntttfw"],
    ["4-14 m", "mdmmgtlmmwmbmmmk"],
    ["4-6 n", "xxhnpmnfnn"],
    ["15-16 g", "ggggggsggggggggng"],
    ["14-15 k", "kpjxmkrksskpbwk"],
    ["15-18 f", "fffffsffffffffnfffff"],
    ["18-19 p", "gwpplnpndvpxgzjvhbpp"],
    ["8-12 l", "ldclrkllbgpwllllcxms"],
    ["14-19 w", "pxsjbtwwhdkptwcxwvr"],
    ["2-17 m", "mtmmmmmmmmmmmmmmmm"],
    ["12-15 b", "nbcsplrmvbjbqlc"],
    ["1-4 z", "bzzszzzzz"],
    ["1-13 t", "tttttttttttttttttt"],
    ["6-7 j", "jjjjjmvjjjjjjjjjjj"],
    ["10-13 l", "llclllllljllllll"],
    ["11-12 c", "mzckxzsbbxcq"],
    ["2-14 k", "kkckkkkbkkkkkrkkkkkk"],
    ["3-5 s", "msssvqszssprssss"],
    ["7-10 f", "fffffffffrf"],
    ["2-4 l", "dlwrl"],
    ["3-7 v", "slqgljmrqrwv"],
    ["4-6 d", "pdddddnddddddd"],
    ["6-9 f", "cnfffpfzfffffff"],
    ["4-17 v", "vvvnvvvvvvvvvvvvvv"],
    ["7-9 q", "qqqqqqqqkqqqqqnqq"],
    ["15-16 q", "qqqqqqqqqqqqqqqqqq"],
    ["10-11 g", "cgtrgggggggggg"],
    ["10-12 x", "xxsxxsjxfxxlx"],
    ["3-12 j", "jjljjjjjjjjjjjj"],
    ["8-9 c", "ccbccczccthcc"],
    ["4-17 h", "hhhfhhshhhhhhhhhhhh"],
    ["1-2 p", "prppr"],
    ["4-12 q", "qqqdqqqqqqqqqqq"],
    ["7-11 b", "bbmbqbrtlwb"],
    ["4-7 l", "lllhlllllz"],
    ["3-4 r", "rrqc"],
    ["5-14 r", "rrrrcrrrrrrqrrrrrrr"],
    ["10-11 d", "pxdcxxjsddd"],
    ["9-11 s", "sssssssspssssssss"],
    ["1-2 j", "jfjljjjjjjjjjjjjjj"],
    ["3-4 v", "vqnvvv"],
    ["2-3 c", "wlcntvmsshxcgzc"],
    ["9-14 t", "rbbljpttwwjtbj"],
    ["10-11 s", "gnrdtfzttks"],
    ["1-4 x", "xpxjxhdxx"],
    ["9-12 c", "chccccccmpfccc"],
    ["14-16 j", "jjjjjjjjjjjjjxjjj"],
    ["5-6 d", "rpdndsbddwdd"],
    ["9-13 x", "thpdhlcwxcxxvxbv"],
    ["4-6 g", "nfsgqnvbntgwvlzlmmxg"],
    ["3-4 d", "dttdcdtq"],
    ["2-4 n", "wnntzbr"],
    ["2-10 j", "jtpszbpjfjcgdjg"],
    ["6-7 b", "bdspbvb"],
    ["10-14 z", "vzznzzzwzlzzqzj"],
    ["7-8 c", "cccccccc"],
    ["7-11 h", "hklhdhssfbz"],
    ["7-8 h", "hhhhhhqzhhhhhs"],
    ["3-5 b", "bcgbwbbbbbdb"],
    ["5-6 q", "qqlxqbgtqpkqt"],
    ["8-9 q", "qqqqqhqkq"],
    ["2-4 q", "qshp"],
    ["8-13 g", "gggggggrgggbgghg"],
    ["1-5 k", "ktcpgpk"],
    ["2-13 v", "mvvwnvfkjrhvvdvvtsvk"],
    ["12-13 k", "kxpkkkckjtkkj"],
    ["12-18 h", "xhqngjkxqqzqhnhhhh"],
    ["11-12 k", "kkkkkkkkkkkjk"],
    ["2-4 r", "rdgrrr"],
    ["3-4 x", "xwjx"],
    ["2-6 c", "lcqzflc"],
    ["13-14 t", "smlkctgbsqpftx"],
    ["4-5 b", "fxtdbzbqbd"],
    ["4-7 s", "wmsssznjzsdkgvdsxhd"],
    ["2-6 z", "wpptkhk"],
    ["14-16 p", "pppppzpppppbprppppp"],
    ["6-7 c", "cccccbw"],
    ["1-6 h", "mhhhhhh"],
    ["2-3 k", "cwkgk"],
    ["3-4 l", "llcl"],
    ["3-4 m", "kmmx"],
    ["14-20 h", "hhhhhhhhhhhrhhhhhhhh"],
    ["8-12 b", "bcmbpbffwghcvjb"],
    ["10-15 f", "fffdfqwmzfdfrfdbpf"],
    ["1-2 l", "hlllljl"],
    ["1-3 g", "vgbgg"],
    ["2-4 n", "zgfn"],
    ["18-20 w", "gmbwtzgzpmdwstsffqzw"],
    ["9-19 j", "jjjjjjjjkjjjjjjjjjjj"],
    ["16-19 f", "fffffffffffffrffffzf"],
    ["8-20 l", "htdlzwsllllccwlflstf"],
    ["3-4 w", "wwww"],
    ["2-4 b", "sbbz"],
    ["4-6 n", "nnrzbbnlcrnsbk"],
    ["7-8 c", "wmzjtbvw"],
    ["5-7 l", "cldlljlzzz"],
    ["5-6 h", "hhzhbhhg"],
    ["4-5 f", "scmrfftkc"],
    ["11-12 m", "flfrbmdpdkpm"],
    ["6-7 v", "xvvvcvkbnvvq"],
    ["4-11 h", "qkjphjpfllhpqnbm"],
    ["2-5 b", "bqbwbbwsb"],
    ["1-8 c", "cqcscccbccrccq"],
    ["1-13 c", "cccccccccccckccc"],
    ["7-8 h", "hhhhhhhs"],
    ["1-3 l", "llxl"],
    ["6-8 h", "hhhhsnkv"],
    ["6-13 m", "mmmmmmmmmmhmpmmm"],
    ["6-9 n", "nrnmmnbnmn"],
    ["7-14 k", "whkpphhkxlnnmkbhtnt"],
    ["4-10 n", "nnnnnnnnnhkn"],
    ["3-4 c", "mcnw"],
    ["8-13 b", "bbbbbbbgbbbbbbbbb"],
    ["8-9 c", "lcccdkjcjrqwck"],
    ["3-13 w", "szmnhsmzwpdbkhtbf"],
    ["4-5 r", "prrrz"],
    ["9-14 m", "mmmmmmmmgmmmmmm"],
    ["7-8 q", "kqpgrqqp"],
    ["16-17 p", "fzxxpcpdhmvmrnvjp"],
    ["7-9 v", "vvvvvvqzxs"],
    ["3-4 w", "qwxw"],
    ["1-2 x", "xqkx"],
    ["9-10 v", "vccmlrlhvdtttfvcxwm"],
    ["11-14 h", "mhvthqhvhhgmfhhhkhch"],
    ["3-4 n", "nqzw"],
    ["2-5 j", "jbjjjjjjjjjjjjjj"],
    ["11-15 g", "bcxggqfmgzgfrdg"],
    ["3-5 v", "gvwvvvrzf"],
    ["6-7 t", "ttzdttr"],
    ["4-9 j", "cgqjqdjvjbfjwdlvdgj"],
    ["5-6 s", "hfflrzksshjqsbvsps"],
    ["1-4 p", "pppn"],
    ["4-5 g", "dprggmpfggbkpg"],
    ["2-3 k", "kbhkkkk"],
    ["13-15 r", "srrrtstrwwxzrrzr"],
    ["2-4 b", "lbbnbzbb"],
    ["1-4 g", "fvgz"],
    ["5-11 q", "hxdhqrqqprpq"],
    ["2-4 z", "zzgm"],
    ["1-13 w", "wwwwhwwwwwwwwwwwww"],
    ["2-3 k", "kkkkk"],
    ["4-8 g", "nlgmhplgcv"],
    ["1-2 j", "zncllmvgjnj"],
    ["11-13 f", "fffffffffffflff"],
    ["2-8 p", "bphqpxkr"],
    ["2-9 b", "bbbbbbfbdbhjpbbbjbbb"],
    ["9-10 s", "zpxnstzwsw"],
    ["7-16 c", "ccccccccccccncsvccc"],
    ["6-8 r", "rrwbrqgr"],
    ["6-12 v", "vvvvvvvqvpvvvvzdd"],
    ["8-9 z", "zzzzbzzmzzz"],
    ["15-16 t", "tfttttntxttqtttc"],
    ["9-16 b", "btbrbfplbbbmbbbbkbb"],
    ["7-8 q", "qrqxrlqg"],
    ["8-12 q", "qqqqqqqpqqqw"],
    ["5-8 v", "jrrlpvvcvkjzjvvvv"],
    ["11-14 d", "dddddddddddddq"],
    ["5-6 f", "rfxmfzf"],
    ["3-4 t", "tttqt"],
    ["10-14 c", "bcccccccccrccfc"],
    ["3-7 n", "snnqplvl"],
    ["5-6 z", "kshzfzhlcsbqwqb"],
    ["6-11 s", "sssssssssmsjsgssss"],
    ["3-7 v", "qgcxvxvg"],
    ["12-17 v", "vkvbsvxkvvnjvvrvvvx"],
    ["2-4 d", "ddrrxbd"],
    ["8-10 x", "tvxxtmgbsxpxbl"],
    ["7-9 r", "rzrbgbrrrrrrmhm"],
    ["2-4 t", "ttttt"],
    ["5-9 x", "xxtwxxnssxlxx"],
    ["3-4 p", "ppdp"],
    ["3-7 g", "ggtgggtg"],
    ["1-2 k", "kbbhjdkfvjqffcss"],
    ["1-2 l", "lrlvlll"],
    ["10-12 x", "xjkbqxkxzxxq"],
    ["7-9 d", "dddhdkpdfdf"],
    ["5-8 m", "mmmmmmmwm"],
    ["3-9 l", "sfrjlzhcll"],
    ["7-18 m", "mmmmmmcmmmmmmmmmmmm"],
    ["1-3 w", "mwplxwwww"],
    ["7-8 t", "tgtctbtrtdtttt"],
    ["3-6 p", "lfpbbgfbpdhnqz"],
    ["5-6 d", "ddddrd"],
    ["1-3 b", "llbbbbb"],
    ["4-7 r", "ktbrncrrnnsrr"],
    ["8-10 r", "rrrrrrrfrrbrr"],
    ["1-8 l", "wlklvlllnljlgtzll"],
    ["2-4 m", "mmhmmxsm"],
    ["10-12 c", "cmwkcnczsxmcrmjtc"],
    ["2-8 q", "qmqqqqqzqq"],
    ["7-9 v", "xvvvvwdnzzv"],
    ["3-7 j", "lsjvmbrjjmpcwqnvvdgc"],
    ["3-9 l", "bgmllldjrzhllsclc"],
    ["1-6 p", "ptppfjpqpp"],
    ["7-8 r", "mctrrstrrxrqtmrr"],
    ["7-8 d", "qddddddxddddddddd"],
    ["4-11 r", "rrrrrrrrrrbr"],
    ["4-8 s", "lsfvtfss"],
    ["4-9 c", "zcccccccj"],
    ["11-12 v", "vvvvvvvvvvvm"],
    ["4-8 g", "rggzlfgtm"],
    ["3-8 j", "jjjjjjfhjsgj"],
    ["3-4 m", "fmhmm"],
    ["15-16 l", "ltllhlljtllllbtlllgl"],
    ["12-13 c", "cccccvcccccqccccc"],
    ["6-7 q", "qqnlqqhqqq"],
    ["1-8 z", "znjqzxpz"],
    ["10-13 k", "kxzmkbxnkbkktmkk"],
    ["8-15 k", "bskzvggzsnlnxzz"],
    ["9-10 v", "vbvvgvcwvs"],
    ["5-8 h", "qhsnhhlhwpvzfb"],
    ["15-16 g", "gdcgggggggtgcgtg"],
    ["8-9 z", "fbgdnrzfb"],
    ["6-7 d", "ddkdddh"],
    ["4-6 w", "xzgfwwlbxft"],
    ["1-3 h", "hkjhh"],
    ["1-3 p", "pwprlp"],
    ["8-12 j", "jdjjjjjdjjcjvjjjjjj"],
    ["11-14 m", "bdsfwddfkgxsmrmm"],
    ["3-10 m", "tmmcmfmmjmm"],
    ["3-4 b", "dwhbzfjxl"],
    ["2-5 n", "nnnnjcnnn"],
    ["16-17 v", "vvvfnvvvltsxhrvvm"],
    ["1-7 v", "qvvvvvwvvvdvv"],
    ["2-14 k", "nxqblwwqmhqzkm"],
    ["3-4 t", "ttts"],
    ["5-6 c", "clnnfk"],
    ["12-13 s", "sssssssssssts"],
    ["7-14 d", "ddqdnwdkdmhddg"],
    ["3-4 t", "tmsttm"],
    ["9-11 x", "xxxtxxxxxxqxwntxj"],
    ["8-14 l", "lllqklwlvlllmbslzlln"],
    ["9-12 n", "sdsnnfncxnwnrn"],
    ["1-5 f", "qfffff"],
    ["6-9 r", "rzmphlrgrr"],
    ["1-4 m", "grdm"],
    ["4-5 s", "ssxsg"],
    ["1-4 n", "xhnznnxnnn"],
    ["2-6 r", "mcwldgbqlqsckgzlrd"],
    ["1-3 l", "llmllll"],
    ["3-4 p", "pjtgdnfjfcjtcnpgxpzq"],
    ["6-7 m", "mmvmmmtn"],
    ["17-19 h", "qgmhhhwwwhqhmhhthhch"],
    ["3-14 s", "lhmnsfdrvnngrsfhxd"],
    ["1-6 p", "pppppwp"],
    ["4-6 l", "lzllltrl"],
    ["3-4 c", "rpxccsc"],
    ["13-16 h", "qsdznfqmsftqqthh"],
    ["2-4 k", "wsvkm"],
    ["1-18 h", "chhhhhhhlhhhhhhhhhhh"],
    ["17-18 d", "xddddddddddddddddddd"],
    ["2-3 t", "jtbrhpzjfpzhcmjql"],
    ["10-11 n", "gjngnnncncnn"],
    ["7-13 r", "rrrrrsrrrrrrlwrrr"],
    ["10-12 l", "llldllslbldllwl"],
    ["17-19 m", "mmmmmmmmmmmmmmmmfmm"],
    ["10-14 n", "nnnnnnnnnbnnnnn"],
    ["17-18 x", "xrxcxxxxxxxxxxxxxxwx"],
    ["3-4 b", "lvxb"],
    ["5-6 r", "rrrrrrr"],
    ["13-18 l", "lllllllllllllllllpl"],
    ["8-12 m", "mmmmmmmqmmmmmmmm"],
    ["7-8 l", "llhqlllh"],
    ["3-8 p", "nmrppdvpxcphxgmkpbsl"],
    ["9-10 v", "hvsbttgsdvvj"],
    ["5-9 k", "kgmvzzzckkgldk"],
    ["15-20 x", "xqxxxjxxxxxxxxxxxxxl"],
    ["5-6 t", "bbwpwtwbhwgqttzjv"],
    ["6-13 n", "klzcfnnjqxrhjwpjfxnk"],
    ["5-8 d", "pcnndzddddnsdqh"],
    ["5-14 k", "kblbtvkwltfklk"],
    ["4-11 q", "zxwdkqqkvqq"],
    ["10-12 s", "tsssssssssssss"],
    ["3-5 r", "rddsrrdksfqfrgr"],
    ["7-16 h", "vdvhlsjxgvrbrxnhns"],
    ["3-4 z", "zxtz"],
    ["4-8 x", "xmnxdwmh"],
    ["11-12 r", "gwsnfrnckrrxrx"],
    ["3-9 q", "qqqqqqqqwqb"],
    ["9-14 f", "bfnfffffvfpfffff"],
    ["6-9 p", "pvpppkppcpp"],
    ["3-4 m", "mmmz"],
    ["3-5 j", "jjjjmjsjjrlkjjjjj"],
    ["4-6 p", "jpbpjs"],
    ["6-9 r", "bswdsrksdrzrgrfmjr"],
    ["8-10 l", "lllllllxll"],
    ["3-7 v", "vvhvvvvv"],
    ["4-11 n", "mnjpbldngrrkbthhmdp"],
    ["2-4 r", "frlrfblsrfzrhtpk"],
    ["16-17 h", "nbghhnzshclxhhmkr"],
    ["2-5 z", "zfzvzzzzzzzq"],
    ["1-5 l", "lllzlfl"],
    ["9-10 d", "dddddddddzd"],
    ["11-12 p", "pspppppppbzp"],
    ["5-9 t", "thzttpxrdhttdwqjsg"],
    ["7-10 w", "tfdfwlwwzdvpnww"],
    ["4-6 z", "fvcljzllwhbzscx"],
    ["14-15 m", "mmmmmmmmmmmmmcd"],
    ["8-11 d", "hgdmwgsdkdbghb"],
    ["13-15 v", "vmvdvvqvvvkvqvvv"],
    ["13-14 f", "fffffffclffffffmf"],
    ["2-5 s", "ssscn"],
    ["11-13 w", "wwwwwwwwwwwwww"],
    ["7-9 l", "xnwrlkskll"],
    ["8-14 g", "vggglvcrgscpgggt"],
    ["4-5 w", "wwwww"],
    ["5-11 w", "wwwwswwwwwwwwwww"],
    ["6-7 g", "gggbvjg"],
    ["14-18 q", "wqfqqqqqqnqsqrqqqq"],
    ["6-7 z", "zzzztzqczzzzz"],
    ["6-12 n", "wnnnnnnxftnkznpvvl"],
    ["10-16 j", "jjjjjdjjjrhjjjjj"],
    ["1-10 l", "lllllllllrll"],
    ["9-13 g", "gdgggggggggkggn"],
    ["6-8 r", "rrrrrrrs"],
    ["16-17 k", "kkkkkxkkkkkkkkkck"],
    ["11-14 b", "bbbjbxbfmqscqbdmgg"],
    ["3-8 d", "sjdkmjppbdddhdxd"],
    ["6-7 g", "xhkhwgqpbg"],
    ["11-12 x", "xxxxnxxwgxxbdl"],
    ["6-8 c", "cccscccwcccccccccc"],
    ["9-16 h", "vhhhhhchwnghmkzhr"],
    ["5-9 v", "vvvdnvvvvv"],
    ["4-16 n", "nmqncgnbfhqnnpnbxwrl"],
    ["3-5 f", "fljrf"],
    ["13-14 m", "mmmmmmmmmmmmgfmmmmmm"],
    ["5-6 g", "ggnggd"],
    ["2-6 w", "wlvhvw"],
    ["13-18 h", "hhhhhhhhhhhhhhhhhvh"],
    ["7-19 m", "mmmmmmmmmmmmmmmmmmwm"],
    ["4-12 k", "mcvtrtsdkvkkfjrmkn"],
    ["1-8 t", "qvmrtttn"],
    ["6-7 f", "fffffsf"],
    ["10-11 m", "mmmmmmmmmjl"],
    ["15-17 v", "mvrhvvvvnvrvzrvvfv"],
    ["10-14 m", "mmtmmmnmmmmmmxm"],
    ["4-16 b", "vcscdqcbcxswjfdbrqbx"],
    ["8-9 z", "zzzzzzznzvz"],
    ["4-6 g", "ggnggdpgggg"],
    ["2-4 d", "hddxxnzzw"],
    ["9-10 g", "gggggggggj"],
    ["4-7 k", "kkkvkkkkkk"],
    ["1-3 r", "rrrrj"],
    ["14-15 w", "wwwwwwwwwwwwwwwww"],
    ["2-4 n", "brfmln"],
    ["18-19 b", "bxbbbbbghbbbbbbbbwb"],
    ["10-12 q", "dqqqrqwcqgqqf"],
    ["2-5 g", "sxfzgtrxkrmstdzfmw"],
    ["3-4 d", "pcddq"],
    ["11-16 w", "sbqwlwzwwwwwtwww"],
    ["2-12 c", "wrccqxtccccchcccjcj"],
    ["16-17 b", "bbbtbbbbbbbbbbbqb"],
    ["3-13 t", "tttttttmgktdthtp"],
    ["1-3 t", "ttcg"],
    ["13-14 z", "zczzzzzzdwkzqz"],
    ["5-6 n", "bnjhnjhnnq"],
    ["2-9 b", "bjbgbzmlbbklbwt"],
    ["4-5 b", "dtlbbwtjbkzzbghbghzk"],
    ["10-16 p", "ppppppqpppwnpppppppp"],
    ["5-6 b", "cbbwtbjkm"],
    ["15-16 p", "ppppppppppppppqd"],
    ["4-8 m", "lgmmhgktslzhbvw"],
    ["2-4 h", "hhdlhhhhhhhhhhh"],
    ["14-18 k", "ktmkkkkkwkklkjrkklfk"],
    ["5-7 x", "sfxxsxx"],
    ["8-9 v", "lkvxdpvjv"],
    ["7-8 r", "rrrrrrsr"],
    ["4-6 b", "btcbbv"],
    ["7-13 n", "zhnhjhnmkzdbt"],
    ["7-9 j", "jvjjjjjjjjjjjjxjj"],
    ["1-4 v", "hdvfv"],
    ["2-5 f", "rznpnxqwncmtkwfxcxqh"],
    ["16-17 x", "zxgbhltrdhxkvvxsxf"],
    ["1-2 h", "hkhhh"],
    ["3-4 h", "zhxc"],
    ["4-9 z", "vsmzhzwgjxfg"],
    ["11-13 x", "xxxxxxxtzxxxc"],
    ["11-12 d", "dddddddgddqj"],
    ["4-11 f", "zkdhqnpgbff"],
    ["2-3 q", "qqlqgqqqv"],
    ["4-9 b", "bvnblwhbbkswmrhtf"],
    ["7-13 t", "cztskdtqdtrkt"],
    ["4-5 f", "fffcsf"],
    ["4-9 f", "ctblqrflf"],
    ["1-2 l", "lmllqhlnll"],
    ["3-6 v", "vvqvvvvr"],
    ["7-9 b", "bbrhbkjbb"],
    ["1-8 p", "xpppppppp"],
    ["7-10 k", "ckkpmktkqksgkkk"],
    ["1-7 m", "lmmmmmmmmmmmmmm"],
    ["11-15 v", "vvfvvmvvvvdvkvv"],
    ["10-11 b", "kbbbbbbzbhbb"],
    ["11-12 l", "jltgggtlcggllt"],
    ["10-13 q", "kqnqqqqqqqqqq"],
    ["6-7 c", "cjcccczc"],
    ["5-11 t", "kdtstshrhfkcx"],
    ["3-12 v", "vlvfzvwvxvvhvvsvvcvm"],
    ["9-10 t", "xttttttttttt"],
    ["8-10 z", "hctlkgjzvzh"],
    ["3-5 g", "gtkwgk"],
    ["16-17 w", "wwswwwwwwwwwwwwwwqww"],
    ["4-11 j", "lbmwjzjxjpjhzjjpbj"],
    ["4-5 c", "klbxc"],
    ["3-5 w", "wlhvb"],
    ["4-8 x", "xgxxxxxxxxxxxxdxnxx"],
    ["2-5 n", "nnnkhn"],
    ["1-2 d", "dxfd"],
    ["11-12 w", "wjcqszwqwkcb"],
    ["6-11 v", "sqpgzhnvndtmvvwl"],
    ["3-4 m", "mmmqmmm"],
    ["1-3 d", "mddb"],
    ["6-7 w", "wwwwwnwwwwwwww"],
    ["12-14 z", "zzzzzxzczzzrzzz"],
    ["5-10 f", "mtcmmhfftft"],
    ["10-14 x", "hhgvmxbwgxdcnz"],
    ["10-16 z", "wzfzzmlmxxfhzqcbsnl"],
    ["3-4 p", "ppvkppp"],
    ["8-11 h", "hhhkhhhjhpbhhhh"],
    ["6-12 f", "ffffdwffrsfffrffnfpk"],
    ["5-11 z", "xqwzzzzbzpwk"],
    ["7-9 c", "crccccccscccccc"],
    ["4-5 b", "qpcnz"],
    ["2-13 m", "lmnrrzfhmbwtmqbsg"],
    ["12-13 k", "kkkkkkdkkkkkmk"],
    ["10-14 q", "sdqfbqszdjhqfq"],
    ["8-13 h", "hhhhhjhhhhhhbhh"],
    ["2-4 g", "gfdb"],
    ["12-19 n", "wtrhndnnnbwnnnnjnnn"],
    ["5-6 n", "zdwnpn"],
    ["3-5 f", "ffsffffff"],
    ["11-16 r", "rrrvrrrrrrwrrrrrlrrr"],
    ["6-8 n", "nnnnnfnnn"],
    ["10-13 b", "brnlbblbkbbbjbbhx"],
    ["7-8 q", "ftrfnqgqc"],
    ["11-12 c", "ncccccccccgcccn"],
    ["3-4 z", "tzzctzwzzvz"],
    ["3-5 t", "tzrqg"],
    ["7-10 m", "mmmmmmrmmqmmm"],
    ["1-2 c", "cdccfcccc"],
    ["10-11 k", "kkkkkkkkkwkk"],
    ["6-18 x", "qndxdgmjvpppddwkbt"],
    ["8-17 c", "pxhszsccndlbzkwgvx"],
    ["3-4 p", "qlrvwdxpqtgwjrtqcc"],
    ["2-4 q", "lkjq"],
    ["17-19 f", "pffgflzxrxfdxffffnz"],
    ["3-11 x", "kzsvmhcxnwj"],
    ["6-7 x", "lxxxxxxcm"],
    ["1-8 n", "nnnnnnnrn"],
    ["2-5 r", "rtrrnr"],
    ["2-4 n", "csvhrvhlp"],
    ["7-8 b", "lbbpdbkb"],
    ["2-8 t", "ztcrbvmst"],
    ["3-4 r", "rwrr"],
    ["7-15 b", "tbtrrbbpwsrvklqb"],
    ["9-13 d", "dcfsgddmdsjgg"],
    ["2-7 d", "mvdzscd"],
    ["6-8 d", "jrjjdndq"],
    ["1-3 m", "mhmvhtmmlbztvmsvmtmb"],
    ["10-12 c", "ctwjbpkchccmbqw"],
    ["2-3 z", "jvzwcrbgqbhvzbf"],
    ["2-7 g", "qbwsdbg"],
    ["4-7 s", "jsxpbmsmkhktfdq"],
    ["11-13 r", "rrrrrrrrrrhrqr"],
    ["9-14 d", "zddcdgddddxddntddm"],
    ["1-15 x", "jgrxxxxfxkgbmsxzx"],
    ["2-17 p", "kcppppkppppppppwm"],
    ["12-19 k", "kkkkkkkkkkkmkkkkkkkk"],
    ["1-4 x", "nzpxg"],
    ["5-12 p", "xcbppqnppqgtrm"],
    ["11-14 h", "dlhzhhhsbllcwhh"],
    ["13-14 q", "qqqqqqqqqqqqqcq"],
    ["11-16 t", "ttgnswrltltttjtj"],
    ["14-15 t", "ttttvtttftttttjtc"],
    ["3-5 s", "xssns"],
    ["9-11 q", "mlqqtqnjqfl"],
    ["3-4 z", "nzzhz"],
    ["2-5 k", "skwbwkwgzj"],
    ["1-3 p", "pppppcppppbpp"],
    ["5-10 r", "rrrrlrrrrrr"],
    ["2-3 l", "jlffrztcckl"],
    ["3-5 t", "ttftttttr"],
    ["3-6 q", "qtqtmnlqck"],
    ["1-4 v", "vxfvmvxwvvjbxp"],
    ["1-5 z", "tzzzzszvzzrmzmz"],
    ["10-11 l", "lllllblllcx"],
    ["1-4 p", "vppppp"],
    ["6-12 v", "zvrwvvvrvhzb"],
    ["2-4 x", "xxnv"],
    ["1-7 w", "hwwwwwgwgwwbwqw"],
    ["3-7 w", "wwwwwlfw"],
    ["5-6 l", "kkpltd"],
    ["4-5 d", "ddnrdk"],
    ["3-6 c", "cncvkt"],
    ["8-9 j", "vblczlfjjkj"],
    ["7-15 d", "ddddxdgdddddddjddd"],
    ["4-7 z", "vvmzdspzwptz"],
    ["5-7 t", "cdrtfqt"],
    ["6-9 j", "jjjjjdjjjjjjjj"],
    ["2-5 j", "ljptkvvfl"],
    ["6-7 l", "vhhnllgx"],
    ["5-6 g", "gpcxwvgpvvgg"],
    ["5-12 q", "plzqqnqzrhqgljj"],
    ["8-13 k", "zkckdknkxkgkvmmkd"],
    ["4-10 s", "jkvstssfcsrckjnzzbsl"],
    ["9-11 n", "nlknnnnggnvnnnnn"],
    ["8-9 s", "ssssrsgstk"],
    ["16-18 r", "rrrrrrrrrrtrrrrbrrrr"],
    ["4-5 f", "qxrzfcgfqfp"],
    ["2-10 p", "pphtppppppplwpsp"],
    ["2-5 q", "qqqqsq"],
    ["6-15 j", "xjkxkjxxkjznjjj"],
    ["9-13 f", "fvfvjlfmltfgf"],
    ["3-6 j", "jnsrcj"],
    ["1-7 h", "vhhhhhhh"],
    ["4-5 q", "qrqqqf"],
    ["2-3 v", "mvxb"],
    ["4-11 l", "lllllllllldl"],
    ["7-17 k", "mkcxhcmbcpjckkqznh"],
    ["7-9 v", "vvpgvvvvs"],
    ["7-11 j", "jjjjjjjjjjjs"],
    ["2-12 v", "mlxjljvffxgv"],
    ["3-4 t", "hhfn"],
    ["14-16 w", "kwfwwqwcfcwwfmww"],
    ["5-6 j", "jjjjjg"],
    ["11-12 n", "nnnnnnrdnnmnn"],
    ["8-9 b", "dsbbbfbbbb"],
    ["3-4 j", "jjcjjj"],
    ["1-3 r", "wrnr"],
    ["10-11 p", "pppppppppqppp"],
    ["12-13 v", "vvvvvvvvvwvvvv"],
    ["7-9 v", "vvvqvvxvdvxv"],
    ["9-14 r", "mmrrrrnrrxrrrwrrrrrr"],
    ["5-6 k", "kkkkbkkr"],
    ["13-17 v", "dbvgrchdpnzvxrdfv"],
    ["4-9 c", "ccjbccqcpcclcc"],
    ["6-8 m", "mbjmmxnb"],
    ["2-6 h", "hhdhnvcc"],
    ["9-16 t", "tttttttttttttttgt"],
    ["12-16 n", "nnnnnnnnnnnnnnnwn"],
    ["3-14 z", "zzdzzzzzzzzzzzz"],
    ["3-8 k", "pmktwckzn"],
    ["9-13 q", "gqqqqqqqrqqqqq"],
    ["3-6 l", "lllllddll"],
    ["7-8 x", "slxxzplxsxkcxlxxx"],
    ["2-5 v", "vwvvd"],
    ["6-7 n", "xxnnnmnnn"],
    ["2-4 z", "zczz"],
    ["2-12 p", "pppppppppppvp"],
    ["2-4 h", "bqwhv"],
    ["5-7 t", "btzttjg"],
    ["4-9 c", "sxcskxxbcv"],
    ["1-6 c", "cccccpc"],
    ["9-13 l", "bcsllbvbjhrflt"],
    ["5-9 c", "zprfctdnt"],
    ["1-5 z", "zzzzz"],
    ["4-8 h", "bpshnhxhrbk"],
    ["4-7 l", "bqclvxf"],
    ["5-6 m", "mmmmmgwcmgjj"],
    ["13-18 m", "mmmnmmmmmmmmpmtmmgm"],
    ["1-5 w", "cwwgwwwwwww"],
    ["14-16 h", "hhhhhhhhhhhhhqhhh"],
    ["6-7 v", "bvvjvvbvvv"],
    ["5-13 b", "pbcbbqmbcsfblc"],
    ["17-18 j", "jjjwjsrjjmkjjqjjjj"],
    ["4-6 t", "ntttpt"],
    ["6-7 v", "mvvnvvc"],
    ["11-12 v", "vclgnzbvtvvjvs"],
    ["8-13 r", "rlrzkjkrrxmdvzgt"],
    ["5-7 n", "nnnnnnsnnnnn"],
    ["3-6 q", "qpkjpq"],
    ["2-7 v", "hvgnjfrkvx"],
    ["6-10 g", "xgmrggggpbggfqgdpm"],
    ["9-10 s", "ssssssswfszsdssszss"],
    ["5-6 p", "pppjppwpp"],
    ["2-5 d", "ddddddd"],
    ["9-13 p", "ppjhpbppxpxxt"],
    ["10-15 t", "cgtcnlltzdkbcjtvxs"],
    ["8-11 m", "dkmmvtdmkbhmk"],
    ["3-4 z", "rzzqzw"],
    ["4-8 z", "zcxzswbzzqzxwkzz"],
    ["3-4 s", "jsts"],
    ["2-7 b", "bsbbbbbbbbbbb"],
    ["11-15 l", "jjkslsltvfbqshl"],
    ["3-14 c", "cqtxcgmcgvgfcccmg"],
    ["1-8 f", "fbfwffhfbxffhlx"],
    ["4-11 r", "drrmrrrzcfrj"],
    ["5-6 p", "pwpvjp"],
    ["11-14 d", "pnrddqwdlpdbddwg"],
    ["9-10 r", "rrrwrrrznrrgqsr"],
    ["3-12 v", "vsvvbvvkvvpdrvvv"],
    ["2-5 t", "mtfqjrjlthk"],
    ["13-17 r", "rrrrrrrrrrrrrrrrtr"],
    ["7-8 n", "nnnnnnhnn"],
    ["3-4 r", "wrpr"],
    ["1-14 p", "ppppppppppppppppp"],
    ["8-9 m", "vzkbzwnmwfqmmmmcmmnd"],
    ["11-14 p", "pppnpvpwppvpppppppp"],
    ["17-19 h", "lzhxlhhchxhbxhwvhsx"],
    ["10-11 n", "nnnnznnnnlp"],
    ["3-12 f", "kwflsfqflxpzbgxzdhzv"],
    ["8-10 x", "xxvxxxxvxsxxlxxxx"],
    ["1-2 c", "dclflczlj"],
    ["4-9 w", "wwwtwwwwwww"],
    ["2-8 t", "pfvtlbtxt"],
    ["4-9 f", "pnfkffkfnh"],
    ["8-10 v", "vjvvvvvvvvvvvv"],
    ["3-13 s", "mfshscgmmrvzw"],
    ["6-10 g", "gzggggpggkggzggggg"],
    ["13-14 n", "fnnnnnnnnnwnrnnn"],
    ["4-14 k", "lbvkwrkjkxjskg"],
    ["9-11 q", "qqqqqqqqsqgq"],
    ["17-18 q", "qqqqqqqqqqqqqqqqqd"],
    ["6-9 s", "spsssgsrrssss"],
    ["8-14 m", "qmmqjmmmmtpmnzgmm"],
    ["1-7 m", "bmsrmmmmmmm"],
    ["14-17 k", "kskdbkkkkdkkkktkqkkk"],
    ["4-5 c", "ccccgfc"],
    ["2-5 k", "kkkkzk"],
    ["2-11 q", "qqwqlnqqqhtdvxqrc"],
    ["4-6 m", "fdxkmmd"],
    ["7-10 j", "mjgftcmjmjj"],
    ["17-18 m", "mmmmmmmmmmmmmmmmnm"],
    ["2-4 v", "svvv"],
    ["6-8 x", "jxxhrxlp"],
    ["4-10 s", "dsvdbsssmscs"],
    ["18-19 k", "zwdgknqvqkgdhdhktkmr"],
    ["2-7 h", "jdflgfh"],
    ["6-8 z", "zmpzzzzzzzzgz"],
    ["3-6 m", "mmrmmm"],
    ["4-8 w", "wwtwktws"],
    ["4-10 k", "dkjkqkkzvk"],
    ["3-7 b", "bbbbbbfbbb"],
    ["4-12 z", "zzzzzzzzzzzzz"],
    ["5-9 z", "nmqdzzkzzzbj"],
    ["4-11 z", "fzzgzzzzzztzz"],
    ["1-7 w", "whwwwzrw"],
    ["5-6 t", "tjtttv"],
    ["9-11 v", "vzvhvxvvnvwvvv"],
    ["2-4 t", "pkjtpp"],
    ["14-15 n", "njpwjnsbnnnnngnnvnnn"],
    ["5-15 k", "qtmvkkdjkslkqvk"],
    ["2-4 s", "skszs"],
    ["2-3 g", "zggjhgxzn"],
    ["16-17 p", "ppppmppppppppppnppp"],
    ["4-10 z", "zzzzzzzzzzz"],
    ["17-18 s", "sssgsssskssssssssbs"],
    ["5-8 m", "mmmmmmmbm"],
    ["1-5 l", "llllmlql"],
    ["3-13 z", "bmdwpgvzfdlgzgl"],
    ["1-4 p", "pjplgjr"],
    ["1-9 v", "vvvzvrvvk"],
    ["6-18 w", "whwpwwflbcwwvwwwwst"],
    ["19-20 n", "nnsnnjnnnnnnnnnnnnkx"],
    ["9-10 m", "rlmxrnqrmkmmwmmmmm"],
    ["15-17 s", "lvssssslssfsssksfb"],
    ["3-4 q", "qqqpq"],
    ["7-13 h", "hhhhhhhhhhhhdhhhhhhh"],
    ["2-6 h", "dvkfhhmk"],
    ["4-6 s", "nczssv"],
    ["10-12 p", "pppppppppppdpprp"],
    ["16-18 s", "sssssssssssssssgsg"],
    ["7-12 h", "hhhhhhvhhhhhh"],
    ["4-12 f", "ffftfffffffwff"],
    ["4-7 s", "csqcpssbgvvmwdb"],
    ["6-10 p", "ppppvppppdppd"],
    ["6-8 h", "hxjhthhgzh"],
    ["3-10 f", "fffffffffsf"],
    ["4-11 g", "trggxlrnqrgh"],
    ["2-15 w", "wjxwtvkwwpgwwww"],
    ["1-4 v", "zjxv"],
    ["7-10 f", "fffffflqff"],
    ["4-6 g", "mgwgpbg"],
    ["1-10 z", "vvzzzzzvzz"],
    ["6-7 f", "ffffffnf"],
    ["11-15 w", "wxzwwqdnnwwxjlwplcl"],
    ["10-11 s", "hsslzjgsssvxsshnsc"],
    ["4-12 n", "tlxdnpznjbknt"],
    ["7-8 k", "mkhcvjxk"],
    ["10-12 j", "jjjjjjjjjjnm"],
    ["2-7 c", "fckckdpcksjckwcc"],
    ["3-8 s", "sssdxssw"],
    ["12-14 t", "ttttttttqttxttttpttt"],
    ["6-7 g", "gggggggg"],
    ["5-10 f", "fqffzffffffffgf"],
    ["6-7 t", "ztqhpbt"],
    ["5-12 w", "swwfwwwwwpwbwj"],
    ["2-4 w", "qmww"],
    ["5-8 v", "vvjnvvpv"],
    ["7-8 p", "bcbtnppbxnnwpr"],
    ["4-12 z", "zzkzdxntzlfbkkzzzw"],
    ["8-9 s", "sssssssss"],
    ["15-18 h", "jhvhhhcxwhhhhmhhhj"],
    ["6-10 w", "bwwwwwwwwwwwww"],
    ["5-9 l", "mtqlhlwlh"],
    ["5-7 l", "ljllnllblpl"],
    ["15-17 h", "hpgdkhsjwfnsjmhqxf"],
    ["3-4 g", "gggxgggg"],
    ["1-2 q", "qdqm"],
    ["6-10 n", "hnnnqknnnnnlnnnnp"],
    ["13-17 q", "djstfsmmqlshqqbqnf"],
    ["6-7 z", "qzlzxzw"],
    ["7-12 g", "qhghvbwdcvkgjl"],
    ["7-15 z", "zzzzzznzzzzzzzzzzzzh"],
    ["3-6 w", "zchpwvw"],
    ["3-4 c", "wmbjp"],
    ["6-9 k", "tckbvkkxkkqk"],
    ["11-13 p", "pcppppppppppppbp"],
    ["5-7 r", "rrrrsrxrr"],
    ["6-10 c", "ccccczcccccccccc"],
    ["7-8 j", "jjpjjplj"],
    ["5-7 m", "mjmmmjrmfmmmmmmmm"],
    ["1-7 t", "ttttttnttvpt"],
    ["6-12 t", "tttfwtttttttttttttt"],
    ["7-17 x", "hxwgrqqlxmrxrcwsx"],
    ["3-8 g", "vjcgqrjhlq"],
    ["13-18 n", "nnnfnnngnnnnjnnnhln"],
    ["13-15 f", "ffffffffffffrbff"],
    ["13-15 x", "xmswzjhtthggslslgx"],
    ["12-13 g", "ggggggggggggggg"],
    ["3-9 f", "cxfskjcbmhmmcpwn"],
    ["5-7 h", "jxzbhbh"],
    ["2-3 m", "mhmlmq"],
    ["1-3 m", "rmmmgmzvcghdtgmsmnm"],
    ["14-15 s", "wzssphxtsskpssr"],
    ["8-14 p", "kppjppgfpprftj"],
    ["2-7 r", "prnmlrrbm"],
    ["2-5 v", "vvvvtvv"],
    ["1-5 n", "nnnnzn"],
    ["2-5 t", "xtlnfwhgvltx"],
    ["3-4 v", "gvtv"],
    ["2-8 k", "kvkstkfz"],
    ["2-6 j", "jdjjjnjjjjzjjjj"],
    ["3-4 s", "sshwsssss"],
    ["2-10 w", "mnhkdtwdzwvsq"],
    ["6-8 b", "bbbbkxbbtbbkbt"],
    ["14-19 h", "hhhhhhhhhhhhhhhhhhhh"],
    ["6-10 d", "ddddddddddddddd"],
    ["10-13 t", "ttttttttthttjttt"],
    ["4-5 c", "ctscw"],
    ["8-9 b", "bbbvbbgmb"],
    ["10-12 s", "sxssshsssswsscsx"],
    ["3-7 r", "rdhrrkrkrrrrcrhrrr"],
    ["8-10 j", "wjsslzjjntjjwjs"],
    ["1-4 q", "gqqw"],
    ["4-6 t", "tjlhvrt"],
    ["2-10 s", "ssssssnssssssssx"],
    ["7-8 x", "xxxxxxfw"],
    ["6-13 r", "sxtcgrffrpdprnklbxbw"],
    ["1-3 p", "ppbppppppp"],
    ["2-3 b", "jbfr"],
    ["1-7 m", "cmmmmqm"],
    ["4-5 t", "tttzt"],
    ["7-9 s", "zwbbbssvl"],
    ["10-13 w", "wwwwwwwwwwwwdw"],
    ["13-14 n", "nnnnnnnnnnnnnmkn"],
    ["5-11 q", "jpbzqwqbwttgzn"],
    ["4-5 k", "kkkwkkk"],
    ["10-17 w", "sgtklkflsrfqxfwhjm"],
    ["6-12 w", "wwjqwwlmphwkwwwwwjw"],
    ["2-13 p", "ppppppppppppzp"],
    ["2-16 h", "tslcwztxxtchgqlxsbx"],
    ["2-9 p", "slptvtljpxdkf"],
    ["10-12 z", "tnzzghzzgzfn"],
    ["3-18 f", "ffxfffffffffffffff"],
    ["1-2 p", "prdpdghkckdgpl"],
    ["6-8 x", "fxxnbwrx"],
    ["7-9 z", "zmzkzdpgjzzz"],
    ["7-14 p", "pppppppppppppppb"],
    ["7-10 l", "xltlzllllljzxlll"],
    ["18-20 n", "nnnnnnnqnnnnnnnnnmnb"],
    ["15-18 p", "pxmqxpmqwfntrpppmf"],
    ["1-15 v", "kgmvwvrvmcvtrvvwv"],
    ["2-8 g", "gxggggggg"],
    ["4-5 f", "clfjfqmpffjfff"],
    ["3-5 r", "rpjkf"],
    ["2-9 h", "hhhhhshhrhh"],
    ["2-5 z", "zxzzz"],
    ["5-11 k", "kkkkkkkkkkkk"],
    ["8-9 n", "nnddcfntnrgnnrnnc"],
    ["1-11 f", "dfffffffffff"],
    ["2-4 x", "dzphvg"],
    ["4-5 w", "mnzlr"],
    ["2-6 f", "jhrkfmg"],
    ["2-17 z", "czzvvzzczznzhwzbzz"],
    ["2-5 r", "xrjrg"],
    ["2-3 g", "gggg"],
    ["7-9 s", "ssssssbsssss"],
    ["17-19 k", "kcwktkxkkbkqnwkkkkdz"],
    ["1-16 f", "zmxdffmfgffxrffffqf"],
    ["7-8 q", "qtmrkbqjq"],
    ["8-9 q", "qqqqqqqqx"],
    ["10-18 n", "nnnnnnnnnznnnnnnnnnn"],
    ["16-18 x", "xwxxxxxxxxxxxxxxxrxx"],
    ["15-18 t", "tttttftptttttttcttt"],
    ["10-11 h", "hfxnlbsqxphtmstbhdn"],
    ["7-13 z", "vdzdzmzxvfzzz"],
    ["2-5 n", "nnpqgnnqnb"],
    ["12-16 v", "pvjvvnbqzjnvvvvpjv"],
    ["4-5 d", "ddddk"],
    ["4-8 l", "lxvhlbclhgd"],
    ["3-12 v", "vvkvvvvvvvvvvvvvvvvv"],
    ["17-18 j", "jjjjjjjjjjjjjjjjdj"],
    ["6-7 b", "ckbdbcsbb"],
    ["9-11 q", "qrhxpcjjqbqt"],
    ["8-14 h", "hhhhhhhhhhhhklhhhhn"],
    ["2-3 b", "bzbjb"],
    ["2-15 w", "nnmdgzhsvhpvswltvt"],
    ["1-5 l", "lbclz"],
    ["15-17 d", "wlddgdxsdcdfdcgdd"],
    ["18-20 q", "dqsldgqqfqwsstqlmqtz"],
    ["1-6 q", "qqqqqdq"],
    ["2-6 j", "jpjjjjjj"],
    ["13-15 p", "ztjlhtnsgphgxccpfsp"],
    ["6-13 m", "ghvvmrglmmmcm"],
    ["3-6 b", "nbbrmrfdlbs"],
    ["1-3 j", "fwhjsr"],
    ["7-10 p", "gcppcppzpppp"],
    ["4-12 r", "rrrrrrrrrrrrrr"],
    ["16-20 d", "djdddvdsddddlmddddpm"],
    ["14-19 x", "xzxjxxxxxxxxxxxxxxj"],
    ["11-16 w", "kwclzxjjwxlwkcnwkwv"],
    ["3-11 b", "zhhxsgqxqbbg"],
    ["10-11 q", "trbhqqzhdqw"],
    ["9-13 l", "vcvlvqlwrlfvll"],
    ["7-9 x", "xxxxxxxxgx"],
    ["5-6 n", "nnnngnn"],
    ["2-5 p", "pqpppppppqpxp"],
    ["4-17 z", "zxrmzwwxwhqxxmqrv"],
    ["5-9 v", "vvvvvvvvrvvvj"],
    ["6-7 x", "qkhbxxkxs"],
    ["3-4 d", "fcmd"],
    ["5-9 f", "nsnlxstff"],
    ["6-9 x", "hrtzmhrxxbmcc"],
    ["3-7 w", "wwwwwwsww"],
    ["5-8 g", "ngkdxggg"],
    ["8-13 r", "rrrrphrrrrrrrrrrdrt"],
    ["2-6 f", "rckzvzfrnp"],
    ["4-6 k", "bfrpttcfbwmvhgn"],
    ["7-9 w", "wwwwwwswww"],
    ["13-15 n", "nnnnnnnnnnnnnnn"],
    ["4-8 j", "jjjjjjjwjjj"],
    ["9-11 h", "hhhhhhrhhhhhh"],
    ["4-7 h", "thmhwrhss"],
    ["1-3 d", "ddddddddddddd"],
    ["10-11 c", "ckrcxwcdpqc"],
    ["2-4 g", "kgghg"],
    ["3-12 s", "ssssvwssssgqs"],
    ["2-7 s", "sssssszs"],
    ["2-10 v", "wvpbjqxvzsdpgmq"],
    ["12-15 n", "nnnnnnbnqvrkfnn"],
    ["3-5 w", "wlvdw"],
    ["11-14 t", "pfrbxgcrwndttj"],
    ["6-7 w", "qnnwwpfwwhw"],
    ["7-10 n", "nnnvnnhnnx"],
    ["3-12 c", "mmfcwvxqwpcclwlxfx"],
    ["2-3 p", "lgpxpppp"],
    ["17-19 k", "rfxvmnmfzrnktfpckpr"],
    ["2-9 k", "kkkknkkkkkkk"],
    ["15-16 t", "ttjmtttmttttttwt"],
    ["9-10 r", "rrrrrrrrmrrrr"],
    ["3-4 p", "jppppxf"],
    ["7-8 k", "nkqbvkkt"],
    ["6-8 d", "dddddrdddd"],
    ["6-7 q", "czbqdgnc"],
    ["3-5 p", "rxpppsx"],
    ["4-6 t", "thvtwv"],
    ["2-13 d", "dmdddddddddddd"],
    ["16-18 n", "nnnnnnnnnnnnnnnnnnn"],
    ["11-12 s", "ssfsdsmssswssh"],
    ["3-5 v", "kxnvvvmvrvdvvssvvv"],
    ["5-8 x", "nxxxxbxxxzx"],
    ["3-5 t", "ctttftt"],
    ["5-7 s", "hssvsgj"],
    ["5-8 r", "rrrrrrrcrx"],
    ["1-13 v", "vvvvvvvvvvvvpvvvvvv"],
    ["5-9 h", "gxlrhsgswhchfxbwjd"],
    ["2-4 w", "wgwb"],
    ["6-12 v", "pmxnjtfsvvxvv"],
    ["1-4 n", "vnntn"],
    ["2-3 w", "wwww"],
    ["3-7 f", "xmfbmnvnfkkmsd"],
    ["10-12 x", "xxxxxxjgxxxxx"],
    ["2-3 l", "cllvpbtmgzmrfmq"],
    ["2-4 l", "llrlllnlxll"],
    ["5-10 h", "hdhhhzhvtchhh"],
    ["8-10 q", "lhqmdwcfhqngq"],
    ["1-5 t", "twtfvcmktthtjltqvpwc"],
    ["6-8 s", "sxsghtbs"],
    ["3-4 m", "mmmmmmmmmmmmmmmm"],
    ["16-17 l", "rjdpxhtblvllgvwhl"],
    ["5-13 s", "brhsssnfcndsh"],
    ["7-13 v", "swkfswvmkvjbnsgvwp"],
    ["1-3 k", "wlfpzk"],
    ["2-4 t", "tpttt"],
    ["2-9 t", "cntttttcgtttt"],
    ["5-6 r", "rrrrbh"],
    ["10-12 j", "jjjjjjjjjzjjdj"],
]

def pass_check(input)
    valid_count = 0

    input.each do |pair|
        min = pair[0].to_s.split("-")[0].to_i
        max = pair[0].to_s.split("-")[1].split(" ")[0].to_i
        letter = pair[0].to_s.split("-")[1].split(" ")[1]
        count = 0

        pair[1].each_char do |char|
            count += 1 if char == letter
            break if count > max
        end

        valid_count += 1 if count >= min && count <= max

    end
    valid_count
end

def pass_check2(input)
    valid_count = 0

    input.each do |pair|
        first = pair[0].to_s.split("-")[0].to_i
        second = pair[0].to_s.split("-")[1].split(" ")[0].to_i
        letter = pair[0].to_s.split("-")[1].split(" ")[1]

        valid_count += 1 if (pair[1][first-1] == letter) ^ (pair[1][second-1] == letter)

    end
    valid_count
end

puts pass_check2(INPUT)
; ModuleID = 'gzip-body.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-freebsd9.0"

%struct.config = type { i16, i16, i16, i16 }
%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, i8*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64, %struct.pthread_mutex*, %struct.pthread*, i32, i32, %union.__mbstate_t }
%struct.__sbuf = type { i8*, i32 }
%struct.pthread_mutex = type opaque
%struct.pthread = type opaque
%union.__mbstate_t = type { i64, [120 x i8] }
%struct.ct_data = type { %union.anon.10, %union.anon.0 }
%union.anon.10 = type { i16 }
%union.anon.0 = type { i16 }
%struct.tree_desc = type { %struct.ct_data*, %struct.ct_data*, i32*, i32, i32, i32, i32 }
%struct._RuneLocale = type { [8 x i8], [32 x i8], i32 (i8*, i64, i8**)*, i32 (i32, i8*, i64, i8**)*, i32, [256 x i64], [256 x i32], [256 x i32], %struct._RuneRange, %struct._RuneRange, %struct._RuneRange, i8*, i32 }
%struct._RuneRange = type { i32, %struct._RuneEntry* }
%struct._RuneEntry = type { i32, i32, i32, i64* }
%struct.option = type { i8*, i32, i32*, i32 }
%struct.huft = type { i8, i8, %union.anon }
%union.anon = type { %struct.huft* }

@zfile = internal global i32 0, align 4
@bi_buf = internal global i16 0, align 2
@bi_valid = internal global i32 0, align 4
@read_buf = common global i32 (i8*, i32)* null, align 8
@outcnt = external global i32
@outbuf = external global [0 x i8]
@window_size = global i64 65536, align 8
@.str = private unnamed_addr constant [15 x i8] c"bad pack level\00", align 1
@compr_level = internal global i32 0, align 4
@prev = external global [0 x i16]
@configuration_table = internal global [10 x %struct.config] [%struct.config zeroinitializer, %struct.config { i16 4, i16 4, i16 8, i16 4 }, %struct.config { i16 4, i16 5, i16 16, i16 8 }, %struct.config { i16 4, i16 6, i16 32, i16 32 }, %struct.config { i16 4, i16 4, i16 16, i16 16 }, %struct.config { i16 8, i16 16, i16 32, i16 32 }, %struct.config { i16 8, i16 16, i16 128, i16 128 }, %struct.config { i16 8, i16 32, i16 128, i16 256 }, %struct.config { i16 32, i16 128, i16 258, i16 1024 }, %struct.config { i16 32, i16 258, i16 258, i16 4096 }], align 16
@max_lazy_match = internal global i32 0, align 4
@good_match = common global i32 0, align 4
@nice_match = common global i32 0, align 4
@max_chain_length = common global i32 0, align 4
@strstart = common global i32 0, align 4
@block_start = common global i64 0, align 8
@window = external global [0 x i8]
@lookahead = internal global i32 0, align 4
@eofile = internal global i32 0, align 4
@ins_h = internal global i32 0, align 4
@prev_length = common global i32 0, align 4
@match_start = common global i32 0, align 4
@optarg = global i8* null, align 8
@optind = global i32 0, align 4
@opterr = global i32 1, align 4
@optopt = global i32 0, align 4
@last_nonopt = internal global i32 0, align 4
@first_nonopt = internal global i32 0, align 4
@nextchar = internal global i8* null, align 8
@ordering = internal global i32 0, align 4
@.str1 = private unnamed_addr constant [16 x i8] c"POSIXLY_CORRECT\00", align 1
@.str12 = private unnamed_addr constant [3 x i8] c"--\00", align 1
@__stderrp = external global %struct.__sFILE*
@.str2 = private unnamed_addr constant [30 x i8] c"%s: option `%s' is ambiguous\0A\00", align 1
@.str3 = private unnamed_addr constant [45 x i8] c"%s: option `--%s' doesn't allow an argument\0A\00", align 1
@.str4 = private unnamed_addr constant [45 x i8] c"%s: option `%c%s' doesn't allow an argument\0A\00", align 1
@.str5 = private unnamed_addr constant [38 x i8] c"%s: option `%s' requires an argument\0A\00", align 1
@.str6 = private unnamed_addr constant [32 x i8] c"%s: unrecognized option `--%s'\0A\00", align 1
@.str7 = private unnamed_addr constant [32 x i8] c"%s: unrecognized option `%c%s'\0A\00", align 1
@.str8 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str9 = private unnamed_addr constant [26 x i8] c"%s: illegal option -- %c\0A\00", align 1
@.str10 = private unnamed_addr constant [39 x i8] c"%s: option requires an argument -- %c\0A\00", align 1
@mask_bits = global [17 x i16] [i16 0, i16 1, i16 3, i16 7, i16 15, i16 31, i16 63, i16 127, i16 255, i16 511, i16 1023, i16 2047, i16 4095, i16 8191, i16 16383, i16 32767, i16 -1], align 16
@lbits = global i32 9, align 4
@dbits = global i32 6, align 4
@hufts = common global i32 0, align 4
@bb = common global i64 0, align 8
@bk = common global i32 0, align 4
@inptr = external global i32
@insize = external global i32
@inbuf = external global [0 x i8]
@cplens = internal global [31 x i16] [i16 3, i16 4, i16 5, i16 6, i16 7, i16 8, i16 9, i16 10, i16 11, i16 13, i16 15, i16 17, i16 19, i16 23, i16 27, i16 31, i16 35, i16 43, i16 51, i16 59, i16 67, i16 83, i16 99, i16 115, i16 131, i16 163, i16 195, i16 227, i16 258, i16 0, i16 0], align 16
@cplext = internal global [31 x i16] [i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 1, i16 1, i16 1, i16 1, i16 2, i16 2, i16 2, i16 2, i16 3, i16 3, i16 3, i16 3, i16 4, i16 4, i16 4, i16 4, i16 5, i16 5, i16 5, i16 5, i16 0, i16 99, i16 99], align 16
@cpdist = internal global [30 x i16] [i16 1, i16 2, i16 3, i16 4, i16 5, i16 7, i16 9, i16 13, i16 17, i16 25, i16 33, i16 49, i16 65, i16 97, i16 129, i16 193, i16 257, i16 385, i16 513, i16 769, i16 1025, i16 1537, i16 2049, i16 3073, i16 4097, i16 6145, i16 8193, i16 12289, i16 16385, i16 24577], align 16
@cpdext = internal global [30 x i16] [i16 0, i16 0, i16 0, i16 0, i16 1, i16 1, i16 2, i16 2, i16 3, i16 3, i16 4, i16 4, i16 5, i16 5, i16 6, i16 6, i16 7, i16 7, i16 8, i16 8, i16 9, i16 9, i16 10, i16 10, i16 11, i16 11, i16 12, i16 12, i16 13, i16 13], align 16
@border = internal global [19 x i32] [i32 16, i32 17, i32 18, i32 0, i32 8, i32 7, i32 9, i32 6, i32 10, i32 5, i32 11, i32 4, i32 12, i32 3, i32 13, i32 2, i32 14, i32 1, i32 15], align 16
@.str11 = private unnamed_addr constant [26 x i8] c" incomplete literal tree\0A\00", align 1
@.str112 = private unnamed_addr constant [27 x i8] c" incomplete distance tree\0A\00", align 1
@msg_done = internal global i32 0, align 4
@.str13 = private unnamed_addr constant [44 x i8] c"output in compress .Z format not supported\0A\00", align 1
@exit_code = external global i32
@file_type = common global i16* null, align 8
@file_method = common global i32* null, align 8
@input_len = internal global i64 0, align 8
@compressed_len = internal global i64 0, align 8
@static_dtree = internal global [30 x %struct.ct_data] zeroinitializer, align 16
@base_length = internal global [29 x i32] zeroinitializer, align 16
@extra_lbits = internal global [29 x i32] [i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1, i32 1, i32 1, i32 1, i32 2, i32 2, i32 2, i32 2, i32 3, i32 3, i32 3, i32 3, i32 4, i32 4, i32 4, i32 4, i32 5, i32 5, i32 5, i32 5, i32 0], align 16
@length_code = internal global [256 x i8] zeroinitializer, align 16
@base_dist = internal global [30 x i32] zeroinitializer, align 16
@extra_dbits = internal global [30 x i32] [i32 0, i32 0, i32 0, i32 0, i32 1, i32 1, i32 2, i32 2, i32 3, i32 3, i32 4, i32 4, i32 5, i32 5, i32 6, i32 6, i32 7, i32 7, i32 8, i32 8, i32 9, i32 9, i32 10, i32 10, i32 11, i32 11, i32 12, i32 12, i32 13, i32 13], align 16
@dist_code = internal global [512 x i8] zeroinitializer, align 16
@bl_count = internal global [16 x i16] zeroinitializer, align 16
@static_ltree = internal global [288 x %struct.ct_data] zeroinitializer, align 16
@flags = internal global i8 0, align 1
@last_flags = internal global i32 0, align 4
@flag_buf = internal global [4096 x i8] zeroinitializer, align 16
@l_desc = internal global %struct.tree_desc { %struct.ct_data* getelementptr inbounds ([573 x %struct.ct_data]* @dyn_ltree, i32 0, i32 0), %struct.ct_data* getelementptr inbounds ([288 x %struct.ct_data]* @static_ltree, i32 0, i32 0), i32* getelementptr inbounds ([29 x i32]* @extra_lbits, i32 0, i32 0), i32 257, i32 286, i32 15, i32 0 }, align 8
@d_desc = internal global %struct.tree_desc { %struct.ct_data* getelementptr inbounds ([61 x %struct.ct_data]* @dyn_dtree, i32 0, i32 0), %struct.ct_data* getelementptr inbounds ([30 x %struct.ct_data]* @static_dtree, i32 0, i32 0), i32* getelementptr inbounds ([30 x i32]* @extra_dbits, i32 0, i32 0), i32 0, i32 30, i32 15, i32 0 }, align 8
@opt_len = internal global i64 0, align 8
@static_len = internal global i64 0, align 8
@.str14 = private unnamed_addr constant [15 x i8] c"block vanished\00", align 1
@dyn_ltree = internal global [573 x %struct.ct_data] zeroinitializer, align 16
@dyn_dtree = internal global [61 x %struct.ct_data] zeroinitializer, align 16
@last_lit = internal global i32 0, align 4
@last_dist = internal global i32 0, align 4
@d_buf = external global [0 x i16]
@flag_bit = internal global i8 0, align 1
@level = external global i32
@.str115 = private unnamed_addr constant [23 x i8] c"-l used on binary file\00", align 1
@.str216 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@bl_order = internal global [19 x i8] c"\10\11\12\00\08\07\09\06\0A\05\0B\04\0C\03\0D\02\0E\01\0F", align 16
@bl_tree = internal global [39 x %struct.ct_data] zeroinitializer, align 16
@bl_desc = internal global %struct.tree_desc { %struct.ct_data* getelementptr inbounds ([39 x %struct.ct_data]* @bl_tree, i32 0, i32 0), %struct.ct_data* null, i32* getelementptr inbounds ([19 x i32]* @extra_blbits, i32 0, i32 0), i32 0, i32 19, i32 7, i32 0 }, align 8
@extra_blbits = internal global [19 x i32] [i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2, i32 3, i32 7], align 16
@heap_len = internal global i32 0, align 4
@heap_max = internal global i32 0, align 4
@heap = internal global [573 x i32] zeroinitializer, align 16
@depth = internal global [573 x i8] zeroinitializer, align 16
@ifd = external global i32
@ofd = external global i32
@done = internal global i32 0, align 4
@test = external global i32
@decode.i = internal global i32 0, align 4
@j = internal global i32 0, align 4
@bitbuf = internal global i16 0, align 2
@pt_table = internal global [256 x i16] zeroinitializer, align 16
@pt_len = internal global [19 x i8] zeroinitializer, align 16
@bitcount = internal global i32 0, align 4
@subbitbuf = internal global i32 0, align 4
@blocksize = internal global i32 0, align 4
@.str21 = private unnamed_addr constant [11 x i8] c"Bad table\0A\00", align 1
@block_mode = global i32 128, align 4
@maxbits = external global i32
@quiet = external global i32
@.str22 = private unnamed_addr constant [38 x i8] c"\0A%s: %s: warning, unknown flags 0x%x\0A\00", align 1
@progname = external global i8*
@ifname = external global [0 x i8]
@.str123 = private unnamed_addr constant [59 x i8] c"\0A%s: %s: compressed with %d bits, can only handle %d bits\0A\00", align 1
@bytes_in = external global i64
@.str224 = private unnamed_addr constant [15 x i8] c"corrupt input.\00", align 1
@bytes_out = external global i64
@to_stdout = external global i32
@.str325 = private unnamed_addr constant [46 x i8] c"corrupt input. Use zcat to recover some data.\00", align 1
@valid = internal global i32 0, align 4
@bitbuf26 = internal global i64 0, align 8
@peek_bits = internal global i32 0, align 4
@max_len = internal global i32 0, align 4
@leaves = internal global [26 x i32] zeroinitializer, align 16
@parents = internal global [26 x i32] zeroinitializer, align 16
@lit_base = internal global [26 x i32] zeroinitializer, align 16
@literal = internal global [256 x i8] zeroinitializer, align 16
@orig_len = internal global i64 0, align 8
@.str27 = private unnamed_addr constant [38 x i8] c"invalid compressed data--length error\00", align 1
@.str128 = private unnamed_addr constant [50 x i8] c"invalid compressed data -- Huffman code > 32 bits\00", align 1
@.str229 = private unnamed_addr constant [32 x i8] c"too many leaves in Huffman tree\00", align 1
@pkzip = global i32 0, align 4
@ext_header = global i32 0, align 4
@.str31 = private unnamed_addr constant [31 x i8] c"\0A%s: %s: not a valid zip file\0A\00", align 1
@method = external global i32
@.str132 = private unnamed_addr constant [58 x i8] c"\0A%s: %s: first entry not deflated or stored -- use unzip\0A\00", align 1
@decrypt = common global i32 0, align 4
@.str233 = private unnamed_addr constant [38 x i8] c"\0A%s: %s: encrypted file -- use unzip\0A\00", align 1
@.str334 = private unnamed_addr constant [14 x i8] c"out of memory\00", align 1
@.str435 = private unnamed_addr constant [41 x i8] c"invalid compressed data--format violated\00", align 1
@.str536 = private unnamed_addr constant [18 x i8] c"len %ld, siz %ld\0A\00", align 1
@.str637 = private unnamed_addr constant [41 x i8] c"invalid compressed data--length mismatch\00", align 1
@.str738 = private unnamed_addr constant [31 x i8] c"internal error, invalid method\00", align 1
@.str839 = private unnamed_addr constant [35 x i8] c"invalid compressed data--crc error\00", align 1
@.str940 = private unnamed_addr constant [38 x i8] c"invalid compressed data--length error\00", align 1
@.str1041 = private unnamed_addr constant [46 x i8] c"%s: %s has more than one entry--rest ignored\0A\00", align 1
@.str1142 = private unnamed_addr constant [45 x i8] c"%s: %s has more than one entry -- unchanged\0A\00", align 1
@key = common global i8* null, align 8
@updcrc.crc = internal global i64 4294967295, align 8
@.str43 = private unnamed_addr constant [3 x i8] c" \09\00", align 1
@.str144 = private unnamed_addr constant [14 x i8] c"out of memory\00", align 1
@.str245 = private unnamed_addr constant [8 x i8] c"argc<=0\00", align 1
@.str346 = private unnamed_addr constant [13 x i8] c"\0A%s: %s: %s\0A\00", align 1
@.str447 = private unnamed_addr constant [23 x i8] c"%s: %s: warning: %s%s\0A\00", align 1
@.str548 = private unnamed_addr constant [6 x i8] c"\0A%s: \00", align 1
@.str649 = private unnamed_addr constant [28 x i8] c"%s: unexpected end of file\0A\00", align 1
@ofname = external global [0 x i8]
@__isthreaded = external global i32
@.str750 = private unnamed_addr constant [12 x i8] c"%2ld.%1ld%%\00", align 1
@crc_32_tab = global [256 x i64] [i64 0, i64 1996959894, i64 3993919788, i64 2567524794, i64 124634137, i64 1886057615, i64 3915621685, i64 2657392035, i64 249268274, i64 2044508324, i64 3772115230, i64 2547177864, i64 162941995, i64 2125561021, i64 3887607047, i64 2428444049, i64 498536548, i64 1789927666, i64 4089016648, i64 2227061214, i64 450548861, i64 1843258603, i64 4107580753, i64 2211677639, i64 325883990, i64 1684777152, i64 4251122042, i64 2321926636, i64 335633487, i64 1661365465, i64 4195302755, i64 2366115317, i64 997073096, i64 1281953886, i64 3579855332, i64 2724688242, i64 1006888145, i64 1258607687, i64 3524101629, i64 2768942443, i64 901097722, i64 1119000684, i64 3686517206, i64 2898065728, i64 853044451, i64 1172266101, i64 3705015759, i64 2882616665, i64 651767980, i64 1373503546, i64 3369554304, i64 3218104598, i64 565507253, i64 1454621731, i64 3485111705, i64 3099436303, i64 671266974, i64 1594198024, i64 3322730930, i64 2970347812, i64 795835527, i64 1483230225, i64 3244367275, i64 3060149565, i64 1994146192, i64 31158534, i64 2563907772, i64 4023717930, i64 1907459465, i64 112637215, i64 2680153253, i64 3904427059, i64 2013776290, i64 251722036, i64 2517215374, i64 3775830040, i64 2137656763, i64 141376813, i64 2439277719, i64 3865271297, i64 1802195444, i64 476864866, i64 2238001368, i64 4066508878, i64 1812370925, i64 453092731, i64 2181625025, i64 4111451223, i64 1706088902, i64 314042704, i64 2344532202, i64 4240017532, i64 1658658271, i64 366619977, i64 2362670323, i64 4224994405, i64 1303535960, i64 984961486, i64 2747007092, i64 3569037538, i64 1256170817, i64 1037604311, i64 2765210733, i64 3554079995, i64 1131014506, i64 879679996, i64 2909243462, i64 3663771856, i64 1141124467, i64 855842277, i64 2852801631, i64 3708648649, i64 1342533948, i64 654459306, i64 3188396048, i64 3373015174, i64 1466479909, i64 544179635, i64 3110523913, i64 3462522015, i64 1591671054, i64 702138776, i64 2966460450, i64 3352799412, i64 1504918807, i64 783551873, i64 3082640443, i64 3233442989, i64 3988292384, i64 2596254646, i64 62317068, i64 1957810842, i64 3939845945, i64 2647816111, i64 81470997, i64 1943803523, i64 3814918930, i64 2489596804, i64 225274430, i64 2053790376, i64 3826175755, i64 2466906013, i64 167816743, i64 2097651377, i64 4027552580, i64 2265490386, i64 503444072, i64 1762050814, i64 4150417245, i64 2154129355, i64 426522225, i64 1852507879, i64 4275313526, i64 2312317920, i64 282753626, i64 1742555852, i64 4189708143, i64 2394877945, i64 397917763, i64 1622183637, i64 3604390888, i64 2714866558, i64 953729732, i64 1340076626, i64 3518719985, i64 2797360999, i64 1068828381, i64 1219638859, i64 3624741850, i64 2936675148, i64 906185462, i64 1090812512, i64 3747672003, i64 2825379669, i64 829329135, i64 1181335161, i64 3412177804, i64 3160834842, i64 628085408, i64 1382605366, i64 3423369109, i64 3138078467, i64 570562233, i64 1426400815, i64 3317316542, i64 2998733608, i64 733239954, i64 1555261956, i64 3268935591, i64 3050360625, i64 752459403, i64 1541320221, i64 2607071920, i64 3965973030, i64 1969922972, i64 40735498, i64 2617837225, i64 3943577151, i64 1913087877, i64 83908371, i64 2512341634, i64 3803740692, i64 2075208622, i64 213261112, i64 2463272603, i64 3855990285, i64 2094854071, i64 198958881, i64 2262029012, i64 4057260610, i64 1759359992, i64 534414190, i64 2176718541, i64 4139329115, i64 1873836001, i64 414664567, i64 2282248934, i64 4279200368, i64 1711684554, i64 285281116, i64 2405801727, i64 4167216745, i64 1634467795, i64 376229701, i64 2685067896, i64 3608007406, i64 1308918612, i64 956543938, i64 2808555105, i64 3495958263, i64 1231636301, i64 1047427035, i64 2932959818, i64 3654703836, i64 1088359270, i64 936918000, i64 2847714899, i64 3736837829, i64 1202900863, i64 817233897, i64 3183342108, i64 3401237130, i64 1404277552, i64 615818150, i64 3134207493, i64 3453421203, i64 1423857449, i64 601450431, i64 3009837614, i64 3294710456, i64 1567103746, i64 711928724, i64 3020668471, i64 3272380065, i64 1510334235, i64 755167117], align 16
@__mb_sb_limit = external global i32
@_CurrentRuneLocale = external global %struct._RuneLocale*

define void @bi_init(i32 %zipfile) nounwind uwtable {
  %1 = alloca i32, align 4
  store i32 %zipfile, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !558), !dbg !559
  %2 = load i32* %1, align 4, !dbg !560
  store i32 %2, i32* @zfile, align 4, !dbg !560
  store i16 0, i16* @bi_buf, align 2, !dbg !562
  store i32 0, i32* @bi_valid, align 4, !dbg !563
  %3 = load i32* @zfile, align 4, !dbg !564
  %4 = icmp ne i32 %3, -1, !dbg !564
  br i1 %4, label %5, label %6, !dbg !564

; <label>:5                                       ; preds = %0
  store i32 (i8*, i32)* @file_read, i32 (i8*, i32)** @read_buf, align 8, !dbg !565
  br label %6, !dbg !567

; <label>:6                                       ; preds = %5, %0
  ret void, !dbg !568
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare i32 @file_read(i8*, i32)

define void @send_bits(i32 %value, i32 %length) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %value, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !569), !dbg !570
  store i32 %length, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !571), !dbg !572
  %3 = load i32* @bi_valid, align 4, !dbg !573
  %4 = load i32* %2, align 4, !dbg !573
  %5 = sub nsw i32 16, %4, !dbg !573
  %6 = icmp sgt i32 %3, %5, !dbg !573
  br i1 %6, label %7, label %76, !dbg !573

; <label>:7                                       ; preds = %0
  %8 = load i32* %1, align 4, !dbg !575
  %9 = load i32* @bi_valid, align 4, !dbg !575
  %10 = shl i32 %8, %9, !dbg !575
  %11 = load i16* @bi_buf, align 2, !dbg !575
  %12 = zext i16 %11 to i32, !dbg !575
  %13 = or i32 %12, %10, !dbg !575
  %14 = trunc i32 %13 to i16, !dbg !575
  store i16 %14, i16* @bi_buf, align 2, !dbg !575
  %15 = load i32* @outcnt, align 4, !dbg !577
  %16 = icmp ult i32 %15, 16382, !dbg !577
  br i1 %16, label %17, label %34, !dbg !577

; <label>:17                                      ; preds = %7
  %18 = load i16* @bi_buf, align 2, !dbg !579
  %19 = zext i16 %18 to i32, !dbg !579
  %20 = and i32 %19, 255, !dbg !579
  %21 = trunc i32 %20 to i8, !dbg !579
  %22 = load i32* @outcnt, align 4, !dbg !579
  %23 = add i32 %22, 1, !dbg !579
  store i32 %23, i32* @outcnt, align 4, !dbg !579
  %24 = zext i32 %22 to i64, !dbg !579
  %25 = getelementptr inbounds [0 x i8]* @outbuf, i32 0, i64 %24, !dbg !579
  store i8 %21, i8* %25, align 1, !dbg !579
  %26 = load i16* @bi_buf, align 2, !dbg !579
  %27 = zext i16 %26 to i32, !dbg !579
  %28 = ashr i32 %27, 8, !dbg !579
  %29 = trunc i32 %28 to i8, !dbg !579
  %30 = load i32* @outcnt, align 4, !dbg !579
  %31 = add i32 %30, 1, !dbg !579
  store i32 %31, i32* @outcnt, align 4, !dbg !579
  %32 = zext i32 %30 to i64, !dbg !579
  %33 = getelementptr inbounds [0 x i8]* @outbuf, i32 0, i64 %32, !dbg !579
  store i8 %29, i8* %33, align 1, !dbg !579
  br label %59, !dbg !579

; <label>:34                                      ; preds = %7
  %35 = load i16* @bi_buf, align 2, !dbg !581
  %36 = zext i16 %35 to i32, !dbg !581
  %37 = and i32 %36, 255, !dbg !581
  %38 = trunc i32 %37 to i8, !dbg !581
  %39 = load i32* @outcnt, align 4, !dbg !581
  %40 = add i32 %39, 1, !dbg !581
  store i32 %40, i32* @outcnt, align 4, !dbg !581
  %41 = zext i32 %39 to i64, !dbg !581
  %42 = getelementptr inbounds [0 x i8]* @outbuf, i32 0, i64 %41, !dbg !581
  store i8 %38, i8* %42, align 1, !dbg !581
  %43 = load i32* @outcnt, align 4, !dbg !581
  %44 = icmp eq i32 %43, 16384, !dbg !581
  br i1 %44, label %45, label %46, !dbg !581

; <label>:45                                      ; preds = %34
  call void @flush_outbuf(), !dbg !581
  br label %46, !dbg !581

; <label>:46                                      ; preds = %45, %34
  %47 = load i16* @bi_buf, align 2, !dbg !584
  %48 = zext i16 %47 to i32, !dbg !584
  %49 = ashr i32 %48, 8, !dbg !584
  %50 = trunc i32 %49 to i8, !dbg !584
  %51 = load i32* @outcnt, align 4, !dbg !584
  %52 = add i32 %51, 1, !dbg !584
  store i32 %52, i32* @outcnt, align 4, !dbg !584
  %53 = zext i32 %51 to i64, !dbg !584
  %54 = getelementptr inbounds [0 x i8]* @outbuf, i32 0, i64 %53, !dbg !584
  store i8 %50, i8* %54, align 1, !dbg !584
  %55 = load i32* @outcnt, align 4, !dbg !584
  %56 = icmp eq i32 %55, 16384, !dbg !584
  br i1 %56, label %57, label %58, !dbg !584

; <label>:57                                      ; preds = %46
  call void @flush_outbuf(), !dbg !584
  br label %58, !dbg !584

; <label>:58                                      ; preds = %57, %46
  br label %59

; <label>:59                                      ; preds = %58, %17
  %60 = load i32* %1, align 4, !dbg !586
  %61 = trunc i32 %60 to i16, !dbg !586
  %62 = zext i16 %61 to i32, !dbg !586
  %63 = load i32* @bi_valid, align 4, !dbg !586
  %64 = sext i32 %63 to i64, !dbg !586
  %65 = sub i64 16, %64, !dbg !586
  %66 = trunc i64 %65 to i32, !dbg !586
  %67 = ashr i32 %62, %66, !dbg !586
  %68 = trunc i32 %67 to i16, !dbg !586
  store i16 %68, i16* @bi_buf, align 2, !dbg !586
  %69 = load i32* %2, align 4, !dbg !587
  %70 = sext i32 %69 to i64, !dbg !587
  %71 = sub i64 %70, 16, !dbg !587
  %72 = load i32* @bi_valid, align 4, !dbg !587
  %73 = sext i32 %72 to i64, !dbg !587
  %74 = add i64 %73, %71, !dbg !587
  %75 = trunc i64 %74 to i32, !dbg !587
  store i32 %75, i32* @bi_valid, align 4, !dbg !587
  br label %87, !dbg !588

; <label>:76                                      ; preds = %0
  %77 = load i32* %1, align 4, !dbg !589
  %78 = load i32* @bi_valid, align 4, !dbg !589
  %79 = shl i32 %77, %78, !dbg !589
  %80 = load i16* @bi_buf, align 2, !dbg !589
  %81 = zext i16 %80 to i32, !dbg !589
  %82 = or i32 %81, %79, !dbg !589
  %83 = trunc i32 %82 to i16, !dbg !589
  store i16 %83, i16* @bi_buf, align 2, !dbg !589
  %84 = load i32* %2, align 4, !dbg !591
  %85 = load i32* @bi_valid, align 4, !dbg !591
  %86 = add nsw i32 %85, %84, !dbg !591
  store i32 %86, i32* @bi_valid, align 4, !dbg !591
  br label %87

; <label>:87                                      ; preds = %76, %59
  ret void, !dbg !592
}

define i32 @bi_reverse(i32 %code, i32 %len) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %res = alloca i32, align 4
  store i32 %code, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !593), !dbg !594
  store i32 %len, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !595), !dbg !596
  call void @llvm.dbg.declare(metadata !{i32* %res}, metadata !597), !dbg !599
  store i32 0, i32* %res, align 4, !dbg !600
  br label %3, !dbg !601

; <label>:3                                       ; preds = %12, %0
  %4 = load i32* %1, align 4, !dbg !602
  %5 = and i32 %4, 1, !dbg !602
  %6 = load i32* %res, align 4, !dbg !602
  %7 = or i32 %6, %5, !dbg !602
  store i32 %7, i32* %res, align 4, !dbg !602
  %8 = load i32* %1, align 4, !dbg !604
  %9 = lshr i32 %8, 1, !dbg !604
  store i32 %9, i32* %1, align 4, !dbg !604
  %10 = load i32* %res, align 4, !dbg !604
  %11 = shl i32 %10, 1, !dbg !604
  store i32 %11, i32* %res, align 4, !dbg !604
  br label %12, !dbg !605

; <label>:12                                      ; preds = %3
  %13 = load i32* %2, align 4, !dbg !605
  %14 = add nsw i32 %13, -1, !dbg !605
  store i32 %14, i32* %2, align 4, !dbg !605
  %15 = icmp sgt i32 %14, 0, !dbg !605
  br i1 %15, label %3, label %16, !dbg !605

; <label>:16                                      ; preds = %12
  %17 = load i32* %res, align 4, !dbg !606
  %18 = lshr i32 %17, 1, !dbg !606
  ret i32 %18, !dbg !606
}

define void @bi_windup() nounwind uwtable {
  %1 = load i32* @bi_valid, align 4, !dbg !607
  %2 = icmp sgt i32 %1, 8, !dbg !607
  br i1 %2, label %3, label %49, !dbg !607

; <label>:3                                       ; preds = %0
  %4 = load i32* @outcnt, align 4, !dbg !609
  %5 = icmp ult i32 %4, 16382, !dbg !609
  br i1 %5, label %6, label %23, !dbg !609

; <label>:6                                       ; preds = %3
  %7 = load i16* @bi_buf, align 2, !dbg !612
  %8 = zext i16 %7 to i32, !dbg !612
  %9 = and i32 %8, 255, !dbg !612
  %10 = trunc i32 %9 to i8, !dbg !612
  %11 = load i32* @outcnt, align 4, !dbg !612
  %12 = add i32 %11, 1, !dbg !612
  store i32 %12, i32* @outcnt, align 4, !dbg !612
  %13 = zext i32 %11 to i64, !dbg !612
  %14 = getelementptr inbounds [0 x i8]* @outbuf, i32 0, i64 %13, !dbg !612
  store i8 %10, i8* %14, align 1, !dbg !612
  %15 = load i16* @bi_buf, align 2, !dbg !612
  %16 = zext i16 %15 to i32, !dbg !612
  %17 = ashr i32 %16, 8, !dbg !612
  %18 = trunc i32 %17 to i8, !dbg !612
  %19 = load i32* @outcnt, align 4, !dbg !612
  %20 = add i32 %19, 1, !dbg !612
  store i32 %20, i32* @outcnt, align 4, !dbg !612
  %21 = zext i32 %19 to i64, !dbg !612
  %22 = getelementptr inbounds [0 x i8]* @outbuf, i32 0, i64 %21, !dbg !612
  store i8 %18, i8* %22, align 1, !dbg !612
  br label %48, !dbg !612

; <label>:23                                      ; preds = %3
  %24 = load i16* @bi_buf, align 2, !dbg !614
  %25 = zext i16 %24 to i32, !dbg !614
  %26 = and i32 %25, 255, !dbg !614
  %27 = trunc i32 %26 to i8, !dbg !614
  %28 = load i32* @outcnt, align 4, !dbg !614
  %29 = add i32 %28, 1, !dbg !614
  store i32 %29, i32* @outcnt, align 4, !dbg !614
  %30 = zext i32 %28 to i64, !dbg !614
  %31 = getelementptr inbounds [0 x i8]* @outbuf, i32 0, i64 %30, !dbg !614
  store i8 %27, i8* %31, align 1, !dbg !614
  %32 = load i32* @outcnt, align 4, !dbg !614
  %33 = icmp eq i32 %32, 16384, !dbg !614
  br i1 %33, label %34, label %35, !dbg !614

; <label>:34                                      ; preds = %23
  call void @flush_outbuf(), !dbg !614
  br label %35, !dbg !614

; <label>:35                                      ; preds = %34, %23
  %36 = load i16* @bi_buf, align 2, !dbg !617
  %37 = zext i16 %36 to i32, !dbg !617
  %38 = ashr i32 %37, 8, !dbg !617
  %39 = trunc i32 %38 to i8, !dbg !617
  %40 = load i32* @outcnt, align 4, !dbg !617
  %41 = add i32 %40, 1, !dbg !617
  store i32 %41, i32* @outcnt, align 4, !dbg !617
  %42 = zext i32 %40 to i64, !dbg !617
  %43 = getelementptr inbounds [0 x i8]* @outbuf, i32 0, i64 %42, !dbg !617
  store i8 %39, i8* %43, align 1, !dbg !617
  %44 = load i32* @outcnt, align 4, !dbg !617
  %45 = icmp eq i32 %44, 16384, !dbg !617
  br i1 %45, label %46, label %47, !dbg !617

; <label>:46                                      ; preds = %35
  call void @flush_outbuf(), !dbg !617
  br label %47, !dbg !617

; <label>:47                                      ; preds = %46, %35
  br label %48

; <label>:48                                      ; preds = %47, %6
  br label %64, !dbg !619

; <label>:49                                      ; preds = %0
  %50 = load i32* @bi_valid, align 4, !dbg !620
  %51 = icmp sgt i32 %50, 0, !dbg !620
  br i1 %51, label %52, label %63, !dbg !620

; <label>:52                                      ; preds = %49
  %53 = load i16* @bi_buf, align 2, !dbg !621
  %54 = trunc i16 %53 to i8, !dbg !621
  %55 = load i32* @outcnt, align 4, !dbg !621
  %56 = add i32 %55, 1, !dbg !621
  store i32 %56, i32* @outcnt, align 4, !dbg !621
  %57 = zext i32 %55 to i64, !dbg !621
  %58 = getelementptr inbounds [0 x i8]* @outbuf, i32 0, i64 %57, !dbg !621
  store i8 %54, i8* %58, align 1, !dbg !621
  %59 = load i32* @outcnt, align 4, !dbg !621
  %60 = icmp eq i32 %59, 16384, !dbg !621
  br i1 %60, label %61, label %62, !dbg !621

; <label>:61                                      ; preds = %52
  call void @flush_outbuf(), !dbg !621
  br label %62, !dbg !621

; <label>:62                                      ; preds = %61, %52
  br label %63, !dbg !624

; <label>:63                                      ; preds = %62, %49
  br label %64

; <label>:64                                      ; preds = %63, %48
  store i16 0, i16* @bi_buf, align 2, !dbg !625
  store i32 0, i32* @bi_valid, align 4, !dbg !626
  ret void, !dbg !627
}

define void @copy_block(i8* %buf, i32 %len, i32 %header) nounwind uwtable {
  %1 = alloca i8*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i8* %buf, i8** %1, align 8
  call void @llvm.dbg.declare(metadata !{i8** %1}, metadata !628), !dbg !629
  store i32 %len, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !630), !dbg !631
  store i32 %header, i32* %3, align 4
  call void @llvm.dbg.declare(metadata !{i32* %3}, metadata !632), !dbg !633
  call void @bi_windup(), !dbg !634
  %4 = load i32* %3, align 4, !dbg !636
  %5 = icmp ne i32 %4, 0, !dbg !636
  br i1 %5, label %6, label %109, !dbg !636

; <label>:6                                       ; preds = %0
  %7 = load i32* @outcnt, align 4, !dbg !637
  %8 = icmp ult i32 %7, 16382, !dbg !637
  br i1 %8, label %9, label %28, !dbg !637

; <label>:9                                       ; preds = %6
  %10 = load i32* %2, align 4, !dbg !640
  %11 = trunc i32 %10 to i16, !dbg !640
  %12 = zext i16 %11 to i32, !dbg !640
  %13 = and i32 %12, 255, !dbg !640
  %14 = trunc i32 %13 to i8, !dbg !640
  %15 = load i32* @outcnt, align 4, !dbg !640
  %16 = add i32 %15, 1, !dbg !640
  store i32 %16, i32* @outcnt, align 4, !dbg !640
  %17 = zext i32 %15 to i64, !dbg !640
  %18 = getelementptr inbounds [0 x i8]* @outbuf, i32 0, i64 %17, !dbg !640
  store i8 %14, i8* %18, align 1, !dbg !640
  %19 = load i32* %2, align 4, !dbg !640
  %20 = trunc i32 %19 to i16, !dbg !640
  %21 = zext i16 %20 to i32, !dbg !640
  %22 = ashr i32 %21, 8, !dbg !640
  %23 = trunc i32 %22 to i8, !dbg !640
  %24 = load i32* @outcnt, align 4, !dbg !640
  %25 = add i32 %24, 1, !dbg !640
  store i32 %25, i32* @outcnt, align 4, !dbg !640
  %26 = zext i32 %24 to i64, !dbg !640
  %27 = getelementptr inbounds [0 x i8]* @outbuf, i32 0, i64 %26, !dbg !640
  store i8 %23, i8* %27, align 1, !dbg !640
  br label %55, !dbg !640

; <label>:28                                      ; preds = %6
  %29 = load i32* %2, align 4, !dbg !642
  %30 = trunc i32 %29 to i16, !dbg !642
  %31 = zext i16 %30 to i32, !dbg !642
  %32 = and i32 %31, 255, !dbg !642
  %33 = trunc i32 %32 to i8, !dbg !642
  %34 = load i32* @outcnt, align 4, !dbg !642
  %35 = add i32 %34, 1, !dbg !642
  store i32 %35, i32* @outcnt, align 4, !dbg !642
  %36 = zext i32 %34 to i64, !dbg !642
  %37 = getelementptr inbounds [0 x i8]* @outbuf, i32 0, i64 %36, !dbg !642
  store i8 %33, i8* %37, align 1, !dbg !642
  %38 = load i32* @outcnt, align 4, !dbg !642
  %39 = icmp eq i32 %38, 16384, !dbg !642
  br i1 %39, label %40, label %41, !dbg !642

; <label>:40                                      ; preds = %28
  call void @flush_outbuf(), !dbg !642
  br label %41, !dbg !642

; <label>:41                                      ; preds = %40, %28
  %42 = load i32* %2, align 4, !dbg !645
  %43 = trunc i32 %42 to i16, !dbg !645
  %44 = zext i16 %43 to i32, !dbg !645
  %45 = ashr i32 %44, 8, !dbg !645
  %46 = trunc i32 %45 to i8, !dbg !645
  %47 = load i32* @outcnt, align 4, !dbg !645
  %48 = add i32 %47, 1, !dbg !645
  store i32 %48, i32* @outcnt, align 4, !dbg !645
  %49 = zext i32 %47 to i64, !dbg !645
  %50 = getelementptr inbounds [0 x i8]* @outbuf, i32 0, i64 %49, !dbg !645
  store i8 %46, i8* %50, align 1, !dbg !645
  %51 = load i32* @outcnt, align 4, !dbg !645
  %52 = icmp eq i32 %51, 16384, !dbg !645
  br i1 %52, label %53, label %54, !dbg !645

; <label>:53                                      ; preds = %41
  call void @flush_outbuf(), !dbg !645
  br label %54, !dbg !645

; <label>:54                                      ; preds = %53, %41
  br label %55

; <label>:55                                      ; preds = %54, %9
  %56 = load i32* @outcnt, align 4, !dbg !647
  %57 = icmp ult i32 %56, 16382, !dbg !647
  br i1 %57, label %58, label %79, !dbg !647

; <label>:58                                      ; preds = %55
  %59 = load i32* %2, align 4, !dbg !649
  %60 = xor i32 %59, -1, !dbg !649
  %61 = trunc i32 %60 to i16, !dbg !649
  %62 = zext i16 %61 to i32, !dbg !649
  %63 = and i32 %62, 255, !dbg !649
  %64 = trunc i32 %63 to i8, !dbg !649
  %65 = load i32* @outcnt, align 4, !dbg !649
  %66 = add i32 %65, 1, !dbg !649
  store i32 %66, i32* @outcnt, align 4, !dbg !649
  %67 = zext i32 %65 to i64, !dbg !649
  %68 = getelementptr inbounds [0 x i8]* @outbuf, i32 0, i64 %67, !dbg !649
  store i8 %64, i8* %68, align 1, !dbg !649
  %69 = load i32* %2, align 4, !dbg !649
  %70 = xor i32 %69, -1, !dbg !649
  %71 = trunc i32 %70 to i16, !dbg !649
  %72 = zext i16 %71 to i32, !dbg !649
  %73 = ashr i32 %72, 8, !dbg !649
  %74 = trunc i32 %73 to i8, !dbg !649
  %75 = load i32* @outcnt, align 4, !dbg !649
  %76 = add i32 %75, 1, !dbg !649
  store i32 %76, i32* @outcnt, align 4, !dbg !649
  %77 = zext i32 %75 to i64, !dbg !649
  %78 = getelementptr inbounds [0 x i8]* @outbuf, i32 0, i64 %77, !dbg !649
  store i8 %74, i8* %78, align 1, !dbg !649
  br label %108, !dbg !649

; <label>:79                                      ; preds = %55
  %80 = load i32* %2, align 4, !dbg !651
  %81 = xor i32 %80, -1, !dbg !651
  %82 = trunc i32 %81 to i16, !dbg !651
  %83 = zext i16 %82 to i32, !dbg !651
  %84 = and i32 %83, 255, !dbg !651
  %85 = trunc i32 %84 to i8, !dbg !651
  %86 = load i32* @outcnt, align 4, !dbg !651
  %87 = add i32 %86, 1, !dbg !651
  store i32 %87, i32* @outcnt, align 4, !dbg !651
  %88 = zext i32 %86 to i64, !dbg !651
  %89 = getelementptr inbounds [0 x i8]* @outbuf, i32 0, i64 %88, !dbg !651
  store i8 %85, i8* %89, align 1, !dbg !651
  %90 = load i32* @outcnt, align 4, !dbg !651
  %91 = icmp eq i32 %90, 16384, !dbg !651
  br i1 %91, label %92, label %93, !dbg !651

; <label>:92                                      ; preds = %79
  call void @flush_outbuf(), !dbg !651
  br label %93, !dbg !651

; <label>:93                                      ; preds = %92, %79
  %94 = load i32* %2, align 4, !dbg !654
  %95 = xor i32 %94, -1, !dbg !654
  %96 = trunc i32 %95 to i16, !dbg !654
  %97 = zext i16 %96 to i32, !dbg !654
  %98 = ashr i32 %97, 8, !dbg !654
  %99 = trunc i32 %98 to i8, !dbg !654
  %100 = load i32* @outcnt, align 4, !dbg !654
  %101 = add i32 %100, 1, !dbg !654
  store i32 %101, i32* @outcnt, align 4, !dbg !654
  %102 = zext i32 %100 to i64, !dbg !654
  %103 = getelementptr inbounds [0 x i8]* @outbuf, i32 0, i64 %102, !dbg !654
  store i8 %99, i8* %103, align 1, !dbg !654
  %104 = load i32* @outcnt, align 4, !dbg !654
  %105 = icmp eq i32 %104, 16384, !dbg !654
  br i1 %105, label %106, label %107, !dbg !654

; <label>:106                                     ; preds = %93
  call void @flush_outbuf(), !dbg !654
  br label %107, !dbg !654

; <label>:107                                     ; preds = %106, %93
  br label %108

; <label>:108                                     ; preds = %107, %58
  br label %109, !dbg !656

; <label>:109                                     ; preds = %108, %0
  br label %110, !dbg !657

; <label>:110                                     ; preds = %125, %109
  %111 = load i32* %2, align 4, !dbg !657
  %112 = add i32 %111, -1, !dbg !657
  store i32 %112, i32* %2, align 4, !dbg !657
  %113 = icmp ne i32 %111, 0, !dbg !657
  br i1 %113, label %114, label %126, !dbg !657

; <label>:114                                     ; preds = %110
  %115 = load i8** %1, align 8, !dbg !658
  %116 = getelementptr inbounds i8* %115, i32 1, !dbg !658
  store i8* %116, i8** %1, align 8, !dbg !658
  %117 = load i8* %115, align 1, !dbg !658
  %118 = load i32* @outcnt, align 4, !dbg !658
  %119 = add i32 %118, 1, !dbg !658
  store i32 %119, i32* @outcnt, align 4, !dbg !658
  %120 = zext i32 %118 to i64, !dbg !658
  %121 = getelementptr inbounds [0 x i8]* @outbuf, i32 0, i64 %120, !dbg !658
  store i8 %117, i8* %121, align 1, !dbg !658
  %122 = load i32* @outcnt, align 4, !dbg !658
  %123 = icmp eq i32 %122, 16384, !dbg !658
  br i1 %123, label %124, label %125, !dbg !658

; <label>:124                                     ; preds = %114
  call void @flush_outbuf(), !dbg !658
  br label %125, !dbg !658

; <label>:125                                     ; preds = %124, %114
  br label %110, !dbg !661

; <label>:126                                     ; preds = %110
  ret void, !dbg !662
}

define void @lm_init(i32 %pack_level, i16* %flags) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i16*, align 8
  %j = alloca i32, align 4
  store i32 %pack_level, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !663), !dbg !664
  store i16* %flags, i16** %2, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !665), !dbg !666
  call void @llvm.dbg.declare(metadata !22, metadata !667), !dbg !669
  %3 = load i32* %1, align 4, !dbg !670
  %4 = icmp slt i32 %3, 1, !dbg !670
  br i1 %4, label %8, label %5, !dbg !670

; <label>:5                                       ; preds = %0
  %6 = load i32* %1, align 4, !dbg !670
  %7 = icmp sgt i32 %6, 9, !dbg !670
  br i1 %7, label %8, label %9, !dbg !670

; <label>:8                                       ; preds = %5, %0
  call void @error(i8* getelementptr inbounds ([15 x i8]* @.str, i32 0, i32 0)), !dbg !671
  br label %9, !dbg !671

; <label>:9                                       ; preds = %8, %5
  %10 = load i32* %1, align 4, !dbg !672
  store i32 %10, i32* @compr_level, align 4, !dbg !672
  call void @llvm.memset.p0i8.i64(i8* bitcast (i16* getelementptr inbounds ([0 x i16]* @prev, i32 0, i64 32768) to i8*), i8 0, i64 65536, i32 1, i1 false), !dbg !673
  %11 = load i32* %1, align 4, !dbg !674
  %12 = sext i32 %11 to i64, !dbg !674
  %13 = getelementptr inbounds [10 x %struct.config]* @configuration_table, i32 0, i64 %12, !dbg !674
  %14 = getelementptr inbounds %struct.config* %13, i32 0, i32 1, !dbg !674
  %15 = load i16* %14, align 2, !dbg !674
  %16 = zext i16 %15 to i32, !dbg !674
  store i32 %16, i32* @max_lazy_match, align 4, !dbg !674
  %17 = load i32* %1, align 4, !dbg !675
  %18 = sext i32 %17 to i64, !dbg !675
  %19 = getelementptr inbounds [10 x %struct.config]* @configuration_table, i32 0, i64 %18, !dbg !675
  %20 = getelementptr inbounds %struct.config* %19, i32 0, i32 0, !dbg !675
  %21 = load i16* %20, align 2, !dbg !675
  %22 = zext i16 %21 to i32, !dbg !675
  store i32 %22, i32* @good_match, align 4, !dbg !675
  %23 = load i32* %1, align 4, !dbg !676
  %24 = sext i32 %23 to i64, !dbg !676
  %25 = getelementptr inbounds [10 x %struct.config]* @configuration_table, i32 0, i64 %24, !dbg !676
  %26 = getelementptr inbounds %struct.config* %25, i32 0, i32 2, !dbg !676
  %27 = load i16* %26, align 2, !dbg !676
  %28 = zext i16 %27 to i32, !dbg !676
  store i32 %28, i32* @nice_match, align 4, !dbg !676
  %29 = load i32* %1, align 4, !dbg !677
  %30 = sext i32 %29 to i64, !dbg !677
  %31 = getelementptr inbounds [10 x %struct.config]* @configuration_table, i32 0, i64 %30, !dbg !677
  %32 = getelementptr inbounds %struct.config* %31, i32 0, i32 3, !dbg !677
  %33 = load i16* %32, align 2, !dbg !677
  %34 = zext i16 %33 to i32, !dbg !677
  store i32 %34, i32* @max_chain_length, align 4, !dbg !677
  %35 = load i32* %1, align 4, !dbg !678
  %36 = icmp eq i32 %35, 1, !dbg !678
  br i1 %36, label %37, label %43, !dbg !678

; <label>:37                                      ; preds = %9
  %38 = load i16** %2, align 8, !dbg !679
  %39 = load i16* %38, align 2, !dbg !679
  %40 = zext i16 %39 to i32, !dbg !679
  %41 = or i32 %40, 4, !dbg !679
  %42 = trunc i32 %41 to i16, !dbg !679
  store i16 %42, i16* %38, align 2, !dbg !679
  br label %53, !dbg !681

; <label>:43                                      ; preds = %9
  %44 = load i32* %1, align 4, !dbg !682
  %45 = icmp eq i32 %44, 9, !dbg !682
  br i1 %45, label %46, label %52, !dbg !682

; <label>:46                                      ; preds = %43
  %47 = load i16** %2, align 8, !dbg !683
  %48 = load i16* %47, align 2, !dbg !683
  %49 = zext i16 %48 to i32, !dbg !683
  %50 = or i32 %49, 2, !dbg !683
  %51 = trunc i32 %50 to i16, !dbg !683
  store i16 %51, i16* %47, align 2, !dbg !683
  br label %52, !dbg !685

; <label>:52                                      ; preds = %46, %43
  br label %53

; <label>:53                                      ; preds = %52, %37
  store i32 0, i32* @strstart, align 4, !dbg !686
  store i64 0, i64* @block_start, align 8, !dbg !687
  %54 = load i32 (i8*, i32)** @read_buf, align 8, !dbg !688
  %55 = call i32 %54(i8* getelementptr inbounds ([0 x i8]* @window, i32 0, i32 0), i32 65536), !dbg !688
  store i32 %55, i32* @lookahead, align 4, !dbg !688
  %56 = load i32* @lookahead, align 4, !dbg !689
  %57 = icmp eq i32 %56, 0, !dbg !689
  br i1 %57, label %61, label %58, !dbg !689

; <label>:58                                      ; preds = %53
  %59 = load i32* @lookahead, align 4, !dbg !689
  %60 = icmp eq i32 %59, -1, !dbg !689
  br i1 %60, label %61, label %62, !dbg !689

; <label>:61                                      ; preds = %58, %53
  store i32 1, i32* @eofile, align 4, !dbg !690
  store i32 0, i32* @lookahead, align 4, !dbg !690
  br label %90, !dbg !692

; <label>:62                                      ; preds = %58
  store i32 0, i32* @eofile, align 4, !dbg !693
  br label %63, !dbg !694

; <label>:63                                      ; preds = %72, %62
  %64 = load i32* @lookahead, align 4, !dbg !694
  %65 = icmp ult i32 %64, 262, !dbg !694
  br i1 %65, label %66, label %70, !dbg !694

; <label>:66                                      ; preds = %63
  %67 = load i32* @eofile, align 4, !dbg !694
  %68 = icmp ne i32 %67, 0, !dbg !694
  %69 = xor i1 %68, true, !dbg !694
  br label %70

; <label>:70                                      ; preds = %66, %63
  %71 = phi i1 [ false, %63 ], [ %69, %66 ]
  br i1 %71, label %72, label %73

; <label>:72                                      ; preds = %70
  call void @fill_window(), !dbg !695
  br label %63, !dbg !695

; <label>:73                                      ; preds = %70
  store i32 0, i32* @ins_h, align 4, !dbg !696
  store i32 0, i32* %j, align 4, !dbg !697
  br label %74, !dbg !697

; <label>:74                                      ; preds = %87, %73
  %75 = load i32* %j, align 4, !dbg !697
  %76 = icmp ult i32 %75, 2, !dbg !697
  br i1 %76, label %77, label %90, !dbg !697

; <label>:77                                      ; preds = %74
  %78 = load i32* @ins_h, align 4, !dbg !699
  %79 = shl i32 %78, 5, !dbg !699
  %80 = load i32* %j, align 4, !dbg !699
  %81 = zext i32 %80 to i64, !dbg !699
  %82 = getelementptr inbounds [0 x i8]* @window, i32 0, i64 %81, !dbg !699
  %83 = load i8* %82, align 1, !dbg !699
  %84 = zext i8 %83 to i32, !dbg !699
  %85 = xor i32 %79, %84, !dbg !699
  %86 = and i32 %85, 32767, !dbg !699
  store i32 %86, i32* @ins_h, align 4, !dbg !699
  br label %87, !dbg !699

; <label>:87                                      ; preds = %77
  %88 = load i32* %j, align 4, !dbg !700
  %89 = add i32 %88, 1, !dbg !700
  store i32 %89, i32* %j, align 4, !dbg !700
  br label %74, !dbg !700

; <label>:90                                      ; preds = %74, %61
  ret void, !dbg !701
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define internal void @fill_window() nounwind uwtable {
  %n = alloca i32, align 4
  %m = alloca i32, align 4
  %more = alloca i32, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !702), !dbg !704
  call void @llvm.dbg.declare(metadata !22, metadata !705), !dbg !706
  call void @llvm.dbg.declare(metadata !22, metadata !707), !dbg !708
  %1 = load i64* @window_size, align 8, !dbg !709
  %2 = load i32* @lookahead, align 4, !dbg !709
  %3 = zext i32 %2 to i64, !dbg !709
  %4 = sub i64 %1, %3, !dbg !709
  %5 = load i32* @strstart, align 4, !dbg !709
  %6 = zext i32 %5 to i64, !dbg !709
  %7 = sub i64 %4, %6, !dbg !709
  %8 = trunc i64 %7 to i32, !dbg !709
  store i32 %8, i32* %more, align 4, !dbg !709
  %9 = load i32* %more, align 4, !dbg !710
  %10 = icmp eq i32 %9, -1, !dbg !710
  br i1 %10, label %11, label %14, !dbg !710

; <label>:11                                      ; preds = %0
  %12 = load i32* %more, align 4, !dbg !711
  %13 = add i32 %12, -1, !dbg !711
  store i32 %13, i32* %more, align 4, !dbg !711
  br label %77, !dbg !713

; <label>:14                                      ; preds = %0
  %15 = load i32* @strstart, align 4, !dbg !714
  %16 = icmp uge i32 %15, 65274, !dbg !714
  br i1 %16, label %17, label %76, !dbg !714

; <label>:17                                      ; preds = %14
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr inbounds ([0 x i8]* @window, i32 0, i32 0), i8* getelementptr inbounds ([0 x i8]* @window, i32 0, i64 32768), i64 32768, i32 1, i1 false), !dbg !715
  %18 = load i32* @match_start, align 4, !dbg !717
  %19 = sub i32 %18, 32768, !dbg !717
  store i32 %19, i32* @match_start, align 4, !dbg !717
  %20 = load i32* @strstart, align 4, !dbg !718
  %21 = sub i32 %20, 32768, !dbg !718
  store i32 %21, i32* @strstart, align 4, !dbg !718
  %22 = load i64* @block_start, align 8, !dbg !719
  %23 = sub nsw i64 %22, 32768, !dbg !719
  store i64 %23, i64* @block_start, align 8, !dbg !719
  store i32 0, i32* %n, align 4, !dbg !720
  br label %24, !dbg !720

; <label>:24                                      ; preds = %45, %17
  %25 = load i32* %n, align 4, !dbg !720
  %26 = icmp ult i32 %25, 32768, !dbg !720
  br i1 %26, label %27, label %48, !dbg !720

; <label>:27                                      ; preds = %24
  %28 = load i32* %n, align 4, !dbg !722
  %29 = zext i32 %28 to i64, !dbg !722
  %30 = getelementptr inbounds i16* getelementptr inbounds ([0 x i16]* @prev, i32 0, i64 32768), i64 %29, !dbg !722
  %31 = load i16* %30, align 2, !dbg !722
  %32 = zext i16 %31 to i32, !dbg !722
  store i32 %32, i32* %m, align 4, !dbg !722
  %33 = load i32* %m, align 4, !dbg !724
  %34 = icmp uge i32 %33, 32768, !dbg !724
  br i1 %34, label %35, label %38, !dbg !724

; <label>:35                                      ; preds = %27
  %36 = load i32* %m, align 4, !dbg !724
  %37 = sub i32 %36, 32768, !dbg !724
  br label %39, !dbg !724

; <label>:38                                      ; preds = %27
  br label %39, !dbg !724

; <label>:39                                      ; preds = %38, %35
  %40 = phi i32 [ %37, %35 ], [ 0, %38 ], !dbg !724
  %41 = trunc i32 %40 to i16, !dbg !724
  %42 = load i32* %n, align 4, !dbg !724
  %43 = zext i32 %42 to i64, !dbg !724
  %44 = getelementptr inbounds i16* getelementptr inbounds ([0 x i16]* @prev, i32 0, i64 32768), i64 %43, !dbg !724
  store i16 %41, i16* %44, align 2, !dbg !724
  br label %45, !dbg !725

; <label>:45                                      ; preds = %39
  %46 = load i32* %n, align 4, !dbg !726
  %47 = add i32 %46, 1, !dbg !726
  store i32 %47, i32* %n, align 4, !dbg !726
  br label %24, !dbg !726

; <label>:48                                      ; preds = %24
  store i32 0, i32* %n, align 4, !dbg !727
  br label %49, !dbg !727

; <label>:49                                      ; preds = %70, %48
  %50 = load i32* %n, align 4, !dbg !727
  %51 = icmp ult i32 %50, 32768, !dbg !727
  br i1 %51, label %52, label %73, !dbg !727

; <label>:52                                      ; preds = %49
  %53 = load i32* %n, align 4, !dbg !729
  %54 = zext i32 %53 to i64, !dbg !729
  %55 = getelementptr inbounds [0 x i16]* @prev, i32 0, i64 %54, !dbg !729
  %56 = load i16* %55, align 1, !dbg !729
  %57 = zext i16 %56 to i32, !dbg !729
  store i32 %57, i32* %m, align 4, !dbg !729
  %58 = load i32* %m, align 4, !dbg !731
  %59 = icmp uge i32 %58, 32768, !dbg !731
  br i1 %59, label %60, label %63, !dbg !731

; <label>:60                                      ; preds = %52
  %61 = load i32* %m, align 4, !dbg !731
  %62 = sub i32 %61, 32768, !dbg !731
  br label %64, !dbg !731

; <label>:63                                      ; preds = %52
  br label %64, !dbg !731

; <label>:64                                      ; preds = %63, %60
  %65 = phi i32 [ %62, %60 ], [ 0, %63 ], !dbg !731
  %66 = trunc i32 %65 to i16, !dbg !731
  %67 = load i32* %n, align 4, !dbg !731
  %68 = zext i32 %67 to i64, !dbg !731
  %69 = getelementptr inbounds [0 x i16]* @prev, i32 0, i64 %68, !dbg !731
  store i16 %66, i16* %69, align 1, !dbg !731
  br label %70, !dbg !732

; <label>:70                                      ; preds = %64
  %71 = load i32* %n, align 4, !dbg !733
  %72 = add i32 %71, 1, !dbg !733
  store i32 %72, i32* %n, align 4, !dbg !733
  br label %49, !dbg !733

; <label>:73                                      ; preds = %49
  %74 = load i32* %more, align 4, !dbg !734
  %75 = add i32 %74, 32768, !dbg !734
  store i32 %75, i32* %more, align 4, !dbg !734
  br label %76, !dbg !735

; <label>:76                                      ; preds = %73, %14
  br label %77

; <label>:77                                      ; preds = %76, %11
  %78 = load i32* @eofile, align 4, !dbg !736
  %79 = icmp ne i32 %78, 0, !dbg !736
  br i1 %79, label %101, label %80, !dbg !736

; <label>:80                                      ; preds = %77
  %81 = load i32 (i8*, i32)** @read_buf, align 8, !dbg !737
  %82 = load i32* @strstart, align 4, !dbg !737
  %83 = zext i32 %82 to i64, !dbg !737
  %84 = getelementptr inbounds i8* getelementptr inbounds ([0 x i8]* @window, i32 0, i32 0), i64 %83, !dbg !737
  %85 = load i32* @lookahead, align 4, !dbg !737
  %86 = zext i32 %85 to i64, !dbg !737
  %87 = getelementptr inbounds i8* %84, i64 %86, !dbg !737
  %88 = load i32* %more, align 4, !dbg !737
  %89 = call i32 %81(i8* %87, i32 %88), !dbg !737
  store i32 %89, i32* %n, align 4, !dbg !737
  %90 = load i32* %n, align 4, !dbg !739
  %91 = icmp eq i32 %90, 0, !dbg !739
  br i1 %91, label %95, label %92, !dbg !739

; <label>:92                                      ; preds = %80
  %93 = load i32* %n, align 4, !dbg !739
  %94 = icmp eq i32 %93, -1, !dbg !739
  br i1 %94, label %95, label %96, !dbg !739

; <label>:95                                      ; preds = %92, %80
  store i32 1, i32* @eofile, align 4, !dbg !740
  br label %100, !dbg !742

; <label>:96                                      ; preds = %92
  %97 = load i32* %n, align 4, !dbg !743
  %98 = load i32* @lookahead, align 4, !dbg !743
  %99 = add i32 %98, %97, !dbg !743
  store i32 %99, i32* @lookahead, align 4, !dbg !743
  br label %100

; <label>:100                                     ; preds = %96, %95
  br label %101, !dbg !745

; <label>:101                                     ; preds = %100, %77
  ret void, !dbg !746
}

define i32 @longest_match(i32 %cur_match) nounwind uwtable {
  %1 = alloca i32, align 4
  %chain_length = alloca i32, align 4
  %scan = alloca i8*, align 8
  %match = alloca i8*, align 8
  %len = alloca i32, align 4
  %best_len = alloca i32, align 4
  %limit = alloca i32, align 4
  %strend = alloca i8*, align 8
  %scan_end1 = alloca i8, align 1
  %scan_end = alloca i8, align 1
  store i32 %cur_match, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !747), !dbg !748
  call void @llvm.dbg.declare(metadata !22, metadata !749), !dbg !751
  %2 = load i32* @max_chain_length, align 4, !dbg !752
  store i32 %2, i32* %chain_length, align 4, !dbg !752
  call void @llvm.dbg.declare(metadata !22, metadata !753), !dbg !756
  %3 = load i32* @strstart, align 4, !dbg !757
  %4 = zext i32 %3 to i64, !dbg !757
  %5 = getelementptr inbounds i8* getelementptr inbounds ([0 x i8]* @window, i32 0, i32 0), i64 %4, !dbg !757
  store i8* %5, i8** %scan, align 8, !dbg !757
  call void @llvm.dbg.declare(metadata !22, metadata !758), !dbg !759
  call void @llvm.dbg.declare(metadata !22, metadata !760), !dbg !761
  call void @llvm.dbg.declare(metadata !22, metadata !762), !dbg !763
  %6 = load i32* @prev_length, align 4, !dbg !764
  store i32 %6, i32* %best_len, align 4, !dbg !764
  call void @llvm.dbg.declare(metadata !22, metadata !765), !dbg !766
  %7 = load i32* @strstart, align 4, !dbg !767
  %8 = icmp ugt i32 %7, 32506, !dbg !767
  br i1 %8, label %9, label %12, !dbg !767

; <label>:9                                       ; preds = %0
  %10 = load i32* @strstart, align 4, !dbg !767
  %11 = sub i32 %10, 32506, !dbg !767
  br label %13, !dbg !767

; <label>:12                                      ; preds = %0
  br label %13, !dbg !767

; <label>:13                                      ; preds = %12, %9
  %14 = phi i32 [ %11, %9 ], [ 0, %12 ], !dbg !767
  store i32 %14, i32* %limit, align 4, !dbg !767
  call void @llvm.dbg.declare(metadata !22, metadata !768), !dbg !769
  %15 = load i32* @strstart, align 4, !dbg !770
  %16 = zext i32 %15 to i64, !dbg !770
  %17 = getelementptr inbounds i8* getelementptr inbounds ([0 x i8]* @window, i32 0, i32 0), i64 %16, !dbg !770
  %18 = getelementptr inbounds i8* %17, i64 258, !dbg !770
  store i8* %18, i8** %strend, align 8, !dbg !770
  call void @llvm.dbg.declare(metadata !22, metadata !771), !dbg !772
  %19 = load i32* %best_len, align 4, !dbg !773
  %20 = sub nsw i32 %19, 1, !dbg !773
  %21 = sext i32 %20 to i64, !dbg !773
  %22 = load i8** %scan, align 8, !dbg !773
  %23 = getelementptr inbounds i8* %22, i64 %21, !dbg !773
  %24 = load i8* %23, align 1, !dbg !773
  store i8 %24, i8* %scan_end1, align 1, !dbg !773
  call void @llvm.dbg.declare(metadata !22, metadata !774), !dbg !775
  %25 = load i32* %best_len, align 4, !dbg !776
  %26 = sext i32 %25 to i64, !dbg !776
  %27 = load i8** %scan, align 8, !dbg !776
  %28 = getelementptr inbounds i8* %27, i64 %26, !dbg !776
  %29 = load i8* %28, align 1, !dbg !776
  store i8 %29, i8* %scan_end, align 1, !dbg !776
  %30 = load i32* @prev_length, align 4, !dbg !777
  %31 = load i32* @good_match, align 4, !dbg !777
  %32 = icmp uge i32 %30, %31, !dbg !777
  br i1 %32, label %33, label %36, !dbg !777

; <label>:33                                      ; preds = %13
  %34 = load i32* %chain_length, align 4, !dbg !778
  %35 = lshr i32 %34, 2, !dbg !778
  store i32 %35, i32* %chain_length, align 4, !dbg !778
  br label %36, !dbg !780

; <label>:36                                      ; preds = %33, %13
  br label %37, !dbg !781

; <label>:37                                      ; preds = %218, %36
  %38 = load i32* %1, align 4, !dbg !782
  %39 = zext i32 %38 to i64, !dbg !782
  %40 = getelementptr inbounds i8* getelementptr inbounds ([0 x i8]* @window, i32 0, i32 0), i64 %39, !dbg !782
  store i8* %40, i8** %match, align 8, !dbg !782
  %41 = load i32* %best_len, align 4, !dbg !784
  %42 = sext i32 %41 to i64, !dbg !784
  %43 = load i8** %match, align 8, !dbg !784
  %44 = getelementptr inbounds i8* %43, i64 %42, !dbg !784
  %45 = load i8* %44, align 1, !dbg !784
  %46 = zext i8 %45 to i32, !dbg !784
  %47 = load i8* %scan_end, align 1, !dbg !784
  %48 = zext i8 %47 to i32, !dbg !784
  %49 = icmp ne i32 %46, %48, !dbg !784
  br i1 %49, label %79, label %50, !dbg !784

; <label>:50                                      ; preds = %37
  %51 = load i32* %best_len, align 4, !dbg !784
  %52 = sub nsw i32 %51, 1, !dbg !784
  %53 = sext i32 %52 to i64, !dbg !784
  %54 = load i8** %match, align 8, !dbg !784
  %55 = getelementptr inbounds i8* %54, i64 %53, !dbg !784
  %56 = load i8* %55, align 1, !dbg !784
  %57 = zext i8 %56 to i32, !dbg !784
  %58 = load i8* %scan_end1, align 1, !dbg !784
  %59 = zext i8 %58 to i32, !dbg !784
  %60 = icmp ne i32 %57, %59, !dbg !784
  br i1 %60, label %79, label %61, !dbg !784

; <label>:61                                      ; preds = %50
  %62 = load i8** %match, align 8, !dbg !784
  %63 = load i8* %62, align 1, !dbg !784
  %64 = zext i8 %63 to i32, !dbg !784
  %65 = load i8** %scan, align 8, !dbg !784
  %66 = load i8* %65, align 1, !dbg !784
  %67 = zext i8 %66 to i32, !dbg !784
  %68 = icmp ne i32 %64, %67, !dbg !784
  br i1 %68, label %79, label %69, !dbg !784

; <label>:69                                      ; preds = %61
  %70 = load i8** %match, align 8, !dbg !784
  %71 = getelementptr inbounds i8* %70, i32 1, !dbg !784
  store i8* %71, i8** %match, align 8, !dbg !784
  %72 = load i8* %71, align 1, !dbg !784
  %73 = zext i8 %72 to i32, !dbg !784
  %74 = load i8** %scan, align 8, !dbg !784
  %75 = getelementptr inbounds i8* %74, i64 1, !dbg !784
  %76 = load i8* %75, align 1, !dbg !784
  %77 = zext i8 %76 to i32, !dbg !784
  %78 = icmp ne i32 %73, %77, !dbg !784
  br i1 %78, label %79, label %80, !dbg !784

; <label>:79                                      ; preds = %69, %61, %50, %37
  br label %205, !dbg !785

; <label>:80                                      ; preds = %69
  %81 = load i8** %scan, align 8, !dbg !786
  %82 = getelementptr inbounds i8* %81, i64 2, !dbg !786
  store i8* %82, i8** %scan, align 8, !dbg !786
  %83 = load i8** %match, align 8, !dbg !786
  %84 = getelementptr inbounds i8* %83, i32 1, !dbg !786
  store i8* %84, i8** %match, align 8, !dbg !786
  br label %85, !dbg !787

; <label>:85                                      ; preds = %170, %80
  br label %86, !dbg !788

; <label>:86                                      ; preds = %85
  %87 = load i8** %scan, align 8, !dbg !788
  %88 = getelementptr inbounds i8* %87, i32 1, !dbg !788
  store i8* %88, i8** %scan, align 8, !dbg !788
  %89 = load i8* %88, align 1, !dbg !788
  %90 = zext i8 %89 to i32, !dbg !788
  %91 = load i8** %match, align 8, !dbg !788
  %92 = getelementptr inbounds i8* %91, i32 1, !dbg !788
  store i8* %92, i8** %match, align 8, !dbg !788
  %93 = load i8* %92, align 1, !dbg !788
  %94 = zext i8 %93 to i32, !dbg !788
  %95 = icmp eq i32 %90, %94, !dbg !788
  br i1 %95, label %96, label %170, !dbg !788

; <label>:96                                      ; preds = %86
  %97 = load i8** %scan, align 8, !dbg !788
  %98 = getelementptr inbounds i8* %97, i32 1, !dbg !788
  store i8* %98, i8** %scan, align 8, !dbg !788
  %99 = load i8* %98, align 1, !dbg !788
  %100 = zext i8 %99 to i32, !dbg !788
  %101 = load i8** %match, align 8, !dbg !788
  %102 = getelementptr inbounds i8* %101, i32 1, !dbg !788
  store i8* %102, i8** %match, align 8, !dbg !788
  %103 = load i8* %102, align 1, !dbg !788
  %104 = zext i8 %103 to i32, !dbg !788
  %105 = icmp eq i32 %100, %104, !dbg !788
  br i1 %105, label %106, label %170, !dbg !788

; <label>:106                                     ; preds = %96
  %107 = load i8** %scan, align 8, !dbg !788
  %108 = getelementptr inbounds i8* %107, i32 1, !dbg !788
  store i8* %108, i8** %scan, align 8, !dbg !788
  %109 = load i8* %108, align 1, !dbg !788
  %110 = zext i8 %109 to i32, !dbg !788
  %111 = load i8** %match, align 8, !dbg !788
  %112 = getelementptr inbounds i8* %111, i32 1, !dbg !788
  store i8* %112, i8** %match, align 8, !dbg !788
  %113 = load i8* %112, align 1, !dbg !788
  %114 = zext i8 %113 to i32, !dbg !788
  %115 = icmp eq i32 %110, %114, !dbg !788
  br i1 %115, label %116, label %170, !dbg !788

; <label>:116                                     ; preds = %106
  %117 = load i8** %scan, align 8, !dbg !788
  %118 = getelementptr inbounds i8* %117, i32 1, !dbg !788
  store i8* %118, i8** %scan, align 8, !dbg !788
  %119 = load i8* %118, align 1, !dbg !788
  %120 = zext i8 %119 to i32, !dbg !788
  %121 = load i8** %match, align 8, !dbg !788
  %122 = getelementptr inbounds i8* %121, i32 1, !dbg !788
  store i8* %122, i8** %match, align 8, !dbg !788
  %123 = load i8* %122, align 1, !dbg !788
  %124 = zext i8 %123 to i32, !dbg !788
  %125 = icmp eq i32 %120, %124, !dbg !788
  br i1 %125, label %126, label %170, !dbg !788

; <label>:126                                     ; preds = %116
  %127 = load i8** %scan, align 8, !dbg !788
  %128 = getelementptr inbounds i8* %127, i32 1, !dbg !788
  store i8* %128, i8** %scan, align 8, !dbg !788
  %129 = load i8* %128, align 1, !dbg !788
  %130 = zext i8 %129 to i32, !dbg !788
  %131 = load i8** %match, align 8, !dbg !788
  %132 = getelementptr inbounds i8* %131, i32 1, !dbg !788
  store i8* %132, i8** %match, align 8, !dbg !788
  %133 = load i8* %132, align 1, !dbg !788
  %134 = zext i8 %133 to i32, !dbg !788
  %135 = icmp eq i32 %130, %134, !dbg !788
  br i1 %135, label %136, label %170, !dbg !788

; <label>:136                                     ; preds = %126
  %137 = load i8** %scan, align 8, !dbg !788
  %138 = getelementptr inbounds i8* %137, i32 1, !dbg !788
  store i8* %138, i8** %scan, align 8, !dbg !788
  %139 = load i8* %138, align 1, !dbg !788
  %140 = zext i8 %139 to i32, !dbg !788
  %141 = load i8** %match, align 8, !dbg !788
  %142 = getelementptr inbounds i8* %141, i32 1, !dbg !788
  store i8* %142, i8** %match, align 8, !dbg !788
  %143 = load i8* %142, align 1, !dbg !788
  %144 = zext i8 %143 to i32, !dbg !788
  %145 = icmp eq i32 %140, %144, !dbg !788
  br i1 %145, label %146, label %170, !dbg !788

; <label>:146                                     ; preds = %136
  %147 = load i8** %scan, align 8, !dbg !788
  %148 = getelementptr inbounds i8* %147, i32 1, !dbg !788
  store i8* %148, i8** %scan, align 8, !dbg !788
  %149 = load i8* %148, align 1, !dbg !788
  %150 = zext i8 %149 to i32, !dbg !788
  %151 = load i8** %match, align 8, !dbg !788
  %152 = getelementptr inbounds i8* %151, i32 1, !dbg !788
  store i8* %152, i8** %match, align 8, !dbg !788
  %153 = load i8* %152, align 1, !dbg !788
  %154 = zext i8 %153 to i32, !dbg !788
  %155 = icmp eq i32 %150, %154, !dbg !788
  br i1 %155, label %156, label %170, !dbg !788

; <label>:156                                     ; preds = %146
  %157 = load i8** %scan, align 8, !dbg !788
  %158 = getelementptr inbounds i8* %157, i32 1, !dbg !788
  store i8* %158, i8** %scan, align 8, !dbg !788
  %159 = load i8* %158, align 1, !dbg !788
  %160 = zext i8 %159 to i32, !dbg !788
  %161 = load i8** %match, align 8, !dbg !788
  %162 = getelementptr inbounds i8* %161, i32 1, !dbg !788
  store i8* %162, i8** %match, align 8, !dbg !788
  %163 = load i8* %162, align 1, !dbg !788
  %164 = zext i8 %163 to i32, !dbg !788
  %165 = icmp eq i32 %160, %164, !dbg !788
  br i1 %165, label %166, label %170, !dbg !788

; <label>:166                                     ; preds = %156
  %167 = load i8** %scan, align 8, !dbg !788
  %168 = load i8** %strend, align 8, !dbg !788
  %169 = icmp ult i8* %167, %168, !dbg !788
  br label %170

; <label>:170                                     ; preds = %166, %156, %146, %136, %126, %116, %106, %96, %86
  %171 = phi i1 [ false, %156 ], [ false, %146 ], [ false, %136 ], [ false, %126 ], [ false, %116 ], [ false, %106 ], [ false, %96 ], [ false, %86 ], [ %169, %166 ]
  br i1 %171, label %85, label %172

; <label>:172                                     ; preds = %170
  %173 = load i8** %strend, align 8, !dbg !790
  %174 = load i8** %scan, align 8, !dbg !790
  %175 = ptrtoint i8* %173 to i64, !dbg !790
  %176 = ptrtoint i8* %174 to i64, !dbg !790
  %177 = sub i64 %175, %176, !dbg !790
  %178 = trunc i64 %177 to i32, !dbg !790
  %179 = sub nsw i32 258, %178, !dbg !790
  store i32 %179, i32* %len, align 4, !dbg !790
  %180 = load i8** %strend, align 8, !dbg !791
  %181 = getelementptr inbounds i8* %180, i64 -258, !dbg !791
  store i8* %181, i8** %scan, align 8, !dbg !791
  %182 = load i32* %len, align 4, !dbg !792
  %183 = load i32* %best_len, align 4, !dbg !792
  %184 = icmp sgt i32 %182, %183, !dbg !792
  br i1 %184, label %185, label %204, !dbg !792

; <label>:185                                     ; preds = %172
  %186 = load i32* %1, align 4, !dbg !793
  store i32 %186, i32* @match_start, align 4, !dbg !793
  %187 = load i32* %len, align 4, !dbg !795
  store i32 %187, i32* %best_len, align 4, !dbg !795
  %188 = load i32* %len, align 4, !dbg !796
  %189 = load i32* @nice_match, align 4, !dbg !796
  %190 = icmp sge i32 %188, %189, !dbg !796
  br i1 %190, label %191, label %192, !dbg !796

; <label>:191                                     ; preds = %185
  br label %220, !dbg !797

; <label>:192                                     ; preds = %185
  %193 = load i32* %best_len, align 4, !dbg !798
  %194 = sub nsw i32 %193, 1, !dbg !798
  %195 = sext i32 %194 to i64, !dbg !798
  %196 = load i8** %scan, align 8, !dbg !798
  %197 = getelementptr inbounds i8* %196, i64 %195, !dbg !798
  %198 = load i8* %197, align 1, !dbg !798
  store i8 %198, i8* %scan_end1, align 1, !dbg !798
  %199 = load i32* %best_len, align 4, !dbg !799
  %200 = sext i32 %199 to i64, !dbg !799
  %201 = load i8** %scan, align 8, !dbg !799
  %202 = getelementptr inbounds i8* %201, i64 %200, !dbg !799
  %203 = load i8* %202, align 1, !dbg !799
  store i8 %203, i8* %scan_end, align 1, !dbg !799
  br label %204, !dbg !800

; <label>:204                                     ; preds = %192, %172
  br label %205, !dbg !801

; <label>:205                                     ; preds = %204, %79
  %206 = load i32* %1, align 4, !dbg !801
  %207 = and i32 %206, 32767, !dbg !801
  %208 = zext i32 %207 to i64, !dbg !801
  %209 = getelementptr inbounds [0 x i16]* @prev, i32 0, i64 %208, !dbg !801
  %210 = load i16* %209, align 1, !dbg !801
  %211 = zext i16 %210 to i32, !dbg !801
  store i32 %211, i32* %1, align 4, !dbg !801
  %212 = load i32* %limit, align 4, !dbg !801
  %213 = icmp ugt i32 %211, %212, !dbg !801
  br i1 %213, label %214, label %218, !dbg !801

; <label>:214                                     ; preds = %205
  %215 = load i32* %chain_length, align 4, !dbg !801
  %216 = add i32 %215, -1, !dbg !801
  store i32 %216, i32* %chain_length, align 4, !dbg !801
  %217 = icmp ne i32 %216, 0, !dbg !801
  br label %218

; <label>:218                                     ; preds = %214, %205
  %219 = phi i1 [ false, %205 ], [ %217, %214 ]
  br i1 %219, label %37, label %220

; <label>:220                                     ; preds = %218, %191
  %221 = load i32* %best_len, align 4, !dbg !802
  ret i32 %221, !dbg !802
}

define i64 @deflate() nounwind uwtable {
  %1 = alloca i64, align 8
  %hash_head = alloca i32, align 4
  %prev_match = alloca i32, align 4
  %flush = alloca i32, align 4
  %match_available = alloca i32, align 4
  %match_length = alloca i32, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !803), !dbg !805
  call void @llvm.dbg.declare(metadata !22, metadata !806), !dbg !807
  call void @llvm.dbg.declare(metadata !22, metadata !808), !dbg !809
  call void @llvm.dbg.declare(metadata !22, metadata !810), !dbg !811
  store i32 0, i32* %match_available, align 4, !dbg !812
  call void @llvm.dbg.declare(metadata !22, metadata !813), !dbg !814
  store i32 2, i32* %match_length, align 4, !dbg !815
  %2 = load i32* @compr_level, align 4, !dbg !816
  %3 = icmp sle i32 %2, 3, !dbg !816
  br i1 %3, label %4, label %6, !dbg !816

; <label>:4                                       ; preds = %0
  %5 = call i64 @deflate_fast(), !dbg !817
  store i64 %5, i64* %1, !dbg !817
  br label %228, !dbg !817

; <label>:6                                       ; preds = %0
  br label %7, !dbg !818

; <label>:7                                       ; preds = %200, %6
  %8 = load i32* @lookahead, align 4, !dbg !818
  %9 = icmp ne i32 %8, 0, !dbg !818
  br i1 %9, label %10, label %201, !dbg !818

; <label>:10                                      ; preds = %7
  %11 = load i32* @ins_h, align 4, !dbg !819
  %12 = shl i32 %11, 5, !dbg !819
  %13 = load i32* @strstart, align 4, !dbg !819
  %14 = add i32 %13, 3, !dbg !819
  %15 = sub i32 %14, 1, !dbg !819
  %16 = zext i32 %15 to i64, !dbg !819
  %17 = getelementptr inbounds [0 x i8]* @window, i32 0, i64 %16, !dbg !819
  %18 = load i8* %17, align 1, !dbg !819
  %19 = zext i8 %18 to i32, !dbg !819
  %20 = xor i32 %12, %19, !dbg !819
  %21 = and i32 %20, 32767, !dbg !819
  store i32 %21, i32* @ins_h, align 4, !dbg !819
  %22 = load i32* @ins_h, align 4, !dbg !819
  %23 = zext i32 %22 to i64, !dbg !819
  %24 = getelementptr inbounds i16* getelementptr inbounds ([0 x i16]* @prev, i32 0, i64 32768), i64 %23, !dbg !819
  %25 = load i16* %24, align 2, !dbg !819
  %26 = zext i16 %25 to i32, !dbg !819
  store i32 %26, i32* %hash_head, align 4, !dbg !819
  %27 = trunc i32 %26 to i16, !dbg !819
  %28 = load i32* @strstart, align 4, !dbg !819
  %29 = and i32 %28, 32767, !dbg !819
  %30 = zext i32 %29 to i64, !dbg !819
  %31 = getelementptr inbounds [0 x i16]* @prev, i32 0, i64 %30, !dbg !819
  store i16 %27, i16* %31, align 1, !dbg !819
  %32 = load i32* @strstart, align 4, !dbg !819
  %33 = trunc i32 %32 to i16, !dbg !819
  %34 = load i32* @ins_h, align 4, !dbg !819
  %35 = zext i32 %34 to i64, !dbg !819
  %36 = getelementptr inbounds i16* getelementptr inbounds ([0 x i16]* @prev, i32 0, i64 32768), i64 %35, !dbg !819
  store i16 %33, i16* %36, align 2, !dbg !819
  %37 = load i32* %match_length, align 4, !dbg !821
  store i32 %37, i32* @prev_length, align 4, !dbg !821
  %38 = load i32* @match_start, align 4, !dbg !821
  store i32 %38, i32* %prev_match, align 4, !dbg !821
  store i32 2, i32* %match_length, align 4, !dbg !822
  %39 = load i32* %hash_head, align 4, !dbg !823
  %40 = icmp ne i32 %39, 0, !dbg !823
  br i1 %40, label %41, label %70, !dbg !823

; <label>:41                                      ; preds = %10
  %42 = load i32* @prev_length, align 4, !dbg !823
  %43 = load i32* @max_lazy_match, align 4, !dbg !823
  %44 = icmp ult i32 %42, %43, !dbg !823
  br i1 %44, label %45, label %70, !dbg !823

; <label>:45                                      ; preds = %41
  %46 = load i32* @strstart, align 4, !dbg !823
  %47 = load i32* %hash_head, align 4, !dbg !823
  %48 = sub i32 %46, %47, !dbg !823
  %49 = icmp ule i32 %48, 32506, !dbg !823
  br i1 %49, label %50, label %70, !dbg !823

; <label>:50                                      ; preds = %45
  %51 = load i32* %hash_head, align 4, !dbg !824
  %52 = call i32 (...)* bitcast (i32 (i32)* @longest_match to i32 (...)*)(i32 %51), !dbg !824
  store i32 %52, i32* %match_length, align 4, !dbg !824
  %53 = load i32* %match_length, align 4, !dbg !826
  %54 = load i32* @lookahead, align 4, !dbg !826
  %55 = icmp ugt i32 %53, %54, !dbg !826
  br i1 %55, label %56, label %58, !dbg !826

; <label>:56                                      ; preds = %50
  %57 = load i32* @lookahead, align 4, !dbg !827
  store i32 %57, i32* %match_length, align 4, !dbg !827
  br label %58, !dbg !827

; <label>:58                                      ; preds = %56, %50
  %59 = load i32* %match_length, align 4, !dbg !828
  %60 = icmp eq i32 %59, 3, !dbg !828
  br i1 %60, label %61, label %69, !dbg !828

; <label>:61                                      ; preds = %58
  %62 = load i32* @strstart, align 4, !dbg !828
  %63 = load i32* @match_start, align 4, !dbg !828
  %64 = sub i32 %62, %63, !dbg !828
  %65 = icmp ugt i32 %64, 4096, !dbg !828
  br i1 %65, label %66, label %69, !dbg !828

; <label>:66                                      ; preds = %61
  %67 = load i32* %match_length, align 4, !dbg !829
  %68 = add i32 %67, -1, !dbg !829
  store i32 %68, i32* %match_length, align 4, !dbg !829
  br label %69, !dbg !831

; <label>:69                                      ; preds = %66, %61, %58
  br label %70, !dbg !832

; <label>:70                                      ; preds = %69, %45, %41, %10
  %71 = load i32* @prev_length, align 4, !dbg !833
  %72 = icmp uge i32 %71, 3, !dbg !833
  br i1 %72, label %73, label %148, !dbg !833

; <label>:73                                      ; preds = %70
  %74 = load i32* %match_length, align 4, !dbg !833
  %75 = load i32* @prev_length, align 4, !dbg !833
  %76 = icmp ule i32 %74, %75, !dbg !833
  br i1 %76, label %77, label %148, !dbg !833

; <label>:77                                      ; preds = %73
  %78 = load i32* @strstart, align 4, !dbg !834
  %79 = sub i32 %78, 1, !dbg !834
  %80 = load i32* %prev_match, align 4, !dbg !834
  %81 = sub i32 %79, %80, !dbg !834
  %82 = load i32* @prev_length, align 4, !dbg !834
  %83 = sub i32 %82, 3, !dbg !834
  %84 = call i32 @ct_tally(i32 %81, i32 %83), !dbg !834
  store i32 %84, i32* %flush, align 4, !dbg !834
  %85 = load i32* @prev_length, align 4, !dbg !836
  %86 = sub i32 %85, 1, !dbg !836
  %87 = load i32* @lookahead, align 4, !dbg !836
  %88 = sub i32 %87, %86, !dbg !836
  store i32 %88, i32* @lookahead, align 4, !dbg !836
  %89 = load i32* @prev_length, align 4, !dbg !837
  %90 = sub i32 %89, 2, !dbg !837
  store i32 %90, i32* @prev_length, align 4, !dbg !837
  br label %91, !dbg !838

; <label>:91                                      ; preds = %120, %77
  %92 = load i32* @strstart, align 4, !dbg !839
  %93 = add i32 %92, 1, !dbg !839
  store i32 %93, i32* @strstart, align 4, !dbg !839
  %94 = load i32* @ins_h, align 4, !dbg !841
  %95 = shl i32 %94, 5, !dbg !841
  %96 = load i32* @strstart, align 4, !dbg !841
  %97 = add i32 %96, 3, !dbg !841
  %98 = sub i32 %97, 1, !dbg !841
  %99 = zext i32 %98 to i64, !dbg !841
  %100 = getelementptr inbounds [0 x i8]* @window, i32 0, i64 %99, !dbg !841
  %101 = load i8* %100, align 1, !dbg !841
  %102 = zext i8 %101 to i32, !dbg !841
  %103 = xor i32 %95, %102, !dbg !841
  %104 = and i32 %103, 32767, !dbg !841
  store i32 %104, i32* @ins_h, align 4, !dbg !841
  %105 = load i32* @ins_h, align 4, !dbg !841
  %106 = zext i32 %105 to i64, !dbg !841
  %107 = getelementptr inbounds i16* getelementptr inbounds ([0 x i16]* @prev, i32 0, i64 32768), i64 %106, !dbg !841
  %108 = load i16* %107, align 2, !dbg !841
  %109 = zext i16 %108 to i32, !dbg !841
  store i32 %109, i32* %hash_head, align 4, !dbg !841
  %110 = trunc i32 %109 to i16, !dbg !841
  %111 = load i32* @strstart, align 4, !dbg !841
  %112 = and i32 %111, 32767, !dbg !841
  %113 = zext i32 %112 to i64, !dbg !841
  %114 = getelementptr inbounds [0 x i16]* @prev, i32 0, i64 %113, !dbg !841
  store i16 %110, i16* %114, align 1, !dbg !841
  %115 = load i32* @strstart, align 4, !dbg !841
  %116 = trunc i32 %115 to i16, !dbg !841
  %117 = load i32* @ins_h, align 4, !dbg !841
  %118 = zext i32 %117 to i64, !dbg !841
  %119 = getelementptr inbounds i16* getelementptr inbounds ([0 x i16]* @prev, i32 0, i64 32768), i64 %118, !dbg !841
  store i16 %116, i16* %119, align 2, !dbg !841
  br label %120, !dbg !842

; <label>:120                                     ; preds = %91
  %121 = load i32* @prev_length, align 4, !dbg !842
  %122 = add i32 %121, -1, !dbg !842
  store i32 %122, i32* @prev_length, align 4, !dbg !842
  %123 = icmp ne i32 %122, 0, !dbg !842
  br i1 %123, label %91, label %124, !dbg !842

; <label>:124                                     ; preds = %120
  store i32 0, i32* %match_available, align 4, !dbg !843
  store i32 2, i32* %match_length, align 4, !dbg !844
  %125 = load i32* @strstart, align 4, !dbg !845
  %126 = add i32 %125, 1, !dbg !845
  store i32 %126, i32* @strstart, align 4, !dbg !845
  %127 = load i32* %flush, align 4, !dbg !846
  %128 = icmp ne i32 %127, 0, !dbg !846
  br i1 %128, label %129, label %147, !dbg !846

; <label>:129                                     ; preds = %124
  %130 = load i64* @block_start, align 8, !dbg !847
  %131 = icmp sge i64 %130, 0, !dbg !847
  br i1 %131, label %132, label %137, !dbg !847

; <label>:132                                     ; preds = %129
  %133 = load i64* @block_start, align 8, !dbg !847
  %134 = trunc i64 %133 to i32, !dbg !847
  %135 = zext i32 %134 to i64, !dbg !847
  %136 = getelementptr inbounds [0 x i8]* @window, i32 0, i64 %135, !dbg !847
  br label %138, !dbg !847

; <label>:137                                     ; preds = %129
  br label %138, !dbg !847

; <label>:138                                     ; preds = %137, %132
  %139 = phi i8* [ %136, %132 ], [ null, %137 ], !dbg !847
  %140 = load i32* @strstart, align 4, !dbg !847
  %141 = zext i32 %140 to i64, !dbg !847
  %142 = load i64* @block_start, align 8, !dbg !847
  %143 = sub nsw i64 %141, %142, !dbg !847
  %144 = call i64 @flush_block(i8* %139, i64 %143, i32 0), !dbg !847
  %145 = load i32* @strstart, align 4, !dbg !847
  %146 = zext i32 %145 to i64, !dbg !847
  store i64 %146, i64* @block_start, align 8, !dbg !847
  br label %147, !dbg !847

; <label>:147                                     ; preds = %138, %124
  br label %189, !dbg !848

; <label>:148                                     ; preds = %73, %70
  %149 = load i32* %match_available, align 4, !dbg !849
  %150 = icmp ne i32 %149, 0, !dbg !849
  br i1 %150, label %151, label %183, !dbg !849

; <label>:151                                     ; preds = %148
  %152 = load i32* @strstart, align 4, !dbg !850
  %153 = sub i32 %152, 1, !dbg !850
  %154 = zext i32 %153 to i64, !dbg !850
  %155 = getelementptr inbounds [0 x i8]* @window, i32 0, i64 %154, !dbg !850
  %156 = load i8* %155, align 1, !dbg !850
  %157 = zext i8 %156 to i32, !dbg !850
  %158 = call i32 @ct_tally(i32 0, i32 %157), !dbg !850
  %159 = icmp ne i32 %158, 0, !dbg !850
  br i1 %159, label %160, label %178, !dbg !850

; <label>:160                                     ; preds = %151
  %161 = load i64* @block_start, align 8, !dbg !852
  %162 = icmp sge i64 %161, 0, !dbg !852
  br i1 %162, label %163, label %168, !dbg !852

; <label>:163                                     ; preds = %160
  %164 = load i64* @block_start, align 8, !dbg !852
  %165 = trunc i64 %164 to i32, !dbg !852
  %166 = zext i32 %165 to i64, !dbg !852
  %167 = getelementptr inbounds [0 x i8]* @window, i32 0, i64 %166, !dbg !852
  br label %169, !dbg !852

; <label>:168                                     ; preds = %160
  br label %169, !dbg !852

; <label>:169                                     ; preds = %168, %163
  %170 = phi i8* [ %167, %163 ], [ null, %168 ], !dbg !852
  %171 = load i32* @strstart, align 4, !dbg !852
  %172 = zext i32 %171 to i64, !dbg !852
  %173 = load i64* @block_start, align 8, !dbg !852
  %174 = sub nsw i64 %172, %173, !dbg !852
  %175 = call i64 @flush_block(i8* %170, i64 %174, i32 0), !dbg !852
  %176 = load i32* @strstart, align 4, !dbg !852
  %177 = zext i32 %176 to i64, !dbg !852
  store i64 %177, i64* @block_start, align 8, !dbg !852
  br label %178, !dbg !854

; <label>:178                                     ; preds = %169, %151
  %179 = load i32* @strstart, align 4, !dbg !855
  %180 = add i32 %179, 1, !dbg !855
  store i32 %180, i32* @strstart, align 4, !dbg !855
  %181 = load i32* @lookahead, align 4, !dbg !856
  %182 = add i32 %181, -1, !dbg !856
  store i32 %182, i32* @lookahead, align 4, !dbg !856
  br label %188, !dbg !857

; <label>:183                                     ; preds = %148
  store i32 1, i32* %match_available, align 4, !dbg !858
  %184 = load i32* @strstart, align 4, !dbg !860
  %185 = add i32 %184, 1, !dbg !860
  store i32 %185, i32* @strstart, align 4, !dbg !860
  %186 = load i32* @lookahead, align 4, !dbg !861
  %187 = add i32 %186, -1, !dbg !861
  store i32 %187, i32* @lookahead, align 4, !dbg !861
  br label %188

; <label>:188                                     ; preds = %183, %178
  br label %189

; <label>:189                                     ; preds = %188, %147
  br label %190, !dbg !862

; <label>:190                                     ; preds = %199, %189
  %191 = load i32* @lookahead, align 4, !dbg !862
  %192 = icmp ult i32 %191, 262, !dbg !862
  br i1 %192, label %193, label %197, !dbg !862

; <label>:193                                     ; preds = %190
  %194 = load i32* @eofile, align 4, !dbg !862
  %195 = icmp ne i32 %194, 0, !dbg !862
  %196 = xor i1 %195, true, !dbg !862
  br label %197

; <label>:197                                     ; preds = %193, %190
  %198 = phi i1 [ false, %190 ], [ %196, %193 ]
  br i1 %198, label %199, label %200

; <label>:199                                     ; preds = %197
  call void @fill_window(), !dbg !863
  br label %190, !dbg !863

; <label>:200                                     ; preds = %197
  br label %7, !dbg !864

; <label>:201                                     ; preds = %7
  %202 = load i32* %match_available, align 4, !dbg !865
  %203 = icmp ne i32 %202, 0, !dbg !865
  br i1 %203, label %204, label %212, !dbg !865

; <label>:204                                     ; preds = %201
  %205 = load i32* @strstart, align 4, !dbg !866
  %206 = sub i32 %205, 1, !dbg !866
  %207 = zext i32 %206 to i64, !dbg !866
  %208 = getelementptr inbounds [0 x i8]* @window, i32 0, i64 %207, !dbg !866
  %209 = load i8* %208, align 1, !dbg !866
  %210 = zext i8 %209 to i32, !dbg !866
  %211 = call i32 @ct_tally(i32 0, i32 %210), !dbg !866
  br label %212, !dbg !866

; <label>:212                                     ; preds = %204, %201
  %213 = load i64* @block_start, align 8, !dbg !867
  %214 = icmp sge i64 %213, 0, !dbg !867
  br i1 %214, label %215, label %220, !dbg !867

; <label>:215                                     ; preds = %212
  %216 = load i64* @block_start, align 8, !dbg !867
  %217 = trunc i64 %216 to i32, !dbg !867
  %218 = zext i32 %217 to i64, !dbg !867
  %219 = getelementptr inbounds [0 x i8]* @window, i32 0, i64 %218, !dbg !867
  br label %221, !dbg !867

; <label>:220                                     ; preds = %212
  br label %221, !dbg !867

; <label>:221                                     ; preds = %220, %215
  %222 = phi i8* [ %219, %215 ], [ null, %220 ], !dbg !867
  %223 = load i32* @strstart, align 4, !dbg !867
  %224 = zext i32 %223 to i64, !dbg !867
  %225 = load i64* @block_start, align 8, !dbg !867
  %226 = sub nsw i64 %224, %225, !dbg !867
  %227 = call i64 @flush_block(i8* %222, i64 %226, i32 1), !dbg !867
  store i64 %227, i64* %1, !dbg !867
  br label %228, !dbg !867

; <label>:228                                     ; preds = %221, %4
  %229 = load i64* %1, !dbg !868
  ret i64 %229, !dbg !868
}

define internal i64 @deflate_fast() nounwind uwtable {
  %hash_head = alloca i32, align 4
  %flush = alloca i32, align 4
  %match_length = alloca i32, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !869), !dbg !871
  call void @llvm.dbg.declare(metadata !22, metadata !872), !dbg !873
  call void @llvm.dbg.declare(metadata !22, metadata !874), !dbg !875
  store i32 0, i32* %match_length, align 4, !dbg !876
  store i32 2, i32* @prev_length, align 4, !dbg !877
  br label %1, !dbg !878

; <label>:1                                       ; preds = %165, %0
  %2 = load i32* @lookahead, align 4, !dbg !878
  %3 = icmp ne i32 %2, 0, !dbg !878
  br i1 %3, label %4, label %166, !dbg !878

; <label>:4                                       ; preds = %1
  %5 = load i32* @ins_h, align 4, !dbg !879
  %6 = shl i32 %5, 5, !dbg !879
  %7 = load i32* @strstart, align 4, !dbg !879
  %8 = add i32 %7, 3, !dbg !879
  %9 = sub i32 %8, 1, !dbg !879
  %10 = zext i32 %9 to i64, !dbg !879
  %11 = getelementptr inbounds [0 x i8]* @window, i32 0, i64 %10, !dbg !879
  %12 = load i8* %11, align 1, !dbg !879
  %13 = zext i8 %12 to i32, !dbg !879
  %14 = xor i32 %6, %13, !dbg !879
  %15 = and i32 %14, 32767, !dbg !879
  store i32 %15, i32* @ins_h, align 4, !dbg !879
  %16 = load i32* @ins_h, align 4, !dbg !879
  %17 = zext i32 %16 to i64, !dbg !879
  %18 = getelementptr inbounds i16* getelementptr inbounds ([0 x i16]* @prev, i32 0, i64 32768), i64 %17, !dbg !879
  %19 = load i16* %18, align 2, !dbg !879
  %20 = zext i16 %19 to i32, !dbg !879
  store i32 %20, i32* %hash_head, align 4, !dbg !879
  %21 = trunc i32 %20 to i16, !dbg !879
  %22 = load i32* @strstart, align 4, !dbg !879
  %23 = and i32 %22, 32767, !dbg !879
  %24 = zext i32 %23 to i64, !dbg !879
  %25 = getelementptr inbounds [0 x i16]* @prev, i32 0, i64 %24, !dbg !879
  store i16 %21, i16* %25, align 1, !dbg !879
  %26 = load i32* @strstart, align 4, !dbg !879
  %27 = trunc i32 %26 to i16, !dbg !879
  %28 = load i32* @ins_h, align 4, !dbg !879
  %29 = zext i32 %28 to i64, !dbg !879
  %30 = getelementptr inbounds i16* getelementptr inbounds ([0 x i16]* @prev, i32 0, i64 32768), i64 %29, !dbg !879
  store i16 %27, i16* %30, align 2, !dbg !879
  %31 = load i32* %hash_head, align 4, !dbg !881
  %32 = icmp ne i32 %31, 0, !dbg !881
  br i1 %32, label %33, label %47, !dbg !881

; <label>:33                                      ; preds = %4
  %34 = load i32* @strstart, align 4, !dbg !881
  %35 = load i32* %hash_head, align 4, !dbg !881
  %36 = sub i32 %34, %35, !dbg !881
  %37 = icmp ule i32 %36, 32506, !dbg !881
  br i1 %37, label %38, label %47, !dbg !881

; <label>:38                                      ; preds = %33
  %39 = load i32* %hash_head, align 4, !dbg !882
  %40 = call i32 (...)* bitcast (i32 (i32)* @longest_match to i32 (...)*)(i32 %39), !dbg !882
  store i32 %40, i32* %match_length, align 4, !dbg !882
  %41 = load i32* %match_length, align 4, !dbg !884
  %42 = load i32* @lookahead, align 4, !dbg !884
  %43 = icmp ugt i32 %41, %42, !dbg !884
  br i1 %43, label %44, label %46, !dbg !884

; <label>:44                                      ; preds = %38
  %45 = load i32* @lookahead, align 4, !dbg !885
  store i32 %45, i32* %match_length, align 4, !dbg !885
  br label %46, !dbg !885

; <label>:46                                      ; preds = %44, %38
  br label %47, !dbg !886

; <label>:47                                      ; preds = %46, %33, %4
  %48 = load i32* %match_length, align 4, !dbg !887
  %49 = icmp uge i32 %48, 3, !dbg !887
  br i1 %49, label %50, label %122, !dbg !887

; <label>:50                                      ; preds = %47
  %51 = load i32* @strstart, align 4, !dbg !888
  %52 = load i32* @match_start, align 4, !dbg !888
  %53 = sub i32 %51, %52, !dbg !888
  %54 = load i32* %match_length, align 4, !dbg !888
  %55 = sub i32 %54, 3, !dbg !888
  %56 = call i32 @ct_tally(i32 %53, i32 %55), !dbg !888
  store i32 %56, i32* %flush, align 4, !dbg !888
  %57 = load i32* %match_length, align 4, !dbg !890
  %58 = load i32* @lookahead, align 4, !dbg !890
  %59 = sub i32 %58, %57, !dbg !890
  store i32 %59, i32* @lookahead, align 4, !dbg !890
  %60 = load i32* %match_length, align 4, !dbg !891
  %61 = load i32* @max_lazy_match, align 4, !dbg !891
  %62 = icmp ule i32 %60, %61, !dbg !891
  br i1 %62, label %63, label %102, !dbg !891

; <label>:63                                      ; preds = %50
  %64 = load i32* %match_length, align 4, !dbg !892
  %65 = add i32 %64, -1, !dbg !892
  store i32 %65, i32* %match_length, align 4, !dbg !892
  br label %66, !dbg !894

; <label>:66                                      ; preds = %95, %63
  %67 = load i32* @strstart, align 4, !dbg !895
  %68 = add i32 %67, 1, !dbg !895
  store i32 %68, i32* @strstart, align 4, !dbg !895
  %69 = load i32* @ins_h, align 4, !dbg !897
  %70 = shl i32 %69, 5, !dbg !897
  %71 = load i32* @strstart, align 4, !dbg !897
  %72 = add i32 %71, 3, !dbg !897
  %73 = sub i32 %72, 1, !dbg !897
  %74 = zext i32 %73 to i64, !dbg !897
  %75 = getelementptr inbounds [0 x i8]* @window, i32 0, i64 %74, !dbg !897
  %76 = load i8* %75, align 1, !dbg !897
  %77 = zext i8 %76 to i32, !dbg !897
  %78 = xor i32 %70, %77, !dbg !897
  %79 = and i32 %78, 32767, !dbg !897
  store i32 %79, i32* @ins_h, align 4, !dbg !897
  %80 = load i32* @ins_h, align 4, !dbg !897
  %81 = zext i32 %80 to i64, !dbg !897
  %82 = getelementptr inbounds i16* getelementptr inbounds ([0 x i16]* @prev, i32 0, i64 32768), i64 %81, !dbg !897
  %83 = load i16* %82, align 2, !dbg !897
  %84 = zext i16 %83 to i32, !dbg !897
  store i32 %84, i32* %hash_head, align 4, !dbg !897
  %85 = trunc i32 %84 to i16, !dbg !897
  %86 = load i32* @strstart, align 4, !dbg !897
  %87 = and i32 %86, 32767, !dbg !897
  %88 = zext i32 %87 to i64, !dbg !897
  %89 = getelementptr inbounds [0 x i16]* @prev, i32 0, i64 %88, !dbg !897
  store i16 %85, i16* %89, align 1, !dbg !897
  %90 = load i32* @strstart, align 4, !dbg !897
  %91 = trunc i32 %90 to i16, !dbg !897
  %92 = load i32* @ins_h, align 4, !dbg !897
  %93 = zext i32 %92 to i64, !dbg !897
  %94 = getelementptr inbounds i16* getelementptr inbounds ([0 x i16]* @prev, i32 0, i64 32768), i64 %93, !dbg !897
  store i16 %91, i16* %94, align 2, !dbg !897
  br label %95, !dbg !898

; <label>:95                                      ; preds = %66
  %96 = load i32* %match_length, align 4, !dbg !898
  %97 = add i32 %96, -1, !dbg !898
  store i32 %97, i32* %match_length, align 4, !dbg !898
  %98 = icmp ne i32 %97, 0, !dbg !898
  br i1 %98, label %66, label %99, !dbg !898

; <label>:99                                      ; preds = %95
  %100 = load i32* @strstart, align 4, !dbg !899
  %101 = add i32 %100, 1, !dbg !899
  store i32 %101, i32* @strstart, align 4, !dbg !899
  br label %121, !dbg !900

; <label>:102                                     ; preds = %50
  %103 = load i32* %match_length, align 4, !dbg !901
  %104 = load i32* @strstart, align 4, !dbg !901
  %105 = add i32 %104, %103, !dbg !901
  store i32 %105, i32* @strstart, align 4, !dbg !901
  store i32 0, i32* %match_length, align 4, !dbg !903
  %106 = load i32* @strstart, align 4, !dbg !904
  %107 = zext i32 %106 to i64, !dbg !904
  %108 = getelementptr inbounds [0 x i8]* @window, i32 0, i64 %107, !dbg !904
  %109 = load i8* %108, align 1, !dbg !904
  %110 = zext i8 %109 to i32, !dbg !904
  store i32 %110, i32* @ins_h, align 4, !dbg !904
  %111 = load i32* @ins_h, align 4, !dbg !905
  %112 = shl i32 %111, 5, !dbg !905
  %113 = load i32* @strstart, align 4, !dbg !905
  %114 = add i32 %113, 1, !dbg !905
  %115 = zext i32 %114 to i64, !dbg !905
  %116 = getelementptr inbounds [0 x i8]* @window, i32 0, i64 %115, !dbg !905
  %117 = load i8* %116, align 1, !dbg !905
  %118 = zext i8 %117 to i32, !dbg !905
  %119 = xor i32 %112, %118, !dbg !905
  %120 = and i32 %119, 32767, !dbg !905
  store i32 %120, i32* @ins_h, align 4, !dbg !905
  br label %121

; <label>:121                                     ; preds = %102, %99
  br label %133, !dbg !906

; <label>:122                                     ; preds = %47
  %123 = load i32* @strstart, align 4, !dbg !907
  %124 = zext i32 %123 to i64, !dbg !907
  %125 = getelementptr inbounds [0 x i8]* @window, i32 0, i64 %124, !dbg !907
  %126 = load i8* %125, align 1, !dbg !907
  %127 = zext i8 %126 to i32, !dbg !907
  %128 = call i32 @ct_tally(i32 0, i32 %127), !dbg !907
  store i32 %128, i32* %flush, align 4, !dbg !907
  %129 = load i32* @lookahead, align 4, !dbg !909
  %130 = add i32 %129, -1, !dbg !909
  store i32 %130, i32* @lookahead, align 4, !dbg !909
  %131 = load i32* @strstart, align 4, !dbg !910
  %132 = add i32 %131, 1, !dbg !910
  store i32 %132, i32* @strstart, align 4, !dbg !910
  br label %133

; <label>:133                                     ; preds = %122, %121
  %134 = load i32* %flush, align 4, !dbg !911
  %135 = icmp ne i32 %134, 0, !dbg !911
  br i1 %135, label %136, label %154, !dbg !911

; <label>:136                                     ; preds = %133
  %137 = load i64* @block_start, align 8, !dbg !912
  %138 = icmp sge i64 %137, 0, !dbg !912
  br i1 %138, label %139, label %144, !dbg !912

; <label>:139                                     ; preds = %136
  %140 = load i64* @block_start, align 8, !dbg !912
  %141 = trunc i64 %140 to i32, !dbg !912
  %142 = zext i32 %141 to i64, !dbg !912
  %143 = getelementptr inbounds [0 x i8]* @window, i32 0, i64 %142, !dbg !912
  br label %145, !dbg !912

; <label>:144                                     ; preds = %136
  br label %145, !dbg !912

; <label>:145                                     ; preds = %144, %139
  %146 = phi i8* [ %143, %139 ], [ null, %144 ], !dbg !912
  %147 = load i32* @strstart, align 4, !dbg !912
  %148 = zext i32 %147 to i64, !dbg !912
  %149 = load i64* @block_start, align 8, !dbg !912
  %150 = sub nsw i64 %148, %149, !dbg !912
  %151 = call i64 @flush_block(i8* %146, i64 %150, i32 0), !dbg !912
  %152 = load i32* @strstart, align 4, !dbg !912
  %153 = zext i32 %152 to i64, !dbg !912
  store i64 %153, i64* @block_start, align 8, !dbg !912
  br label %154, !dbg !912

; <label>:154                                     ; preds = %145, %133
  br label %155, !dbg !913

; <label>:155                                     ; preds = %164, %154
  %156 = load i32* @lookahead, align 4, !dbg !913
  %157 = icmp ult i32 %156, 262, !dbg !913
  br i1 %157, label %158, label %162, !dbg !913

; <label>:158                                     ; preds = %155
  %159 = load i32* @eofile, align 4, !dbg !913
  %160 = icmp ne i32 %159, 0, !dbg !913
  %161 = xor i1 %160, true, !dbg !913
  br label %162

; <label>:162                                     ; preds = %158, %155
  %163 = phi i1 [ false, %155 ], [ %161, %158 ]
  br i1 %163, label %164, label %165

; <label>:164                                     ; preds = %162
  call void @fill_window(), !dbg !914
  br label %155, !dbg !914

; <label>:165                                     ; preds = %162
  br label %1, !dbg !915

; <label>:166                                     ; preds = %1
  %167 = load i64* @block_start, align 8, !dbg !916
  %168 = icmp sge i64 %167, 0, !dbg !916
  br i1 %168, label %169, label %174, !dbg !916

; <label>:169                                     ; preds = %166
  %170 = load i64* @block_start, align 8, !dbg !916
  %171 = trunc i64 %170 to i32, !dbg !916
  %172 = zext i32 %171 to i64, !dbg !916
  %173 = getelementptr inbounds [0 x i8]* @window, i32 0, i64 %172, !dbg !916
  br label %175, !dbg !916

; <label>:174                                     ; preds = %166
  br label %175, !dbg !916

; <label>:175                                     ; preds = %174, %169
  %176 = phi i8* [ %173, %169 ], [ null, %174 ], !dbg !916
  %177 = load i32* @strstart, align 4, !dbg !916
  %178 = zext i32 %177 to i64, !dbg !916
  %179 = load i64* @block_start, align 8, !dbg !916
  %180 = sub nsw i64 %178, %179, !dbg !916
  %181 = call i64 @flush_block(i8* %176, i64 %180, i32 1), !dbg !916
  ret i64 %181, !dbg !916
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @_getopt_internal(i32 %argc, i8** %argv, i8* %optstring, %struct.option* %longopts, i32* %longind, i32 %long_only) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %4 = alloca i8*, align 8
  %5 = alloca %struct.option*, align 8
  %6 = alloca i32*, align 8
  %7 = alloca i32, align 4
  %option_index = alloca i32, align 4
  %p = alloca %struct.option*, align 8
  %s = alloca i8*, align 8
  %exact = alloca i32, align 4
  %ambig = alloca i32, align 4
  %pfound = alloca %struct.option*, align 8
  %indfound = alloca i32, align 4
  %c = alloca i8, align 1
  %temp = alloca i8*, align 8
  store i32 %argc, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !917), !dbg !918
  store i8** %argv, i8*** %3, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !919), !dbg !920
  store i8* %optstring, i8** %4, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !921), !dbg !922
  store %struct.option* %longopts, %struct.option** %5, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !923), !dbg !924
  store i32* %longind, i32** %6, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !925), !dbg !926
  store i32 %long_only, i32* %7, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !927), !dbg !928
  call void @llvm.dbg.declare(metadata !22, metadata !929), !dbg !931
  store i8* null, i8** @optarg, align 8, !dbg !932
  %8 = load i32* @optind, align 4, !dbg !933
  %9 = icmp eq i32 %8, 0, !dbg !933
  br i1 %9, label %10, label %36, !dbg !933

; <label>:10                                      ; preds = %0
  store i32 1, i32* @optind, align 4, !dbg !934
  store i32 1, i32* @last_nonopt, align 4, !dbg !934
  store i32 1, i32* @first_nonopt, align 4, !dbg !934
  store i8* null, i8** @nextchar, align 8, !dbg !936
  %11 = load i8** %4, align 8, !dbg !937
  %12 = getelementptr inbounds i8* %11, i64 0, !dbg !937
  %13 = load i8* %12, align 1, !dbg !937
  %14 = sext i8 %13 to i32, !dbg !937
  %15 = icmp eq i32 %14, 45, !dbg !937
  br i1 %15, label %16, label %19, !dbg !937

; <label>:16                                      ; preds = %10
  store i32 2, i32* @ordering, align 4, !dbg !938
  %17 = load i8** %4, align 8, !dbg !940
  %18 = getelementptr inbounds i8* %17, i32 1, !dbg !940
  store i8* %18, i8** %4, align 8, !dbg !940
  br label %35, !dbg !941

; <label>:19                                      ; preds = %10
  %20 = load i8** %4, align 8, !dbg !942
  %21 = getelementptr inbounds i8* %20, i64 0, !dbg !942
  %22 = load i8* %21, align 1, !dbg !942
  %23 = sext i8 %22 to i32, !dbg !942
  %24 = icmp eq i32 %23, 43, !dbg !942
  br i1 %24, label %25, label %28, !dbg !942

; <label>:25                                      ; preds = %19
  store i32 0, i32* @ordering, align 4, !dbg !943
  %26 = load i8** %4, align 8, !dbg !945
  %27 = getelementptr inbounds i8* %26, i32 1, !dbg !945
  store i8* %27, i8** %4, align 8, !dbg !945
  br label %34, !dbg !946

; <label>:28                                      ; preds = %19
  %29 = call i8* @getenv(i8* getelementptr inbounds ([16 x i8]* @.str1, i32 0, i32 0)), !dbg !947
  %30 = icmp ne i8* %29, null, !dbg !947
  br i1 %30, label %31, label %32, !dbg !947

; <label>:31                                      ; preds = %28
  store i32 0, i32* @ordering, align 4, !dbg !948
  br label %33, !dbg !948

; <label>:32                                      ; preds = %28
  store i32 1, i32* @ordering, align 4, !dbg !949
  br label %33

; <label>:33                                      ; preds = %32, %31
  br label %34

; <label>:34                                      ; preds = %33, %25
  br label %35

; <label>:35                                      ; preds = %34, %16
  br label %36, !dbg !950

; <label>:36                                      ; preds = %35, %0
  %37 = load i8** @nextchar, align 8, !dbg !951
  %38 = icmp eq i8* %37, null, !dbg !951
  br i1 %38, label %44, label %39, !dbg !951

; <label>:39                                      ; preds = %36
  %40 = load i8** @nextchar, align 8, !dbg !951
  %41 = load i8* %40, align 1, !dbg !951
  %42 = sext i8 %41 to i32, !dbg !951
  %43 = icmp eq i32 %42, 0, !dbg !951
  br i1 %43, label %44, label %198, !dbg !951

; <label>:44                                      ; preds = %39, %36
  %45 = load i32* @ordering, align 4, !dbg !952
  %46 = icmp eq i32 %45, 1, !dbg !952
  br i1 %46, label %47, label %98, !dbg !952

; <label>:47                                      ; preds = %44
  %48 = load i32* @first_nonopt, align 4, !dbg !954
  %49 = load i32* @last_nonopt, align 4, !dbg !954
  %50 = icmp ne i32 %48, %49, !dbg !954
  br i1 %50, label %51, label %57, !dbg !954

; <label>:51                                      ; preds = %47
  %52 = load i32* @last_nonopt, align 4, !dbg !954
  %53 = load i32* @optind, align 4, !dbg !954
  %54 = icmp ne i32 %52, %53, !dbg !954
  br i1 %54, label %55, label %57, !dbg !954

; <label>:55                                      ; preds = %51
  %56 = load i8*** %3, align 8, !dbg !956
  call void (...)* bitcast (void (i8**)* @exchange to void (...)*)(i8** %56), !dbg !956
  br label %64, !dbg !956

; <label>:57                                      ; preds = %51, %47
  %58 = load i32* @last_nonopt, align 4, !dbg !957
  %59 = load i32* @optind, align 4, !dbg !957
  %60 = icmp ne i32 %58, %59, !dbg !957
  br i1 %60, label %61, label %63, !dbg !957

; <label>:61                                      ; preds = %57
  %62 = load i32* @optind, align 4, !dbg !958
  store i32 %62, i32* @first_nonopt, align 4, !dbg !958
  br label %63, !dbg !958

; <label>:63                                      ; preds = %61, %57
  br label %64

; <label>:64                                      ; preds = %63, %55
  br label %65, !dbg !959

; <label>:65                                      ; preds = %93, %64
  %66 = load i32* @optind, align 4, !dbg !959
  %67 = load i32* %2, align 4, !dbg !959
  %68 = icmp slt i32 %66, %67, !dbg !959
  br i1 %68, label %69, label %91, !dbg !959

; <label>:69                                      ; preds = %65
  %70 = load i32* @optind, align 4, !dbg !959
  %71 = sext i32 %70 to i64, !dbg !959
  %72 = load i8*** %3, align 8, !dbg !959
  %73 = getelementptr inbounds i8** %72, i64 %71, !dbg !959
  %74 = load i8** %73, align 8, !dbg !959
  %75 = getelementptr inbounds i8* %74, i64 0, !dbg !959
  %76 = load i8* %75, align 1, !dbg !959
  %77 = sext i8 %76 to i32, !dbg !959
  %78 = icmp ne i32 %77, 45, !dbg !959
  br i1 %78, label %89, label %79, !dbg !959

; <label>:79                                      ; preds = %69
  %80 = load i32* @optind, align 4, !dbg !959
  %81 = sext i32 %80 to i64, !dbg !959
  %82 = load i8*** %3, align 8, !dbg !959
  %83 = getelementptr inbounds i8** %82, i64 %81, !dbg !959
  %84 = load i8** %83, align 8, !dbg !959
  %85 = getelementptr inbounds i8* %84, i64 1, !dbg !959
  %86 = load i8* %85, align 1, !dbg !959
  %87 = sext i8 %86 to i32, !dbg !959
  %88 = icmp eq i32 %87, 0, !dbg !959
  br label %89, !dbg !959

; <label>:89                                      ; preds = %79, %69
  %90 = phi i1 [ true, %69 ], [ %88, %79 ]
  br label %91

; <label>:91                                      ; preds = %89, %65
  %92 = phi i1 [ false, %65 ], [ %90, %89 ]
  br i1 %92, label %93, label %96

; <label>:93                                      ; preds = %91
  %94 = load i32* @optind, align 4, !dbg !960
  %95 = add nsw i32 %94, 1, !dbg !960
  store i32 %95, i32* @optind, align 4, !dbg !960
  br label %65, !dbg !960

; <label>:96                                      ; preds = %91
  %97 = load i32* @optind, align 4, !dbg !961
  store i32 %97, i32* @last_nonopt, align 4, !dbg !961
  br label %98, !dbg !962

; <label>:98                                      ; preds = %96, %44
  %99 = load i32* @optind, align 4, !dbg !963
  %100 = load i32* %2, align 4, !dbg !963
  %101 = icmp ne i32 %99, %100, !dbg !963
  br i1 %101, label %102, label %132, !dbg !963

; <label>:102                                     ; preds = %98
  %103 = load i32* @optind, align 4, !dbg !964
  %104 = sext i32 %103 to i64, !dbg !964
  %105 = load i8*** %3, align 8, !dbg !964
  %106 = getelementptr inbounds i8** %105, i64 %104, !dbg !964
  %107 = load i8** %106, align 8, !dbg !964
  %108 = call i32 @strcmp(i8* %107, i8* getelementptr inbounds ([3 x i8]* @.str12, i32 0, i32 0)), !dbg !964
  %109 = icmp ne i32 %108, 0, !dbg !964
  br i1 %109, label %132, label %110, !dbg !964

; <label>:110                                     ; preds = %102
  %111 = load i32* @optind, align 4, !dbg !965
  %112 = add nsw i32 %111, 1, !dbg !965
  store i32 %112, i32* @optind, align 4, !dbg !965
  %113 = load i32* @first_nonopt, align 4, !dbg !967
  %114 = load i32* @last_nonopt, align 4, !dbg !967
  %115 = icmp ne i32 %113, %114, !dbg !967
  br i1 %115, label %116, label %122, !dbg !967

; <label>:116                                     ; preds = %110
  %117 = load i32* @last_nonopt, align 4, !dbg !967
  %118 = load i32* @optind, align 4, !dbg !967
  %119 = icmp ne i32 %117, %118, !dbg !967
  br i1 %119, label %120, label %122, !dbg !967

; <label>:120                                     ; preds = %116
  %121 = load i8*** %3, align 8, !dbg !968
  call void (...)* bitcast (void (i8**)* @exchange to void (...)*)(i8** %121), !dbg !968
  br label %129, !dbg !968

; <label>:122                                     ; preds = %116, %110
  %123 = load i32* @first_nonopt, align 4, !dbg !969
  %124 = load i32* @last_nonopt, align 4, !dbg !969
  %125 = icmp eq i32 %123, %124, !dbg !969
  br i1 %125, label %126, label %128, !dbg !969

; <label>:126                                     ; preds = %122
  %127 = load i32* @optind, align 4, !dbg !970
  store i32 %127, i32* @first_nonopt, align 4, !dbg !970
  br label %128, !dbg !970

; <label>:128                                     ; preds = %126, %122
  br label %129

; <label>:129                                     ; preds = %128, %120
  %130 = load i32* %2, align 4, !dbg !971
  store i32 %130, i32* @last_nonopt, align 4, !dbg !971
  %131 = load i32* %2, align 4, !dbg !972
  store i32 %131, i32* @optind, align 4, !dbg !972
  br label %132, !dbg !973

; <label>:132                                     ; preds = %129, %102, %98
  %133 = load i32* @optind, align 4, !dbg !974
  %134 = load i32* %2, align 4, !dbg !974
  %135 = icmp eq i32 %133, %134, !dbg !974
  br i1 %135, label %136, label %143, !dbg !974

; <label>:136                                     ; preds = %132
  %137 = load i32* @first_nonopt, align 4, !dbg !975
  %138 = load i32* @last_nonopt, align 4, !dbg !975
  %139 = icmp ne i32 %137, %138, !dbg !975
  br i1 %139, label %140, label %142, !dbg !975

; <label>:140                                     ; preds = %136
  %141 = load i32* @first_nonopt, align 4, !dbg !977
  store i32 %141, i32* @optind, align 4, !dbg !977
  br label %142, !dbg !977

; <label>:142                                     ; preds = %140, %136
  store i32 -1, i32* %1, !dbg !978
  br label %625, !dbg !978

; <label>:143                                     ; preds = %132
  %144 = load i32* @optind, align 4, !dbg !979
  %145 = sext i32 %144 to i64, !dbg !979
  %146 = load i8*** %3, align 8, !dbg !979
  %147 = getelementptr inbounds i8** %146, i64 %145, !dbg !979
  %148 = load i8** %147, align 8, !dbg !979
  %149 = getelementptr inbounds i8* %148, i64 0, !dbg !979
  %150 = load i8* %149, align 1, !dbg !979
  %151 = sext i8 %150 to i32, !dbg !979
  %152 = icmp ne i32 %151, 45, !dbg !979
  br i1 %152, label %163, label %153, !dbg !979

; <label>:153                                     ; preds = %143
  %154 = load i32* @optind, align 4, !dbg !979
  %155 = sext i32 %154 to i64, !dbg !979
  %156 = load i8*** %3, align 8, !dbg !979
  %157 = getelementptr inbounds i8** %156, i64 %155, !dbg !979
  %158 = load i8** %157, align 8, !dbg !979
  %159 = getelementptr inbounds i8* %158, i64 1, !dbg !979
  %160 = load i8* %159, align 1, !dbg !979
  %161 = sext i8 %160 to i32, !dbg !979
  %162 = icmp eq i32 %161, 0, !dbg !979
  br i1 %162, label %163, label %174, !dbg !979

; <label>:163                                     ; preds = %153, %143
  %164 = load i32* @ordering, align 4, !dbg !980
  %165 = icmp eq i32 %164, 0, !dbg !980
  br i1 %165, label %166, label %167, !dbg !980

; <label>:166                                     ; preds = %163
  store i32 -1, i32* %1, !dbg !982
  br label %625, !dbg !982

; <label>:167                                     ; preds = %163
  %168 = load i32* @optind, align 4, !dbg !983
  %169 = add nsw i32 %168, 1, !dbg !983
  store i32 %169, i32* @optind, align 4, !dbg !983
  %170 = sext i32 %168 to i64, !dbg !983
  %171 = load i8*** %3, align 8, !dbg !983
  %172 = getelementptr inbounds i8** %171, i64 %170, !dbg !983
  %173 = load i8** %172, align 8, !dbg !983
  store i8* %173, i8** @optarg, align 8, !dbg !983
  store i32 1, i32* %1, !dbg !984
  br label %625, !dbg !984

; <label>:174                                     ; preds = %153
  %175 = load i32* @optind, align 4, !dbg !985
  %176 = sext i32 %175 to i64, !dbg !985
  %177 = load i8*** %3, align 8, !dbg !985
  %178 = getelementptr inbounds i8** %177, i64 %176, !dbg !985
  %179 = load i8** %178, align 8, !dbg !985
  %180 = getelementptr inbounds i8* %179, i64 1, !dbg !985
  %181 = load %struct.option** %5, align 8, !dbg !985
  %182 = icmp ne %struct.option* %181, null, !dbg !985
  br i1 %182, label %183, label %193, !dbg !985

; <label>:183                                     ; preds = %174
  %184 = load i32* @optind, align 4, !dbg !985
  %185 = sext i32 %184 to i64, !dbg !985
  %186 = load i8*** %3, align 8, !dbg !985
  %187 = getelementptr inbounds i8** %186, i64 %185, !dbg !985
  %188 = load i8** %187, align 8, !dbg !985
  %189 = getelementptr inbounds i8* %188, i64 1, !dbg !985
  %190 = load i8* %189, align 1, !dbg !985
  %191 = sext i8 %190 to i32, !dbg !985
  %192 = icmp eq i32 %191, 45, !dbg !985
  br label %193

; <label>:193                                     ; preds = %183, %174
  %194 = phi i1 [ false, %174 ], [ %192, %183 ]
  %195 = zext i1 %194 to i32
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds i8* %180, i64 %196
  store i8* %197, i8** @nextchar, align 8
  br label %198, !dbg !986

; <label>:198                                     ; preds = %193, %39
  %199 = load %struct.option** %5, align 8, !dbg !987
  %200 = icmp ne %struct.option* %199, null, !dbg !987
  br i1 %200, label %201, label %518, !dbg !987

; <label>:201                                     ; preds = %198
  %202 = load i32* @optind, align 4, !dbg !987
  %203 = sext i32 %202 to i64, !dbg !987
  %204 = load i8*** %3, align 8, !dbg !987
  %205 = getelementptr inbounds i8** %204, i64 %203, !dbg !987
  %206 = load i8** %205, align 8, !dbg !987
  %207 = getelementptr inbounds i8* %206, i64 0, !dbg !987
  %208 = load i8* %207, align 1, !dbg !987
  %209 = sext i8 %208 to i32, !dbg !987
  %210 = icmp eq i32 %209, 45, !dbg !987
  br i1 %210, label %211, label %518, !dbg !987

; <label>:211                                     ; preds = %201
  %212 = load i32* @optind, align 4, !dbg !987
  %213 = sext i32 %212 to i64, !dbg !987
  %214 = load i8*** %3, align 8, !dbg !987
  %215 = getelementptr inbounds i8** %214, i64 %213, !dbg !987
  %216 = load i8** %215, align 8, !dbg !987
  %217 = getelementptr inbounds i8* %216, i64 1, !dbg !987
  %218 = load i8* %217, align 1, !dbg !987
  %219 = sext i8 %218 to i32, !dbg !987
  %220 = icmp eq i32 %219, 45, !dbg !987
  br i1 %220, label %224, label %221, !dbg !987

; <label>:221                                     ; preds = %211
  %222 = load i32* %7, align 4, !dbg !987
  %223 = icmp ne i32 %222, 0, !dbg !987
  br i1 %223, label %224, label %518, !dbg !987

; <label>:224                                     ; preds = %221, %211
  call void @llvm.dbg.declare(metadata !22, metadata !988), !dbg !990
  call void @llvm.dbg.declare(metadata !22, metadata !991), !dbg !992
  %225 = load i8** @nextchar, align 8, !dbg !993
  store i8* %225, i8** %s, align 8, !dbg !993
  call void @llvm.dbg.declare(metadata !22, metadata !994), !dbg !995
  store i32 0, i32* %exact, align 4, !dbg !996
  call void @llvm.dbg.declare(metadata !22, metadata !997), !dbg !998
  store i32 0, i32* %ambig, align 4, !dbg !999
  call void @llvm.dbg.declare(metadata !22, metadata !1000), !dbg !1001
  store %struct.option* null, %struct.option** %pfound, align 8, !dbg !1002
  call void @llvm.dbg.declare(metadata !22, metadata !1003), !dbg !1004
  store i32 0, i32* %indfound, align 4, !dbg !1005
  br label %226, !dbg !1006

; <label>:226                                     ; preds = %238, %224
  %227 = load i8** %s, align 8, !dbg !1006
  %228 = load i8* %227, align 1, !dbg !1006
  %229 = sext i8 %228 to i32, !dbg !1006
  %230 = icmp ne i32 %229, 0, !dbg !1006
  br i1 %230, label %231, label %236, !dbg !1006

; <label>:231                                     ; preds = %226
  %232 = load i8** %s, align 8, !dbg !1006
  %233 = load i8* %232, align 1, !dbg !1006
  %234 = sext i8 %233 to i32, !dbg !1006
  %235 = icmp ne i32 %234, 61, !dbg !1006
  br label %236

; <label>:236                                     ; preds = %231, %226
  %237 = phi i1 [ false, %226 ], [ %235, %231 ]
  br i1 %237, label %238, label %241

; <label>:238                                     ; preds = %236
  %239 = load i8** %s, align 8, !dbg !1007
  %240 = getelementptr inbounds i8* %239, i32 1, !dbg !1007
  store i8* %240, i8** %s, align 8, !dbg !1007
  br label %226, !dbg !1007

; <label>:241                                     ; preds = %236
  %242 = load %struct.option** %5, align 8, !dbg !1008
  store %struct.option* %242, %struct.option** %p, align 8, !dbg !1008
  store i32 0, i32* %option_index, align 4, !dbg !1008
  br label %243, !dbg !1008

; <label>:243                                     ; preds = %286, %241
  %244 = load %struct.option** %p, align 8, !dbg !1008
  %245 = getelementptr inbounds %struct.option* %244, i32 0, i32 0, !dbg !1008
  %246 = load i8** %245, align 8, !dbg !1008
  %247 = icmp ne i8* %246, null, !dbg !1008
  br i1 %247, label %248, label %291, !dbg !1008

; <label>:248                                     ; preds = %243
  %249 = load %struct.option** %p, align 8, !dbg !1010
  %250 = getelementptr inbounds %struct.option* %249, i32 0, i32 0, !dbg !1010
  %251 = load i8** %250, align 8, !dbg !1010
  %252 = load i8** @nextchar, align 8, !dbg !1010
  %253 = load i8** %s, align 8, !dbg !1010
  %254 = load i8** @nextchar, align 8, !dbg !1010
  %255 = ptrtoint i8* %253 to i64, !dbg !1010
  %256 = ptrtoint i8* %254 to i64, !dbg !1010
  %257 = sub i64 %255, %256, !dbg !1010
  %258 = trunc i64 %257 to i32, !dbg !1010
  %259 = call i32 @strncmp(i8* %251, i8* %252, i32 %258), !dbg !1010
  %260 = icmp ne i32 %259, 0, !dbg !1010
  br i1 %260, label %285, label %261, !dbg !1010

; <label>:261                                     ; preds = %248
  %262 = load i8** %s, align 8, !dbg !1011
  %263 = load i8** @nextchar, align 8, !dbg !1011
  %264 = ptrtoint i8* %262 to i64, !dbg !1011
  %265 = ptrtoint i8* %263 to i64, !dbg !1011
  %266 = sub i64 %264, %265, !dbg !1011
  %267 = load %struct.option** %p, align 8, !dbg !1013
  %268 = getelementptr inbounds %struct.option* %267, i32 0, i32 0, !dbg !1013
  %269 = load i8** %268, align 8, !dbg !1013
  %270 = call i32 (...)* bitcast (i32 (i8*)* @my_strlen to i32 (...)*)(i8* %269), !dbg !1013
  %271 = sext i32 %270 to i64, !dbg !1013
  %272 = icmp eq i64 %266, %271, !dbg !1013
  br i1 %272, label %273, label %276, !dbg !1013

; <label>:273                                     ; preds = %261
  %274 = load %struct.option** %p, align 8, !dbg !1014
  store %struct.option* %274, %struct.option** %pfound, align 8, !dbg !1014
  %275 = load i32* %option_index, align 4, !dbg !1016
  store i32 %275, i32* %indfound, align 4, !dbg !1016
  store i32 1, i32* %exact, align 4, !dbg !1017
  br label %291, !dbg !1018

; <label>:276                                     ; preds = %261
  %277 = load %struct.option** %pfound, align 8, !dbg !1019
  %278 = icmp eq %struct.option* %277, null, !dbg !1019
  br i1 %278, label %279, label %282, !dbg !1019

; <label>:279                                     ; preds = %276
  %280 = load %struct.option** %p, align 8, !dbg !1020
  store %struct.option* %280, %struct.option** %pfound, align 8, !dbg !1020
  %281 = load i32* %option_index, align 4, !dbg !1022
  store i32 %281, i32* %indfound, align 4, !dbg !1022
  br label %283, !dbg !1023

; <label>:282                                     ; preds = %276
  store i32 1, i32* %ambig, align 4, !dbg !1024
  br label %283

; <label>:283                                     ; preds = %282, %279
  br label %284

; <label>:284                                     ; preds = %283
  br label %285, !dbg !1025

; <label>:285                                     ; preds = %284, %248
  br label %286, !dbg !1025

; <label>:286                                     ; preds = %285
  %287 = load %struct.option** %p, align 8, !dbg !1026
  %288 = getelementptr inbounds %struct.option* %287, i32 1, !dbg !1026
  store %struct.option* %288, %struct.option** %p, align 8, !dbg !1026
  %289 = load i32* %option_index, align 4, !dbg !1026
  %290 = add nsw i32 %289, 1, !dbg !1026
  store i32 %290, i32* %option_index, align 4, !dbg !1026
  br label %243, !dbg !1026

; <label>:291                                     ; preds = %273, %243
  %292 = load i32* %ambig, align 4, !dbg !1027
  %293 = icmp ne i32 %292, 0, !dbg !1027
  br i1 %293, label %294, label %319, !dbg !1027

; <label>:294                                     ; preds = %291
  %295 = load i32* %exact, align 4, !dbg !1027
  %296 = icmp ne i32 %295, 0, !dbg !1027
  br i1 %296, label %319, label %297, !dbg !1027

; <label>:297                                     ; preds = %294
  %298 = load i32* @opterr, align 4, !dbg !1028
  %299 = icmp ne i32 %298, 0, !dbg !1028
  br i1 %299, label %300, label %311, !dbg !1028

; <label>:300                                     ; preds = %297
  %301 = load %struct.__sFILE** @__stderrp, align 8, !dbg !1030
  %302 = load i8*** %3, align 8, !dbg !1030
  %303 = getelementptr inbounds i8** %302, i64 0, !dbg !1030
  %304 = load i8** %303, align 8, !dbg !1030
  %305 = load i32* @optind, align 4, !dbg !1030
  %306 = sext i32 %305 to i64, !dbg !1030
  %307 = load i8*** %3, align 8, !dbg !1030
  %308 = getelementptr inbounds i8** %307, i64 %306, !dbg !1030
  %309 = load i8** %308, align 8, !dbg !1030
  %310 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %301, i8* getelementptr inbounds ([30 x i8]* @.str2, i32 0, i32 0), i8* %304, i8* %309), !dbg !1030
  br label %311, !dbg !1030

; <label>:311                                     ; preds = %300, %297
  %312 = load i8** @nextchar, align 8, !dbg !1031
  %313 = call i32 (...)* bitcast (i32 (i8*)* @my_strlen to i32 (...)*)(i8* %312), !dbg !1031
  %314 = load i8** @nextchar, align 8, !dbg !1031
  %315 = sext i32 %313 to i64, !dbg !1031
  %316 = getelementptr inbounds i8* %314, i64 %315, !dbg !1031
  store i8* %316, i8** @nextchar, align 8, !dbg !1031
  %317 = load i32* @optind, align 4, !dbg !1032
  %318 = add nsw i32 %317, 1, !dbg !1032
  store i32 %318, i32* @optind, align 4, !dbg !1032
  store i32 0, i32* %1, !dbg !1033
  br label %625, !dbg !1033

; <label>:319                                     ; preds = %294, %291
  %320 = load %struct.option** %pfound, align 8, !dbg !1034
  %321 = icmp ne %struct.option* %320, null, !dbg !1034
  br i1 %321, label %322, label %458, !dbg !1034

; <label>:322                                     ; preds = %319
  %323 = load i32* %indfound, align 4, !dbg !1035
  store i32 %323, i32* %option_index, align 4, !dbg !1035
  %324 = load i32* @optind, align 4, !dbg !1037
  %325 = add nsw i32 %324, 1, !dbg !1037
  store i32 %325, i32* @optind, align 4, !dbg !1037
  %326 = load i8** %s, align 8, !dbg !1038
  %327 = load i8* %326, align 1, !dbg !1038
  %328 = icmp ne i8 %327, 0, !dbg !1038
  br i1 %328, label %329, label %386, !dbg !1038

; <label>:329                                     ; preds = %322
  %330 = load %struct.option** %pfound, align 8, !dbg !1039
  %331 = getelementptr inbounds %struct.option* %330, i32 0, i32 1, !dbg !1039
  %332 = load i32* %331, align 4, !dbg !1039
  %333 = icmp ne i32 %332, 0, !dbg !1039
  br i1 %333, label %334, label %337, !dbg !1039

; <label>:334                                     ; preds = %329
  %335 = load i8** %s, align 8, !dbg !1041
  %336 = getelementptr inbounds i8* %335, i64 1, !dbg !1041
  store i8* %336, i8** @optarg, align 8, !dbg !1041
  br label %385, !dbg !1041

; <label>:337                                     ; preds = %329
  %338 = load i32* @opterr, align 4, !dbg !1042
  %339 = icmp ne i32 %338, 0, !dbg !1042
  br i1 %339, label %340, label %379, !dbg !1042

; <label>:340                                     ; preds = %337
  %341 = load i32* @optind, align 4, !dbg !1044
  %342 = sub nsw i32 %341, 1, !dbg !1044
  %343 = sext i32 %342 to i64, !dbg !1044
  %344 = load i8*** %3, align 8, !dbg !1044
  %345 = getelementptr inbounds i8** %344, i64 %343, !dbg !1044
  %346 = load i8** %345, align 8, !dbg !1044
  %347 = getelementptr inbounds i8* %346, i64 1, !dbg !1044
  %348 = load i8* %347, align 1, !dbg !1044
  %349 = sext i8 %348 to i32, !dbg !1044
  %350 = icmp eq i32 %349, 45, !dbg !1044
  br i1 %350, label %351, label %360, !dbg !1044

; <label>:351                                     ; preds = %340
  %352 = load %struct.__sFILE** @__stderrp, align 8, !dbg !1046
  %353 = load i8*** %3, align 8, !dbg !1046
  %354 = getelementptr inbounds i8** %353, i64 0, !dbg !1046
  %355 = load i8** %354, align 8, !dbg !1046
  %356 = load %struct.option** %pfound, align 8, !dbg !1046
  %357 = getelementptr inbounds %struct.option* %356, i32 0, i32 0, !dbg !1046
  %358 = load i8** %357, align 8, !dbg !1046
  %359 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %352, i8* getelementptr inbounds ([45 x i8]* @.str3, i32 0, i32 0), i8* %355, i8* %358), !dbg !1046
  br label %378, !dbg !1046

; <label>:360                                     ; preds = %340
  %361 = load %struct.__sFILE** @__stderrp, align 8, !dbg !1047
  %362 = load i8*** %3, align 8, !dbg !1047
  %363 = getelementptr inbounds i8** %362, i64 0, !dbg !1047
  %364 = load i8** %363, align 8, !dbg !1047
  %365 = load i32* @optind, align 4, !dbg !1047
  %366 = sub nsw i32 %365, 1, !dbg !1047
  %367 = sext i32 %366 to i64, !dbg !1047
  %368 = load i8*** %3, align 8, !dbg !1047
  %369 = getelementptr inbounds i8** %368, i64 %367, !dbg !1047
  %370 = load i8** %369, align 8, !dbg !1047
  %371 = getelementptr inbounds i8* %370, i64 0, !dbg !1047
  %372 = load i8* %371, align 1, !dbg !1047
  %373 = sext i8 %372 to i32, !dbg !1047
  %374 = load %struct.option** %pfound, align 8, !dbg !1047
  %375 = getelementptr inbounds %struct.option* %374, i32 0, i32 0, !dbg !1047
  %376 = load i8** %375, align 8, !dbg !1047
  %377 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %361, i8* getelementptr inbounds ([45 x i8]* @.str4, i32 0, i32 0), i8* %364, i32 %373, i8* %376), !dbg !1047
  br label %378

; <label>:378                                     ; preds = %360, %351
  br label %379, !dbg !1048

; <label>:379                                     ; preds = %378, %337
  %380 = load i8** @nextchar, align 8, !dbg !1049
  %381 = call i32 (...)* bitcast (i32 (i8*)* @my_strlen to i32 (...)*)(i8* %380), !dbg !1049
  %382 = load i8** @nextchar, align 8, !dbg !1049
  %383 = sext i32 %381 to i64, !dbg !1049
  %384 = getelementptr inbounds i8* %382, i64 %383, !dbg !1049
  store i8* %384, i8** @nextchar, align 8, !dbg !1049
  store i32 0, i32* %1, !dbg !1050
  br label %625, !dbg !1050

; <label>:385                                     ; preds = %334
  br label %431, !dbg !1051

; <label>:386                                     ; preds = %322
  %387 = load %struct.option** %pfound, align 8, !dbg !1052
  %388 = getelementptr inbounds %struct.option* %387, i32 0, i32 1, !dbg !1052
  %389 = load i32* %388, align 4, !dbg !1052
  %390 = icmp eq i32 %389, 1, !dbg !1052
  br i1 %390, label %391, label %430, !dbg !1052

; <label>:391                                     ; preds = %386
  %392 = load i32* @optind, align 4, !dbg !1053
  %393 = load i32* %2, align 4, !dbg !1053
  %394 = icmp slt i32 %392, %393, !dbg !1053
  br i1 %394, label %395, label %402, !dbg !1053

; <label>:395                                     ; preds = %391
  %396 = load i32* @optind, align 4, !dbg !1055
  %397 = add nsw i32 %396, 1, !dbg !1055
  store i32 %397, i32* @optind, align 4, !dbg !1055
  %398 = sext i32 %396 to i64, !dbg !1055
  %399 = load i8*** %3, align 8, !dbg !1055
  %400 = getelementptr inbounds i8** %399, i64 %398, !dbg !1055
  %401 = load i8** %400, align 8, !dbg !1055
  store i8* %401, i8** @optarg, align 8, !dbg !1055
  br label %429, !dbg !1055

; <label>:402                                     ; preds = %391
  %403 = load i32* @opterr, align 4, !dbg !1056
  %404 = icmp ne i32 %403, 0, !dbg !1056
  br i1 %404, label %405, label %417, !dbg !1056

; <label>:405                                     ; preds = %402
  %406 = load %struct.__sFILE** @__stderrp, align 8, !dbg !1058
  %407 = load i8*** %3, align 8, !dbg !1058
  %408 = getelementptr inbounds i8** %407, i64 0, !dbg !1058
  %409 = load i8** %408, align 8, !dbg !1058
  %410 = load i32* @optind, align 4, !dbg !1058
  %411 = sub nsw i32 %410, 1, !dbg !1058
  %412 = sext i32 %411 to i64, !dbg !1058
  %413 = load i8*** %3, align 8, !dbg !1058
  %414 = getelementptr inbounds i8** %413, i64 %412, !dbg !1058
  %415 = load i8** %414, align 8, !dbg !1058
  %416 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %406, i8* getelementptr inbounds ([38 x i8]* @.str5, i32 0, i32 0), i8* %409, i8* %415), !dbg !1058
  br label %417, !dbg !1058

; <label>:417                                     ; preds = %405, %402
  %418 = load i8** @nextchar, align 8, !dbg !1059
  %419 = call i32 (...)* bitcast (i32 (i8*)* @my_strlen to i32 (...)*)(i8* %418), !dbg !1059
  %420 = load i8** @nextchar, align 8, !dbg !1059
  %421 = sext i32 %419 to i64, !dbg !1059
  %422 = getelementptr inbounds i8* %420, i64 %421, !dbg !1059
  store i8* %422, i8** @nextchar, align 8, !dbg !1059
  %423 = load i8** %4, align 8, !dbg !1060
  %424 = getelementptr inbounds i8* %423, i64 0, !dbg !1060
  %425 = load i8* %424, align 1, !dbg !1060
  %426 = sext i8 %425 to i32, !dbg !1060
  %427 = icmp eq i32 %426, 58, !dbg !1060
  %428 = select i1 %427, i32 58, i32 0, !dbg !1060
  store i32 %428, i32* %1, !dbg !1060
  br label %625, !dbg !1060

; <label>:429                                     ; preds = %395
  br label %430, !dbg !1061

; <label>:430                                     ; preds = %429, %386
  br label %431

; <label>:431                                     ; preds = %430, %385
  %432 = load i8** @nextchar, align 8, !dbg !1062
  %433 = call i32 (...)* bitcast (i32 (i8*)* @my_strlen to i32 (...)*)(i8* %432), !dbg !1062
  %434 = load i8** @nextchar, align 8, !dbg !1062
  %435 = sext i32 %433 to i64, !dbg !1062
  %436 = getelementptr inbounds i8* %434, i64 %435, !dbg !1062
  store i8* %436, i8** @nextchar, align 8, !dbg !1062
  %437 = load i32** %6, align 8, !dbg !1063
  %438 = icmp ne i32* %437, null, !dbg !1063
  br i1 %438, label %439, label %442, !dbg !1063

; <label>:439                                     ; preds = %431
  %440 = load i32* %option_index, align 4, !dbg !1064
  %441 = load i32** %6, align 8, !dbg !1064
  store i32 %440, i32* %441, align 4, !dbg !1064
  br label %442, !dbg !1064

; <label>:442                                     ; preds = %439, %431
  %443 = load %struct.option** %pfound, align 8, !dbg !1065
  %444 = getelementptr inbounds %struct.option* %443, i32 0, i32 2, !dbg !1065
  %445 = load i32** %444, align 8, !dbg !1065
  %446 = icmp ne i32* %445, null, !dbg !1065
  br i1 %446, label %447, label %454, !dbg !1065

; <label>:447                                     ; preds = %442
  %448 = load %struct.option** %pfound, align 8, !dbg !1066
  %449 = getelementptr inbounds %struct.option* %448, i32 0, i32 3, !dbg !1066
  %450 = load i32* %449, align 4, !dbg !1066
  %451 = load %struct.option** %pfound, align 8, !dbg !1066
  %452 = getelementptr inbounds %struct.option* %451, i32 0, i32 2, !dbg !1066
  %453 = load i32** %452, align 8, !dbg !1066
  store i32 %450, i32* %453, align 4, !dbg !1066
  store i32 0, i32* %1, !dbg !1068
  br label %625, !dbg !1068

; <label>:454                                     ; preds = %442
  %455 = load %struct.option** %pfound, align 8, !dbg !1069
  %456 = getelementptr inbounds %struct.option* %455, i32 0, i32 3, !dbg !1069
  %457 = load i32* %456, align 4, !dbg !1069
  store i32 %457, i32* %1, !dbg !1069
  br label %625, !dbg !1069

; <label>:458                                     ; preds = %319
  %459 = load i32* %7, align 4, !dbg !1070
  %460 = icmp ne i32 %459, 0, !dbg !1070
  br i1 %460, label %461, label %478, !dbg !1070

; <label>:461                                     ; preds = %458
  %462 = load i32* @optind, align 4, !dbg !1070
  %463 = sext i32 %462 to i64, !dbg !1070
  %464 = load i8*** %3, align 8, !dbg !1070
  %465 = getelementptr inbounds i8** %464, i64 %463, !dbg !1070
  %466 = load i8** %465, align 8, !dbg !1070
  %467 = getelementptr inbounds i8* %466, i64 1, !dbg !1070
  %468 = load i8* %467, align 1, !dbg !1070
  %469 = sext i8 %468 to i32, !dbg !1070
  %470 = icmp eq i32 %469, 45, !dbg !1070
  br i1 %470, label %478, label %471, !dbg !1070

; <label>:471                                     ; preds = %461
  %472 = load i8** %4, align 8, !dbg !1071
  %473 = load i8** @nextchar, align 8, !dbg !1071
  %474 = load i8* %473, align 1, !dbg !1071
  %475 = sext i8 %474 to i32, !dbg !1071
  %476 = call i8* (...)* bitcast (i8* (i8*, i32)* @my_index to i8* (...)*)(i8* %472, i32 %475), !dbg !1071
  %477 = icmp eq i8* %476, null, !dbg !1071
  br i1 %477, label %478, label %517, !dbg !1071

; <label>:478                                     ; preds = %471, %461, %458
  %479 = load i32* @opterr, align 4, !dbg !1072
  %480 = icmp ne i32 %479, 0, !dbg !1072
  br i1 %480, label %481, label %514, !dbg !1072

; <label>:481                                     ; preds = %478
  %482 = load i32* @optind, align 4, !dbg !1074
  %483 = sext i32 %482 to i64, !dbg !1074
  %484 = load i8*** %3, align 8, !dbg !1074
  %485 = getelementptr inbounds i8** %484, i64 %483, !dbg !1074
  %486 = load i8** %485, align 8, !dbg !1074
  %487 = getelementptr inbounds i8* %486, i64 1, !dbg !1074
  %488 = load i8* %487, align 1, !dbg !1074
  %489 = sext i8 %488 to i32, !dbg !1074
  %490 = icmp eq i32 %489, 45, !dbg !1074
  br i1 %490, label %491, label %498, !dbg !1074

; <label>:491                                     ; preds = %481
  %492 = load %struct.__sFILE** @__stderrp, align 8, !dbg !1076
  %493 = load i8*** %3, align 8, !dbg !1076
  %494 = getelementptr inbounds i8** %493, i64 0, !dbg !1076
  %495 = load i8** %494, align 8, !dbg !1076
  %496 = load i8** @nextchar, align 8, !dbg !1076
  %497 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %492, i8* getelementptr inbounds ([32 x i8]* @.str6, i32 0, i32 0), i8* %495, i8* %496), !dbg !1076
  br label %513, !dbg !1076

; <label>:498                                     ; preds = %481
  %499 = load %struct.__sFILE** @__stderrp, align 8, !dbg !1077
  %500 = load i8*** %3, align 8, !dbg !1077
  %501 = getelementptr inbounds i8** %500, i64 0, !dbg !1077
  %502 = load i8** %501, align 8, !dbg !1077
  %503 = load i32* @optind, align 4, !dbg !1077
  %504 = sext i32 %503 to i64, !dbg !1077
  %505 = load i8*** %3, align 8, !dbg !1077
  %506 = getelementptr inbounds i8** %505, i64 %504, !dbg !1077
  %507 = load i8** %506, align 8, !dbg !1077
  %508 = getelementptr inbounds i8* %507, i64 0, !dbg !1077
  %509 = load i8* %508, align 1, !dbg !1077
  %510 = sext i8 %509 to i32, !dbg !1077
  %511 = load i8** @nextchar, align 8, !dbg !1077
  %512 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %499, i8* getelementptr inbounds ([32 x i8]* @.str7, i32 0, i32 0), i8* %502, i32 %510, i8* %511), !dbg !1077
  br label %513

; <label>:513                                     ; preds = %498, %491
  br label %514, !dbg !1078

; <label>:514                                     ; preds = %513, %478
  store i8* getelementptr inbounds ([1 x i8]* @.str8, i32 0, i32 0), i8** @nextchar, align 8, !dbg !1079
  %515 = load i32* @optind, align 4, !dbg !1080
  %516 = add nsw i32 %515, 1, !dbg !1080
  store i32 %516, i32* @optind, align 4, !dbg !1080
  store i32 0, i32* %1, !dbg !1081
  br label %625, !dbg !1081

; <label>:517                                     ; preds = %471
  br label %518, !dbg !1082

; <label>:518                                     ; preds = %517, %221, %201, %198
  call void @llvm.dbg.declare(metadata !22, metadata !1083), !dbg !1085
  %519 = load i8** @nextchar, align 8, !dbg !1086
  %520 = getelementptr inbounds i8* %519, i32 1, !dbg !1086
  store i8* %520, i8** @nextchar, align 8, !dbg !1086
  %521 = load i8* %519, align 1, !dbg !1086
  store i8 %521, i8* %c, align 1, !dbg !1086
  call void @llvm.dbg.declare(metadata !22, metadata !1087), !dbg !1088
  %522 = load i8** %4, align 8, !dbg !1089
  %523 = load i8* %c, align 1, !dbg !1089
  %524 = sext i8 %523 to i32, !dbg !1089
  %525 = call i8* (...)* bitcast (i8* (i8*, i32)* @my_index to i8* (...)*)(i8* %522, i32 %524), !dbg !1089
  store i8* %525, i8** %temp, align 8, !dbg !1089
  %526 = load i8** @nextchar, align 8, !dbg !1090
  %527 = load i8* %526, align 1, !dbg !1090
  %528 = sext i8 %527 to i32, !dbg !1090
  %529 = icmp eq i32 %528, 0, !dbg !1090
  br i1 %529, label %530, label %533, !dbg !1090

; <label>:530                                     ; preds = %518
  %531 = load i32* @optind, align 4, !dbg !1091
  %532 = add nsw i32 %531, 1, !dbg !1091
  store i32 %532, i32* @optind, align 4, !dbg !1091
  br label %533, !dbg !1091

; <label>:533                                     ; preds = %530, %518
  %534 = load i8** %temp, align 8, !dbg !1092
  %535 = icmp eq i8* %534, null, !dbg !1092
  br i1 %535, label %540, label %536, !dbg !1092

; <label>:536                                     ; preds = %533
  %537 = load i8* %c, align 1, !dbg !1092
  %538 = sext i8 %537 to i32, !dbg !1092
  %539 = icmp eq i32 %538, 58, !dbg !1092
  br i1 %539, label %540, label %554, !dbg !1092

; <label>:540                                     ; preds = %536, %533
  %541 = load i32* @opterr, align 4, !dbg !1093
  %542 = icmp ne i32 %541, 0, !dbg !1093
  br i1 %542, label %543, label %551, !dbg !1093

; <label>:543                                     ; preds = %540
  %544 = load %struct.__sFILE** @__stderrp, align 8, !dbg !1095
  %545 = load i8*** %3, align 8, !dbg !1095
  %546 = getelementptr inbounds i8** %545, i64 0, !dbg !1095
  %547 = load i8** %546, align 8, !dbg !1095
  %548 = load i8* %c, align 1, !dbg !1095
  %549 = sext i8 %548 to i32, !dbg !1095
  %550 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %544, i8* getelementptr inbounds ([26 x i8]* @.str9, i32 0, i32 0), i8* %547, i32 %549), !dbg !1095
  br label %551, !dbg !1097

; <label>:551                                     ; preds = %543, %540
  %552 = load i8* %c, align 1, !dbg !1098
  %553 = sext i8 %552 to i32, !dbg !1098
  store i32 %553, i32* @optopt, align 4, !dbg !1098
  store i32 0, i32* %1, !dbg !1099
  br label %625, !dbg !1099

; <label>:554                                     ; preds = %536
  %555 = load i8** %temp, align 8, !dbg !1100
  %556 = getelementptr inbounds i8* %555, i64 1, !dbg !1100
  %557 = load i8* %556, align 1, !dbg !1100
  %558 = sext i8 %557 to i32, !dbg !1100
  %559 = icmp eq i32 %558, 58, !dbg !1100
  br i1 %559, label %560, label %622, !dbg !1100

; <label>:560                                     ; preds = %554
  %561 = load i8** %temp, align 8, !dbg !1101
  %562 = getelementptr inbounds i8* %561, i64 2, !dbg !1101
  %563 = load i8* %562, align 1, !dbg !1101
  %564 = sext i8 %563 to i32, !dbg !1101
  %565 = icmp eq i32 %564, 58, !dbg !1101
  br i1 %565, label %566, label %577, !dbg !1101

; <label>:566                                     ; preds = %560
  %567 = load i8** @nextchar, align 8, !dbg !1103
  %568 = load i8* %567, align 1, !dbg !1103
  %569 = sext i8 %568 to i32, !dbg !1103
  %570 = icmp ne i32 %569, 0, !dbg !1103
  br i1 %570, label %571, label %575, !dbg !1103

; <label>:571                                     ; preds = %566
  %572 = load i8** @nextchar, align 8, !dbg !1105
  store i8* %572, i8** @optarg, align 8, !dbg !1105
  %573 = load i32* @optind, align 4, !dbg !1107
  %574 = add nsw i32 %573, 1, !dbg !1107
  store i32 %574, i32* @optind, align 4, !dbg !1107
  br label %576, !dbg !1108

; <label>:575                                     ; preds = %566
  store i8* null, i8** @optarg, align 8, !dbg !1109
  br label %576

; <label>:576                                     ; preds = %575, %571
  store i8* null, i8** @nextchar, align 8, !dbg !1110
  br label %621, !dbg !1111

; <label>:577                                     ; preds = %560
  %578 = load i8** @nextchar, align 8, !dbg !1112
  %579 = load i8* %578, align 1, !dbg !1112
  %580 = sext i8 %579 to i32, !dbg !1112
  %581 = icmp ne i32 %580, 0, !dbg !1112
  br i1 %581, label %582, label %586, !dbg !1112

; <label>:582                                     ; preds = %577
  %583 = load i8** @nextchar, align 8, !dbg !1114
  store i8* %583, i8** @optarg, align 8, !dbg !1114
  %584 = load i32* @optind, align 4, !dbg !1116
  %585 = add nsw i32 %584, 1, !dbg !1116
  store i32 %585, i32* @optind, align 4, !dbg !1116
  br label %620, !dbg !1117

; <label>:586                                     ; preds = %577
  %587 = load i32* @optind, align 4, !dbg !1118
  %588 = load i32* %2, align 4, !dbg !1118
  %589 = icmp eq i32 %587, %588, !dbg !1118
  br i1 %589, label %590, label %612, !dbg !1118

; <label>:590                                     ; preds = %586
  %591 = load i32* @opterr, align 4, !dbg !1119
  %592 = icmp ne i32 %591, 0, !dbg !1119
  br i1 %592, label %593, label %601, !dbg !1119

; <label>:593                                     ; preds = %590
  %594 = load %struct.__sFILE** @__stderrp, align 8, !dbg !1121
  %595 = load i8*** %3, align 8, !dbg !1121
  %596 = getelementptr inbounds i8** %595, i64 0, !dbg !1121
  %597 = load i8** %596, align 8, !dbg !1121
  %598 = load i8* %c, align 1, !dbg !1121
  %599 = sext i8 %598 to i32, !dbg !1121
  %600 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %594, i8* getelementptr inbounds ([39 x i8]* @.str10, i32 0, i32 0), i8* %597, i32 %599), !dbg !1121
  br label %601, !dbg !1123

; <label>:601                                     ; preds = %593, %590
  %602 = load i8* %c, align 1, !dbg !1124
  %603 = sext i8 %602 to i32, !dbg !1124
  store i32 %603, i32* @optopt, align 4, !dbg !1124
  %604 = load i8** %4, align 8, !dbg !1125
  %605 = getelementptr inbounds i8* %604, i64 0, !dbg !1125
  %606 = load i8* %605, align 1, !dbg !1125
  %607 = sext i8 %606 to i32, !dbg !1125
  %608 = icmp eq i32 %607, 58, !dbg !1125
  br i1 %608, label %609, label %610, !dbg !1125

; <label>:609                                     ; preds = %601
  store i8 58, i8* %c, align 1, !dbg !1126
  br label %611, !dbg !1126

; <label>:610                                     ; preds = %601
  store i8 0, i8* %c, align 1, !dbg !1127
  br label %611

; <label>:611                                     ; preds = %610, %609
  br label %619, !dbg !1128

; <label>:612                                     ; preds = %586
  %613 = load i32* @optind, align 4, !dbg !1129
  %614 = add nsw i32 %613, 1, !dbg !1129
  store i32 %614, i32* @optind, align 4, !dbg !1129
  %615 = sext i32 %613 to i64, !dbg !1129
  %616 = load i8*** %3, align 8, !dbg !1129
  %617 = getelementptr inbounds i8** %616, i64 %615, !dbg !1129
  %618 = load i8** %617, align 8, !dbg !1129
  store i8* %618, i8** @optarg, align 8, !dbg !1129
  br label %619

; <label>:619                                     ; preds = %612, %611
  br label %620

; <label>:620                                     ; preds = %619, %582
  store i8* null, i8** @nextchar, align 8, !dbg !1130
  br label %621

; <label>:621                                     ; preds = %620, %576
  br label %622, !dbg !1131

; <label>:622                                     ; preds = %621, %554
  %623 = load i8* %c, align 1, !dbg !1132
  %624 = sext i8 %623 to i32, !dbg !1132
  store i32 %624, i32* %1, !dbg !1132
  br label %625, !dbg !1132

; <label>:625                                     ; preds = %622, %551, %514, %454, %447, %417, %379, %311, %167, %166, %142
  %626 = load i32* %1, !dbg !1133
  ret i32 %626, !dbg !1133
}

declare i8* @getenv(i8*)

define internal void @exchange(i8** %argv) nounwind uwtable {
  %1 = alloca i8**, align 8
  %temp = alloca i8*, align 8
  %first = alloca i8**, align 8
  %last = alloca i8**, align 8
  store i8** %argv, i8*** %1, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !1134), !dbg !1135
  call void @llvm.dbg.declare(metadata !22, metadata !1136), !dbg !1138
  call void @llvm.dbg.declare(metadata !22, metadata !1139), !dbg !1140
  call void @llvm.dbg.declare(metadata !22, metadata !1141), !dbg !1142
  %2 = load i32* @first_nonopt, align 4, !dbg !1143
  %3 = sext i32 %2 to i64, !dbg !1143
  %4 = load i8*** %1, align 8, !dbg !1143
  %5 = getelementptr inbounds i8** %4, i64 %3, !dbg !1143
  store i8** %5, i8*** %first, align 8, !dbg !1143
  %6 = load i32* @optind, align 4, !dbg !1144
  %7 = sub nsw i32 %6, 1, !dbg !1144
  %8 = sext i32 %7 to i64, !dbg !1144
  %9 = load i8*** %1, align 8, !dbg !1144
  %10 = getelementptr inbounds i8** %9, i64 %8, !dbg !1144
  store i8** %10, i8*** %last, align 8, !dbg !1144
  br label %11, !dbg !1145

; <label>:11                                      ; preds = %15, %0
  %12 = load i8*** %first, align 8, !dbg !1145
  %13 = load i8*** %last, align 8, !dbg !1145
  %14 = icmp ult i8** %12, %13, !dbg !1145
  br i1 %14, label %15, label %27, !dbg !1145

; <label>:15                                      ; preds = %11
  %16 = load i8*** %first, align 8, !dbg !1146
  %17 = load i8** %16, align 8, !dbg !1146
  store i8* %17, i8** %temp, align 8, !dbg !1146
  %18 = load i8*** %last, align 8, !dbg !1148
  %19 = load i8** %18, align 8, !dbg !1148
  %20 = load i8*** %first, align 8, !dbg !1148
  store i8* %19, i8** %20, align 8, !dbg !1148
  %21 = load i8** %temp, align 8, !dbg !1149
  %22 = load i8*** %last, align 8, !dbg !1149
  store i8* %21, i8** %22, align 8, !dbg !1149
  %23 = load i8*** %first, align 8, !dbg !1150
  %24 = getelementptr inbounds i8** %23, i32 1, !dbg !1150
  store i8** %24, i8*** %first, align 8, !dbg !1150
  %25 = load i8*** %last, align 8, !dbg !1151
  %26 = getelementptr inbounds i8** %25, i32 -1, !dbg !1151
  store i8** %26, i8*** %last, align 8, !dbg !1151
  br label %11, !dbg !1152

; <label>:27                                      ; preds = %11
  %28 = load i32* @first_nonopt, align 4, !dbg !1153
  %29 = sext i32 %28 to i64, !dbg !1153
  %30 = load i8*** %1, align 8, !dbg !1153
  %31 = getelementptr inbounds i8** %30, i64 %29, !dbg !1153
  store i8** %31, i8*** %first, align 8, !dbg !1153
  %32 = load i32* @optind, align 4, !dbg !1154
  %33 = load i32* @last_nonopt, align 4, !dbg !1154
  %34 = sub nsw i32 %32, %33, !dbg !1154
  %35 = load i32* @first_nonopt, align 4, !dbg !1154
  %36 = add nsw i32 %35, %34, !dbg !1154
  store i32 %36, i32* @first_nonopt, align 4, !dbg !1154
  %37 = load i32* @first_nonopt, align 4, !dbg !1155
  %38 = sub nsw i32 %37, 1, !dbg !1155
  %39 = sext i32 %38 to i64, !dbg !1155
  %40 = load i8*** %1, align 8, !dbg !1155
  %41 = getelementptr inbounds i8** %40, i64 %39, !dbg !1155
  store i8** %41, i8*** %last, align 8, !dbg !1155
  br label %42, !dbg !1156

; <label>:42                                      ; preds = %46, %27
  %43 = load i8*** %first, align 8, !dbg !1156
  %44 = load i8*** %last, align 8, !dbg !1156
  %45 = icmp ult i8** %43, %44, !dbg !1156
  br i1 %45, label %46, label %58, !dbg !1156

; <label>:46                                      ; preds = %42
  %47 = load i8*** %first, align 8, !dbg !1157
  %48 = load i8** %47, align 8, !dbg !1157
  store i8* %48, i8** %temp, align 8, !dbg !1157
  %49 = load i8*** %last, align 8, !dbg !1159
  %50 = load i8** %49, align 8, !dbg !1159
  %51 = load i8*** %first, align 8, !dbg !1159
  store i8* %50, i8** %51, align 8, !dbg !1159
  %52 = load i8** %temp, align 8, !dbg !1160
  %53 = load i8*** %last, align 8, !dbg !1160
  store i8* %52, i8** %53, align 8, !dbg !1160
  %54 = load i8*** %first, align 8, !dbg !1161
  %55 = getelementptr inbounds i8** %54, i32 1, !dbg !1161
  store i8** %55, i8*** %first, align 8, !dbg !1161
  %56 = load i8*** %last, align 8, !dbg !1162
  %57 = getelementptr inbounds i8** %56, i32 -1, !dbg !1162
  store i8** %57, i8*** %last, align 8, !dbg !1162
  br label %42, !dbg !1163

; <label>:58                                      ; preds = %42
  %59 = load i32* @first_nonopt, align 4, !dbg !1164
  %60 = sext i32 %59 to i64, !dbg !1164
  %61 = load i8*** %1, align 8, !dbg !1164
  %62 = getelementptr inbounds i8** %61, i64 %60, !dbg !1164
  store i8** %62, i8*** %first, align 8, !dbg !1164
  %63 = load i32* @optind, align 4, !dbg !1165
  store i32 %63, i32* @last_nonopt, align 4, !dbg !1165
  %64 = load i32* @last_nonopt, align 4, !dbg !1166
  %65 = sub nsw i32 %64, 1, !dbg !1166
  %66 = sext i32 %65 to i64, !dbg !1166
  %67 = load i8*** %1, align 8, !dbg !1166
  %68 = getelementptr inbounds i8** %67, i64 %66, !dbg !1166
  store i8** %68, i8*** %last, align 8, !dbg !1166
  br label %69, !dbg !1167

; <label>:69                                      ; preds = %73, %58
  %70 = load i8*** %first, align 8, !dbg !1167
  %71 = load i8*** %last, align 8, !dbg !1167
  %72 = icmp ult i8** %70, %71, !dbg !1167
  br i1 %72, label %73, label %85, !dbg !1167

; <label>:73                                      ; preds = %69
  %74 = load i8*** %first, align 8, !dbg !1168
  %75 = load i8** %74, align 8, !dbg !1168
  store i8* %75, i8** %temp, align 8, !dbg !1168
  %76 = load i8*** %last, align 8, !dbg !1170
  %77 = load i8** %76, align 8, !dbg !1170
  %78 = load i8*** %first, align 8, !dbg !1170
  store i8* %77, i8** %78, align 8, !dbg !1170
  %79 = load i8** %temp, align 8, !dbg !1171
  %80 = load i8*** %last, align 8, !dbg !1171
  store i8* %79, i8** %80, align 8, !dbg !1171
  %81 = load i8*** %first, align 8, !dbg !1172
  %82 = getelementptr inbounds i8** %81, i32 1, !dbg !1172
  store i8** %82, i8*** %first, align 8, !dbg !1172
  %83 = load i8*** %last, align 8, !dbg !1173
  %84 = getelementptr inbounds i8** %83, i32 -1, !dbg !1173
  store i8** %84, i8*** %last, align 8, !dbg !1173
  br label %69, !dbg !1174

; <label>:85                                      ; preds = %69
  ret void, !dbg !1175
}

declare i32 @strcmp(i8*, i8*)

declare i32 @strncmp(i8*, i8*, i32)

define internal i32 @my_strlen(i8* %str) nounwind uwtable {
  %1 = alloca i8*, align 8
  %n = alloca i32, align 4
  store i8* %str, i8** %1, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !1176), !dbg !1177
  call void @llvm.dbg.declare(metadata !22, metadata !1178), !dbg !1180
  store i32 0, i32* %n, align 4, !dbg !1181
  br label %2, !dbg !1182

; <label>:2                                       ; preds = %7, %0
  %3 = load i8** %1, align 8, !dbg !1182
  %4 = getelementptr inbounds i8* %3, i32 1, !dbg !1182
  store i8* %4, i8** %1, align 8, !dbg !1182
  %5 = load i8* %3, align 1, !dbg !1182
  %6 = icmp ne i8 %5, 0, !dbg !1182
  br i1 %6, label %7, label %10, !dbg !1182

; <label>:7                                       ; preds = %2
  %8 = load i32* %n, align 4, !dbg !1183
  %9 = add nsw i32 %8, 1, !dbg !1183
  store i32 %9, i32* %n, align 4, !dbg !1183
  br label %2, !dbg !1183

; <label>:10                                      ; preds = %2
  %11 = load i32* %n, align 4, !dbg !1184
  ret i32 %11, !dbg !1184
}

declare i32 @fprintf(%struct.__sFILE*, i8*, ...)

define internal i8* @my_index(i8* %str, i32 %chr) nounwind uwtable {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %str, i8** %2, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !1185), !dbg !1186
  store i32 %chr, i32* %3, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !1187), !dbg !1188
  br label %4, !dbg !1189

; <label>:4                                       ; preds = %16, %0
  %5 = load i8** %2, align 8, !dbg !1189
  %6 = load i8* %5, align 1, !dbg !1189
  %7 = icmp ne i8 %6, 0, !dbg !1189
  br i1 %7, label %8, label %19, !dbg !1189

; <label>:8                                       ; preds = %4
  %9 = load i8** %2, align 8, !dbg !1191
  %10 = load i8* %9, align 1, !dbg !1191
  %11 = sext i8 %10 to i32, !dbg !1191
  %12 = load i32* %3, align 4, !dbg !1191
  %13 = icmp eq i32 %11, %12, !dbg !1191
  br i1 %13, label %14, label %16, !dbg !1191

; <label>:14                                      ; preds = %8
  %15 = load i8** %2, align 8, !dbg !1193
  store i8* %15, i8** %1, !dbg !1193
  br label %20, !dbg !1193

; <label>:16                                      ; preds = %8
  %17 = load i8** %2, align 8, !dbg !1194
  %18 = getelementptr inbounds i8* %17, i32 1, !dbg !1194
  store i8* %18, i8** %2, align 8, !dbg !1194
  br label %4, !dbg !1195

; <label>:19                                      ; preds = %4
  store i8* null, i8** %1, !dbg !1196
  br label %20, !dbg !1196

; <label>:20                                      ; preds = %19, %14
  %21 = load i8** %1, !dbg !1197
  ret i8* %21, !dbg !1197
}

define i32 @getopt(i32 %argc, i8** %argv, i8* %optstring) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i8**, align 8
  %3 = alloca i8*, align 8
  store i32 %argc, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !1198), !dbg !1199
  store i8** %argv, i8*** %2, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !1200), !dbg !1201
  store i8* %optstring, i8** %3, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !1202), !dbg !1203
  %4 = load i32* %1, align 4, !dbg !1204
  %5 = load i8*** %2, align 8, !dbg !1204
  %6 = load i8** %3, align 8, !dbg !1204
  %7 = call i32 (...)* bitcast (i32 (i32, i8**, i8*, %struct.option*, i32*, i32)* @_getopt_internal to i32 (...)*)(i32 %4, i8** %5, i8* %6, %struct.option* null, i32* null, i32 0), !dbg !1204
  ret i32 %7, !dbg !1204
}

define i32 @getopt_long(i32 %argc, i8** %argv, i8* %options, %struct.option* %long_options, i32* %opt_index) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i8**, align 8
  %3 = alloca i8*, align 8
  %4 = alloca %struct.option*, align 8
  %5 = alloca i32*, align 8
  store i32 %argc, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !1206), !dbg !1207
  store i8** %argv, i8*** %2, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !1208), !dbg !1209
  store i8* %options, i8** %3, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !1210), !dbg !1211
  store %struct.option* %long_options, %struct.option** %4, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !1212), !dbg !1213
  store i32* %opt_index, i32** %5, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !1214), !dbg !1215
  %6 = load i32* %1, align 4, !dbg !1216
  %7 = load i8*** %2, align 8, !dbg !1216
  %8 = load i8** %3, align 8, !dbg !1216
  %9 = load %struct.option** %4, align 8, !dbg !1216
  %10 = load i32** %5, align 8, !dbg !1216
  %11 = call i32 (...)* bitcast (i32 (i32, i8**, i8*, %struct.option*, i32*, i32)* @_getopt_internal to i32 (...)*)(i32 %6, i8** %7, i8* %8, %struct.option* %9, i32* %10, i32 0), !dbg !1216
  ret i32 %11, !dbg !1216
}

define i32 @huft_build(i32* %b, i32 %n, i32 %s, i16* %d, i16* %e, %struct.huft** %t, i32* %m) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i16*, align 8
  %6 = alloca i16*, align 8
  %7 = alloca %struct.huft**, align 8
  %8 = alloca i32*, align 8
  %a = alloca i32, align 4
  %c = alloca [17 x i32], align 16
  %f = alloca i32, align 4
  %g = alloca i32, align 4
  %h = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %p = alloca i32*, align 8
  %q = alloca %struct.huft*, align 8
  %r = alloca %struct.huft, align 8
  %u = alloca [16 x %struct.huft*], align 16
  %v = alloca [288 x i32], align 16
  %w = alloca i32, align 4
  %x = alloca [17 x i32], align 16
  %xp = alloca i32*, align 8
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  store i32* %b, i32** %2, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !1218), !dbg !1219
  store i32 %n, i32* %3, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !1220), !dbg !1221
  store i32 %s, i32* %4, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !1222), !dbg !1223
  store i16* %d, i16** %5, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !1224), !dbg !1225
  store i16* %e, i16** %6, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !1226), !dbg !1227
  store %struct.huft** %t, %struct.huft*** %7, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !1228), !dbg !1229
  store i32* %m, i32** %8, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !1230), !dbg !1231
  call void @llvm.dbg.declare(metadata !22, metadata !1232), !dbg !1234
  call void @llvm.dbg.declare(metadata !22, metadata !1235), !dbg !1237
  call void @llvm.dbg.declare(metadata !22, metadata !1238), !dbg !1239
  call void @llvm.dbg.declare(metadata !22, metadata !1240), !dbg !1241
  call void @llvm.dbg.declare(metadata !22, metadata !1242), !dbg !1243
  call void @llvm.dbg.declare(metadata !22, metadata !1244), !dbg !1245
  call void @llvm.dbg.declare(metadata !22, metadata !1246), !dbg !1247
  call void @llvm.dbg.declare(metadata !22, metadata !1248), !dbg !1249
  call void @llvm.dbg.declare(metadata !22, metadata !1250), !dbg !1251
  call void @llvm.dbg.declare(metadata !22, metadata !1252), !dbg !1253
  call void @llvm.dbg.declare(metadata !22, metadata !1254), !dbg !1255
  call void @llvm.dbg.declare(metadata !22, metadata !1256), !dbg !1257
  call void @llvm.dbg.declare(metadata !22, metadata !1258), !dbg !1260
  call void @llvm.dbg.declare(metadata !22, metadata !1261), !dbg !1263
  call void @llvm.dbg.declare(metadata !22, metadata !1264), !dbg !1265
  call void @llvm.dbg.declare(metadata !22, metadata !1266), !dbg !1267
  call void @llvm.dbg.declare(metadata !22, metadata !1268), !dbg !1269
  call void @llvm.dbg.declare(metadata !22, metadata !1270), !dbg !1271
  call void @llvm.dbg.declare(metadata !22, metadata !1272), !dbg !1273
  %9 = getelementptr inbounds [17 x i32]* %c, i32 0, i32 0, !dbg !1274
  %10 = bitcast i32* %9 to i8*, !dbg !1274
  call void @llvm.memset.p0i8.i64(i8* %10, i8 0, i64 68, i32 1, i1 false), !dbg !1274
  %11 = load i32** %2, align 8, !dbg !1275
  store i32* %11, i32** %p, align 8, !dbg !1275
  %12 = load i32* %3, align 4, !dbg !1276
  store i32 %12, i32* %i, align 4, !dbg !1276
  br label %13, !dbg !1277

; <label>:13                                      ; preds = %22, %0
  %14 = load i32** %p, align 8, !dbg !1278
  %15 = load i32* %14, align 4, !dbg !1278
  %16 = zext i32 %15 to i64, !dbg !1278
  %17 = getelementptr inbounds [17 x i32]* %c, i32 0, i64 %16, !dbg !1278
  %18 = load i32* %17, align 4, !dbg !1278
  %19 = add i32 %18, 1, !dbg !1278
  store i32 %19, i32* %17, align 4, !dbg !1278
  %20 = load i32** %p, align 8, !dbg !1280
  %21 = getelementptr inbounds i32* %20, i32 1, !dbg !1280
  store i32* %21, i32** %p, align 8, !dbg !1280
  br label %22, !dbg !1281

; <label>:22                                      ; preds = %13
  %23 = load i32* %i, align 4, !dbg !1281
  %24 = add i32 %23, -1, !dbg !1281
  store i32 %24, i32* %i, align 4, !dbg !1281
  %25 = icmp ne i32 %24, 0, !dbg !1281
  br i1 %25, label %13, label %26, !dbg !1281

; <label>:26                                      ; preds = %22
  %27 = getelementptr inbounds [17 x i32]* %c, i32 0, i64 0, !dbg !1282
  %28 = load i32* %27, align 4, !dbg !1282
  %29 = load i32* %3, align 4, !dbg !1282
  %30 = icmp eq i32 %28, %29, !dbg !1282
  br i1 %30, label %31, label %34, !dbg !1282

; <label>:31                                      ; preds = %26
  %32 = load %struct.huft*** %7, align 8, !dbg !1283
  store %struct.huft* null, %struct.huft** %32, align 8, !dbg !1283
  %33 = load i32** %8, align 8, !dbg !1285
  store i32 0, i32* %33, align 4, !dbg !1285
  store i32 0, i32* %1, !dbg !1286
  br label %434, !dbg !1286

; <label>:34                                      ; preds = %26
  %35 = load i32** %8, align 8, !dbg !1287
  %36 = load i32* %35, align 4, !dbg !1287
  store i32 %36, i32* %l, align 4, !dbg !1287
  store i32 1, i32* %j, align 4, !dbg !1288
  br label %37, !dbg !1288

; <label>:37                                      ; preds = %48, %34
  %38 = load i32* %j, align 4, !dbg !1288
  %39 = icmp ule i32 %38, 16, !dbg !1288
  br i1 %39, label %40, label %51, !dbg !1288

; <label>:40                                      ; preds = %37
  %41 = load i32* %j, align 4, !dbg !1290
  %42 = zext i32 %41 to i64, !dbg !1290
  %43 = getelementptr inbounds [17 x i32]* %c, i32 0, i64 %42, !dbg !1290
  %44 = load i32* %43, align 4, !dbg !1290
  %45 = icmp ne i32 %44, 0, !dbg !1290
  br i1 %45, label %46, label %47, !dbg !1290

; <label>:46                                      ; preds = %40
  br label %51, !dbg !1291

; <label>:47                                      ; preds = %40
  br label %48, !dbg !1291

; <label>:48                                      ; preds = %47
  %49 = load i32* %j, align 4, !dbg !1292
  %50 = add i32 %49, 1, !dbg !1292
  store i32 %50, i32* %j, align 4, !dbg !1292
  br label %37, !dbg !1292

; <label>:51                                      ; preds = %46, %37
  %52 = load i32* %j, align 4, !dbg !1293
  store i32 %52, i32* %k, align 4, !dbg !1293
  %53 = load i32* %l, align 4, !dbg !1294
  %54 = load i32* %j, align 4, !dbg !1294
  %55 = icmp ult i32 %53, %54, !dbg !1294
  br i1 %55, label %56, label %58, !dbg !1294

; <label>:56                                      ; preds = %51
  %57 = load i32* %j, align 4, !dbg !1295
  store i32 %57, i32* %l, align 4, !dbg !1295
  br label %58, !dbg !1295

; <label>:58                                      ; preds = %56, %51
  store i32 16, i32* %i, align 4, !dbg !1296
  br label %59, !dbg !1296

; <label>:59                                      ; preds = %70, %58
  %60 = load i32* %i, align 4, !dbg !1296
  %61 = icmp ne i32 %60, 0, !dbg !1296
  br i1 %61, label %62, label %73, !dbg !1296

; <label>:62                                      ; preds = %59
  %63 = load i32* %i, align 4, !dbg !1298
  %64 = zext i32 %63 to i64, !dbg !1298
  %65 = getelementptr inbounds [17 x i32]* %c, i32 0, i64 %64, !dbg !1298
  %66 = load i32* %65, align 4, !dbg !1298
  %67 = icmp ne i32 %66, 0, !dbg !1298
  br i1 %67, label %68, label %69, !dbg !1298

; <label>:68                                      ; preds = %62
  br label %73, !dbg !1299

; <label>:69                                      ; preds = %62
  br label %70, !dbg !1299

; <label>:70                                      ; preds = %69
  %71 = load i32* %i, align 4, !dbg !1300
  %72 = add i32 %71, -1, !dbg !1300
  store i32 %72, i32* %i, align 4, !dbg !1300
  br label %59, !dbg !1300

; <label>:73                                      ; preds = %68, %59
  %74 = load i32* %i, align 4, !dbg !1301
  store i32 %74, i32* %g, align 4, !dbg !1301
  %75 = load i32* %l, align 4, !dbg !1302
  %76 = load i32* %i, align 4, !dbg !1302
  %77 = icmp ugt i32 %75, %76, !dbg !1302
  br i1 %77, label %78, label %80, !dbg !1302

; <label>:78                                      ; preds = %73
  %79 = load i32* %i, align 4, !dbg !1303
  store i32 %79, i32* %l, align 4, !dbg !1303
  br label %80, !dbg !1303

; <label>:80                                      ; preds = %78, %73
  %81 = load i32* %l, align 4, !dbg !1304
  %82 = load i32** %8, align 8, !dbg !1304
  store i32 %81, i32* %82, align 4, !dbg !1304
  %83 = load i32* %j, align 4, !dbg !1305
  %84 = shl i32 1, %83, !dbg !1305
  store i32 %84, i32* %y, align 4, !dbg !1305
  br label %85, !dbg !1305

; <label>:85                                      ; preds = %99, %80
  %86 = load i32* %j, align 4, !dbg !1305
  %87 = load i32* %i, align 4, !dbg !1305
  %88 = icmp ult i32 %86, %87, !dbg !1305
  br i1 %88, label %89, label %104, !dbg !1305

; <label>:89                                      ; preds = %85
  %90 = load i32* %j, align 4, !dbg !1307
  %91 = zext i32 %90 to i64, !dbg !1307
  %92 = getelementptr inbounds [17 x i32]* %c, i32 0, i64 %91, !dbg !1307
  %93 = load i32* %92, align 4, !dbg !1307
  %94 = load i32* %y, align 4, !dbg !1307
  %95 = sub i32 %94, %93, !dbg !1307
  store i32 %95, i32* %y, align 4, !dbg !1307
  %96 = icmp slt i32 %95, 0, !dbg !1307
  br i1 %96, label %97, label %98, !dbg !1307

; <label>:97                                      ; preds = %89
  store i32 2, i32* %1, !dbg !1308
  br label %434, !dbg !1308

; <label>:98                                      ; preds = %89
  br label %99, !dbg !1308

; <label>:99                                      ; preds = %98
  %100 = load i32* %j, align 4, !dbg !1309
  %101 = add i32 %100, 1, !dbg !1309
  store i32 %101, i32* %j, align 4, !dbg !1309
  %102 = load i32* %y, align 4, !dbg !1309
  %103 = shl i32 %102, 1, !dbg !1309
  store i32 %103, i32* %y, align 4, !dbg !1309
  br label %85, !dbg !1309

; <label>:104                                     ; preds = %85
  %105 = load i32* %i, align 4, !dbg !1310
  %106 = zext i32 %105 to i64, !dbg !1310
  %107 = getelementptr inbounds [17 x i32]* %c, i32 0, i64 %106, !dbg !1310
  %108 = load i32* %107, align 4, !dbg !1310
  %109 = load i32* %y, align 4, !dbg !1310
  %110 = sub i32 %109, %108, !dbg !1310
  store i32 %110, i32* %y, align 4, !dbg !1310
  %111 = icmp slt i32 %110, 0, !dbg !1310
  br i1 %111, label %112, label %113, !dbg !1310

; <label>:112                                     ; preds = %104
  store i32 2, i32* %1, !dbg !1311
  br label %434, !dbg !1311

; <label>:113                                     ; preds = %104
  %114 = load i32* %y, align 4, !dbg !1312
  %115 = load i32* %i, align 4, !dbg !1312
  %116 = zext i32 %115 to i64, !dbg !1312
  %117 = getelementptr inbounds [17 x i32]* %c, i32 0, i64 %116, !dbg !1312
  %118 = load i32* %117, align 4, !dbg !1312
  %119 = add i32 %118, %114, !dbg !1312
  store i32 %119, i32* %117, align 4, !dbg !1312
  store i32 0, i32* %j, align 4, !dbg !1313
  %120 = getelementptr inbounds [17 x i32]* %x, i32 0, i64 1, !dbg !1313
  store i32 0, i32* %120, align 4, !dbg !1313
  %121 = getelementptr inbounds [17 x i32]* %c, i32 0, i32 0, !dbg !1314
  %122 = getelementptr inbounds i32* %121, i64 1, !dbg !1314
  store i32* %122, i32** %p, align 8, !dbg !1314
  %123 = getelementptr inbounds [17 x i32]* %x, i32 0, i32 0, !dbg !1315
  %124 = getelementptr inbounds i32* %123, i64 2, !dbg !1315
  store i32* %124, i32** %xp, align 8, !dbg !1315
  br label %125, !dbg !1316

; <label>:125                                     ; preds = %129, %113
  %126 = load i32* %i, align 4, !dbg !1316
  %127 = add i32 %126, -1, !dbg !1316
  store i32 %127, i32* %i, align 4, !dbg !1316
  %128 = icmp ne i32 %127, 0, !dbg !1316
  br i1 %128, label %129, label %137, !dbg !1316

; <label>:129                                     ; preds = %125
  %130 = load i32** %p, align 8, !dbg !1317
  %131 = getelementptr inbounds i32* %130, i32 1, !dbg !1317
  store i32* %131, i32** %p, align 8, !dbg !1317
  %132 = load i32* %130, align 4, !dbg !1317
  %133 = load i32* %j, align 4, !dbg !1317
  %134 = add i32 %133, %132, !dbg !1317
  store i32 %134, i32* %j, align 4, !dbg !1317
  %135 = load i32** %xp, align 8, !dbg !1317
  %136 = getelementptr inbounds i32* %135, i32 1, !dbg !1317
  store i32* %136, i32** %xp, align 8, !dbg !1317
  store i32 %134, i32* %135, align 4, !dbg !1317
  br label %125, !dbg !1319

; <label>:137                                     ; preds = %125
  %138 = load i32** %2, align 8, !dbg !1320
  store i32* %138, i32** %p, align 8, !dbg !1320
  store i32 0, i32* %i, align 4, !dbg !1321
  br label %139, !dbg !1322

; <label>:139                                     ; preds = %154, %137
  %140 = load i32** %p, align 8, !dbg !1323
  %141 = getelementptr inbounds i32* %140, i32 1, !dbg !1323
  store i32* %141, i32** %p, align 8, !dbg !1323
  %142 = load i32* %140, align 4, !dbg !1323
  store i32 %142, i32* %j, align 4, !dbg !1323
  %143 = icmp ne i32 %142, 0, !dbg !1323
  br i1 %143, label %144, label %153, !dbg !1323

; <label>:144                                     ; preds = %139
  %145 = load i32* %i, align 4, !dbg !1325
  %146 = load i32* %j, align 4, !dbg !1325
  %147 = zext i32 %146 to i64, !dbg !1325
  %148 = getelementptr inbounds [17 x i32]* %x, i32 0, i64 %147, !dbg !1325
  %149 = load i32* %148, align 4, !dbg !1325
  %150 = add i32 %149, 1, !dbg !1325
  store i32 %150, i32* %148, align 4, !dbg !1325
  %151 = zext i32 %149 to i64, !dbg !1325
  %152 = getelementptr inbounds [288 x i32]* %v, i32 0, i64 %151, !dbg !1325
  store i32 %145, i32* %152, align 4, !dbg !1325
  br label %153, !dbg !1325

; <label>:153                                     ; preds = %144, %139
  br label %154, !dbg !1326

; <label>:154                                     ; preds = %153
  %155 = load i32* %i, align 4, !dbg !1326
  %156 = add i32 %155, 1, !dbg !1326
  store i32 %156, i32* %i, align 4, !dbg !1326
  %157 = load i32* %3, align 4, !dbg !1326
  %158 = icmp ult i32 %156, %157, !dbg !1326
  br i1 %158, label %139, label %159, !dbg !1326

; <label>:159                                     ; preds = %154
  store i32 0, i32* %i, align 4, !dbg !1327
  %160 = getelementptr inbounds [17 x i32]* %x, i32 0, i64 0, !dbg !1327
  store i32 0, i32* %160, align 4, !dbg !1327
  %161 = getelementptr inbounds [288 x i32]* %v, i32 0, i32 0, !dbg !1328
  store i32* %161, i32** %p, align 8, !dbg !1328
  store i32 -1, i32* %h, align 4, !dbg !1329
  %162 = load i32* %l, align 4, !dbg !1330
  %163 = sub nsw i32 0, %162, !dbg !1330
  store i32 %163, i32* %w, align 4, !dbg !1330
  %164 = getelementptr inbounds [16 x %struct.huft*]* %u, i32 0, i64 0, !dbg !1331
  store %struct.huft* null, %struct.huft** %164, align 8, !dbg !1331
  store %struct.huft* null, %struct.huft** %q, align 8, !dbg !1332
  store i32 0, i32* %z, align 4, !dbg !1333
  br label %165, !dbg !1334

; <label>:165                                     ; preds = %422, %159
  %166 = load i32* %k, align 4, !dbg !1334
  %167 = load i32* %g, align 4, !dbg !1334
  %168 = icmp sle i32 %166, %167, !dbg !1334
  br i1 %168, label %169, label %425, !dbg !1334

; <label>:169                                     ; preds = %165
  %170 = load i32* %k, align 4, !dbg !1336
  %171 = sext i32 %170 to i64, !dbg !1336
  %172 = getelementptr inbounds [17 x i32]* %c, i32 0, i64 %171, !dbg !1336
  %173 = load i32* %172, align 4, !dbg !1336
  store i32 %173, i32* %a, align 4, !dbg !1336
  br label %174, !dbg !1338

; <label>:174                                     ; preds = %420, %169
  %175 = load i32* %a, align 4, !dbg !1338
  %176 = add i32 %175, -1, !dbg !1338
  store i32 %176, i32* %a, align 4, !dbg !1338
  %177 = icmp ne i32 %175, 0, !dbg !1338
  br i1 %177, label %178, label %421, !dbg !1338

; <label>:178                                     ; preds = %174
  br label %179, !dbg !1339

; <label>:179                                     ; preds = %303, %178
  %180 = load i32* %k, align 4, !dbg !1339
  %181 = load i32* %w, align 4, !dbg !1339
  %182 = load i32* %l, align 4, !dbg !1339
  %183 = add nsw i32 %181, %182, !dbg !1339
  %184 = icmp sgt i32 %180, %183, !dbg !1339
  br i1 %184, label %185, label %304, !dbg !1339

; <label>:185                                     ; preds = %179
  %186 = load i32* %h, align 4, !dbg !1341
  %187 = add nsw i32 %186, 1, !dbg !1341
  store i32 %187, i32* %h, align 4, !dbg !1341
  %188 = load i32* %l, align 4, !dbg !1343
  %189 = load i32* %w, align 4, !dbg !1343
  %190 = add nsw i32 %189, %188, !dbg !1343
  store i32 %190, i32* %w, align 4, !dbg !1343
  %191 = load i32* %g, align 4, !dbg !1344
  %192 = load i32* %w, align 4, !dbg !1344
  %193 = sub nsw i32 %191, %192, !dbg !1344
  store i32 %193, i32* %z, align 4, !dbg !1344
  %194 = load i32* %l, align 4, !dbg !1344
  %195 = icmp ugt i32 %193, %194, !dbg !1344
  br i1 %195, label %196, label %198, !dbg !1344

; <label>:196                                     ; preds = %185
  %197 = load i32* %l, align 4, !dbg !1344
  br label %200, !dbg !1344

; <label>:198                                     ; preds = %185
  %199 = load i32* %z, align 4, !dbg !1344
  br label %200, !dbg !1344

; <label>:200                                     ; preds = %198, %196
  %201 = phi i32 [ %197, %196 ], [ %199, %198 ], !dbg !1344
  store i32 %201, i32* %z, align 4, !dbg !1344
  %202 = load i32* %k, align 4, !dbg !1345
  %203 = load i32* %w, align 4, !dbg !1345
  %204 = sub nsw i32 %202, %203, !dbg !1345
  store i32 %204, i32* %j, align 4, !dbg !1345
  %205 = shl i32 1, %204, !dbg !1345
  store i32 %205, i32* %f, align 4, !dbg !1345
  %206 = load i32* %a, align 4, !dbg !1345
  %207 = add i32 %206, 1, !dbg !1345
  %208 = icmp ugt i32 %205, %207, !dbg !1345
  br i1 %208, label %209, label %237, !dbg !1345

; <label>:209                                     ; preds = %200
  %210 = load i32* %a, align 4, !dbg !1346
  %211 = add i32 %210, 1, !dbg !1346
  %212 = load i32* %f, align 4, !dbg !1346
  %213 = sub i32 %212, %211, !dbg !1346
  store i32 %213, i32* %f, align 4, !dbg !1346
  %214 = getelementptr inbounds [17 x i32]* %c, i32 0, i32 0, !dbg !1348
  %215 = load i32* %k, align 4, !dbg !1348
  %216 = sext i32 %215 to i64, !dbg !1348
  %217 = getelementptr inbounds i32* %214, i64 %216, !dbg !1348
  store i32* %217, i32** %xp, align 8, !dbg !1348
  br label %218, !dbg !1349

; <label>:218                                     ; preds = %231, %209
  %219 = load i32* %j, align 4, !dbg !1349
  %220 = add i32 %219, 1, !dbg !1349
  store i32 %220, i32* %j, align 4, !dbg !1349
  %221 = load i32* %z, align 4, !dbg !1349
  %222 = icmp ult i32 %220, %221, !dbg !1349
  br i1 %222, label %223, label %236, !dbg !1349

; <label>:223                                     ; preds = %218
  %224 = load i32* %f, align 4, !dbg !1350
  %225 = shl i32 %224, 1, !dbg !1350
  store i32 %225, i32* %f, align 4, !dbg !1350
  %226 = load i32** %xp, align 8, !dbg !1350
  %227 = getelementptr inbounds i32* %226, i32 1, !dbg !1350
  store i32* %227, i32** %xp, align 8, !dbg !1350
  %228 = load i32* %227, align 4, !dbg !1350
  %229 = icmp ule i32 %225, %228, !dbg !1350
  br i1 %229, label %230, label %231, !dbg !1350

; <label>:230                                     ; preds = %223
  br label %236, !dbg !1352

; <label>:231                                     ; preds = %223
  %232 = load i32** %xp, align 8, !dbg !1353
  %233 = load i32* %232, align 4, !dbg !1353
  %234 = load i32* %f, align 4, !dbg !1353
  %235 = sub i32 %234, %233, !dbg !1353
  store i32 %235, i32* %f, align 4, !dbg !1353
  br label %218, !dbg !1354

; <label>:236                                     ; preds = %230, %218
  br label %237, !dbg !1355

; <label>:237                                     ; preds = %236, %200
  %238 = load i32* %j, align 4, !dbg !1356
  %239 = shl i32 1, %238, !dbg !1356
  store i32 %239, i32* %z, align 4, !dbg !1356
  %240 = load i32* %z, align 4, !dbg !1357
  %241 = add i32 %240, 1, !dbg !1357
  %242 = zext i32 %241 to i64, !dbg !1357
  %243 = mul i64 %242, 16, !dbg !1357
  %244 = call noalias i8* @malloc(i64 %243), !dbg !1357
  %245 = bitcast i8* %244 to %struct.huft*, !dbg !1357
  store %struct.huft* %245, %struct.huft** %q, align 8, !dbg !1357
  %246 = icmp eq %struct.huft* %245, null, !dbg !1357
  br i1 %246, label %247, label %255, !dbg !1357

; <label>:247                                     ; preds = %237
  %248 = load i32* %h, align 4, !dbg !1358
  %249 = icmp ne i32 %248, 0, !dbg !1358
  br i1 %249, label %250, label %254, !dbg !1358

; <label>:250                                     ; preds = %247
  %251 = getelementptr inbounds [16 x %struct.huft*]* %u, i32 0, i64 0, !dbg !1360
  %252 = load %struct.huft** %251, align 8, !dbg !1360
  %253 = call i32 @huft_free(%struct.huft* %252), !dbg !1360
  br label %254, !dbg !1360

; <label>:254                                     ; preds = %250, %247
  store i32 3, i32* %1, !dbg !1361
  br label %434, !dbg !1361

; <label>:255                                     ; preds = %237
  %256 = load i32* %z, align 4, !dbg !1362
  %257 = add i32 %256, 1, !dbg !1362
  %258 = load i32* @hufts, align 4, !dbg !1362
  %259 = add i32 %258, %257, !dbg !1362
  store i32 %259, i32* @hufts, align 4, !dbg !1362
  %260 = load %struct.huft** %q, align 8, !dbg !1363
  %261 = getelementptr inbounds %struct.huft* %260, i64 1, !dbg !1363
  %262 = load %struct.huft*** %7, align 8, !dbg !1363
  store %struct.huft* %261, %struct.huft** %262, align 8, !dbg !1363
  %263 = load %struct.huft** %q, align 8, !dbg !1364
  %264 = getelementptr inbounds %struct.huft* %263, i32 0, i32 2, !dbg !1364
  %265 = bitcast %union.anon* %264 to %struct.huft**, !dbg !1364
  store %struct.huft** %265, %struct.huft*** %7, align 8, !dbg !1364
  store %struct.huft* null, %struct.huft** %265, align 8, !dbg !1364
  %266 = load %struct.huft** %q, align 8, !dbg !1365
  %267 = getelementptr inbounds %struct.huft* %266, i32 1, !dbg !1365
  store %struct.huft* %267, %struct.huft** %q, align 8, !dbg !1365
  %268 = load i32* %h, align 4, !dbg !1365
  %269 = sext i32 %268 to i64, !dbg !1365
  %270 = getelementptr inbounds [16 x %struct.huft*]* %u, i32 0, i64 %269, !dbg !1365
  store %struct.huft* %267, %struct.huft** %270, align 8, !dbg !1365
  %271 = load i32* %h, align 4, !dbg !1366
  %272 = icmp ne i32 %271, 0, !dbg !1366
  br i1 %272, label %273, label %303, !dbg !1366

; <label>:273                                     ; preds = %255
  %274 = load i32* %i, align 4, !dbg !1367
  %275 = load i32* %h, align 4, !dbg !1367
  %276 = sext i32 %275 to i64, !dbg !1367
  %277 = getelementptr inbounds [17 x i32]* %x, i32 0, i64 %276, !dbg !1367
  store i32 %274, i32* %277, align 4, !dbg !1367
  %278 = load i32* %l, align 4, !dbg !1369
  %279 = trunc i32 %278 to i8, !dbg !1369
  %280 = getelementptr inbounds %struct.huft* %r, i32 0, i32 1, !dbg !1369
  store i8 %279, i8* %280, align 1, !dbg !1369
  %281 = load i32* %j, align 4, !dbg !1370
  %282 = add i32 16, %281, !dbg !1370
  %283 = trunc i32 %282 to i8, !dbg !1370
  %284 = getelementptr inbounds %struct.huft* %r, i32 0, i32 0, !dbg !1370
  store i8 %283, i8* %284, align 1, !dbg !1370
  %285 = load %struct.huft** %q, align 8, !dbg !1371
  %286 = getelementptr inbounds %struct.huft* %r, i32 0, i32 2, !dbg !1371
  %287 = bitcast %union.anon* %286 to %struct.huft**, !dbg !1371
  store %struct.huft* %285, %struct.huft** %287, align 8, !dbg !1371
  %288 = load i32* %i, align 4, !dbg !1372
  %289 = load i32* %w, align 4, !dbg !1372
  %290 = load i32* %l, align 4, !dbg !1372
  %291 = sub nsw i32 %289, %290, !dbg !1372
  %292 = lshr i32 %288, %291, !dbg !1372
  store i32 %292, i32* %j, align 4, !dbg !1372
  %293 = load i32* %j, align 4, !dbg !1373
  %294 = zext i32 %293 to i64, !dbg !1373
  %295 = load i32* %h, align 4, !dbg !1373
  %296 = sub nsw i32 %295, 1, !dbg !1373
  %297 = sext i32 %296 to i64, !dbg !1373
  %298 = getelementptr inbounds [16 x %struct.huft*]* %u, i32 0, i64 %297, !dbg !1373
  %299 = load %struct.huft** %298, align 8, !dbg !1373
  %300 = getelementptr inbounds %struct.huft* %299, i64 %294, !dbg !1373
  %301 = bitcast %struct.huft* %300 to i8*, !dbg !1373
  %302 = bitcast %struct.huft* %r to i8*, !dbg !1373
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %301, i8* %302, i64 16, i32 8, i1 false), !dbg !1373
  br label %303, !dbg !1374

; <label>:303                                     ; preds = %273, %255
  br label %179, !dbg !1375

; <label>:304                                     ; preds = %179
  %305 = load i32* %k, align 4, !dbg !1376
  %306 = load i32* %w, align 4, !dbg !1376
  %307 = sub nsw i32 %305, %306, !dbg !1376
  %308 = trunc i32 %307 to i8, !dbg !1376
  %309 = getelementptr inbounds %struct.huft* %r, i32 0, i32 1, !dbg !1376
  store i8 %308, i8* %309, align 1, !dbg !1376
  %310 = load i32** %p, align 8, !dbg !1377
  %311 = getelementptr inbounds [288 x i32]* %v, i32 0, i32 0, !dbg !1377
  %312 = load i32* %3, align 4, !dbg !1377
  %313 = zext i32 %312 to i64, !dbg !1377
  %314 = getelementptr inbounds i32* %311, i64 %313, !dbg !1377
  %315 = icmp uge i32* %310, %314, !dbg !1377
  br i1 %315, label %316, label %318, !dbg !1377

; <label>:316                                     ; preds = %304
  %317 = getelementptr inbounds %struct.huft* %r, i32 0, i32 0, !dbg !1378
  store i8 99, i8* %317, align 1, !dbg !1378
  br label %360, !dbg !1378

; <label>:318                                     ; preds = %304
  %319 = load i32** %p, align 8, !dbg !1379
  %320 = load i32* %319, align 4, !dbg !1379
  %321 = load i32* %4, align 4, !dbg !1379
  %322 = icmp ult i32 %320, %321, !dbg !1379
  br i1 %322, label %323, label %337, !dbg !1379

; <label>:323                                     ; preds = %318
  %324 = load i32** %p, align 8, !dbg !1380
  %325 = load i32* %324, align 4, !dbg !1380
  %326 = icmp ult i32 %325, 256, !dbg !1380
  %327 = select i1 %326, i32 16, i32 15, !dbg !1380
  %328 = trunc i32 %327 to i8, !dbg !1380
  %329 = getelementptr inbounds %struct.huft* %r, i32 0, i32 0, !dbg !1380
  store i8 %328, i8* %329, align 1, !dbg !1380
  %330 = load i32** %p, align 8, !dbg !1382
  %331 = load i32* %330, align 4, !dbg !1382
  %332 = trunc i32 %331 to i16, !dbg !1382
  %333 = getelementptr inbounds %struct.huft* %r, i32 0, i32 2, !dbg !1382
  %334 = bitcast %union.anon* %333 to i16*, !dbg !1382
  store i16 %332, i16* %334, align 2, !dbg !1382
  %335 = load i32** %p, align 8, !dbg !1383
  %336 = getelementptr inbounds i32* %335, i32 1, !dbg !1383
  store i32* %336, i32** %p, align 8, !dbg !1383
  br label %359, !dbg !1384

; <label>:337                                     ; preds = %318
  %338 = load i32** %p, align 8, !dbg !1385
  %339 = load i32* %338, align 4, !dbg !1385
  %340 = load i32* %4, align 4, !dbg !1385
  %341 = sub i32 %339, %340, !dbg !1385
  %342 = zext i32 %341 to i64, !dbg !1385
  %343 = load i16** %6, align 8, !dbg !1385
  %344 = getelementptr inbounds i16* %343, i64 %342, !dbg !1385
  %345 = load i16* %344, align 2, !dbg !1385
  %346 = trunc i16 %345 to i8, !dbg !1385
  %347 = getelementptr inbounds %struct.huft* %r, i32 0, i32 0, !dbg !1385
  store i8 %346, i8* %347, align 1, !dbg !1385
  %348 = load i32** %p, align 8, !dbg !1387
  %349 = getelementptr inbounds i32* %348, i32 1, !dbg !1387
  store i32* %349, i32** %p, align 8, !dbg !1387
  %350 = load i32* %348, align 4, !dbg !1387
  %351 = load i32* %4, align 4, !dbg !1387
  %352 = sub i32 %350, %351, !dbg !1387
  %353 = zext i32 %352 to i64, !dbg !1387
  %354 = load i16** %5, align 8, !dbg !1387
  %355 = getelementptr inbounds i16* %354, i64 %353, !dbg !1387
  %356 = load i16* %355, align 2, !dbg !1387
  %357 = getelementptr inbounds %struct.huft* %r, i32 0, i32 2, !dbg !1387
  %358 = bitcast %union.anon* %357 to i16*, !dbg !1387
  store i16 %356, i16* %358, align 2, !dbg !1387
  br label %359

; <label>:359                                     ; preds = %337, %323
  br label %360

; <label>:360                                     ; preds = %359, %316
  %361 = load i32* %k, align 4, !dbg !1388
  %362 = load i32* %w, align 4, !dbg !1388
  %363 = sub nsw i32 %361, %362, !dbg !1388
  %364 = shl i32 1, %363, !dbg !1388
  store i32 %364, i32* %f, align 4, !dbg !1388
  %365 = load i32* %i, align 4, !dbg !1389
  %366 = load i32* %w, align 4, !dbg !1389
  %367 = lshr i32 %365, %366, !dbg !1389
  store i32 %367, i32* %j, align 4, !dbg !1389
  br label %368, !dbg !1389

; <label>:368                                     ; preds = %379, %360
  %369 = load i32* %j, align 4, !dbg !1389
  %370 = load i32* %z, align 4, !dbg !1389
  %371 = icmp ult i32 %369, %370, !dbg !1389
  br i1 %371, label %372, label %383, !dbg !1389

; <label>:372                                     ; preds = %368
  %373 = load i32* %j, align 4, !dbg !1391
  %374 = zext i32 %373 to i64, !dbg !1391
  %375 = load %struct.huft** %q, align 8, !dbg !1391
  %376 = getelementptr inbounds %struct.huft* %375, i64 %374, !dbg !1391
  %377 = bitcast %struct.huft* %376 to i8*, !dbg !1391
  %378 = bitcast %struct.huft* %r to i8*, !dbg !1391
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %377, i8* %378, i64 16, i32 8, i1 false), !dbg !1391
  br label %379, !dbg !1391

; <label>:379                                     ; preds = %372
  %380 = load i32* %f, align 4, !dbg !1392
  %381 = load i32* %j, align 4, !dbg !1392
  %382 = add i32 %381, %380, !dbg !1392
  store i32 %382, i32* %j, align 4, !dbg !1392
  br label %368, !dbg !1392

; <label>:383                                     ; preds = %368
  %384 = load i32* %k, align 4, !dbg !1393
  %385 = sub nsw i32 %384, 1, !dbg !1393
  %386 = shl i32 1, %385, !dbg !1393
  store i32 %386, i32* %j, align 4, !dbg !1393
  br label %387, !dbg !1393

; <label>:387                                     ; preds = %396, %383
  %388 = load i32* %i, align 4, !dbg !1393
  %389 = load i32* %j, align 4, !dbg !1393
  %390 = and i32 %388, %389, !dbg !1393
  %391 = icmp ne i32 %390, 0, !dbg !1393
  br i1 %391, label %392, label %399, !dbg !1393

; <label>:392                                     ; preds = %387
  %393 = load i32* %j, align 4, !dbg !1395
  %394 = load i32* %i, align 4, !dbg !1395
  %395 = xor i32 %394, %393, !dbg !1395
  store i32 %395, i32* %i, align 4, !dbg !1395
  br label %396, !dbg !1395

; <label>:396                                     ; preds = %392
  %397 = load i32* %j, align 4, !dbg !1396
  %398 = lshr i32 %397, 1, !dbg !1396
  store i32 %398, i32* %j, align 4, !dbg !1396
  br label %387, !dbg !1396

; <label>:399                                     ; preds = %387
  %400 = load i32* %j, align 4, !dbg !1397
  %401 = load i32* %i, align 4, !dbg !1397
  %402 = xor i32 %401, %400, !dbg !1397
  store i32 %402, i32* %i, align 4, !dbg !1397
  br label %403, !dbg !1398

; <label>:403                                     ; preds = %414, %399
  %404 = load i32* %i, align 4, !dbg !1398
  %405 = load i32* %w, align 4, !dbg !1398
  %406 = shl i32 1, %405, !dbg !1398
  %407 = sub nsw i32 %406, 1, !dbg !1398
  %408 = and i32 %404, %407, !dbg !1398
  %409 = load i32* %h, align 4, !dbg !1398
  %410 = sext i32 %409 to i64, !dbg !1398
  %411 = getelementptr inbounds [17 x i32]* %x, i32 0, i64 %410, !dbg !1398
  %412 = load i32* %411, align 4, !dbg !1398
  %413 = icmp ne i32 %408, %412, !dbg !1398
  br i1 %413, label %414, label %420, !dbg !1398

; <label>:414                                     ; preds = %403
  %415 = load i32* %h, align 4, !dbg !1399
  %416 = add nsw i32 %415, -1, !dbg !1399
  store i32 %416, i32* %h, align 4, !dbg !1399
  %417 = load i32* %l, align 4, !dbg !1401
  %418 = load i32* %w, align 4, !dbg !1401
  %419 = sub nsw i32 %418, %417, !dbg !1401
  store i32 %419, i32* %w, align 4, !dbg !1401
  br label %403, !dbg !1402

; <label>:420                                     ; preds = %403
  br label %174, !dbg !1403

; <label>:421                                     ; preds = %174
  br label %422, !dbg !1404

; <label>:422                                     ; preds = %421
  %423 = load i32* %k, align 4, !dbg !1405
  %424 = add nsw i32 %423, 1, !dbg !1405
  store i32 %424, i32* %k, align 4, !dbg !1405
  br label %165, !dbg !1405

; <label>:425                                     ; preds = %165
  %426 = load i32* %y, align 4, !dbg !1406
  %427 = icmp ne i32 %426, 0, !dbg !1406
  br i1 %427, label %428, label %431, !dbg !1406

; <label>:428                                     ; preds = %425
  %429 = load i32* %g, align 4, !dbg !1406
  %430 = icmp ne i32 %429, 1, !dbg !1406
  br label %431

; <label>:431                                     ; preds = %428, %425
  %432 = phi i1 [ false, %425 ], [ %430, %428 ]
  %433 = zext i1 %432 to i32
  store i32 %433, i32* %1
  br label %434

; <label>:434                                     ; preds = %431, %254, %112, %97, %31
  %435 = load i32* %1, !dbg !1407
  ret i32 %435, !dbg !1407
}

declare noalias i8* @malloc(i64)

define i32 @huft_free(%struct.huft* %t) nounwind uwtable {
  %1 = alloca %struct.huft*, align 8
  %p = alloca %struct.huft*, align 8
  %q = alloca %struct.huft*, align 8
  store %struct.huft* %t, %struct.huft** %1, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !1408), !dbg !1409
  call void @llvm.dbg.declare(metadata !22, metadata !1410), !dbg !1412
  call void @llvm.dbg.declare(metadata !22, metadata !1413), !dbg !1414
  %2 = load %struct.huft** %1, align 8, !dbg !1415
  store %struct.huft* %2, %struct.huft** %p, align 8, !dbg !1415
  br label %3, !dbg !1416

; <label>:3                                       ; preds = %6, %0
  %4 = load %struct.huft** %p, align 8, !dbg !1416
  %5 = icmp ne %struct.huft* %4, null, !dbg !1416
  br i1 %5, label %6, label %15, !dbg !1416

; <label>:6                                       ; preds = %3
  %7 = load %struct.huft** %p, align 8, !dbg !1417
  %8 = getelementptr inbounds %struct.huft* %7, i32 -1, !dbg !1417
  store %struct.huft* %8, %struct.huft** %p, align 8, !dbg !1417
  %9 = getelementptr inbounds %struct.huft* %8, i32 0, i32 2, !dbg !1417
  %10 = bitcast %union.anon* %9 to %struct.huft**, !dbg !1417
  %11 = load %struct.huft** %10, align 8, !dbg !1417
  store %struct.huft* %11, %struct.huft** %q, align 8, !dbg !1417
  %12 = load %struct.huft** %p, align 8, !dbg !1419
  %13 = bitcast %struct.huft* %12 to i8*, !dbg !1419
  call void @free(i8* %13), !dbg !1419
  %14 = load %struct.huft** %q, align 8, !dbg !1420
  store %struct.huft* %14, %struct.huft** %p, align 8, !dbg !1420
  br label %3, !dbg !1421

; <label>:15                                      ; preds = %3
  ret i32 0, !dbg !1422
}

declare void @free(i8*)

define i32 @inflate_codes(%struct.huft* %tl, %struct.huft* %td, i32 %bl, i32 %bd) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca %struct.huft*, align 8
  %3 = alloca %struct.huft*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %e = alloca i32, align 4
  %n = alloca i32, align 4
  %d = alloca i32, align 4
  %w = alloca i32, align 4
  %t = alloca %struct.huft*, align 8
  %ml = alloca i32, align 4
  %md = alloca i32, align 4
  %b = alloca i64, align 8
  %k = alloca i32, align 4
  store %struct.huft* %tl, %struct.huft** %2, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !1423), !dbg !1424
  store %struct.huft* %td, %struct.huft** %3, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !1425), !dbg !1426
  store i32 %bl, i32* %4, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !1427), !dbg !1428
  store i32 %bd, i32* %5, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !1429), !dbg !1430
  call void @llvm.dbg.declare(metadata !22, metadata !1431), !dbg !1433
  call void @llvm.dbg.declare(metadata !22, metadata !1434), !dbg !1435
  call void @llvm.dbg.declare(metadata !22, metadata !1436), !dbg !1437
  call void @llvm.dbg.declare(metadata !22, metadata !1438), !dbg !1439
  call void @llvm.dbg.declare(metadata !22, metadata !1440), !dbg !1441
  call void @llvm.dbg.declare(metadata !22, metadata !1442), !dbg !1443
  call void @llvm.dbg.declare(metadata !22, metadata !1444), !dbg !1445
  call void @llvm.dbg.declare(metadata !22, metadata !1446), !dbg !1447
  call void @llvm.dbg.declare(metadata !22, metadata !1448), !dbg !1449
  %6 = load i64* @bb, align 8, !dbg !1450
  store i64 %6, i64* %b, align 8, !dbg !1450
  %7 = load i32* @bk, align 4, !dbg !1451
  store i32 %7, i32* %k, align 4, !dbg !1451
  %8 = load i32* @outcnt, align 4, !dbg !1452
  store i32 %8, i32* %w, align 4, !dbg !1452
  %9 = load i32* %4, align 4, !dbg !1453
  %10 = sext i32 %9 to i64, !dbg !1453
  %11 = getelementptr inbounds [17 x i16]* @mask_bits, i32 0, i64 %10, !dbg !1453
  %12 = load i16* %11, align 2, !dbg !1453
  %13 = zext i16 %12 to i32, !dbg !1453
  store i32 %13, i32* %ml, align 4, !dbg !1453
  %14 = load i32* %5, align 4, !dbg !1454
  %15 = sext i32 %14 to i64, !dbg !1454
  %16 = getelementptr inbounds [17 x i16]* @mask_bits, i32 0, i64 %15, !dbg !1454
  %17 = load i16* %16, align 2, !dbg !1454
  %18 = zext i16 %17 to i32, !dbg !1454
  store i32 %18, i32* %md, align 4, !dbg !1454
  br label %19, !dbg !1455

; <label>:19                                      ; preds = %460, %0
  br label %20, !dbg !1457

; <label>:20                                      ; preds = %37, %19
  %21 = load i32* %k, align 4, !dbg !1457
  %22 = load i32* %4, align 4, !dbg !1457
  %23 = icmp ult i32 %21, %22, !dbg !1457
  br i1 %23, label %24, label %48, !dbg !1457

; <label>:24                                      ; preds = %20
  %25 = load i32* @inptr, align 4, !dbg !1460
  %26 = load i32* @insize, align 4, !dbg !1460
  %27 = icmp ult i32 %25, %26, !dbg !1460
  br i1 %27, label %28, label %35, !dbg !1460

; <label>:28                                      ; preds = %24
  %29 = load i32* @inptr, align 4, !dbg !1460
  %30 = add i32 %29, 1, !dbg !1460
  store i32 %30, i32* @inptr, align 4, !dbg !1460
  %31 = zext i32 %29 to i64, !dbg !1460
  %32 = getelementptr inbounds [0 x i8]* @inbuf, i32 0, i64 %31, !dbg !1460
  %33 = load i8* %32, align 1, !dbg !1460
  %34 = zext i8 %33 to i32, !dbg !1460
  br label %37, !dbg !1460

; <label>:35                                      ; preds = %24
  %36 = call i32 @fill_inbuf(i32 0), !dbg !1460
  br label %37, !dbg !1460

; <label>:37                                      ; preds = %35, %28
  %38 = phi i32 [ %34, %28 ], [ %36, %35 ], !dbg !1460
  %39 = trunc i32 %38 to i8, !dbg !1460
  %40 = zext i8 %39 to i64, !dbg !1460
  %41 = load i32* %k, align 4, !dbg !1460
  %42 = zext i32 %41 to i64, !dbg !1460
  %43 = shl i64 %40, %42, !dbg !1460
  %44 = load i64* %b, align 8, !dbg !1460
  %45 = or i64 %44, %43, !dbg !1460
  store i64 %45, i64* %b, align 8, !dbg !1460
  %46 = load i32* %k, align 4, !dbg !1460
  %47 = add i32 %46, 8, !dbg !1460
  store i32 %47, i32* %k, align 4, !dbg !1460
  br label %20, !dbg !1460

; <label>:48                                      ; preds = %20
  %49 = load %struct.huft** %2, align 8, !dbg !1462
  %50 = load i64* %b, align 8, !dbg !1462
  %51 = trunc i64 %50 to i32, !dbg !1462
  %52 = load i32* %ml, align 4, !dbg !1462
  %53 = and i32 %51, %52, !dbg !1462
  %54 = zext i32 %53 to i64, !dbg !1462
  %55 = getelementptr inbounds %struct.huft* %49, i64 %54, !dbg !1462
  store %struct.huft* %55, %struct.huft** %t, align 8, !dbg !1462
  %56 = getelementptr inbounds %struct.huft* %55, i32 0, i32 0, !dbg !1462
  %57 = load i8* %56, align 1, !dbg !1462
  %58 = zext i8 %57 to i32, !dbg !1462
  store i32 %58, i32* %e, align 4, !dbg !1462
  %59 = icmp ugt i32 %58, 16, !dbg !1462
  br i1 %59, label %60, label %130, !dbg !1462

; <label>:60                                      ; preds = %48
  br label %61, !dbg !1463

; <label>:61                                      ; preds = %110, %60
  %62 = load i32* %e, align 4, !dbg !1464
  %63 = icmp eq i32 %62, 99, !dbg !1464
  br i1 %63, label %64, label %65, !dbg !1464

; <label>:64                                      ; preds = %61
  store i32 1, i32* %1, !dbg !1466
  br label %465, !dbg !1466

; <label>:65                                      ; preds = %61
  %66 = load %struct.huft** %t, align 8, !dbg !1467
  %67 = getelementptr inbounds %struct.huft* %66, i32 0, i32 1, !dbg !1467
  %68 = load i8* %67, align 1, !dbg !1467
  %69 = zext i8 %68 to i32, !dbg !1467
  %70 = load i64* %b, align 8, !dbg !1467
  %71 = zext i32 %69 to i64, !dbg !1467
  %72 = lshr i64 %70, %71, !dbg !1467
  store i64 %72, i64* %b, align 8, !dbg !1467
  %73 = load %struct.huft** %t, align 8, !dbg !1467
  %74 = getelementptr inbounds %struct.huft* %73, i32 0, i32 1, !dbg !1467
  %75 = load i8* %74, align 1, !dbg !1467
  %76 = zext i8 %75 to i32, !dbg !1467
  %77 = load i32* %k, align 4, !dbg !1467
  %78 = sub i32 %77, %76, !dbg !1467
  store i32 %78, i32* %k, align 4, !dbg !1467
  %79 = load i32* %e, align 4, !dbg !1469
  %80 = sub i32 %79, 16, !dbg !1469
  store i32 %80, i32* %e, align 4, !dbg !1469
  br label %81, !dbg !1470

; <label>:81                                      ; preds = %98, %65
  %82 = load i32* %k, align 4, !dbg !1470
  %83 = load i32* %e, align 4, !dbg !1470
  %84 = icmp ult i32 %82, %83, !dbg !1470
  br i1 %84, label %85, label %109, !dbg !1470

; <label>:85                                      ; preds = %81
  %86 = load i32* @inptr, align 4, !dbg !1472
  %87 = load i32* @insize, align 4, !dbg !1472
  %88 = icmp ult i32 %86, %87, !dbg !1472
  br i1 %88, label %89, label %96, !dbg !1472

; <label>:89                                      ; preds = %85
  %90 = load i32* @inptr, align 4, !dbg !1472
  %91 = add i32 %90, 1, !dbg !1472
  store i32 %91, i32* @inptr, align 4, !dbg !1472
  %92 = zext i32 %90 to i64, !dbg !1472
  %93 = getelementptr inbounds [0 x i8]* @inbuf, i32 0, i64 %92, !dbg !1472
  %94 = load i8* %93, align 1, !dbg !1472
  %95 = zext i8 %94 to i32, !dbg !1472
  br label %98, !dbg !1472

; <label>:96                                      ; preds = %85
  %97 = call i32 @fill_inbuf(i32 0), !dbg !1472
  br label %98, !dbg !1472

; <label>:98                                      ; preds = %96, %89
  %99 = phi i32 [ %95, %89 ], [ %97, %96 ], !dbg !1472
  %100 = trunc i32 %99 to i8, !dbg !1472
  %101 = zext i8 %100 to i64, !dbg !1472
  %102 = load i32* %k, align 4, !dbg !1472
  %103 = zext i32 %102 to i64, !dbg !1472
  %104 = shl i64 %101, %103, !dbg !1472
  %105 = load i64* %b, align 8, !dbg !1472
  %106 = or i64 %105, %104, !dbg !1472
  store i64 %106, i64* %b, align 8, !dbg !1472
  %107 = load i32* %k, align 4, !dbg !1472
  %108 = add i32 %107, 8, !dbg !1472
  store i32 %108, i32* %k, align 4, !dbg !1472
  br label %81, !dbg !1472

; <label>:109                                     ; preds = %81
  br label %110, !dbg !1474

; <label>:110                                     ; preds = %109
  %111 = load %struct.huft** %t, align 8, !dbg !1474
  %112 = getelementptr inbounds %struct.huft* %111, i32 0, i32 2, !dbg !1474
  %113 = bitcast %union.anon* %112 to %struct.huft**, !dbg !1474
  %114 = load %struct.huft** %113, align 8, !dbg !1474
  %115 = load i64* %b, align 8, !dbg !1474
  %116 = trunc i64 %115 to i32, !dbg !1474
  %117 = load i32* %e, align 4, !dbg !1474
  %118 = zext i32 %117 to i64, !dbg !1474
  %119 = getelementptr inbounds [17 x i16]* @mask_bits, i32 0, i64 %118, !dbg !1474
  %120 = load i16* %119, align 2, !dbg !1474
  %121 = zext i16 %120 to i32, !dbg !1474
  %122 = and i32 %116, %121, !dbg !1474
  %123 = zext i32 %122 to i64, !dbg !1474
  %124 = getelementptr inbounds %struct.huft* %114, i64 %123, !dbg !1474
  store %struct.huft* %124, %struct.huft** %t, align 8, !dbg !1474
  %125 = getelementptr inbounds %struct.huft* %124, i32 0, i32 0, !dbg !1474
  %126 = load i8* %125, align 1, !dbg !1474
  %127 = zext i8 %126 to i32, !dbg !1474
  store i32 %127, i32* %e, align 4, !dbg !1474
  %128 = icmp ugt i32 %127, 16, !dbg !1474
  br i1 %128, label %61, label %129, !dbg !1474

; <label>:129                                     ; preds = %110
  br label %130, !dbg !1474

; <label>:130                                     ; preds = %129, %48
  %131 = load %struct.huft** %t, align 8, !dbg !1475
  %132 = getelementptr inbounds %struct.huft* %131, i32 0, i32 1, !dbg !1475
  %133 = load i8* %132, align 1, !dbg !1475
  %134 = zext i8 %133 to i32, !dbg !1475
  %135 = load i64* %b, align 8, !dbg !1475
  %136 = zext i32 %134 to i64, !dbg !1475
  %137 = lshr i64 %135, %136, !dbg !1475
  store i64 %137, i64* %b, align 8, !dbg !1475
  %138 = load %struct.huft** %t, align 8, !dbg !1475
  %139 = getelementptr inbounds %struct.huft* %138, i32 0, i32 1, !dbg !1475
  %140 = load i8* %139, align 1, !dbg !1475
  %141 = zext i8 %140 to i32, !dbg !1475
  %142 = load i32* %k, align 4, !dbg !1475
  %143 = sub i32 %142, %141, !dbg !1475
  store i32 %143, i32* %k, align 4, !dbg !1475
  %144 = load i32* %e, align 4, !dbg !1477
  %145 = icmp eq i32 %144, 16, !dbg !1477
  br i1 %145, label %146, label %161, !dbg !1477

; <label>:146                                     ; preds = %130
  %147 = load %struct.huft** %t, align 8, !dbg !1478
  %148 = getelementptr inbounds %struct.huft* %147, i32 0, i32 2, !dbg !1478
  %149 = bitcast %union.anon* %148 to i16*, !dbg !1478
  %150 = load i16* %149, align 2, !dbg !1478
  %151 = trunc i16 %150 to i8, !dbg !1478
  %152 = load i32* %w, align 4, !dbg !1478
  %153 = add i32 %152, 1, !dbg !1478
  store i32 %153, i32* %w, align 4, !dbg !1478
  %154 = zext i32 %152 to i64, !dbg !1478
  %155 = getelementptr inbounds [0 x i8]* @window, i32 0, i64 %154, !dbg !1478
  store i8 %151, i8* %155, align 1, !dbg !1478
  %156 = load i32* %w, align 4, !dbg !1480
  %157 = icmp eq i32 %156, 32768, !dbg !1480
  br i1 %157, label %158, label %160, !dbg !1480

; <label>:158                                     ; preds = %146
  %159 = load i32* %w, align 4, !dbg !1481
  store i32 %159, i32* @outcnt, align 4, !dbg !1481
  call void @flush_window(), !dbg !1481
  store i32 0, i32* %w, align 4, !dbg !1483
  br label %160, !dbg !1484

; <label>:160                                     ; preds = %158, %146
  br label %460, !dbg !1485

; <label>:161                                     ; preds = %130
  %162 = load i32* %e, align 4, !dbg !1486
  %163 = icmp eq i32 %162, 15, !dbg !1486
  br i1 %163, label %164, label %165, !dbg !1486

; <label>:164                                     ; preds = %161
  br label %461, !dbg !1488

; <label>:165                                     ; preds = %161
  br label %166, !dbg !1489

; <label>:166                                     ; preds = %183, %165
  %167 = load i32* %k, align 4, !dbg !1489
  %168 = load i32* %e, align 4, !dbg !1489
  %169 = icmp ult i32 %167, %168, !dbg !1489
  br i1 %169, label %170, label %194, !dbg !1489

; <label>:170                                     ; preds = %166
  %171 = load i32* @inptr, align 4, !dbg !1491
  %172 = load i32* @insize, align 4, !dbg !1491
  %173 = icmp ult i32 %171, %172, !dbg !1491
  br i1 %173, label %174, label %181, !dbg !1491

; <label>:174                                     ; preds = %170
  %175 = load i32* @inptr, align 4, !dbg !1491
  %176 = add i32 %175, 1, !dbg !1491
  store i32 %176, i32* @inptr, align 4, !dbg !1491
  %177 = zext i32 %175 to i64, !dbg !1491
  %178 = getelementptr inbounds [0 x i8]* @inbuf, i32 0, i64 %177, !dbg !1491
  %179 = load i8* %178, align 1, !dbg !1491
  %180 = zext i8 %179 to i32, !dbg !1491
  br label %183, !dbg !1491

; <label>:181                                     ; preds = %170
  %182 = call i32 @fill_inbuf(i32 0), !dbg !1491
  br label %183, !dbg !1491

; <label>:183                                     ; preds = %181, %174
  %184 = phi i32 [ %180, %174 ], [ %182, %181 ], !dbg !1491
  %185 = trunc i32 %184 to i8, !dbg !1491
  %186 = zext i8 %185 to i64, !dbg !1491
  %187 = load i32* %k, align 4, !dbg !1491
  %188 = zext i32 %187 to i64, !dbg !1491
  %189 = shl i64 %186, %188, !dbg !1491
  %190 = load i64* %b, align 8, !dbg !1491
  %191 = or i64 %190, %189, !dbg !1491
  store i64 %191, i64* %b, align 8, !dbg !1491
  %192 = load i32* %k, align 4, !dbg !1491
  %193 = add i32 %192, 8, !dbg !1491
  store i32 %193, i32* %k, align 4, !dbg !1491
  br label %166, !dbg !1491

; <label>:194                                     ; preds = %166
  %195 = load %struct.huft** %t, align 8, !dbg !1493
  %196 = getelementptr inbounds %struct.huft* %195, i32 0, i32 2, !dbg !1493
  %197 = bitcast %union.anon* %196 to i16*, !dbg !1493
  %198 = load i16* %197, align 2, !dbg !1493
  %199 = zext i16 %198 to i32, !dbg !1493
  %200 = load i64* %b, align 8, !dbg !1493
  %201 = trunc i64 %200 to i32, !dbg !1493
  %202 = load i32* %e, align 4, !dbg !1493
  %203 = zext i32 %202 to i64, !dbg !1493
  %204 = getelementptr inbounds [17 x i16]* @mask_bits, i32 0, i64 %203, !dbg !1493
  %205 = load i16* %204, align 2, !dbg !1493
  %206 = zext i16 %205 to i32, !dbg !1493
  %207 = and i32 %201, %206, !dbg !1493
  %208 = add i32 %199, %207, !dbg !1493
  store i32 %208, i32* %n, align 4, !dbg !1493
  %209 = load i32* %e, align 4, !dbg !1494
  %210 = load i64* %b, align 8, !dbg !1494
  %211 = zext i32 %209 to i64, !dbg !1494
  %212 = lshr i64 %210, %211, !dbg !1494
  store i64 %212, i64* %b, align 8, !dbg !1494
  %213 = load i32* %e, align 4, !dbg !1494
  %214 = load i32* %k, align 4, !dbg !1494
  %215 = sub i32 %214, %213, !dbg !1494
  store i32 %215, i32* %k, align 4, !dbg !1494
  br label %216, !dbg !1496

; <label>:216                                     ; preds = %233, %194
  %217 = load i32* %k, align 4, !dbg !1496
  %218 = load i32* %5, align 4, !dbg !1496
  %219 = icmp ult i32 %217, %218, !dbg !1496
  br i1 %219, label %220, label %244, !dbg !1496

; <label>:220                                     ; preds = %216
  %221 = load i32* @inptr, align 4, !dbg !1498
  %222 = load i32* @insize, align 4, !dbg !1498
  %223 = icmp ult i32 %221, %222, !dbg !1498
  br i1 %223, label %224, label %231, !dbg !1498

; <label>:224                                     ; preds = %220
  %225 = load i32* @inptr, align 4, !dbg !1498
  %226 = add i32 %225, 1, !dbg !1498
  store i32 %226, i32* @inptr, align 4, !dbg !1498
  %227 = zext i32 %225 to i64, !dbg !1498
  %228 = getelementptr inbounds [0 x i8]* @inbuf, i32 0, i64 %227, !dbg !1498
  %229 = load i8* %228, align 1, !dbg !1498
  %230 = zext i8 %229 to i32, !dbg !1498
  br label %233, !dbg !1498

; <label>:231                                     ; preds = %220
  %232 = call i32 @fill_inbuf(i32 0), !dbg !1498
  br label %233, !dbg !1498

; <label>:233                                     ; preds = %231, %224
  %234 = phi i32 [ %230, %224 ], [ %232, %231 ], !dbg !1498
  %235 = trunc i32 %234 to i8, !dbg !1498
  %236 = zext i8 %235 to i64, !dbg !1498
  %237 = load i32* %k, align 4, !dbg !1498
  %238 = zext i32 %237 to i64, !dbg !1498
  %239 = shl i64 %236, %238, !dbg !1498
  %240 = load i64* %b, align 8, !dbg !1498
  %241 = or i64 %240, %239, !dbg !1498
  store i64 %241, i64* %b, align 8, !dbg !1498
  %242 = load i32* %k, align 4, !dbg !1498
  %243 = add i32 %242, 8, !dbg !1498
  store i32 %243, i32* %k, align 4, !dbg !1498
  br label %216, !dbg !1498

; <label>:244                                     ; preds = %216
  %245 = load %struct.huft** %3, align 8, !dbg !1500
  %246 = load i64* %b, align 8, !dbg !1500
  %247 = trunc i64 %246 to i32, !dbg !1500
  %248 = load i32* %md, align 4, !dbg !1500
  %249 = and i32 %247, %248, !dbg !1500
  %250 = zext i32 %249 to i64, !dbg !1500
  %251 = getelementptr inbounds %struct.huft* %245, i64 %250, !dbg !1500
  store %struct.huft* %251, %struct.huft** %t, align 8, !dbg !1500
  %252 = getelementptr inbounds %struct.huft* %251, i32 0, i32 0, !dbg !1500
  %253 = load i8* %252, align 1, !dbg !1500
  %254 = zext i8 %253 to i32, !dbg !1500
  store i32 %254, i32* %e, align 4, !dbg !1500
  %255 = icmp ugt i32 %254, 16, !dbg !1500
  br i1 %255, label %256, label %326, !dbg !1500

; <label>:256                                     ; preds = %244
  br label %257, !dbg !1501

; <label>:257                                     ; preds = %306, %256
  %258 = load i32* %e, align 4, !dbg !1502
  %259 = icmp eq i32 %258, 99, !dbg !1502
  br i1 %259, label %260, label %261, !dbg !1502

; <label>:260                                     ; preds = %257
  store i32 1, i32* %1, !dbg !1504
  br label %465, !dbg !1504

; <label>:261                                     ; preds = %257
  %262 = load %struct.huft** %t, align 8, !dbg !1505
  %263 = getelementptr inbounds %struct.huft* %262, i32 0, i32 1, !dbg !1505
  %264 = load i8* %263, align 1, !dbg !1505
  %265 = zext i8 %264 to i32, !dbg !1505
  %266 = load i64* %b, align 8, !dbg !1505
  %267 = zext i32 %265 to i64, !dbg !1505
  %268 = lshr i64 %266, %267, !dbg !1505
  store i64 %268, i64* %b, align 8, !dbg !1505
  %269 = load %struct.huft** %t, align 8, !dbg !1505
  %270 = getelementptr inbounds %struct.huft* %269, i32 0, i32 1, !dbg !1505
  %271 = load i8* %270, align 1, !dbg !1505
  %272 = zext i8 %271 to i32, !dbg !1505
  %273 = load i32* %k, align 4, !dbg !1505
  %274 = sub i32 %273, %272, !dbg !1505
  store i32 %274, i32* %k, align 4, !dbg !1505
  %275 = load i32* %e, align 4, !dbg !1507
  %276 = sub i32 %275, 16, !dbg !1507
  store i32 %276, i32* %e, align 4, !dbg !1507
  br label %277, !dbg !1508

; <label>:277                                     ; preds = %294, %261
  %278 = load i32* %k, align 4, !dbg !1508
  %279 = load i32* %e, align 4, !dbg !1508
  %280 = icmp ult i32 %278, %279, !dbg !1508
  br i1 %280, label %281, label %305, !dbg !1508

; <label>:281                                     ; preds = %277
  %282 = load i32* @inptr, align 4, !dbg !1510
  %283 = load i32* @insize, align 4, !dbg !1510
  %284 = icmp ult i32 %282, %283, !dbg !1510
  br i1 %284, label %285, label %292, !dbg !1510

; <label>:285                                     ; preds = %281
  %286 = load i32* @inptr, align 4, !dbg !1510
  %287 = add i32 %286, 1, !dbg !1510
  store i32 %287, i32* @inptr, align 4, !dbg !1510
  %288 = zext i32 %286 to i64, !dbg !1510
  %289 = getelementptr inbounds [0 x i8]* @inbuf, i32 0, i64 %288, !dbg !1510
  %290 = load i8* %289, align 1, !dbg !1510
  %291 = zext i8 %290 to i32, !dbg !1510
  br label %294, !dbg !1510

; <label>:292                                     ; preds = %281
  %293 = call i32 @fill_inbuf(i32 0), !dbg !1510
  br label %294, !dbg !1510

; <label>:294                                     ; preds = %292, %285
  %295 = phi i32 [ %291, %285 ], [ %293, %292 ], !dbg !1510
  %296 = trunc i32 %295 to i8, !dbg !1510
  %297 = zext i8 %296 to i64, !dbg !1510
  %298 = load i32* %k, align 4, !dbg !1510
  %299 = zext i32 %298 to i64, !dbg !1510
  %300 = shl i64 %297, %299, !dbg !1510
  %301 = load i64* %b, align 8, !dbg !1510
  %302 = or i64 %301, %300, !dbg !1510
  store i64 %302, i64* %b, align 8, !dbg !1510
  %303 = load i32* %k, align 4, !dbg !1510
  %304 = add i32 %303, 8, !dbg !1510
  store i32 %304, i32* %k, align 4, !dbg !1510
  br label %277, !dbg !1510

; <label>:305                                     ; preds = %277
  br label %306, !dbg !1512

; <label>:306                                     ; preds = %305
  %307 = load %struct.huft** %t, align 8, !dbg !1512
  %308 = getelementptr inbounds %struct.huft* %307, i32 0, i32 2, !dbg !1512
  %309 = bitcast %union.anon* %308 to %struct.huft**, !dbg !1512
  %310 = load %struct.huft** %309, align 8, !dbg !1512
  %311 = load i64* %b, align 8, !dbg !1512
  %312 = trunc i64 %311 to i32, !dbg !1512
  %313 = load i32* %e, align 4, !dbg !1512
  %314 = zext i32 %313 to i64, !dbg !1512
  %315 = getelementptr inbounds [17 x i16]* @mask_bits, i32 0, i64 %314, !dbg !1512
  %316 = load i16* %315, align 2, !dbg !1512
  %317 = zext i16 %316 to i32, !dbg !1512
  %318 = and i32 %312, %317, !dbg !1512
  %319 = zext i32 %318 to i64, !dbg !1512
  %320 = getelementptr inbounds %struct.huft* %310, i64 %319, !dbg !1512
  store %struct.huft* %320, %struct.huft** %t, align 8, !dbg !1512
  %321 = getelementptr inbounds %struct.huft* %320, i32 0, i32 0, !dbg !1512
  %322 = load i8* %321, align 1, !dbg !1512
  %323 = zext i8 %322 to i32, !dbg !1512
  store i32 %323, i32* %e, align 4, !dbg !1512
  %324 = icmp ugt i32 %323, 16, !dbg !1512
  br i1 %324, label %257, label %325, !dbg !1512

; <label>:325                                     ; preds = %306
  br label %326, !dbg !1512

; <label>:326                                     ; preds = %325, %244
  %327 = load %struct.huft** %t, align 8, !dbg !1513
  %328 = getelementptr inbounds %struct.huft* %327, i32 0, i32 1, !dbg !1513
  %329 = load i8* %328, align 1, !dbg !1513
  %330 = zext i8 %329 to i32, !dbg !1513
  %331 = load i64* %b, align 8, !dbg !1513
  %332 = zext i32 %330 to i64, !dbg !1513
  %333 = lshr i64 %331, %332, !dbg !1513
  store i64 %333, i64* %b, align 8, !dbg !1513
  %334 = load %struct.huft** %t, align 8, !dbg !1513
  %335 = getelementptr inbounds %struct.huft* %334, i32 0, i32 1, !dbg !1513
  %336 = load i8* %335, align 1, !dbg !1513
  %337 = zext i8 %336 to i32, !dbg !1513
  %338 = load i32* %k, align 4, !dbg !1513
  %339 = sub i32 %338, %337, !dbg !1513
  store i32 %339, i32* %k, align 4, !dbg !1513
  br label %340, !dbg !1515

; <label>:340                                     ; preds = %357, %326
  %341 = load i32* %k, align 4, !dbg !1515
  %342 = load i32* %e, align 4, !dbg !1515
  %343 = icmp ult i32 %341, %342, !dbg !1515
  br i1 %343, label %344, label %368, !dbg !1515

; <label>:344                                     ; preds = %340
  %345 = load i32* @inptr, align 4, !dbg !1517
  %346 = load i32* @insize, align 4, !dbg !1517
  %347 = icmp ult i32 %345, %346, !dbg !1517
  br i1 %347, label %348, label %355, !dbg !1517

; <label>:348                                     ; preds = %344
  %349 = load i32* @inptr, align 4, !dbg !1517
  %350 = add i32 %349, 1, !dbg !1517
  store i32 %350, i32* @inptr, align 4, !dbg !1517
  %351 = zext i32 %349 to i64, !dbg !1517
  %352 = getelementptr inbounds [0 x i8]* @inbuf, i32 0, i64 %351, !dbg !1517
  %353 = load i8* %352, align 1, !dbg !1517
  %354 = zext i8 %353 to i32, !dbg !1517
  br label %357, !dbg !1517

; <label>:355                                     ; preds = %344
  %356 = call i32 @fill_inbuf(i32 0), !dbg !1517
  br label %357, !dbg !1517

; <label>:357                                     ; preds = %355, %348
  %358 = phi i32 [ %354, %348 ], [ %356, %355 ], !dbg !1517
  %359 = trunc i32 %358 to i8, !dbg !1517
  %360 = zext i8 %359 to i64, !dbg !1517
  %361 = load i32* %k, align 4, !dbg !1517
  %362 = zext i32 %361 to i64, !dbg !1517
  %363 = shl i64 %360, %362, !dbg !1517
  %364 = load i64* %b, align 8, !dbg !1517
  %365 = or i64 %364, %363, !dbg !1517
  store i64 %365, i64* %b, align 8, !dbg !1517
  %366 = load i32* %k, align 4, !dbg !1517
  %367 = add i32 %366, 8, !dbg !1517
  store i32 %367, i32* %k, align 4, !dbg !1517
  br label %340, !dbg !1517

; <label>:368                                     ; preds = %340
  %369 = load i32* %w, align 4, !dbg !1519
  %370 = load %struct.huft** %t, align 8, !dbg !1519
  %371 = getelementptr inbounds %struct.huft* %370, i32 0, i32 2, !dbg !1519
  %372 = bitcast %union.anon* %371 to i16*, !dbg !1519
  %373 = load i16* %372, align 2, !dbg !1519
  %374 = zext i16 %373 to i32, !dbg !1519
  %375 = sub i32 %369, %374, !dbg !1519
  %376 = load i64* %b, align 8, !dbg !1519
  %377 = trunc i64 %376 to i32, !dbg !1519
  %378 = load i32* %e, align 4, !dbg !1519
  %379 = zext i32 %378 to i64, !dbg !1519
  %380 = getelementptr inbounds [17 x i16]* @mask_bits, i32 0, i64 %379, !dbg !1519
  %381 = load i16* %380, align 2, !dbg !1519
  %382 = zext i16 %381 to i32, !dbg !1519
  %383 = and i32 %377, %382, !dbg !1519
  %384 = sub i32 %375, %383, !dbg !1519
  store i32 %384, i32* %d, align 4, !dbg !1519
  %385 = load i32* %e, align 4, !dbg !1520
  %386 = load i64* %b, align 8, !dbg !1520
  %387 = zext i32 %385 to i64, !dbg !1520
  %388 = lshr i64 %386, %387, !dbg !1520
  store i64 %388, i64* %b, align 8, !dbg !1520
  %389 = load i32* %e, align 4, !dbg !1520
  %390 = load i32* %k, align 4, !dbg !1520
  %391 = sub i32 %390, %389, !dbg !1520
  store i32 %391, i32* %k, align 4, !dbg !1520
  br label %392, !dbg !1522

; <label>:392                                     ; preds = %456, %368
  %393 = load i32* %d, align 4, !dbg !1523
  %394 = and i32 %393, 32767, !dbg !1523
  store i32 %394, i32* %d, align 4, !dbg !1523
  %395 = load i32* %w, align 4, !dbg !1523
  %396 = icmp ugt i32 %394, %395, !dbg !1523
  br i1 %396, label %397, label %399, !dbg !1523

; <label>:397                                     ; preds = %392
  %398 = load i32* %d, align 4, !dbg !1523
  br label %401, !dbg !1523

; <label>:399                                     ; preds = %392
  %400 = load i32* %w, align 4, !dbg !1523
  br label %401, !dbg !1523

; <label>:401                                     ; preds = %399, %397
  %402 = phi i32 [ %398, %397 ], [ %400, %399 ], !dbg !1523
  %403 = sub i32 32768, %402, !dbg !1523
  store i32 %403, i32* %e, align 4, !dbg !1523
  %404 = load i32* %n, align 4, !dbg !1523
  %405 = icmp ugt i32 %403, %404, !dbg !1523
  br i1 %405, label %406, label %408, !dbg !1523

; <label>:406                                     ; preds = %401
  %407 = load i32* %n, align 4, !dbg !1523
  br label %410, !dbg !1523

; <label>:408                                     ; preds = %401
  %409 = load i32* %e, align 4, !dbg !1523
  br label %410, !dbg !1523

; <label>:410                                     ; preds = %408, %406
  %411 = phi i32 [ %407, %406 ], [ %409, %408 ], !dbg !1523
  store i32 %411, i32* %e, align 4, !dbg !1523
  %412 = load i32* %n, align 4, !dbg !1523
  %413 = sub i32 %412, %411, !dbg !1523
  store i32 %413, i32* %n, align 4, !dbg !1523
  %414 = load i32* %w, align 4, !dbg !1525
  %415 = load i32* %d, align 4, !dbg !1525
  %416 = sub i32 %414, %415, !dbg !1525
  %417 = load i32* %e, align 4, !dbg !1525
  %418 = icmp uge i32 %416, %417, !dbg !1525
  br i1 %418, label %419, label %434, !dbg !1525

; <label>:419                                     ; preds = %410
  %420 = load i32* %w, align 4, !dbg !1526
  %421 = zext i32 %420 to i64, !dbg !1526
  %422 = getelementptr inbounds i8* getelementptr inbounds ([0 x i8]* @window, i32 0, i32 0), i64 %421, !dbg !1526
  %423 = load i32* %d, align 4, !dbg !1526
  %424 = zext i32 %423 to i64, !dbg !1526
  %425 = getelementptr inbounds i8* getelementptr inbounds ([0 x i8]* @window, i32 0, i32 0), i64 %424, !dbg !1526
  %426 = load i32* %e, align 4, !dbg !1526
  %427 = zext i32 %426 to i64, !dbg !1526
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %422, i8* %425, i64 %427, i32 1, i1 false), !dbg !1526
  %428 = load i32* %e, align 4, !dbg !1528
  %429 = load i32* %w, align 4, !dbg !1528
  %430 = add i32 %429, %428, !dbg !1528
  store i32 %430, i32* %w, align 4, !dbg !1528
  %431 = load i32* %e, align 4, !dbg !1529
  %432 = load i32* %d, align 4, !dbg !1529
  %433 = add i32 %432, %431, !dbg !1529
  store i32 %433, i32* %d, align 4, !dbg !1529
  br label %450, !dbg !1530

; <label>:434                                     ; preds = %410
  br label %435, !dbg !1531

; <label>:435                                     ; preds = %445, %434
  %436 = load i32* %d, align 4, !dbg !1532
  %437 = add i32 %436, 1, !dbg !1532
  store i32 %437, i32* %d, align 4, !dbg !1532
  %438 = zext i32 %436 to i64, !dbg !1532
  %439 = getelementptr inbounds [0 x i8]* @window, i32 0, i64 %438, !dbg !1532
  %440 = load i8* %439, align 1, !dbg !1532
  %441 = load i32* %w, align 4, !dbg !1532
  %442 = add i32 %441, 1, !dbg !1532
  store i32 %442, i32* %w, align 4, !dbg !1532
  %443 = zext i32 %441 to i64, !dbg !1532
  %444 = getelementptr inbounds [0 x i8]* @window, i32 0, i64 %443, !dbg !1532
  store i8 %440, i8* %444, align 1, !dbg !1532
  br label %445, !dbg !1534

; <label>:445                                     ; preds = %435
  %446 = load i32* %e, align 4, !dbg !1534
  %447 = add i32 %446, -1, !dbg !1534
  store i32 %447, i32* %e, align 4, !dbg !1534
  %448 = icmp ne i32 %447, 0, !dbg !1534
  br i1 %448, label %435, label %449, !dbg !1534

; <label>:449                                     ; preds = %445
  br label %450

; <label>:450                                     ; preds = %449, %419
  %451 = load i32* %w, align 4, !dbg !1535
  %452 = icmp eq i32 %451, 32768, !dbg !1535
  br i1 %452, label %453, label %455, !dbg !1535

; <label>:453                                     ; preds = %450
  %454 = load i32* %w, align 4, !dbg !1536
  store i32 %454, i32* @outcnt, align 4, !dbg !1536
  call void @flush_window(), !dbg !1536
  store i32 0, i32* %w, align 4, !dbg !1538
  br label %455, !dbg !1539

; <label>:455                                     ; preds = %453, %450
  br label %456, !dbg !1540

; <label>:456                                     ; preds = %455
  %457 = load i32* %n, align 4, !dbg !1540
  %458 = icmp ne i32 %457, 0, !dbg !1540
  br i1 %458, label %392, label %459, !dbg !1540

; <label>:459                                     ; preds = %456
  br label %460

; <label>:460                                     ; preds = %459, %160
  br label %19, !dbg !1541

; <label>:461                                     ; preds = %164
  %462 = load i32* %w, align 4, !dbg !1542
  store i32 %462, i32* @outcnt, align 4, !dbg !1542
  %463 = load i64* %b, align 8, !dbg !1543
  store i64 %463, i64* @bb, align 8, !dbg !1543
  %464 = load i32* %k, align 4, !dbg !1544
  store i32 %464, i32* @bk, align 4, !dbg !1544
  store i32 0, i32* %1, !dbg !1545
  br label %465, !dbg !1545

; <label>:465                                     ; preds = %461, %260, %64
  %466 = load i32* %1, !dbg !1546
  ret i32 %466, !dbg !1546
}

define i32 @inflate_stored() nounwind uwtable {
  %1 = alloca i32, align 4
  %n = alloca i32, align 4
  %w = alloca i32, align 4
  %b = alloca i64, align 8
  %k = alloca i32, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !1547), !dbg !1549
  call void @llvm.dbg.declare(metadata !22, metadata !1550), !dbg !1551
  call void @llvm.dbg.declare(metadata !22, metadata !1552), !dbg !1553
  call void @llvm.dbg.declare(metadata !22, metadata !1554), !dbg !1555
  %2 = load i64* @bb, align 8, !dbg !1556
  store i64 %2, i64* %b, align 8, !dbg !1556
  %3 = load i32* @bk, align 4, !dbg !1557
  store i32 %3, i32* %k, align 4, !dbg !1557
  %4 = load i32* @outcnt, align 4, !dbg !1558
  store i32 %4, i32* %w, align 4, !dbg !1558
  %5 = load i32* %k, align 4, !dbg !1559
  %6 = and i32 %5, 7, !dbg !1559
  store i32 %6, i32* %n, align 4, !dbg !1559
  %7 = load i32* %n, align 4, !dbg !1560
  %8 = load i64* %b, align 8, !dbg !1560
  %9 = zext i32 %7 to i64, !dbg !1560
  %10 = lshr i64 %8, %9, !dbg !1560
  store i64 %10, i64* %b, align 8, !dbg !1560
  %11 = load i32* %n, align 4, !dbg !1560
  %12 = load i32* %k, align 4, !dbg !1560
  %13 = sub i32 %12, %11, !dbg !1560
  store i32 %13, i32* %k, align 4, !dbg !1560
  br label %14, !dbg !1562

; <label>:14                                      ; preds = %30, %0
  %15 = load i32* %k, align 4, !dbg !1562
  %16 = icmp ult i32 %15, 16, !dbg !1562
  br i1 %16, label %17, label %41, !dbg !1562

; <label>:17                                      ; preds = %14
  %18 = load i32* @inptr, align 4, !dbg !1564
  %19 = load i32* @insize, align 4, !dbg !1564
  %20 = icmp ult i32 %18, %19, !dbg !1564
  br i1 %20, label %21, label %28, !dbg !1564

; <label>:21                                      ; preds = %17
  %22 = load i32* @inptr, align 4, !dbg !1564
  %23 = add i32 %22, 1, !dbg !1564
  store i32 %23, i32* @inptr, align 4, !dbg !1564
  %24 = zext i32 %22 to i64, !dbg !1564
  %25 = getelementptr inbounds [0 x i8]* @inbuf, i32 0, i64 %24, !dbg !1564
  %26 = load i8* %25, align 1, !dbg !1564
  %27 = zext i8 %26 to i32, !dbg !1564
  br label %30, !dbg !1564

; <label>:28                                      ; preds = %17
  %29 = call i32 @fill_inbuf(i32 0), !dbg !1564
  br label %30, !dbg !1564

; <label>:30                                      ; preds = %28, %21
  %31 = phi i32 [ %27, %21 ], [ %29, %28 ], !dbg !1564
  %32 = trunc i32 %31 to i8, !dbg !1564
  %33 = zext i8 %32 to i64, !dbg !1564
  %34 = load i32* %k, align 4, !dbg !1564
  %35 = zext i32 %34 to i64, !dbg !1564
  %36 = shl i64 %33, %35, !dbg !1564
  %37 = load i64* %b, align 8, !dbg !1564
  %38 = or i64 %37, %36, !dbg !1564
  store i64 %38, i64* %b, align 8, !dbg !1564
  %39 = load i32* %k, align 4, !dbg !1564
  %40 = add i32 %39, 8, !dbg !1564
  store i32 %40, i32* %k, align 4, !dbg !1564
  br label %14, !dbg !1564

; <label>:41                                      ; preds = %14
  %42 = load i64* %b, align 8, !dbg !1566
  %43 = trunc i64 %42 to i32, !dbg !1566
  %44 = and i32 %43, 65535, !dbg !1566
  store i32 %44, i32* %n, align 4, !dbg !1566
  %45 = load i64* %b, align 8, !dbg !1567
  %46 = lshr i64 %45, 16, !dbg !1567
  store i64 %46, i64* %b, align 8, !dbg !1567
  %47 = load i32* %k, align 4, !dbg !1567
  %48 = sub i32 %47, 16, !dbg !1567
  store i32 %48, i32* %k, align 4, !dbg !1567
  br label %49, !dbg !1569

; <label>:49                                      ; preds = %65, %41
  %50 = load i32* %k, align 4, !dbg !1569
  %51 = icmp ult i32 %50, 16, !dbg !1569
  br i1 %51, label %52, label %76, !dbg !1569

; <label>:52                                      ; preds = %49
  %53 = load i32* @inptr, align 4, !dbg !1571
  %54 = load i32* @insize, align 4, !dbg !1571
  %55 = icmp ult i32 %53, %54, !dbg !1571
  br i1 %55, label %56, label %63, !dbg !1571

; <label>:56                                      ; preds = %52
  %57 = load i32* @inptr, align 4, !dbg !1571
  %58 = add i32 %57, 1, !dbg !1571
  store i32 %58, i32* @inptr, align 4, !dbg !1571
  %59 = zext i32 %57 to i64, !dbg !1571
  %60 = getelementptr inbounds [0 x i8]* @inbuf, i32 0, i64 %59, !dbg !1571
  %61 = load i8* %60, align 1, !dbg !1571
  %62 = zext i8 %61 to i32, !dbg !1571
  br label %65, !dbg !1571

; <label>:63                                      ; preds = %52
  %64 = call i32 @fill_inbuf(i32 0), !dbg !1571
  br label %65, !dbg !1571

; <label>:65                                      ; preds = %63, %56
  %66 = phi i32 [ %62, %56 ], [ %64, %63 ], !dbg !1571
  %67 = trunc i32 %66 to i8, !dbg !1571
  %68 = zext i8 %67 to i64, !dbg !1571
  %69 = load i32* %k, align 4, !dbg !1571
  %70 = zext i32 %69 to i64, !dbg !1571
  %71 = shl i64 %68, %70, !dbg !1571
  %72 = load i64* %b, align 8, !dbg !1571
  %73 = or i64 %72, %71, !dbg !1571
  store i64 %73, i64* %b, align 8, !dbg !1571
  %74 = load i32* %k, align 4, !dbg !1571
  %75 = add i32 %74, 8, !dbg !1571
  store i32 %75, i32* %k, align 4, !dbg !1571
  br label %49, !dbg !1571

; <label>:76                                      ; preds = %49
  %77 = load i32* %n, align 4, !dbg !1573
  %78 = load i64* %b, align 8, !dbg !1573
  %79 = xor i64 %78, -1, !dbg !1573
  %80 = and i64 %79, 65535, !dbg !1573
  %81 = trunc i64 %80 to i32, !dbg !1573
  %82 = icmp ne i32 %77, %81, !dbg !1573
  br i1 %82, label %83, label %84, !dbg !1573

; <label>:83                                      ; preds = %76
  store i32 1, i32* %1, !dbg !1574
  br label %141, !dbg !1574

; <label>:84                                      ; preds = %76
  %85 = load i64* %b, align 8, !dbg !1575
  %86 = lshr i64 %85, 16, !dbg !1575
  store i64 %86, i64* %b, align 8, !dbg !1575
  %87 = load i32* %k, align 4, !dbg !1575
  %88 = sub i32 %87, 16, !dbg !1575
  store i32 %88, i32* %k, align 4, !dbg !1575
  br label %89, !dbg !1577

; <label>:89                                      ; preds = %132, %84
  %90 = load i32* %n, align 4, !dbg !1577
  %91 = add i32 %90, -1, !dbg !1577
  store i32 %91, i32* %n, align 4, !dbg !1577
  %92 = icmp ne i32 %90, 0, !dbg !1577
  br i1 %92, label %93, label %137, !dbg !1577

; <label>:93                                      ; preds = %89
  br label %94, !dbg !1578

; <label>:94                                      ; preds = %110, %93
  %95 = load i32* %k, align 4, !dbg !1578
  %96 = icmp ult i32 %95, 8, !dbg !1578
  br i1 %96, label %97, label %121, !dbg !1578

; <label>:97                                      ; preds = %94
  %98 = load i32* @inptr, align 4, !dbg !1581
  %99 = load i32* @insize, align 4, !dbg !1581
  %100 = icmp ult i32 %98, %99, !dbg !1581
  br i1 %100, label %101, label %108, !dbg !1581

; <label>:101                                     ; preds = %97
  %102 = load i32* @inptr, align 4, !dbg !1581
  %103 = add i32 %102, 1, !dbg !1581
  store i32 %103, i32* @inptr, align 4, !dbg !1581
  %104 = zext i32 %102 to i64, !dbg !1581
  %105 = getelementptr inbounds [0 x i8]* @inbuf, i32 0, i64 %104, !dbg !1581
  %106 = load i8* %105, align 1, !dbg !1581
  %107 = zext i8 %106 to i32, !dbg !1581
  br label %110, !dbg !1581

; <label>:108                                     ; preds = %97
  %109 = call i32 @fill_inbuf(i32 0), !dbg !1581
  br label %110, !dbg !1581

; <label>:110                                     ; preds = %108, %101
  %111 = phi i32 [ %107, %101 ], [ %109, %108 ], !dbg !1581
  %112 = trunc i32 %111 to i8, !dbg !1581
  %113 = zext i8 %112 to i64, !dbg !1581
  %114 = load i32* %k, align 4, !dbg !1581
  %115 = zext i32 %114 to i64, !dbg !1581
  %116 = shl i64 %113, %115, !dbg !1581
  %117 = load i64* %b, align 8, !dbg !1581
  %118 = or i64 %117, %116, !dbg !1581
  store i64 %118, i64* %b, align 8, !dbg !1581
  %119 = load i32* %k, align 4, !dbg !1581
  %120 = add i32 %119, 8, !dbg !1581
  store i32 %120, i32* %k, align 4, !dbg !1581
  br label %94, !dbg !1581

; <label>:121                                     ; preds = %94
  %122 = load i64* %b, align 8, !dbg !1583
  %123 = trunc i64 %122 to i8, !dbg !1583
  %124 = load i32* %w, align 4, !dbg !1583
  %125 = add i32 %124, 1, !dbg !1583
  store i32 %125, i32* %w, align 4, !dbg !1583
  %126 = zext i32 %124 to i64, !dbg !1583
  %127 = getelementptr inbounds [0 x i8]* @window, i32 0, i64 %126, !dbg !1583
  store i8 %123, i8* %127, align 1, !dbg !1583
  %128 = load i32* %w, align 4, !dbg !1584
  %129 = icmp eq i32 %128, 32768, !dbg !1584
  br i1 %129, label %130, label %132, !dbg !1584

; <label>:130                                     ; preds = %121
  %131 = load i32* %w, align 4, !dbg !1585
  store i32 %131, i32* @outcnt, align 4, !dbg !1585
  call void @flush_window(), !dbg !1585
  store i32 0, i32* %w, align 4, !dbg !1587
  br label %132, !dbg !1588

; <label>:132                                     ; preds = %130, %121
  %133 = load i64* %b, align 8, !dbg !1589
  %134 = lshr i64 %133, 8, !dbg !1589
  store i64 %134, i64* %b, align 8, !dbg !1589
  %135 = load i32* %k, align 4, !dbg !1589
  %136 = sub i32 %135, 8, !dbg !1589
  store i32 %136, i32* %k, align 4, !dbg !1589
  br label %89, !dbg !1591

; <label>:137                                     ; preds = %89
  %138 = load i32* %w, align 4, !dbg !1592
  store i32 %138, i32* @outcnt, align 4, !dbg !1592
  %139 = load i64* %b, align 8, !dbg !1593
  store i64 %139, i64* @bb, align 8, !dbg !1593
  %140 = load i32* %k, align 4, !dbg !1594
  store i32 %140, i32* @bk, align 4, !dbg !1594
  store i32 0, i32* %1, !dbg !1595
  br label %141, !dbg !1595

; <label>:141                                     ; preds = %137, %83
  %142 = load i32* %1, !dbg !1596
  ret i32 %142, !dbg !1596
}

define i32 @inflate_fixed() nounwind uwtable {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %tl = alloca %struct.huft*, align 8
  %td = alloca %struct.huft*, align 8
  %bl = alloca i32, align 4
  %bd = alloca i32, align 4
  %l = alloca [288 x i32], align 16
  call void @llvm.dbg.declare(metadata !22, metadata !1597), !dbg !1599
  call void @llvm.dbg.declare(metadata !22, metadata !1600), !dbg !1601
  call void @llvm.dbg.declare(metadata !22, metadata !1602), !dbg !1603
  call void @llvm.dbg.declare(metadata !22, metadata !1604), !dbg !1605
  call void @llvm.dbg.declare(metadata !22, metadata !1606), !dbg !1607
  call void @llvm.dbg.declare(metadata !22, metadata !1608), !dbg !1609
  store i32 0, i32* %i, align 4, !dbg !1610
  br label %2, !dbg !1610

; <label>:2                                       ; preds = %9, %0
  %3 = load i32* %i, align 4, !dbg !1610
  %4 = icmp slt i32 %3, 144, !dbg !1610
  br i1 %4, label %5, label %12, !dbg !1610

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4, !dbg !1612
  %7 = sext i32 %6 to i64, !dbg !1612
  %8 = getelementptr inbounds [288 x i32]* %l, i32 0, i64 %7, !dbg !1612
  store i32 8, i32* %8, align 4, !dbg !1612
  br label %9, !dbg !1612

; <label>:9                                       ; preds = %5
  %10 = load i32* %i, align 4, !dbg !1613
  %11 = add nsw i32 %10, 1, !dbg !1613
  store i32 %11, i32* %i, align 4, !dbg !1613
  br label %2, !dbg !1613

; <label>:12                                      ; preds = %2
  br label %13, !dbg !1614

; <label>:13                                      ; preds = %20, %12
  %14 = load i32* %i, align 4, !dbg !1614
  %15 = icmp slt i32 %14, 256, !dbg !1614
  br i1 %15, label %16, label %23, !dbg !1614

; <label>:16                                      ; preds = %13
  %17 = load i32* %i, align 4, !dbg !1616
  %18 = sext i32 %17 to i64, !dbg !1616
  %19 = getelementptr inbounds [288 x i32]* %l, i32 0, i64 %18, !dbg !1616
  store i32 9, i32* %19, align 4, !dbg !1616
  br label %20, !dbg !1616

; <label>:20                                      ; preds = %16
  %21 = load i32* %i, align 4, !dbg !1617
  %22 = add nsw i32 %21, 1, !dbg !1617
  store i32 %22, i32* %i, align 4, !dbg !1617
  br label %13, !dbg !1617

; <label>:23                                      ; preds = %13
  br label %24, !dbg !1618

; <label>:24                                      ; preds = %31, %23
  %25 = load i32* %i, align 4, !dbg !1618
  %26 = icmp slt i32 %25, 280, !dbg !1618
  br i1 %26, label %27, label %34, !dbg !1618

; <label>:27                                      ; preds = %24
  %28 = load i32* %i, align 4, !dbg !1620
  %29 = sext i32 %28 to i64, !dbg !1620
  %30 = getelementptr inbounds [288 x i32]* %l, i32 0, i64 %29, !dbg !1620
  store i32 7, i32* %30, align 4, !dbg !1620
  br label %31, !dbg !1620

; <label>:31                                      ; preds = %27
  %32 = load i32* %i, align 4, !dbg !1621
  %33 = add nsw i32 %32, 1, !dbg !1621
  store i32 %33, i32* %i, align 4, !dbg !1621
  br label %24, !dbg !1621

; <label>:34                                      ; preds = %24
  br label %35, !dbg !1622

; <label>:35                                      ; preds = %42, %34
  %36 = load i32* %i, align 4, !dbg !1622
  %37 = icmp slt i32 %36, 288, !dbg !1622
  br i1 %37, label %38, label %45, !dbg !1622

; <label>:38                                      ; preds = %35
  %39 = load i32* %i, align 4, !dbg !1624
  %40 = sext i32 %39 to i64, !dbg !1624
  %41 = getelementptr inbounds [288 x i32]* %l, i32 0, i64 %40, !dbg !1624
  store i32 8, i32* %41, align 4, !dbg !1624
  br label %42, !dbg !1624

; <label>:42                                      ; preds = %38
  %43 = load i32* %i, align 4, !dbg !1625
  %44 = add nsw i32 %43, 1, !dbg !1625
  store i32 %44, i32* %i, align 4, !dbg !1625
  br label %35, !dbg !1625

; <label>:45                                      ; preds = %35
  store i32 7, i32* %bl, align 4, !dbg !1626
  %46 = getelementptr inbounds [288 x i32]* %l, i32 0, i32 0, !dbg !1627
  %47 = call i32 (...)* bitcast (i32 (i32*, i32, i32, i16*, i16*, %struct.huft**, i32*)* @huft_build to i32 (...)*)(i32* %46, i32 288, i32 257, i16* getelementptr inbounds ([31 x i16]* @cplens, i32 0, i32 0), i16* getelementptr inbounds ([31 x i16]* @cplext, i32 0, i32 0), %struct.huft** %tl, i32* %bl), !dbg !1627
  store i32 %47, i32* %i, align 4, !dbg !1627
  %48 = icmp ne i32 %47, 0, !dbg !1627
  br i1 %48, label %49, label %51, !dbg !1627

; <label>:49                                      ; preds = %45
  %50 = load i32* %i, align 4, !dbg !1628
  store i32 %50, i32* %1, !dbg !1628
  br label %83, !dbg !1628

; <label>:51                                      ; preds = %45
  store i32 0, i32* %i, align 4, !dbg !1629
  br label %52, !dbg !1629

; <label>:52                                      ; preds = %59, %51
  %53 = load i32* %i, align 4, !dbg !1629
  %54 = icmp slt i32 %53, 30, !dbg !1629
  br i1 %54, label %55, label %62, !dbg !1629

; <label>:55                                      ; preds = %52
  %56 = load i32* %i, align 4, !dbg !1631
  %57 = sext i32 %56 to i64, !dbg !1631
  %58 = getelementptr inbounds [288 x i32]* %l, i32 0, i64 %57, !dbg !1631
  store i32 5, i32* %58, align 4, !dbg !1631
  br label %59, !dbg !1631

; <label>:59                                      ; preds = %55
  %60 = load i32* %i, align 4, !dbg !1632
  %61 = add nsw i32 %60, 1, !dbg !1632
  store i32 %61, i32* %i, align 4, !dbg !1632
  br label %52, !dbg !1632

; <label>:62                                      ; preds = %52
  store i32 5, i32* %bd, align 4, !dbg !1633
  %63 = getelementptr inbounds [288 x i32]* %l, i32 0, i32 0, !dbg !1634
  %64 = call i32 (...)* bitcast (i32 (i32*, i32, i32, i16*, i16*, %struct.huft**, i32*)* @huft_build to i32 (...)*)(i32* %63, i32 30, i32 0, i16* getelementptr inbounds ([30 x i16]* @cpdist, i32 0, i32 0), i16* getelementptr inbounds ([30 x i16]* @cpdext, i32 0, i32 0), %struct.huft** %td, i32* %bd), !dbg !1634
  store i32 %64, i32* %i, align 4, !dbg !1634
  %65 = icmp sgt i32 %64, 1, !dbg !1634
  br i1 %65, label %66, label %70, !dbg !1634

; <label>:66                                      ; preds = %62
  %67 = load %struct.huft** %tl, align 8, !dbg !1635
  %68 = call i32 (...)* bitcast (i32 (%struct.huft*)* @huft_free to i32 (...)*)(%struct.huft* %67), !dbg !1635
  %69 = load i32* %i, align 4, !dbg !1637
  store i32 %69, i32* %1, !dbg !1637
  br label %83, !dbg !1637

; <label>:70                                      ; preds = %62
  %71 = load %struct.huft** %tl, align 8, !dbg !1638
  %72 = load %struct.huft** %td, align 8, !dbg !1638
  %73 = load i32* %bl, align 4, !dbg !1638
  %74 = load i32* %bd, align 4, !dbg !1638
  %75 = call i32 (...)* bitcast (i32 (%struct.huft*, %struct.huft*, i32, i32)* @inflate_codes to i32 (...)*)(%struct.huft* %71, %struct.huft* %72, i32 %73, i32 %74), !dbg !1638
  %76 = icmp ne i32 %75, 0, !dbg !1638
  br i1 %76, label %77, label %78, !dbg !1638

; <label>:77                                      ; preds = %70
  store i32 1, i32* %1, !dbg !1639
  br label %83, !dbg !1639

; <label>:78                                      ; preds = %70
  %79 = load %struct.huft** %tl, align 8, !dbg !1640
  %80 = call i32 (...)* bitcast (i32 (%struct.huft*)* @huft_free to i32 (...)*)(%struct.huft* %79), !dbg !1640
  %81 = load %struct.huft** %td, align 8, !dbg !1641
  %82 = call i32 (...)* bitcast (i32 (%struct.huft*)* @huft_free to i32 (...)*)(%struct.huft* %81), !dbg !1641
  store i32 0, i32* %1, !dbg !1642
  br label %83, !dbg !1642

; <label>:83                                      ; preds = %78, %77, %66, %49
  %84 = load i32* %1, !dbg !1643
  ret i32 %84, !dbg !1643
}

define i32 @inflate_dynamic() nounwind uwtable {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %l = alloca i32, align 4
  %m = alloca i32, align 4
  %n = alloca i32, align 4
  %tl = alloca %struct.huft*, align 8
  %td = alloca %struct.huft*, align 8
  %bl = alloca i32, align 4
  %bd = alloca i32, align 4
  %nb = alloca i32, align 4
  %nl = alloca i32, align 4
  %nd = alloca i32, align 4
  %ll = alloca [316 x i32], align 16
  %b = alloca i64, align 8
  %k = alloca i32, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !1644), !dbg !1646
  call void @llvm.dbg.declare(metadata !22, metadata !1647), !dbg !1648
  call void @llvm.dbg.declare(metadata !22, metadata !1649), !dbg !1650
  call void @llvm.dbg.declare(metadata !22, metadata !1651), !dbg !1652
  call void @llvm.dbg.declare(metadata !22, metadata !1653), !dbg !1654
  call void @llvm.dbg.declare(metadata !22, metadata !1655), !dbg !1656
  call void @llvm.dbg.declare(metadata !22, metadata !1657), !dbg !1658
  call void @llvm.dbg.declare(metadata !22, metadata !1659), !dbg !1660
  call void @llvm.dbg.declare(metadata !22, metadata !1661), !dbg !1662
  call void @llvm.dbg.declare(metadata !22, metadata !1663), !dbg !1664
  call void @llvm.dbg.declare(metadata !22, metadata !1665), !dbg !1666
  call void @llvm.dbg.declare(metadata !22, metadata !1667), !dbg !1668
  call void @llvm.dbg.declare(metadata !22, metadata !1669), !dbg !1673
  call void @llvm.dbg.declare(metadata !22, metadata !1674), !dbg !1675
  call void @llvm.dbg.declare(metadata !22, metadata !1676), !dbg !1677
  %2 = load i64* @bb, align 8, !dbg !1678
  store i64 %2, i64* %b, align 8, !dbg !1678
  %3 = load i32* @bk, align 4, !dbg !1679
  store i32 %3, i32* %k, align 4, !dbg !1679
  br label %4, !dbg !1680

; <label>:4                                       ; preds = %20, %0
  %5 = load i32* %k, align 4, !dbg !1680
  %6 = icmp ult i32 %5, 5, !dbg !1680
  br i1 %6, label %7, label %31, !dbg !1680

; <label>:7                                       ; preds = %4
  %8 = load i32* @inptr, align 4, !dbg !1682
  %9 = load i32* @insize, align 4, !dbg !1682
  %10 = icmp ult i32 %8, %9, !dbg !1682
  br i1 %10, label %11, label %18, !dbg !1682

; <label>:11                                      ; preds = %7
  %12 = load i32* @inptr, align 4, !dbg !1682
  %13 = add i32 %12, 1, !dbg !1682
  store i32 %13, i32* @inptr, align 4, !dbg !1682
  %14 = zext i32 %12 to i64, !dbg !1682
  %15 = getelementptr inbounds [0 x i8]* @inbuf, i32 0, i64 %14, !dbg !1682
  %16 = load i8* %15, align 1, !dbg !1682
  %17 = zext i8 %16 to i32, !dbg !1682
  br label %20, !dbg !1682

; <label>:18                                      ; preds = %7
  %19 = call i32 @fill_inbuf(i32 0), !dbg !1682
  br label %20, !dbg !1682

; <label>:20                                      ; preds = %18, %11
  %21 = phi i32 [ %17, %11 ], [ %19, %18 ], !dbg !1682
  %22 = trunc i32 %21 to i8, !dbg !1682
  %23 = zext i8 %22 to i64, !dbg !1682
  %24 = load i32* %k, align 4, !dbg !1682
  %25 = zext i32 %24 to i64, !dbg !1682
  %26 = shl i64 %23, %25, !dbg !1682
  %27 = load i64* %b, align 8, !dbg !1682
  %28 = or i64 %27, %26, !dbg !1682
  store i64 %28, i64* %b, align 8, !dbg !1682
  %29 = load i32* %k, align 4, !dbg !1682
  %30 = add i32 %29, 8, !dbg !1682
  store i32 %30, i32* %k, align 4, !dbg !1682
  br label %4, !dbg !1682

; <label>:31                                      ; preds = %4
  %32 = load i64* %b, align 8, !dbg !1684
  %33 = trunc i64 %32 to i32, !dbg !1684
  %34 = and i32 %33, 31, !dbg !1684
  %35 = add i32 257, %34, !dbg !1684
  store i32 %35, i32* %nl, align 4, !dbg !1684
  %36 = load i64* %b, align 8, !dbg !1685
  %37 = lshr i64 %36, 5, !dbg !1685
  store i64 %37, i64* %b, align 8, !dbg !1685
  %38 = load i32* %k, align 4, !dbg !1685
  %39 = sub i32 %38, 5, !dbg !1685
  store i32 %39, i32* %k, align 4, !dbg !1685
  br label %40, !dbg !1687

; <label>:40                                      ; preds = %56, %31
  %41 = load i32* %k, align 4, !dbg !1687
  %42 = icmp ult i32 %41, 5, !dbg !1687
  br i1 %42, label %43, label %67, !dbg !1687

; <label>:43                                      ; preds = %40
  %44 = load i32* @inptr, align 4, !dbg !1689
  %45 = load i32* @insize, align 4, !dbg !1689
  %46 = icmp ult i32 %44, %45, !dbg !1689
  br i1 %46, label %47, label %54, !dbg !1689

; <label>:47                                      ; preds = %43
  %48 = load i32* @inptr, align 4, !dbg !1689
  %49 = add i32 %48, 1, !dbg !1689
  store i32 %49, i32* @inptr, align 4, !dbg !1689
  %50 = zext i32 %48 to i64, !dbg !1689
  %51 = getelementptr inbounds [0 x i8]* @inbuf, i32 0, i64 %50, !dbg !1689
  %52 = load i8* %51, align 1, !dbg !1689
  %53 = zext i8 %52 to i32, !dbg !1689
  br label %56, !dbg !1689

; <label>:54                                      ; preds = %43
  %55 = call i32 @fill_inbuf(i32 0), !dbg !1689
  br label %56, !dbg !1689

; <label>:56                                      ; preds = %54, %47
  %57 = phi i32 [ %53, %47 ], [ %55, %54 ], !dbg !1689
  %58 = trunc i32 %57 to i8, !dbg !1689
  %59 = zext i8 %58 to i64, !dbg !1689
  %60 = load i32* %k, align 4, !dbg !1689
  %61 = zext i32 %60 to i64, !dbg !1689
  %62 = shl i64 %59, %61, !dbg !1689
  %63 = load i64* %b, align 8, !dbg !1689
  %64 = or i64 %63, %62, !dbg !1689
  store i64 %64, i64* %b, align 8, !dbg !1689
  %65 = load i32* %k, align 4, !dbg !1689
  %66 = add i32 %65, 8, !dbg !1689
  store i32 %66, i32* %k, align 4, !dbg !1689
  br label %40, !dbg !1689

; <label>:67                                      ; preds = %40
  %68 = load i64* %b, align 8, !dbg !1691
  %69 = trunc i64 %68 to i32, !dbg !1691
  %70 = and i32 %69, 31, !dbg !1691
  %71 = add i32 1, %70, !dbg !1691
  store i32 %71, i32* %nd, align 4, !dbg !1691
  %72 = load i64* %b, align 8, !dbg !1692
  %73 = lshr i64 %72, 5, !dbg !1692
  store i64 %73, i64* %b, align 8, !dbg !1692
  %74 = load i32* %k, align 4, !dbg !1692
  %75 = sub i32 %74, 5, !dbg !1692
  store i32 %75, i32* %k, align 4, !dbg !1692
  br label %76, !dbg !1694

; <label>:76                                      ; preds = %92, %67
  %77 = load i32* %k, align 4, !dbg !1694
  %78 = icmp ult i32 %77, 4, !dbg !1694
  br i1 %78, label %79, label %103, !dbg !1694

; <label>:79                                      ; preds = %76
  %80 = load i32* @inptr, align 4, !dbg !1696
  %81 = load i32* @insize, align 4, !dbg !1696
  %82 = icmp ult i32 %80, %81, !dbg !1696
  br i1 %82, label %83, label %90, !dbg !1696

; <label>:83                                      ; preds = %79
  %84 = load i32* @inptr, align 4, !dbg !1696
  %85 = add i32 %84, 1, !dbg !1696
  store i32 %85, i32* @inptr, align 4, !dbg !1696
  %86 = zext i32 %84 to i64, !dbg !1696
  %87 = getelementptr inbounds [0 x i8]* @inbuf, i32 0, i64 %86, !dbg !1696
  %88 = load i8* %87, align 1, !dbg !1696
  %89 = zext i8 %88 to i32, !dbg !1696
  br label %92, !dbg !1696

; <label>:90                                      ; preds = %79
  %91 = call i32 @fill_inbuf(i32 0), !dbg !1696
  br label %92, !dbg !1696

; <label>:92                                      ; preds = %90, %83
  %93 = phi i32 [ %89, %83 ], [ %91, %90 ], !dbg !1696
  %94 = trunc i32 %93 to i8, !dbg !1696
  %95 = zext i8 %94 to i64, !dbg !1696
  %96 = load i32* %k, align 4, !dbg !1696
  %97 = zext i32 %96 to i64, !dbg !1696
  %98 = shl i64 %95, %97, !dbg !1696
  %99 = load i64* %b, align 8, !dbg !1696
  %100 = or i64 %99, %98, !dbg !1696
  store i64 %100, i64* %b, align 8, !dbg !1696
  %101 = load i32* %k, align 4, !dbg !1696
  %102 = add i32 %101, 8, !dbg !1696
  store i32 %102, i32* %k, align 4, !dbg !1696
  br label %76, !dbg !1696

; <label>:103                                     ; preds = %76
  %104 = load i64* %b, align 8, !dbg !1698
  %105 = trunc i64 %104 to i32, !dbg !1698
  %106 = and i32 %105, 15, !dbg !1698
  %107 = add i32 4, %106, !dbg !1698
  store i32 %107, i32* %nb, align 4, !dbg !1698
  %108 = load i64* %b, align 8, !dbg !1699
  %109 = lshr i64 %108, 4, !dbg !1699
  store i64 %109, i64* %b, align 8, !dbg !1699
  %110 = load i32* %k, align 4, !dbg !1699
  %111 = sub i32 %110, 4, !dbg !1699
  store i32 %111, i32* %k, align 4, !dbg !1699
  %112 = load i32* %nl, align 4, !dbg !1701
  %113 = icmp ugt i32 %112, 286, !dbg !1701
  br i1 %113, label %117, label %114, !dbg !1701

; <label>:114                                     ; preds = %103
  %115 = load i32* %nd, align 4, !dbg !1701
  %116 = icmp ugt i32 %115, 30, !dbg !1701
  br i1 %116, label %117, label %118, !dbg !1701

; <label>:117                                     ; preds = %114, %103
  store i32 1, i32* %1, !dbg !1702
  br label %493, !dbg !1702

; <label>:118                                     ; preds = %114
  store i32 0, i32* %j, align 4, !dbg !1703
  br label %119, !dbg !1703

; <label>:119                                     ; preds = %165, %118
  %120 = load i32* %j, align 4, !dbg !1703
  %121 = load i32* %nb, align 4, !dbg !1703
  %122 = icmp ult i32 %120, %121, !dbg !1703
  br i1 %122, label %123, label %168, !dbg !1703

; <label>:123                                     ; preds = %119
  br label %124, !dbg !1705

; <label>:124                                     ; preds = %140, %123
  %125 = load i32* %k, align 4, !dbg !1705
  %126 = icmp ult i32 %125, 3, !dbg !1705
  br i1 %126, label %127, label %151, !dbg !1705

; <label>:127                                     ; preds = %124
  %128 = load i32* @inptr, align 4, !dbg !1708
  %129 = load i32* @insize, align 4, !dbg !1708
  %130 = icmp ult i32 %128, %129, !dbg !1708
  br i1 %130, label %131, label %138, !dbg !1708

; <label>:131                                     ; preds = %127
  %132 = load i32* @inptr, align 4, !dbg !1708
  %133 = add i32 %132, 1, !dbg !1708
  store i32 %133, i32* @inptr, align 4, !dbg !1708
  %134 = zext i32 %132 to i64, !dbg !1708
  %135 = getelementptr inbounds [0 x i8]* @inbuf, i32 0, i64 %134, !dbg !1708
  %136 = load i8* %135, align 1, !dbg !1708
  %137 = zext i8 %136 to i32, !dbg !1708
  br label %140, !dbg !1708

; <label>:138                                     ; preds = %127
  %139 = call i32 @fill_inbuf(i32 0), !dbg !1708
  br label %140, !dbg !1708

; <label>:140                                     ; preds = %138, %131
  %141 = phi i32 [ %137, %131 ], [ %139, %138 ], !dbg !1708
  %142 = trunc i32 %141 to i8, !dbg !1708
  %143 = zext i8 %142 to i64, !dbg !1708
  %144 = load i32* %k, align 4, !dbg !1708
  %145 = zext i32 %144 to i64, !dbg !1708
  %146 = shl i64 %143, %145, !dbg !1708
  %147 = load i64* %b, align 8, !dbg !1708
  %148 = or i64 %147, %146, !dbg !1708
  store i64 %148, i64* %b, align 8, !dbg !1708
  %149 = load i32* %k, align 4, !dbg !1708
  %150 = add i32 %149, 8, !dbg !1708
  store i32 %150, i32* %k, align 4, !dbg !1708
  br label %124, !dbg !1708

; <label>:151                                     ; preds = %124
  %152 = load i64* %b, align 8, !dbg !1710
  %153 = trunc i64 %152 to i32, !dbg !1710
  %154 = and i32 %153, 7, !dbg !1710
  %155 = load i32* %j, align 4, !dbg !1710
  %156 = zext i32 %155 to i64, !dbg !1710
  %157 = getelementptr inbounds [19 x i32]* @border, i32 0, i64 %156, !dbg !1710
  %158 = load i32* %157, align 4, !dbg !1710
  %159 = zext i32 %158 to i64, !dbg !1710
  %160 = getelementptr inbounds [316 x i32]* %ll, i32 0, i64 %159, !dbg !1710
  store i32 %154, i32* %160, align 4, !dbg !1710
  %161 = load i64* %b, align 8, !dbg !1711
  %162 = lshr i64 %161, 3, !dbg !1711
  store i64 %162, i64* %b, align 8, !dbg !1711
  %163 = load i32* %k, align 4, !dbg !1711
  %164 = sub i32 %163, 3, !dbg !1711
  store i32 %164, i32* %k, align 4, !dbg !1711
  br label %165, !dbg !1713

; <label>:165                                     ; preds = %151
  %166 = load i32* %j, align 4, !dbg !1714
  %167 = add i32 %166, 1, !dbg !1714
  store i32 %167, i32* %j, align 4, !dbg !1714
  br label %119, !dbg !1714

; <label>:168                                     ; preds = %119
  br label %169, !dbg !1715

; <label>:169                                     ; preds = %179, %168
  %170 = load i32* %j, align 4, !dbg !1715
  %171 = icmp ult i32 %170, 19, !dbg !1715
  br i1 %171, label %172, label %182, !dbg !1715

; <label>:172                                     ; preds = %169
  %173 = load i32* %j, align 4, !dbg !1717
  %174 = zext i32 %173 to i64, !dbg !1717
  %175 = getelementptr inbounds [19 x i32]* @border, i32 0, i64 %174, !dbg !1717
  %176 = load i32* %175, align 4, !dbg !1717
  %177 = zext i32 %176 to i64, !dbg !1717
  %178 = getelementptr inbounds [316 x i32]* %ll, i32 0, i64 %177, !dbg !1717
  store i32 0, i32* %178, align 4, !dbg !1717
  br label %179, !dbg !1717

; <label>:179                                     ; preds = %172
  %180 = load i32* %j, align 4, !dbg !1718
  %181 = add i32 %180, 1, !dbg !1718
  store i32 %181, i32* %j, align 4, !dbg !1718
  br label %169, !dbg !1718

; <label>:182                                     ; preds = %169
  store i32 7, i32* %bl, align 4, !dbg !1719
  %183 = getelementptr inbounds [316 x i32]* %ll, i32 0, i32 0, !dbg !1720
  %184 = call i32 (...)* bitcast (i32 (i32*, i32, i32, i16*, i16*, %struct.huft**, i32*)* @huft_build to i32 (...)*)(i32* %183, i32 19, i32 19, i16* null, i16* null, %struct.huft** %tl, i32* %bl), !dbg !1720
  store i32 %184, i32* %i, align 4, !dbg !1720
  %185 = icmp ne i32 %184, 0, !dbg !1720
  br i1 %185, label %186, label %194, !dbg !1720

; <label>:186                                     ; preds = %182
  %187 = load i32* %i, align 4, !dbg !1721
  %188 = icmp eq i32 %187, 1, !dbg !1721
  br i1 %188, label %189, label %192, !dbg !1721

; <label>:189                                     ; preds = %186
  %190 = load %struct.huft** %tl, align 8, !dbg !1723
  %191 = call i32 (...)* bitcast (i32 (%struct.huft*)* @huft_free to i32 (...)*)(%struct.huft* %190), !dbg !1723
  br label %192, !dbg !1723

; <label>:192                                     ; preds = %189, %186
  %193 = load i32* %i, align 4, !dbg !1724
  store i32 %193, i32* %1, !dbg !1724
  br label %493, !dbg !1724

; <label>:194                                     ; preds = %182
  %195 = load i32* %nl, align 4, !dbg !1725
  %196 = load i32* %nd, align 4, !dbg !1725
  %197 = add i32 %195, %196, !dbg !1725
  store i32 %197, i32* %n, align 4, !dbg !1725
  %198 = load i32* %bl, align 4, !dbg !1726
  %199 = sext i32 %198 to i64, !dbg !1726
  %200 = getelementptr inbounds [17 x i16]* @mask_bits, i32 0, i64 %199, !dbg !1726
  %201 = load i16* %200, align 2, !dbg !1726
  %202 = zext i16 %201 to i32, !dbg !1726
  store i32 %202, i32* %m, align 4, !dbg !1726
  store i32 0, i32* %l, align 4, !dbg !1727
  store i32 0, i32* %i, align 4, !dbg !1727
  br label %203, !dbg !1728

; <label>:203                                     ; preds = %438, %194
  %204 = load i32* %i, align 4, !dbg !1728
  %205 = load i32* %n, align 4, !dbg !1728
  %206 = icmp ult i32 %204, %205, !dbg !1728
  br i1 %206, label %207, label %439, !dbg !1728

; <label>:207                                     ; preds = %203
  br label %208, !dbg !1729

; <label>:208                                     ; preds = %225, %207
  %209 = load i32* %k, align 4, !dbg !1729
  %210 = load i32* %bl, align 4, !dbg !1729
  %211 = icmp ult i32 %209, %210, !dbg !1729
  br i1 %211, label %212, label %236, !dbg !1729

; <label>:212                                     ; preds = %208
  %213 = load i32* @inptr, align 4, !dbg !1732
  %214 = load i32* @insize, align 4, !dbg !1732
  %215 = icmp ult i32 %213, %214, !dbg !1732
  br i1 %215, label %216, label %223, !dbg !1732

; <label>:216                                     ; preds = %212
  %217 = load i32* @inptr, align 4, !dbg !1732
  %218 = add i32 %217, 1, !dbg !1732
  store i32 %218, i32* @inptr, align 4, !dbg !1732
  %219 = zext i32 %217 to i64, !dbg !1732
  %220 = getelementptr inbounds [0 x i8]* @inbuf, i32 0, i64 %219, !dbg !1732
  %221 = load i8* %220, align 1, !dbg !1732
  %222 = zext i8 %221 to i32, !dbg !1732
  br label %225, !dbg !1732

; <label>:223                                     ; preds = %212
  %224 = call i32 @fill_inbuf(i32 0), !dbg !1732
  br label %225, !dbg !1732

; <label>:225                                     ; preds = %223, %216
  %226 = phi i32 [ %222, %216 ], [ %224, %223 ], !dbg !1732
  %227 = trunc i32 %226 to i8, !dbg !1732
  %228 = zext i8 %227 to i64, !dbg !1732
  %229 = load i32* %k, align 4, !dbg !1732
  %230 = zext i32 %229 to i64, !dbg !1732
  %231 = shl i64 %228, %230, !dbg !1732
  %232 = load i64* %b, align 8, !dbg !1732
  %233 = or i64 %232, %231, !dbg !1732
  store i64 %233, i64* %b, align 8, !dbg !1732
  %234 = load i32* %k, align 4, !dbg !1732
  %235 = add i32 %234, 8, !dbg !1732
  store i32 %235, i32* %k, align 4, !dbg !1732
  br label %208, !dbg !1732

; <label>:236                                     ; preds = %208
  %237 = load %struct.huft** %tl, align 8, !dbg !1734
  %238 = load i64* %b, align 8, !dbg !1734
  %239 = trunc i64 %238 to i32, !dbg !1734
  %240 = load i32* %m, align 4, !dbg !1734
  %241 = and i32 %239, %240, !dbg !1734
  %242 = zext i32 %241 to i64, !dbg !1734
  %243 = getelementptr inbounds %struct.huft* %237, i64 %242, !dbg !1734
  store %struct.huft* %243, %struct.huft** %td, align 8, !dbg !1734
  %244 = getelementptr inbounds %struct.huft* %243, i32 0, i32 1, !dbg !1734
  %245 = load i8* %244, align 1, !dbg !1734
  %246 = zext i8 %245 to i32, !dbg !1734
  store i32 %246, i32* %j, align 4, !dbg !1734
  %247 = load i32* %j, align 4, !dbg !1735
  %248 = load i64* %b, align 8, !dbg !1735
  %249 = zext i32 %247 to i64, !dbg !1735
  %250 = lshr i64 %248, %249, !dbg !1735
  store i64 %250, i64* %b, align 8, !dbg !1735
  %251 = load i32* %j, align 4, !dbg !1735
  %252 = load i32* %k, align 4, !dbg !1735
  %253 = sub i32 %252, %251, !dbg !1735
  store i32 %253, i32* %k, align 4, !dbg !1735
  %254 = load %struct.huft** %td, align 8, !dbg !1737
  %255 = getelementptr inbounds %struct.huft* %254, i32 0, i32 2, !dbg !1737
  %256 = bitcast %union.anon* %255 to i16*, !dbg !1737
  %257 = load i16* %256, align 2, !dbg !1737
  %258 = zext i16 %257 to i32, !dbg !1737
  store i32 %258, i32* %j, align 4, !dbg !1737
  %259 = load i32* %j, align 4, !dbg !1738
  %260 = icmp ult i32 %259, 16, !dbg !1738
  br i1 %260, label %261, label %267, !dbg !1738

; <label>:261                                     ; preds = %236
  %262 = load i32* %j, align 4, !dbg !1739
  store i32 %262, i32* %l, align 4, !dbg !1739
  %263 = load i32* %i, align 4, !dbg !1739
  %264 = add nsw i32 %263, 1, !dbg !1739
  store i32 %264, i32* %i, align 4, !dbg !1739
  %265 = sext i32 %263 to i64, !dbg !1739
  %266 = getelementptr inbounds [316 x i32]* %ll, i32 0, i64 %265, !dbg !1739
  store i32 %262, i32* %266, align 4, !dbg !1739
  br label %438, !dbg !1739

; <label>:267                                     ; preds = %236
  %268 = load i32* %j, align 4, !dbg !1740
  %269 = icmp eq i32 %268, 16, !dbg !1740
  br i1 %269, label %270, label %325, !dbg !1740

; <label>:270                                     ; preds = %267
  br label %271, !dbg !1741

; <label>:271                                     ; preds = %287, %270
  %272 = load i32* %k, align 4, !dbg !1741
  %273 = icmp ult i32 %272, 2, !dbg !1741
  br i1 %273, label %274, label %298, !dbg !1741

; <label>:274                                     ; preds = %271
  %275 = load i32* @inptr, align 4, !dbg !1744
  %276 = load i32* @insize, align 4, !dbg !1744
  %277 = icmp ult i32 %275, %276, !dbg !1744
  br i1 %277, label %278, label %285, !dbg !1744

; <label>:278                                     ; preds = %274
  %279 = load i32* @inptr, align 4, !dbg !1744
  %280 = add i32 %279, 1, !dbg !1744
  store i32 %280, i32* @inptr, align 4, !dbg !1744
  %281 = zext i32 %279 to i64, !dbg !1744
  %282 = getelementptr inbounds [0 x i8]* @inbuf, i32 0, i64 %281, !dbg !1744
  %283 = load i8* %282, align 1, !dbg !1744
  %284 = zext i8 %283 to i32, !dbg !1744
  br label %287, !dbg !1744

; <label>:285                                     ; preds = %274
  %286 = call i32 @fill_inbuf(i32 0), !dbg !1744
  br label %287, !dbg !1744

; <label>:287                                     ; preds = %285, %278
  %288 = phi i32 [ %284, %278 ], [ %286, %285 ], !dbg !1744
  %289 = trunc i32 %288 to i8, !dbg !1744
  %290 = zext i8 %289 to i64, !dbg !1744
  %291 = load i32* %k, align 4, !dbg !1744
  %292 = zext i32 %291 to i64, !dbg !1744
  %293 = shl i64 %290, %292, !dbg !1744
  %294 = load i64* %b, align 8, !dbg !1744
  %295 = or i64 %294, %293, !dbg !1744
  store i64 %295, i64* %b, align 8, !dbg !1744
  %296 = load i32* %k, align 4, !dbg !1744
  %297 = add i32 %296, 8, !dbg !1744
  store i32 %297, i32* %k, align 4, !dbg !1744
  br label %271, !dbg !1744

; <label>:298                                     ; preds = %271
  %299 = load i64* %b, align 8, !dbg !1746
  %300 = trunc i64 %299 to i32, !dbg !1746
  %301 = and i32 %300, 3, !dbg !1746
  %302 = add i32 3, %301, !dbg !1746
  store i32 %302, i32* %j, align 4, !dbg !1746
  %303 = load i64* %b, align 8, !dbg !1747
  %304 = lshr i64 %303, 2, !dbg !1747
  store i64 %304, i64* %b, align 8, !dbg !1747
  %305 = load i32* %k, align 4, !dbg !1747
  %306 = sub i32 %305, 2, !dbg !1747
  store i32 %306, i32* %k, align 4, !dbg !1747
  %307 = load i32* %i, align 4, !dbg !1749
  %308 = load i32* %j, align 4, !dbg !1749
  %309 = add i32 %307, %308, !dbg !1749
  %310 = load i32* %n, align 4, !dbg !1749
  %311 = icmp ugt i32 %309, %310, !dbg !1749
  br i1 %311, label %312, label %313, !dbg !1749

; <label>:312                                     ; preds = %298
  store i32 1, i32* %1, !dbg !1750
  br label %493, !dbg !1750

; <label>:313                                     ; preds = %298
  br label %314, !dbg !1751

; <label>:314                                     ; preds = %318, %313
  %315 = load i32* %j, align 4, !dbg !1751
  %316 = add i32 %315, -1, !dbg !1751
  store i32 %316, i32* %j, align 4, !dbg !1751
  %317 = icmp ne i32 %315, 0, !dbg !1751
  br i1 %317, label %318, label %324, !dbg !1751

; <label>:318                                     ; preds = %314
  %319 = load i32* %l, align 4, !dbg !1752
  %320 = load i32* %i, align 4, !dbg !1752
  %321 = add nsw i32 %320, 1, !dbg !1752
  store i32 %321, i32* %i, align 4, !dbg !1752
  %322 = sext i32 %320 to i64, !dbg !1752
  %323 = getelementptr inbounds [316 x i32]* %ll, i32 0, i64 %322, !dbg !1752
  store i32 %319, i32* %323, align 4, !dbg !1752
  br label %314, !dbg !1752

; <label>:324                                     ; preds = %314
  br label %437, !dbg !1753

; <label>:325                                     ; preds = %267
  %326 = load i32* %j, align 4, !dbg !1754
  %327 = icmp eq i32 %326, 17, !dbg !1754
  br i1 %327, label %328, label %382, !dbg !1754

; <label>:328                                     ; preds = %325
  br label %329, !dbg !1755

; <label>:329                                     ; preds = %345, %328
  %330 = load i32* %k, align 4, !dbg !1755
  %331 = icmp ult i32 %330, 3, !dbg !1755
  br i1 %331, label %332, label %356, !dbg !1755

; <label>:332                                     ; preds = %329
  %333 = load i32* @inptr, align 4, !dbg !1758
  %334 = load i32* @insize, align 4, !dbg !1758
  %335 = icmp ult i32 %333, %334, !dbg !1758
  br i1 %335, label %336, label %343, !dbg !1758

; <label>:336                                     ; preds = %332
  %337 = load i32* @inptr, align 4, !dbg !1758
  %338 = add i32 %337, 1, !dbg !1758
  store i32 %338, i32* @inptr, align 4, !dbg !1758
  %339 = zext i32 %337 to i64, !dbg !1758
  %340 = getelementptr inbounds [0 x i8]* @inbuf, i32 0, i64 %339, !dbg !1758
  %341 = load i8* %340, align 1, !dbg !1758
  %342 = zext i8 %341 to i32, !dbg !1758
  br label %345, !dbg !1758

; <label>:343                                     ; preds = %332
  %344 = call i32 @fill_inbuf(i32 0), !dbg !1758
  br label %345, !dbg !1758

; <label>:345                                     ; preds = %343, %336
  %346 = phi i32 [ %342, %336 ], [ %344, %343 ], !dbg !1758
  %347 = trunc i32 %346 to i8, !dbg !1758
  %348 = zext i8 %347 to i64, !dbg !1758
  %349 = load i32* %k, align 4, !dbg !1758
  %350 = zext i32 %349 to i64, !dbg !1758
  %351 = shl i64 %348, %350, !dbg !1758
  %352 = load i64* %b, align 8, !dbg !1758
  %353 = or i64 %352, %351, !dbg !1758
  store i64 %353, i64* %b, align 8, !dbg !1758
  %354 = load i32* %k, align 4, !dbg !1758
  %355 = add i32 %354, 8, !dbg !1758
  store i32 %355, i32* %k, align 4, !dbg !1758
  br label %329, !dbg !1758

; <label>:356                                     ; preds = %329
  %357 = load i64* %b, align 8, !dbg !1760
  %358 = trunc i64 %357 to i32, !dbg !1760
  %359 = and i32 %358, 7, !dbg !1760
  %360 = add i32 3, %359, !dbg !1760
  store i32 %360, i32* %j, align 4, !dbg !1760
  %361 = load i64* %b, align 8, !dbg !1761
  %362 = lshr i64 %361, 3, !dbg !1761
  store i64 %362, i64* %b, align 8, !dbg !1761
  %363 = load i32* %k, align 4, !dbg !1761
  %364 = sub i32 %363, 3, !dbg !1761
  store i32 %364, i32* %k, align 4, !dbg !1761
  %365 = load i32* %i, align 4, !dbg !1763
  %366 = load i32* %j, align 4, !dbg !1763
  %367 = add i32 %365, %366, !dbg !1763
  %368 = load i32* %n, align 4, !dbg !1763
  %369 = icmp ugt i32 %367, %368, !dbg !1763
  br i1 %369, label %370, label %371, !dbg !1763

; <label>:370                                     ; preds = %356
  store i32 1, i32* %1, !dbg !1764
  br label %493, !dbg !1764

; <label>:371                                     ; preds = %356
  br label %372, !dbg !1765

; <label>:372                                     ; preds = %376, %371
  %373 = load i32* %j, align 4, !dbg !1765
  %374 = add i32 %373, -1, !dbg !1765
  store i32 %374, i32* %j, align 4, !dbg !1765
  %375 = icmp ne i32 %373, 0, !dbg !1765
  br i1 %375, label %376, label %381, !dbg !1765

; <label>:376                                     ; preds = %372
  %377 = load i32* %i, align 4, !dbg !1766
  %378 = add nsw i32 %377, 1, !dbg !1766
  store i32 %378, i32* %i, align 4, !dbg !1766
  %379 = sext i32 %377 to i64, !dbg !1766
  %380 = getelementptr inbounds [316 x i32]* %ll, i32 0, i64 %379, !dbg !1766
  store i32 0, i32* %380, align 4, !dbg !1766
  br label %372, !dbg !1766

; <label>:381                                     ; preds = %372
  store i32 0, i32* %l, align 4, !dbg !1767
  br label %436, !dbg !1768

; <label>:382                                     ; preds = %325
  br label %383, !dbg !1769

; <label>:383                                     ; preds = %399, %382
  %384 = load i32* %k, align 4, !dbg !1769
  %385 = icmp ult i32 %384, 7, !dbg !1769
  br i1 %385, label %386, label %410, !dbg !1769

; <label>:386                                     ; preds = %383
  %387 = load i32* @inptr, align 4, !dbg !1772
  %388 = load i32* @insize, align 4, !dbg !1772
  %389 = icmp ult i32 %387, %388, !dbg !1772
  br i1 %389, label %390, label %397, !dbg !1772

; <label>:390                                     ; preds = %386
  %391 = load i32* @inptr, align 4, !dbg !1772
  %392 = add i32 %391, 1, !dbg !1772
  store i32 %392, i32* @inptr, align 4, !dbg !1772
  %393 = zext i32 %391 to i64, !dbg !1772
  %394 = getelementptr inbounds [0 x i8]* @inbuf, i32 0, i64 %393, !dbg !1772
  %395 = load i8* %394, align 1, !dbg !1772
  %396 = zext i8 %395 to i32, !dbg !1772
  br label %399, !dbg !1772

; <label>:397                                     ; preds = %386
  %398 = call i32 @fill_inbuf(i32 0), !dbg !1772
  br label %399, !dbg !1772

; <label>:399                                     ; preds = %397, %390
  %400 = phi i32 [ %396, %390 ], [ %398, %397 ], !dbg !1772
  %401 = trunc i32 %400 to i8, !dbg !1772
  %402 = zext i8 %401 to i64, !dbg !1772
  %403 = load i32* %k, align 4, !dbg !1772
  %404 = zext i32 %403 to i64, !dbg !1772
  %405 = shl i64 %402, %404, !dbg !1772
  %406 = load i64* %b, align 8, !dbg !1772
  %407 = or i64 %406, %405, !dbg !1772
  store i64 %407, i64* %b, align 8, !dbg !1772
  %408 = load i32* %k, align 4, !dbg !1772
  %409 = add i32 %408, 8, !dbg !1772
  store i32 %409, i32* %k, align 4, !dbg !1772
  br label %383, !dbg !1772

; <label>:410                                     ; preds = %383
  %411 = load i64* %b, align 8, !dbg !1774
  %412 = trunc i64 %411 to i32, !dbg !1774
  %413 = and i32 %412, 127, !dbg !1774
  %414 = add i32 11, %413, !dbg !1774
  store i32 %414, i32* %j, align 4, !dbg !1774
  %415 = load i64* %b, align 8, !dbg !1775
  %416 = lshr i64 %415, 7, !dbg !1775
  store i64 %416, i64* %b, align 8, !dbg !1775
  %417 = load i32* %k, align 4, !dbg !1775
  %418 = sub i32 %417, 7, !dbg !1775
  store i32 %418, i32* %k, align 4, !dbg !1775
  %419 = load i32* %i, align 4, !dbg !1777
  %420 = load i32* %j, align 4, !dbg !1777
  %421 = add i32 %419, %420, !dbg !1777
  %422 = load i32* %n, align 4, !dbg !1777
  %423 = icmp ugt i32 %421, %422, !dbg !1777
  br i1 %423, label %424, label %425, !dbg !1777

; <label>:424                                     ; preds = %410
  store i32 1, i32* %1, !dbg !1778
  br label %493, !dbg !1778

; <label>:425                                     ; preds = %410
  br label %426, !dbg !1779

; <label>:426                                     ; preds = %430, %425
  %427 = load i32* %j, align 4, !dbg !1779
  %428 = add i32 %427, -1, !dbg !1779
  store i32 %428, i32* %j, align 4, !dbg !1779
  %429 = icmp ne i32 %427, 0, !dbg !1779
  br i1 %429, label %430, label %435, !dbg !1779

; <label>:430                                     ; preds = %426
  %431 = load i32* %i, align 4, !dbg !1780
  %432 = add nsw i32 %431, 1, !dbg !1780
  store i32 %432, i32* %i, align 4, !dbg !1780
  %433 = sext i32 %431 to i64, !dbg !1780
  %434 = getelementptr inbounds [316 x i32]* %ll, i32 0, i64 %433, !dbg !1780
  store i32 0, i32* %434, align 4, !dbg !1780
  br label %426, !dbg !1780

; <label>:435                                     ; preds = %426
  store i32 0, i32* %l, align 4, !dbg !1781
  br label %436

; <label>:436                                     ; preds = %435, %381
  br label %437

; <label>:437                                     ; preds = %436, %324
  br label %438

; <label>:438                                     ; preds = %437, %261
  br label %203, !dbg !1782

; <label>:439                                     ; preds = %203
  %440 = load %struct.huft** %tl, align 8, !dbg !1783
  %441 = call i32 (...)* bitcast (i32 (%struct.huft*)* @huft_free to i32 (...)*)(%struct.huft* %440), !dbg !1783
  %442 = load i64* %b, align 8, !dbg !1784
  store i64 %442, i64* @bb, align 8, !dbg !1784
  %443 = load i32* %k, align 4, !dbg !1785
  store i32 %443, i32* @bk, align 4, !dbg !1785
  %444 = load i32* @lbits, align 4, !dbg !1786
  store i32 %444, i32* %bl, align 4, !dbg !1786
  %445 = getelementptr inbounds [316 x i32]* %ll, i32 0, i32 0, !dbg !1787
  %446 = load i32* %nl, align 4, !dbg !1787
  %447 = call i32 (...)* bitcast (i32 (i32*, i32, i32, i16*, i16*, %struct.huft**, i32*)* @huft_build to i32 (...)*)(i32* %445, i32 %446, i32 257, i16* getelementptr inbounds ([31 x i16]* @cplens, i32 0, i32 0), i16* getelementptr inbounds ([31 x i16]* @cplext, i32 0, i32 0), %struct.huft** %tl, i32* %bl), !dbg !1787
  store i32 %447, i32* %i, align 4, !dbg !1787
  %448 = icmp ne i32 %447, 0, !dbg !1787
  br i1 %448, label %449, label %459, !dbg !1787

; <label>:449                                     ; preds = %439
  %450 = load i32* %i, align 4, !dbg !1788
  %451 = icmp eq i32 %450, 1, !dbg !1788
  br i1 %451, label %452, label %457, !dbg !1788

; <label>:452                                     ; preds = %449
  %453 = load %struct.__sFILE** @__stderrp, align 8, !dbg !1790
  %454 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %453, i8* getelementptr inbounds ([26 x i8]* @.str11, i32 0, i32 0)), !dbg !1790
  %455 = load %struct.huft** %tl, align 8, !dbg !1792
  %456 = call i32 (...)* bitcast (i32 (%struct.huft*)* @huft_free to i32 (...)*)(%struct.huft* %455), !dbg !1792
  br label %457, !dbg !1793

; <label>:457                                     ; preds = %452, %449
  %458 = load i32* %i, align 4, !dbg !1794
  store i32 %458, i32* %1, !dbg !1794
  br label %493, !dbg !1794

; <label>:459                                     ; preds = %439
  %460 = load i32* @dbits, align 4, !dbg !1795
  store i32 %460, i32* %bd, align 4, !dbg !1795
  %461 = getelementptr inbounds [316 x i32]* %ll, i32 0, i32 0, !dbg !1796
  %462 = load i32* %nl, align 4, !dbg !1796
  %463 = zext i32 %462 to i64, !dbg !1796
  %464 = getelementptr inbounds i32* %461, i64 %463, !dbg !1796
  %465 = load i32* %nd, align 4, !dbg !1796
  %466 = call i32 (...)* bitcast (i32 (i32*, i32, i32, i16*, i16*, %struct.huft**, i32*)* @huft_build to i32 (...)*)(i32* %464, i32 %465, i32 0, i16* getelementptr inbounds ([30 x i16]* @cpdist, i32 0, i32 0), i16* getelementptr inbounds ([30 x i16]* @cpdext, i32 0, i32 0), %struct.huft** %td, i32* %bd), !dbg !1796
  store i32 %466, i32* %i, align 4, !dbg !1796
  %467 = icmp ne i32 %466, 0, !dbg !1796
  br i1 %467, label %468, label %480, !dbg !1796

; <label>:468                                     ; preds = %459
  %469 = load i32* %i, align 4, !dbg !1797
  %470 = icmp eq i32 %469, 1, !dbg !1797
  br i1 %470, label %471, label %476, !dbg !1797

; <label>:471                                     ; preds = %468
  %472 = load %struct.__sFILE** @__stderrp, align 8, !dbg !1799
  %473 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %472, i8* getelementptr inbounds ([27 x i8]* @.str112, i32 0, i32 0)), !dbg !1799
  %474 = load %struct.huft** %td, align 8, !dbg !1801
  %475 = call i32 (...)* bitcast (i32 (%struct.huft*)* @huft_free to i32 (...)*)(%struct.huft* %474), !dbg !1801
  br label %476, !dbg !1802

; <label>:476                                     ; preds = %471, %468
  %477 = load %struct.huft** %tl, align 8, !dbg !1803
  %478 = call i32 (...)* bitcast (i32 (%struct.huft*)* @huft_free to i32 (...)*)(%struct.huft* %477), !dbg !1803
  %479 = load i32* %i, align 4, !dbg !1804
  store i32 %479, i32* %1, !dbg !1804
  br label %493, !dbg !1804

; <label>:480                                     ; preds = %459
  %481 = load %struct.huft** %tl, align 8, !dbg !1805
  %482 = load %struct.huft** %td, align 8, !dbg !1805
  %483 = load i32* %bl, align 4, !dbg !1805
  %484 = load i32* %bd, align 4, !dbg !1805
  %485 = call i32 (...)* bitcast (i32 (%struct.huft*, %struct.huft*, i32, i32)* @inflate_codes to i32 (...)*)(%struct.huft* %481, %struct.huft* %482, i32 %483, i32 %484), !dbg !1805
  %486 = icmp ne i32 %485, 0, !dbg !1805
  br i1 %486, label %487, label %488, !dbg !1805

; <label>:487                                     ; preds = %480
  store i32 1, i32* %1, !dbg !1806
  br label %493, !dbg !1806

; <label>:488                                     ; preds = %480
  %489 = load %struct.huft** %tl, align 8, !dbg !1807
  %490 = call i32 (...)* bitcast (i32 (%struct.huft*)* @huft_free to i32 (...)*)(%struct.huft* %489), !dbg !1807
  %491 = load %struct.huft** %td, align 8, !dbg !1808
  %492 = call i32 (...)* bitcast (i32 (%struct.huft*)* @huft_free to i32 (...)*)(%struct.huft* %491), !dbg !1808
  store i32 0, i32* %1, !dbg !1809
  br label %493, !dbg !1809

; <label>:493                                     ; preds = %488, %487, %476, %457, %424, %370, %312, %192, %117
  %494 = load i32* %1, !dbg !1810
  ret i32 %494, !dbg !1810
}

define i32 @inflate_block(i32* %e) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32*, align 8
  %t = alloca i32, align 4
  %b = alloca i64, align 8
  %k = alloca i32, align 4
  store i32* %e, i32** %2, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !1811), !dbg !1812
  call void @llvm.dbg.declare(metadata !22, metadata !1813), !dbg !1815
  call void @llvm.dbg.declare(metadata !22, metadata !1816), !dbg !1817
  call void @llvm.dbg.declare(metadata !22, metadata !1818), !dbg !1819
  %3 = load i64* @bb, align 8, !dbg !1820
  store i64 %3, i64* %b, align 8, !dbg !1820
  %4 = load i32* @bk, align 4, !dbg !1821
  store i32 %4, i32* %k, align 4, !dbg !1821
  br label %5, !dbg !1822

; <label>:5                                       ; preds = %21, %0
  %6 = load i32* %k, align 4, !dbg !1822
  %7 = icmp ult i32 %6, 1, !dbg !1822
  br i1 %7, label %8, label %32, !dbg !1822

; <label>:8                                       ; preds = %5
  %9 = load i32* @inptr, align 4, !dbg !1824
  %10 = load i32* @insize, align 4, !dbg !1824
  %11 = icmp ult i32 %9, %10, !dbg !1824
  br i1 %11, label %12, label %19, !dbg !1824

; <label>:12                                      ; preds = %8
  %13 = load i32* @inptr, align 4, !dbg !1824
  %14 = add i32 %13, 1, !dbg !1824
  store i32 %14, i32* @inptr, align 4, !dbg !1824
  %15 = zext i32 %13 to i64, !dbg !1824
  %16 = getelementptr inbounds [0 x i8]* @inbuf, i32 0, i64 %15, !dbg !1824
  %17 = load i8* %16, align 1, !dbg !1824
  %18 = zext i8 %17 to i32, !dbg !1824
  br label %21, !dbg !1824

; <label>:19                                      ; preds = %8
  %20 = call i32 @fill_inbuf(i32 0), !dbg !1824
  br label %21, !dbg !1824

; <label>:21                                      ; preds = %19, %12
  %22 = phi i32 [ %18, %12 ], [ %20, %19 ], !dbg !1824
  %23 = trunc i32 %22 to i8, !dbg !1824
  %24 = zext i8 %23 to i64, !dbg !1824
  %25 = load i32* %k, align 4, !dbg !1824
  %26 = zext i32 %25 to i64, !dbg !1824
  %27 = shl i64 %24, %26, !dbg !1824
  %28 = load i64* %b, align 8, !dbg !1824
  %29 = or i64 %28, %27, !dbg !1824
  store i64 %29, i64* %b, align 8, !dbg !1824
  %30 = load i32* %k, align 4, !dbg !1824
  %31 = add i32 %30, 8, !dbg !1824
  store i32 %31, i32* %k, align 4, !dbg !1824
  br label %5, !dbg !1824

; <label>:32                                      ; preds = %5
  %33 = load i64* %b, align 8, !dbg !1826
  %34 = trunc i64 %33 to i32, !dbg !1826
  %35 = and i32 %34, 1, !dbg !1826
  %36 = load i32** %2, align 8, !dbg !1826
  store i32 %35, i32* %36, align 4, !dbg !1826
  %37 = load i64* %b, align 8, !dbg !1827
  %38 = lshr i64 %37, 1, !dbg !1827
  store i64 %38, i64* %b, align 8, !dbg !1827
  %39 = load i32* %k, align 4, !dbg !1827
  %40 = sub i32 %39, 1, !dbg !1827
  store i32 %40, i32* %k, align 4, !dbg !1827
  br label %41, !dbg !1829

; <label>:41                                      ; preds = %57, %32
  %42 = load i32* %k, align 4, !dbg !1829
  %43 = icmp ult i32 %42, 2, !dbg !1829
  br i1 %43, label %44, label %68, !dbg !1829

; <label>:44                                      ; preds = %41
  %45 = load i32* @inptr, align 4, !dbg !1831
  %46 = load i32* @insize, align 4, !dbg !1831
  %47 = icmp ult i32 %45, %46, !dbg !1831
  br i1 %47, label %48, label %55, !dbg !1831

; <label>:48                                      ; preds = %44
  %49 = load i32* @inptr, align 4, !dbg !1831
  %50 = add i32 %49, 1, !dbg !1831
  store i32 %50, i32* @inptr, align 4, !dbg !1831
  %51 = zext i32 %49 to i64, !dbg !1831
  %52 = getelementptr inbounds [0 x i8]* @inbuf, i32 0, i64 %51, !dbg !1831
  %53 = load i8* %52, align 1, !dbg !1831
  %54 = zext i8 %53 to i32, !dbg !1831
  br label %57, !dbg !1831

; <label>:55                                      ; preds = %44
  %56 = call i32 @fill_inbuf(i32 0), !dbg !1831
  br label %57, !dbg !1831

; <label>:57                                      ; preds = %55, %48
  %58 = phi i32 [ %54, %48 ], [ %56, %55 ], !dbg !1831
  %59 = trunc i32 %58 to i8, !dbg !1831
  %60 = zext i8 %59 to i64, !dbg !1831
  %61 = load i32* %k, align 4, !dbg !1831
  %62 = zext i32 %61 to i64, !dbg !1831
  %63 = shl i64 %60, %62, !dbg !1831
  %64 = load i64* %b, align 8, !dbg !1831
  %65 = or i64 %64, %63, !dbg !1831
  store i64 %65, i64* %b, align 8, !dbg !1831
  %66 = load i32* %k, align 4, !dbg !1831
  %67 = add i32 %66, 8, !dbg !1831
  store i32 %67, i32* %k, align 4, !dbg !1831
  br label %41, !dbg !1831

; <label>:68                                      ; preds = %41
  %69 = load i64* %b, align 8, !dbg !1833
  %70 = trunc i64 %69 to i32, !dbg !1833
  %71 = and i32 %70, 3, !dbg !1833
  store i32 %71, i32* %t, align 4, !dbg !1833
  %72 = load i64* %b, align 8, !dbg !1834
  %73 = lshr i64 %72, 2, !dbg !1834
  store i64 %73, i64* %b, align 8, !dbg !1834
  %74 = load i32* %k, align 4, !dbg !1834
  %75 = sub i32 %74, 2, !dbg !1834
  store i32 %75, i32* %k, align 4, !dbg !1834
  %76 = load i64* %b, align 8, !dbg !1836
  store i64 %76, i64* @bb, align 8, !dbg !1836
  %77 = load i32* %k, align 4, !dbg !1837
  store i32 %77, i32* @bk, align 4, !dbg !1837
  %78 = load i32* %t, align 4, !dbg !1838
  %79 = icmp eq i32 %78, 2, !dbg !1838
  br i1 %79, label %80, label %82, !dbg !1838

; <label>:80                                      ; preds = %68
  %81 = call i32 @inflate_dynamic(), !dbg !1839
  store i32 %81, i32* %1, !dbg !1839
  br label %93, !dbg !1839

; <label>:82                                      ; preds = %68
  %83 = load i32* %t, align 4, !dbg !1840
  %84 = icmp eq i32 %83, 0, !dbg !1840
  br i1 %84, label %85, label %87, !dbg !1840

; <label>:85                                      ; preds = %82
  %86 = call i32 @inflate_stored(), !dbg !1841
  store i32 %86, i32* %1, !dbg !1841
  br label %93, !dbg !1841

; <label>:87                                      ; preds = %82
  %88 = load i32* %t, align 4, !dbg !1842
  %89 = icmp eq i32 %88, 1, !dbg !1842
  br i1 %89, label %90, label %92, !dbg !1842

; <label>:90                                      ; preds = %87
  %91 = call i32 @inflate_fixed(), !dbg !1843
  store i32 %91, i32* %1, !dbg !1843
  br label %93, !dbg !1843

; <label>:92                                      ; preds = %87
  store i32 2, i32* %1, !dbg !1844
  br label %93, !dbg !1844

; <label>:93                                      ; preds = %92, %90, %85, %80
  %94 = load i32* %1, !dbg !1845
  ret i32 %94, !dbg !1845
}

define i32 @inflate() nounwind uwtable {
  %1 = alloca i32, align 4
  %e = alloca i32, align 4
  %r = alloca i32, align 4
  %h = alloca i32, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !1846), !dbg !1848
  call void @llvm.dbg.declare(metadata !22, metadata !1849), !dbg !1850
  call void @llvm.dbg.declare(metadata !22, metadata !1851), !dbg !1852
  store i32 0, i32* @outcnt, align 4, !dbg !1853
  store i32 0, i32* @bk, align 4, !dbg !1854
  store i64 0, i64* @bb, align 8, !dbg !1855
  store i32 0, i32* %h, align 4, !dbg !1856
  br label %2, !dbg !1857

; <label>:2                                       ; preds = %14, %0
  store i32 0, i32* @hufts, align 4, !dbg !1858
  %3 = call i32 (...)* bitcast (i32 (i32*)* @inflate_block to i32 (...)*)(i32* %e), !dbg !1860
  store i32 %3, i32* %r, align 4, !dbg !1860
  %4 = icmp ne i32 %3, 0, !dbg !1860
  br i1 %4, label %5, label %7, !dbg !1860

; <label>:5                                       ; preds = %2
  %6 = load i32* %r, align 4, !dbg !1861
  store i32 %6, i32* %1, !dbg !1861
  br label %29, !dbg !1861

; <label>:7                                       ; preds = %2
  %8 = load i32* @hufts, align 4, !dbg !1862
  %9 = load i32* %h, align 4, !dbg !1862
  %10 = icmp ugt i32 %8, %9, !dbg !1862
  br i1 %10, label %11, label %13, !dbg !1862

; <label>:11                                      ; preds = %7
  %12 = load i32* @hufts, align 4, !dbg !1863
  store i32 %12, i32* %h, align 4, !dbg !1863
  br label %13, !dbg !1863

; <label>:13                                      ; preds = %11, %7
  br label %14, !dbg !1864

; <label>:14                                      ; preds = %13
  %15 = load i32* %e, align 4, !dbg !1864
  %16 = icmp ne i32 %15, 0, !dbg !1864
  %17 = xor i1 %16, true, !dbg !1864
  br i1 %17, label %2, label %18, !dbg !1864

; <label>:18                                      ; preds = %14
  br label %19, !dbg !1865

; <label>:19                                      ; preds = %22, %18
  %20 = load i32* @bk, align 4, !dbg !1865
  %21 = icmp uge i32 %20, 8, !dbg !1865
  br i1 %21, label %22, label %27, !dbg !1865

; <label>:22                                      ; preds = %19
  %23 = load i32* @bk, align 4, !dbg !1866
  %24 = sub i32 %23, 8, !dbg !1866
  store i32 %24, i32* @bk, align 4, !dbg !1866
  %25 = load i32* @inptr, align 4, !dbg !1868
  %26 = add i32 %25, -1, !dbg !1868
  store i32 %26, i32* @inptr, align 4, !dbg !1868
  br label %19, !dbg !1869

; <label>:27                                      ; preds = %19
  %28 = load i32* @outcnt, align 4, !dbg !1870
  store i32 %28, i32* @outcnt, align 4, !dbg !1870
  call void @flush_window(), !dbg !1870
  store i32 0, i32* %1, !dbg !1871
  br label %29, !dbg !1871

; <label>:29                                      ; preds = %27, %5
  %30 = load i32* %1, !dbg !1872
  ret i32 %30, !dbg !1872
}

define i32 @lzw(i32 %in, i32 %out) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %in, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !1873), !dbg !1874
  store i32 %out, i32* %3, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !1875), !dbg !1876
  %4 = load i32* @msg_done, align 4, !dbg !1877
  %5 = icmp ne i32 %4, 0, !dbg !1877
  br i1 %5, label %6, label %7, !dbg !1877

; <label>:6                                       ; preds = %0
  store i32 1, i32* %1, !dbg !1879
  br label %15, !dbg !1879

; <label>:7                                       ; preds = %0
  store i32 1, i32* @msg_done, align 4, !dbg !1880
  %8 = load %struct.__sFILE** @__stderrp, align 8, !dbg !1881
  %9 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %8, i8* getelementptr inbounds ([44 x i8]* @.str13, i32 0, i32 0)), !dbg !1881
  %10 = load i32* %2, align 4, !dbg !1882
  %11 = load i32* %3, align 4, !dbg !1882
  %12 = icmp ne i32 %10, %11, !dbg !1882
  br i1 %12, label %13, label %14, !dbg !1882

; <label>:13                                      ; preds = %7
  store i32 1, i32* @exit_code, align 4, !dbg !1883
  br label %14, !dbg !1885

; <label>:14                                      ; preds = %13, %7
  store i32 1, i32* %1, !dbg !1886
  br label %15, !dbg !1886

; <label>:15                                      ; preds = %14, %6
  %16 = load i32* %1, !dbg !1887
  ret i32 %16, !dbg !1887
}

define void @ct_init(i16* %attr, i32* %methodp) nounwind uwtable {
  %1 = alloca i16*, align 8
  %2 = alloca i32*, align 8
  %n = alloca i32, align 4
  %bits = alloca i32, align 4
  %length = alloca i32, align 4
  %code = alloca i32, align 4
  %dist = alloca i32, align 4
  store i16* %attr, i16** %1, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !1888), !dbg !1889
  store i32* %methodp, i32** %2, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !1890), !dbg !1891
  call void @llvm.dbg.declare(metadata !22, metadata !1892), !dbg !1894
  call void @llvm.dbg.declare(metadata !22, metadata !1895), !dbg !1896
  call void @llvm.dbg.declare(metadata !22, metadata !1897), !dbg !1898
  call void @llvm.dbg.declare(metadata !22, metadata !1899), !dbg !1900
  call void @llvm.dbg.declare(metadata !22, metadata !1901), !dbg !1902
  %3 = load i16** %1, align 8, !dbg !1903
  store i16* %3, i16** @file_type, align 8, !dbg !1903
  %4 = load i32** %2, align 8, !dbg !1904
  store i32* %4, i32** @file_method, align 8, !dbg !1904
  store i64 0, i64* @input_len, align 8, !dbg !1905
  store i64 0, i64* @compressed_len, align 8, !dbg !1905
  %5 = load i16* getelementptr inbounds ([30 x %struct.ct_data]* @static_dtree, i32 0, i64 0, i32 1, i32 0), align 2, !dbg !1906
  %6 = zext i16 %5 to i32, !dbg !1906
  %7 = icmp ne i32 %6, 0, !dbg !1906
  br i1 %7, label %8, label %9, !dbg !1906

; <label>:8                                       ; preds = %0
  br label %198, !dbg !1907

; <label>:9                                       ; preds = %0
  store i32 0, i32* %length, align 4, !dbg !1908
  store i32 0, i32* %code, align 4, !dbg !1909
  br label %10, !dbg !1909

; <label>:10                                      ; preds = %37, %9
  %11 = load i32* %code, align 4, !dbg !1909
  %12 = icmp slt i32 %11, 28, !dbg !1909
  br i1 %12, label %13, label %40, !dbg !1909

; <label>:13                                      ; preds = %10
  %14 = load i32* %length, align 4, !dbg !1911
  %15 = load i32* %code, align 4, !dbg !1911
  %16 = sext i32 %15 to i64, !dbg !1911
  %17 = getelementptr inbounds [29 x i32]* @base_length, i32 0, i64 %16, !dbg !1911
  store i32 %14, i32* %17, align 4, !dbg !1911
  store i32 0, i32* %n, align 4, !dbg !1913
  br label %18, !dbg !1913

; <label>:18                                      ; preds = %33, %13
  %19 = load i32* %n, align 4, !dbg !1913
  %20 = load i32* %code, align 4, !dbg !1913
  %21 = sext i32 %20 to i64, !dbg !1913
  %22 = getelementptr inbounds [29 x i32]* @extra_lbits, i32 0, i64 %21, !dbg !1913
  %23 = load i32* %22, align 4, !dbg !1913
  %24 = shl i32 1, %23, !dbg !1913
  %25 = icmp slt i32 %19, %24, !dbg !1913
  br i1 %25, label %26, label %36, !dbg !1913

; <label>:26                                      ; preds = %18
  %27 = load i32* %code, align 4, !dbg !1915
  %28 = trunc i32 %27 to i8, !dbg !1915
  %29 = load i32* %length, align 4, !dbg !1915
  %30 = add nsw i32 %29, 1, !dbg !1915
  store i32 %30, i32* %length, align 4, !dbg !1915
  %31 = sext i32 %29 to i64, !dbg !1915
  %32 = getelementptr inbounds [256 x i8]* @length_code, i32 0, i64 %31, !dbg !1915
  store i8 %28, i8* %32, align 1, !dbg !1915
  br label %33, !dbg !1917

; <label>:33                                      ; preds = %26
  %34 = load i32* %n, align 4, !dbg !1918
  %35 = add nsw i32 %34, 1, !dbg !1918
  store i32 %35, i32* %n, align 4, !dbg !1918
  br label %18, !dbg !1918

; <label>:36                                      ; preds = %18
  br label %37, !dbg !1919

; <label>:37                                      ; preds = %36
  %38 = load i32* %code, align 4, !dbg !1920
  %39 = add nsw i32 %38, 1, !dbg !1920
  store i32 %39, i32* %code, align 4, !dbg !1920
  br label %10, !dbg !1920

; <label>:40                                      ; preds = %10
  %41 = load i32* %code, align 4, !dbg !1921
  %42 = trunc i32 %41 to i8, !dbg !1921
  %43 = load i32* %length, align 4, !dbg !1921
  %44 = sub nsw i32 %43, 1, !dbg !1921
  %45 = sext i32 %44 to i64, !dbg !1921
  %46 = getelementptr inbounds [256 x i8]* @length_code, i32 0, i64 %45, !dbg !1921
  store i8 %42, i8* %46, align 1, !dbg !1921
  store i32 0, i32* %dist, align 4, !dbg !1922
  store i32 0, i32* %code, align 4, !dbg !1923
  br label %47, !dbg !1923

; <label>:47                                      ; preds = %74, %40
  %48 = load i32* %code, align 4, !dbg !1923
  %49 = icmp slt i32 %48, 16, !dbg !1923
  br i1 %49, label %50, label %77, !dbg !1923

; <label>:50                                      ; preds = %47
  %51 = load i32* %dist, align 4, !dbg !1925
  %52 = load i32* %code, align 4, !dbg !1925
  %53 = sext i32 %52 to i64, !dbg !1925
  %54 = getelementptr inbounds [30 x i32]* @base_dist, i32 0, i64 %53, !dbg !1925
  store i32 %51, i32* %54, align 4, !dbg !1925
  store i32 0, i32* %n, align 4, !dbg !1927
  br label %55, !dbg !1927

; <label>:55                                      ; preds = %70, %50
  %56 = load i32* %n, align 4, !dbg !1927
  %57 = load i32* %code, align 4, !dbg !1927
  %58 = sext i32 %57 to i64, !dbg !1927
  %59 = getelementptr inbounds [30 x i32]* @extra_dbits, i32 0, i64 %58, !dbg !1927
  %60 = load i32* %59, align 4, !dbg !1927
  %61 = shl i32 1, %60, !dbg !1927
  %62 = icmp slt i32 %56, %61, !dbg !1927
  br i1 %62, label %63, label %73, !dbg !1927

; <label>:63                                      ; preds = %55
  %64 = load i32* %code, align 4, !dbg !1929
  %65 = trunc i32 %64 to i8, !dbg !1929
  %66 = load i32* %dist, align 4, !dbg !1929
  %67 = add nsw i32 %66, 1, !dbg !1929
  store i32 %67, i32* %dist, align 4, !dbg !1929
  %68 = sext i32 %66 to i64, !dbg !1929
  %69 = getelementptr inbounds [512 x i8]* @dist_code, i32 0, i64 %68, !dbg !1929
  store i8 %65, i8* %69, align 1, !dbg !1929
  br label %70, !dbg !1931

; <label>:70                                      ; preds = %63
  %71 = load i32* %n, align 4, !dbg !1932
  %72 = add nsw i32 %71, 1, !dbg !1932
  store i32 %72, i32* %n, align 4, !dbg !1932
  br label %55, !dbg !1932

; <label>:73                                      ; preds = %55
  br label %74, !dbg !1933

; <label>:74                                      ; preds = %73
  %75 = load i32* %code, align 4, !dbg !1934
  %76 = add nsw i32 %75, 1, !dbg !1934
  store i32 %76, i32* %code, align 4, !dbg !1934
  br label %47, !dbg !1934

; <label>:77                                      ; preds = %47
  %78 = load i32* %dist, align 4, !dbg !1935
  %79 = ashr i32 %78, 7, !dbg !1935
  store i32 %79, i32* %dist, align 4, !dbg !1935
  br label %80, !dbg !1936

; <label>:80                                      ; preds = %110, %77
  %81 = load i32* %code, align 4, !dbg !1936
  %82 = icmp slt i32 %81, 30, !dbg !1936
  br i1 %82, label %83, label %113, !dbg !1936

; <label>:83                                      ; preds = %80
  %84 = load i32* %dist, align 4, !dbg !1938
  %85 = shl i32 %84, 7, !dbg !1938
  %86 = load i32* %code, align 4, !dbg !1938
  %87 = sext i32 %86 to i64, !dbg !1938
  %88 = getelementptr inbounds [30 x i32]* @base_dist, i32 0, i64 %87, !dbg !1938
  store i32 %85, i32* %88, align 4, !dbg !1938
  store i32 0, i32* %n, align 4, !dbg !1940
  br label %89, !dbg !1940

; <label>:89                                      ; preds = %106, %83
  %90 = load i32* %n, align 4, !dbg !1940
  %91 = load i32* %code, align 4, !dbg !1940
  %92 = sext i32 %91 to i64, !dbg !1940
  %93 = getelementptr inbounds [30 x i32]* @extra_dbits, i32 0, i64 %92, !dbg !1940
  %94 = load i32* %93, align 4, !dbg !1940
  %95 = sub nsw i32 %94, 7, !dbg !1940
  %96 = shl i32 1, %95, !dbg !1940
  %97 = icmp slt i32 %90, %96, !dbg !1940
  br i1 %97, label %98, label %109, !dbg !1940

; <label>:98                                      ; preds = %89
  %99 = load i32* %code, align 4, !dbg !1942
  %100 = trunc i32 %99 to i8, !dbg !1942
  %101 = load i32* %dist, align 4, !dbg !1942
  %102 = add nsw i32 %101, 1, !dbg !1942
  store i32 %102, i32* %dist, align 4, !dbg !1942
  %103 = add nsw i32 256, %101, !dbg !1942
  %104 = sext i32 %103 to i64, !dbg !1942
  %105 = getelementptr inbounds [512 x i8]* @dist_code, i32 0, i64 %104, !dbg !1942
  store i8 %100, i8* %105, align 1, !dbg !1942
  br label %106, !dbg !1944

; <label>:106                                     ; preds = %98
  %107 = load i32* %n, align 4, !dbg !1945
  %108 = add nsw i32 %107, 1, !dbg !1945
  store i32 %108, i32* %n, align 4, !dbg !1945
  br label %89, !dbg !1945

; <label>:109                                     ; preds = %89
  br label %110, !dbg !1946

; <label>:110                                     ; preds = %109
  %111 = load i32* %code, align 4, !dbg !1947
  %112 = add nsw i32 %111, 1, !dbg !1947
  store i32 %112, i32* %code, align 4, !dbg !1947
  br label %80, !dbg !1947

; <label>:113                                     ; preds = %80
  store i32 0, i32* %bits, align 4, !dbg !1948
  br label %114, !dbg !1948

; <label>:114                                     ; preds = %121, %113
  %115 = load i32* %bits, align 4, !dbg !1948
  %116 = icmp sle i32 %115, 15, !dbg !1948
  br i1 %116, label %117, label %124, !dbg !1948

; <label>:117                                     ; preds = %114
  %118 = load i32* %bits, align 4, !dbg !1950
  %119 = sext i32 %118 to i64, !dbg !1950
  %120 = getelementptr inbounds [16 x i16]* @bl_count, i32 0, i64 %119, !dbg !1950
  store i16 0, i16* %120, align 2, !dbg !1950
  br label %121, !dbg !1950

; <label>:121                                     ; preds = %117
  %122 = load i32* %bits, align 4, !dbg !1951
  %123 = add nsw i32 %122, 1, !dbg !1951
  store i32 %123, i32* %bits, align 4, !dbg !1951
  br label %114, !dbg !1951

; <label>:124                                     ; preds = %114
  store i32 0, i32* %n, align 4, !dbg !1952
  br label %125, !dbg !1953

; <label>:125                                     ; preds = %128, %124
  %126 = load i32* %n, align 4, !dbg !1953
  %127 = icmp sle i32 %126, 143, !dbg !1953
  br i1 %127, label %128, label %137, !dbg !1953

; <label>:128                                     ; preds = %125
  %129 = load i32* %n, align 4, !dbg !1954
  %130 = add nsw i32 %129, 1, !dbg !1954
  store i32 %130, i32* %n, align 4, !dbg !1954
  %131 = sext i32 %129 to i64, !dbg !1954
  %132 = getelementptr inbounds [288 x %struct.ct_data]* @static_ltree, i32 0, i64 %131, !dbg !1954
  %133 = getelementptr inbounds %struct.ct_data* %132, i32 0, i32 1, !dbg !1954
  %134 = bitcast %union.anon.0* %133 to i16*, !dbg !1954
  store i16 8, i16* %134, align 2, !dbg !1954
  %135 = load i16* getelementptr inbounds ([16 x i16]* @bl_count, i32 0, i64 8), align 2, !dbg !1954
  %136 = add i16 %135, 1, !dbg !1954
  store i16 %136, i16* getelementptr inbounds ([16 x i16]* @bl_count, i32 0, i64 8), align 2, !dbg !1954
  br label %125, !dbg !1954

; <label>:137                                     ; preds = %125
  br label %138, !dbg !1955

; <label>:138                                     ; preds = %141, %137
  %139 = load i32* %n, align 4, !dbg !1955
  %140 = icmp sle i32 %139, 255, !dbg !1955
  br i1 %140, label %141, label %150, !dbg !1955

; <label>:141                                     ; preds = %138
  %142 = load i32* %n, align 4, !dbg !1956
  %143 = add nsw i32 %142, 1, !dbg !1956
  store i32 %143, i32* %n, align 4, !dbg !1956
  %144 = sext i32 %142 to i64, !dbg !1956
  %145 = getelementptr inbounds [288 x %struct.ct_data]* @static_ltree, i32 0, i64 %144, !dbg !1956
  %146 = getelementptr inbounds %struct.ct_data* %145, i32 0, i32 1, !dbg !1956
  %147 = bitcast %union.anon.0* %146 to i16*, !dbg !1956
  store i16 9, i16* %147, align 2, !dbg !1956
  %148 = load i16* getelementptr inbounds ([16 x i16]* @bl_count, i32 0, i64 9), align 2, !dbg !1956
  %149 = add i16 %148, 1, !dbg !1956
  store i16 %149, i16* getelementptr inbounds ([16 x i16]* @bl_count, i32 0, i64 9), align 2, !dbg !1956
  br label %138, !dbg !1956

; <label>:150                                     ; preds = %138
  br label %151, !dbg !1957

; <label>:151                                     ; preds = %154, %150
  %152 = load i32* %n, align 4, !dbg !1957
  %153 = icmp sle i32 %152, 279, !dbg !1957
  br i1 %153, label %154, label %163, !dbg !1957

; <label>:154                                     ; preds = %151
  %155 = load i32* %n, align 4, !dbg !1958
  %156 = add nsw i32 %155, 1, !dbg !1958
  store i32 %156, i32* %n, align 4, !dbg !1958
  %157 = sext i32 %155 to i64, !dbg !1958
  %158 = getelementptr inbounds [288 x %struct.ct_data]* @static_ltree, i32 0, i64 %157, !dbg !1958
  %159 = getelementptr inbounds %struct.ct_data* %158, i32 0, i32 1, !dbg !1958
  %160 = bitcast %union.anon.0* %159 to i16*, !dbg !1958
  store i16 7, i16* %160, align 2, !dbg !1958
  %161 = load i16* getelementptr inbounds ([16 x i16]* @bl_count, i32 0, i64 7), align 2, !dbg !1958
  %162 = add i16 %161, 1, !dbg !1958
  store i16 %162, i16* getelementptr inbounds ([16 x i16]* @bl_count, i32 0, i64 7), align 2, !dbg !1958
  br label %151, !dbg !1958

; <label>:163                                     ; preds = %151
  br label %164, !dbg !1959

; <label>:164                                     ; preds = %167, %163
  %165 = load i32* %n, align 4, !dbg !1959
  %166 = icmp sle i32 %165, 287, !dbg !1959
  br i1 %166, label %167, label %176, !dbg !1959

; <label>:167                                     ; preds = %164
  %168 = load i32* %n, align 4, !dbg !1960
  %169 = add nsw i32 %168, 1, !dbg !1960
  store i32 %169, i32* %n, align 4, !dbg !1960
  %170 = sext i32 %168 to i64, !dbg !1960
  %171 = getelementptr inbounds [288 x %struct.ct_data]* @static_ltree, i32 0, i64 %170, !dbg !1960
  %172 = getelementptr inbounds %struct.ct_data* %171, i32 0, i32 1, !dbg !1960
  %173 = bitcast %union.anon.0* %172 to i16*, !dbg !1960
  store i16 8, i16* %173, align 2, !dbg !1960
  %174 = load i16* getelementptr inbounds ([16 x i16]* @bl_count, i32 0, i64 8), align 2, !dbg !1960
  %175 = add i16 %174, 1, !dbg !1960
  store i16 %175, i16* getelementptr inbounds ([16 x i16]* @bl_count, i32 0, i64 8), align 2, !dbg !1960
  br label %164, !dbg !1960

; <label>:176                                     ; preds = %164
  call void @gen_codes(%struct.ct_data* getelementptr inbounds ([288 x %struct.ct_data]* @static_ltree, i32 0, i32 0), i32 287), !dbg !1961
  store i32 0, i32* %n, align 4, !dbg !1962
  br label %177, !dbg !1962

; <label>:177                                     ; preds = %194, %176
  %178 = load i32* %n, align 4, !dbg !1962
  %179 = icmp slt i32 %178, 30, !dbg !1962
  br i1 %179, label %180, label %197, !dbg !1962

; <label>:180                                     ; preds = %177
  %181 = load i32* %n, align 4, !dbg !1964
  %182 = sext i32 %181 to i64, !dbg !1964
  %183 = getelementptr inbounds [30 x %struct.ct_data]* @static_dtree, i32 0, i64 %182, !dbg !1964
  %184 = getelementptr inbounds %struct.ct_data* %183, i32 0, i32 1, !dbg !1964
  %185 = bitcast %union.anon.0* %184 to i16*, !dbg !1964
  store i16 5, i16* %185, align 2, !dbg !1964
  %186 = load i32* %n, align 4, !dbg !1966
  %187 = call i32 @bi_reverse(i32 %186, i32 5), !dbg !1966
  %188 = trunc i32 %187 to i16, !dbg !1966
  %189 = load i32* %n, align 4, !dbg !1966
  %190 = sext i32 %189 to i64, !dbg !1966
  %191 = getelementptr inbounds [30 x %struct.ct_data]* @static_dtree, i32 0, i64 %190, !dbg !1966
  %192 = getelementptr inbounds %struct.ct_data* %191, i32 0, i32 0, !dbg !1966
  %193 = bitcast %union.anon.10* %192 to i16*, !dbg !1966
  store i16 %188, i16* %193, align 2, !dbg !1966
  br label %194, !dbg !1967

; <label>:194                                     ; preds = %180
  %195 = load i32* %n, align 4, !dbg !1968
  %196 = add nsw i32 %195, 1, !dbg !1968
  store i32 %196, i32* %n, align 4, !dbg !1968
  br label %177, !dbg !1968

; <label>:197                                     ; preds = %177
  call void @init_block(), !dbg !1969
  br label %198, !dbg !1970

; <label>:198                                     ; preds = %197, %8
  ret void, !dbg !1970
}

define internal void @gen_codes(%struct.ct_data* %tree, i32 %max_code) nounwind uwtable {
  %1 = alloca %struct.ct_data*, align 8
  %2 = alloca i32, align 4
  %next_code = alloca [16 x i16], align 16
  %code = alloca i16, align 2
  %bits = alloca i32, align 4
  %n = alloca i32, align 4
  %len = alloca i32, align 4
  store %struct.ct_data* %tree, %struct.ct_data** %1, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !1971), !dbg !1972
  store i32 %max_code, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !1973), !dbg !1974
  call void @llvm.dbg.declare(metadata !22, metadata !1975), !dbg !1977
  call void @llvm.dbg.declare(metadata !22, metadata !1978), !dbg !1979
  store i16 0, i16* %code, align 2, !dbg !1980
  call void @llvm.dbg.declare(metadata !22, metadata !1981), !dbg !1982
  call void @llvm.dbg.declare(metadata !22, metadata !1983), !dbg !1984
  store i32 1, i32* %bits, align 4, !dbg !1985
  br label %3, !dbg !1985

; <label>:3                                       ; preds = %21, %0
  %4 = load i32* %bits, align 4, !dbg !1985
  %5 = icmp sle i32 %4, 15, !dbg !1985
  br i1 %5, label %6, label %24, !dbg !1985

; <label>:6                                       ; preds = %3
  %7 = load i16* %code, align 2, !dbg !1987
  %8 = zext i16 %7 to i32, !dbg !1987
  %9 = load i32* %bits, align 4, !dbg !1987
  %10 = sub nsw i32 %9, 1, !dbg !1987
  %11 = sext i32 %10 to i64, !dbg !1987
  %12 = getelementptr inbounds [16 x i16]* @bl_count, i32 0, i64 %11, !dbg !1987
  %13 = load i16* %12, align 2, !dbg !1987
  %14 = zext i16 %13 to i32, !dbg !1987
  %15 = add nsw i32 %8, %14, !dbg !1987
  %16 = shl i32 %15, 1, !dbg !1987
  %17 = trunc i32 %16 to i16, !dbg !1987
  store i16 %17, i16* %code, align 2, !dbg !1987
  %18 = load i32* %bits, align 4, !dbg !1987
  %19 = sext i32 %18 to i64, !dbg !1987
  %20 = getelementptr inbounds [16 x i16]* %next_code, i32 0, i64 %19, !dbg !1987
  store i16 %17, i16* %20, align 2, !dbg !1987
  br label %21, !dbg !1989

; <label>:21                                      ; preds = %6
  %22 = load i32* %bits, align 4, !dbg !1990
  %23 = add nsw i32 %22, 1, !dbg !1990
  store i32 %23, i32* %bits, align 4, !dbg !1990
  br label %3, !dbg !1990

; <label>:24                                      ; preds = %3
  store i32 0, i32* %n, align 4, !dbg !1991
  br label %25, !dbg !1991

; <label>:25                                      ; preds = %57, %24
  %26 = load i32* %n, align 4, !dbg !1991
  %27 = load i32* %2, align 4, !dbg !1991
  %28 = icmp sle i32 %26, %27, !dbg !1991
  br i1 %28, label %29, label %60, !dbg !1991

; <label>:29                                      ; preds = %25
  call void @llvm.dbg.declare(metadata !22, metadata !1993), !dbg !1995
  %30 = load i32* %n, align 4, !dbg !1996
  %31 = sext i32 %30 to i64, !dbg !1996
  %32 = load %struct.ct_data** %1, align 8, !dbg !1996
  %33 = getelementptr inbounds %struct.ct_data* %32, i64 %31, !dbg !1996
  %34 = getelementptr inbounds %struct.ct_data* %33, i32 0, i32 1, !dbg !1996
  %35 = bitcast %union.anon.0* %34 to i16*, !dbg !1996
  %36 = load i16* %35, align 2, !dbg !1996
  %37 = zext i16 %36 to i32, !dbg !1996
  store i32 %37, i32* %len, align 4, !dbg !1996
  %38 = load i32* %len, align 4, !dbg !1997
  %39 = icmp eq i32 %38, 0, !dbg !1997
  br i1 %39, label %40, label %41, !dbg !1997

; <label>:40                                      ; preds = %29
  br label %57, !dbg !1998

; <label>:41                                      ; preds = %29
  %42 = load i32* %len, align 4, !dbg !1999
  %43 = sext i32 %42 to i64, !dbg !1999
  %44 = getelementptr inbounds [16 x i16]* %next_code, i32 0, i64 %43, !dbg !1999
  %45 = load i16* %44, align 2, !dbg !1999
  %46 = add i16 %45, 1, !dbg !1999
  store i16 %46, i16* %44, align 2, !dbg !1999
  %47 = zext i16 %45 to i32, !dbg !1999
  %48 = load i32* %len, align 4, !dbg !1999
  %49 = call i32 @bi_reverse(i32 %47, i32 %48), !dbg !1999
  %50 = trunc i32 %49 to i16, !dbg !1999
  %51 = load i32* %n, align 4, !dbg !1999
  %52 = sext i32 %51 to i64, !dbg !1999
  %53 = load %struct.ct_data** %1, align 8, !dbg !1999
  %54 = getelementptr inbounds %struct.ct_data* %53, i64 %52, !dbg !1999
  %55 = getelementptr inbounds %struct.ct_data* %54, i32 0, i32 0, !dbg !1999
  %56 = bitcast %union.anon.10* %55 to i16*, !dbg !1999
  store i16 %50, i16* %56, align 2, !dbg !1999
  br label %57, !dbg !2000

; <label>:57                                      ; preds = %41, %40
  %58 = load i32* %n, align 4, !dbg !2001
  %59 = add nsw i32 %58, 1, !dbg !2001
  store i32 %59, i32* %n, align 4, !dbg !2001
  br label %25, !dbg !2001

; <label>:60                                      ; preds = %25
  ret void, !dbg !2002
}

define internal void @init_block() nounwind uwtable {
  %n = alloca i32, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !2003), !dbg !2005
  store i32 0, i32* %n, align 4, !dbg !2006
  br label %1, !dbg !2006

; <label>:1                                       ; preds = %10, %0
  %2 = load i32* %n, align 4, !dbg !2006
  %3 = icmp slt i32 %2, 286, !dbg !2006
  br i1 %3, label %4, label %13, !dbg !2006

; <label>:4                                       ; preds = %1
  %5 = load i32* %n, align 4, !dbg !2008
  %6 = sext i32 %5 to i64, !dbg !2008
  %7 = getelementptr inbounds [573 x %struct.ct_data]* @dyn_ltree, i32 0, i64 %6, !dbg !2008
  %8 = getelementptr inbounds %struct.ct_data* %7, i32 0, i32 0, !dbg !2008
  %9 = bitcast %union.anon.10* %8 to i16*, !dbg !2008
  store i16 0, i16* %9, align 2, !dbg !2008
  br label %10, !dbg !2008

; <label>:10                                      ; preds = %4
  %11 = load i32* %n, align 4, !dbg !2009
  %12 = add nsw i32 %11, 1, !dbg !2009
  store i32 %12, i32* %n, align 4, !dbg !2009
  br label %1, !dbg !2009

; <label>:13                                      ; preds = %1
  store i32 0, i32* %n, align 4, !dbg !2010
  br label %14, !dbg !2010

; <label>:14                                      ; preds = %23, %13
  %15 = load i32* %n, align 4, !dbg !2010
  %16 = icmp slt i32 %15, 30, !dbg !2010
  br i1 %16, label %17, label %26, !dbg !2010

; <label>:17                                      ; preds = %14
  %18 = load i32* %n, align 4, !dbg !2012
  %19 = sext i32 %18 to i64, !dbg !2012
  %20 = getelementptr inbounds [61 x %struct.ct_data]* @dyn_dtree, i32 0, i64 %19, !dbg !2012
  %21 = getelementptr inbounds %struct.ct_data* %20, i32 0, i32 0, !dbg !2012
  %22 = bitcast %union.anon.10* %21 to i16*, !dbg !2012
  store i16 0, i16* %22, align 2, !dbg !2012
  br label %23, !dbg !2012

; <label>:23                                      ; preds = %17
  %24 = load i32* %n, align 4, !dbg !2013
  %25 = add nsw i32 %24, 1, !dbg !2013
  store i32 %25, i32* %n, align 4, !dbg !2013
  br label %14, !dbg !2013

; <label>:26                                      ; preds = %14
  store i32 0, i32* %n, align 4, !dbg !2014
  br label %27, !dbg !2014

; <label>:27                                      ; preds = %36, %26
  %28 = load i32* %n, align 4, !dbg !2014
  %29 = icmp slt i32 %28, 19, !dbg !2014
  br i1 %29, label %30, label %39, !dbg !2014

; <label>:30                                      ; preds = %27
  %31 = load i32* %n, align 4, !dbg !2016
  %32 = sext i32 %31 to i64, !dbg !2016
  %33 = getelementptr inbounds [39 x %struct.ct_data]* @bl_tree, i32 0, i64 %32, !dbg !2016
  %34 = getelementptr inbounds %struct.ct_data* %33, i32 0, i32 0, !dbg !2016
  %35 = bitcast %union.anon.10* %34 to i16*, !dbg !2016
  store i16 0, i16* %35, align 2, !dbg !2016
  br label %36, !dbg !2016

; <label>:36                                      ; preds = %30
  %37 = load i32* %n, align 4, !dbg !2017
  %38 = add nsw i32 %37, 1, !dbg !2017
  store i32 %38, i32* %n, align 4, !dbg !2017
  br label %27, !dbg !2017

; <label>:39                                      ; preds = %27
  store i16 1, i16* getelementptr inbounds ([573 x %struct.ct_data]* @dyn_ltree, i32 0, i64 256, i32 0, i32 0), align 2, !dbg !2018
  store i64 0, i64* @static_len, align 8, !dbg !2019
  store i64 0, i64* @opt_len, align 8, !dbg !2019
  store i32 0, i32* @last_flags, align 4, !dbg !2020
  store i32 0, i32* @last_dist, align 4, !dbg !2020
  store i32 0, i32* @last_lit, align 4, !dbg !2020
  store i8 0, i8* @flags, align 1, !dbg !2021
  store i8 1, i8* @flag_bit, align 1, !dbg !2022
  ret void, !dbg !2023
}

define i64 @flush_block(i8* %buf, i64 %stored_len, i32 %eof) nounwind uwtable {
  %1 = alloca i8*, align 8
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  %opt_lenb = alloca i64, align 8
  %static_lenb = alloca i64, align 8
  %max_blindex = alloca i32, align 4
  store i8* %buf, i8** %1, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !2024), !dbg !2025
  store i64 %stored_len, i64* %2, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !2026), !dbg !2027
  store i32 %eof, i32* %3, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !2028), !dbg !2029
  call void @llvm.dbg.declare(metadata !22, metadata !2030), !dbg !2032
  call void @llvm.dbg.declare(metadata !22, metadata !2033), !dbg !2034
  call void @llvm.dbg.declare(metadata !22, metadata !2035), !dbg !2036
  %4 = load i8* @flags, align 1, !dbg !2037
  %5 = load i32* @last_flags, align 4, !dbg !2037
  %6 = zext i32 %5 to i64, !dbg !2037
  %7 = getelementptr inbounds [4096 x i8]* @flag_buf, i32 0, i64 %6, !dbg !2037
  store i8 %4, i8* %7, align 1, !dbg !2037
  %8 = load i16** @file_type, align 8, !dbg !2038
  %9 = load i16* %8, align 2, !dbg !2038
  %10 = zext i16 %9 to i32, !dbg !2038
  %11 = icmp eq i32 %10, 65535, !dbg !2038
  br i1 %11, label %12, label %13, !dbg !2038

; <label>:12                                      ; preds = %0
  call void @set_file_type(), !dbg !2039
  br label %13, !dbg !2039

; <label>:13                                      ; preds = %12, %0
  call void (...)* bitcast (void (%struct.tree_desc*)* @build_tree to void (...)*)(%struct.tree_desc* @l_desc), !dbg !2040
  call void (...)* bitcast (void (%struct.tree_desc*)* @build_tree to void (...)*)(%struct.tree_desc* @d_desc), !dbg !2041
  %14 = call i32 @build_bl_tree(), !dbg !2042
  store i32 %14, i32* %max_blindex, align 4, !dbg !2042
  %15 = load i64* @opt_len, align 8, !dbg !2043
  %16 = add i64 %15, 3, !dbg !2043
  %17 = add i64 %16, 7, !dbg !2043
  %18 = lshr i64 %17, 3, !dbg !2043
  store i64 %18, i64* %opt_lenb, align 8, !dbg !2043
  %19 = load i64* @static_len, align 8, !dbg !2044
  %20 = add i64 %19, 3, !dbg !2044
  %21 = add i64 %20, 7, !dbg !2044
  %22 = lshr i64 %21, 3, !dbg !2044
  store i64 %22, i64* %static_lenb, align 8, !dbg !2044
  %23 = load i64* %2, align 8, !dbg !2045
  %24 = load i64* @input_len, align 8, !dbg !2045
  %25 = add i64 %24, %23, !dbg !2045
  store i64 %25, i64* @input_len, align 8, !dbg !2045
  %26 = load i64* %static_lenb, align 8, !dbg !2046
  %27 = load i64* %opt_lenb, align 8, !dbg !2046
  %28 = icmp ule i64 %26, %27, !dbg !2046
  br i1 %28, label %29, label %31, !dbg !2046

; <label>:29                                      ; preds = %13
  %30 = load i64* %static_lenb, align 8, !dbg !2047
  store i64 %30, i64* %opt_lenb, align 8, !dbg !2047
  br label %31, !dbg !2047

; <label>:31                                      ; preds = %29, %13
  %32 = load i64* %2, align 8, !dbg !2048
  %33 = load i64* %opt_lenb, align 8, !dbg !2048
  %34 = icmp ule i64 %32, %33, !dbg !2048
  br i1 %34, label %35, label %53, !dbg !2048

; <label>:35                                      ; preds = %31
  %36 = load i32* %3, align 4, !dbg !2048
  %37 = icmp ne i32 %36, 0, !dbg !2048
  br i1 %37, label %38, label %53, !dbg !2048

; <label>:38                                      ; preds = %35
  %39 = load i64* @compressed_len, align 8, !dbg !2048
  %40 = icmp eq i64 %39, 0, !dbg !2048
  br i1 %40, label %41, label %53, !dbg !2048

; <label>:41                                      ; preds = %38
  br i1 false, label %42, label %53, !dbg !2048

; <label>:42                                      ; preds = %41
  %43 = load i8** %1, align 8, !dbg !2049
  %44 = icmp eq i8* %43, null, !dbg !2049
  br i1 %44, label %45, label %46, !dbg !2049

; <label>:45                                      ; preds = %42
  call void @error(i8* getelementptr inbounds ([15 x i8]* @.str14, i32 0, i32 0)), !dbg !2051
  br label %46, !dbg !2051

; <label>:46                                      ; preds = %45, %42
  %47 = load i8** %1, align 8, !dbg !2052
  %48 = load i64* %2, align 8, !dbg !2052
  %49 = trunc i64 %48 to i32, !dbg !2052
  call void @copy_block(i8* %47, i32 %49, i32 0), !dbg !2052
  %50 = load i64* %2, align 8, !dbg !2053
  %51 = shl i64 %50, 3, !dbg !2053
  store i64 %51, i64* @compressed_len, align 8, !dbg !2053
  %52 = load i32** @file_method, align 8, !dbg !2054
  store i32 0, i32* %52, align 4, !dbg !2054
  br label %102, !dbg !2055

; <label>:53                                      ; preds = %41, %38, %35, %31
  %54 = load i64* %2, align 8, !dbg !2056
  %55 = add i64 %54, 4, !dbg !2056
  %56 = load i64* %opt_lenb, align 8, !dbg !2056
  %57 = icmp ule i64 %55, %56, !dbg !2056
  br i1 %57, label %58, label %76, !dbg !2056

; <label>:58                                      ; preds = %53
  %59 = load i8** %1, align 8, !dbg !2056
  %60 = icmp ne i8* %59, null, !dbg !2056
  br i1 %60, label %61, label %76, !dbg !2056

; <label>:61                                      ; preds = %58
  %62 = load i32* %3, align 4, !dbg !2057
  %63 = add nsw i32 0, %62, !dbg !2057
  call void @send_bits(i32 %63, i32 3), !dbg !2057
  %64 = load i64* @compressed_len, align 8, !dbg !2059
  %65 = add i64 %64, 3, !dbg !2059
  %66 = add i64 %65, 7, !dbg !2059
  %67 = and i64 %66, -8, !dbg !2059
  store i64 %67, i64* @compressed_len, align 8, !dbg !2059
  %68 = load i64* %2, align 8, !dbg !2060
  %69 = add i64 %68, 4, !dbg !2060
  %70 = shl i64 %69, 3, !dbg !2060
  %71 = load i64* @compressed_len, align 8, !dbg !2060
  %72 = add i64 %71, %70, !dbg !2060
  store i64 %72, i64* @compressed_len, align 8, !dbg !2060
  %73 = load i8** %1, align 8, !dbg !2061
  %74 = load i64* %2, align 8, !dbg !2061
  %75 = trunc i64 %74 to i32, !dbg !2061
  call void @copy_block(i8* %73, i32 %75, i32 1), !dbg !2061
  br label %101, !dbg !2062

; <label>:76                                      ; preds = %58, %53
  %77 = load i64* %static_lenb, align 8, !dbg !2063
  %78 = load i64* %opt_lenb, align 8, !dbg !2063
  %79 = icmp eq i64 %77, %78, !dbg !2063
  br i1 %79, label %80, label %87, !dbg !2063

; <label>:80                                      ; preds = %76
  %81 = load i32* %3, align 4, !dbg !2064
  %82 = add nsw i32 2, %81, !dbg !2064
  call void @send_bits(i32 %82, i32 3), !dbg !2064
  call void @compress_block(%struct.ct_data* getelementptr inbounds ([288 x %struct.ct_data]* @static_ltree, i32 0, i32 0), %struct.ct_data* getelementptr inbounds ([30 x %struct.ct_data]* @static_dtree, i32 0, i32 0)), !dbg !2066
  %83 = load i64* @static_len, align 8, !dbg !2067
  %84 = add i64 3, %83, !dbg !2067
  %85 = load i64* @compressed_len, align 8, !dbg !2067
  %86 = add i64 %85, %84, !dbg !2067
  store i64 %86, i64* @compressed_len, align 8, !dbg !2067
  br label %100, !dbg !2068

; <label>:87                                      ; preds = %76
  %88 = load i32* %3, align 4, !dbg !2069
  %89 = add nsw i32 4, %88, !dbg !2069
  call void @send_bits(i32 %89, i32 3), !dbg !2069
  %90 = load i32* getelementptr inbounds (%struct.tree_desc* @l_desc, i32 0, i32 6), align 4, !dbg !2071
  %91 = add nsw i32 %90, 1, !dbg !2071
  %92 = load i32* getelementptr inbounds (%struct.tree_desc* @d_desc, i32 0, i32 6), align 4, !dbg !2071
  %93 = add nsw i32 %92, 1, !dbg !2071
  %94 = load i32* %max_blindex, align 4, !dbg !2071
  %95 = add nsw i32 %94, 1, !dbg !2071
  call void (...)* bitcast (void (i32, i32, i32)* @send_all_trees to void (...)*)(i32 %91, i32 %93, i32 %95), !dbg !2071
  call void @compress_block(%struct.ct_data* getelementptr inbounds ([573 x %struct.ct_data]* @dyn_ltree, i32 0, i32 0), %struct.ct_data* getelementptr inbounds ([61 x %struct.ct_data]* @dyn_dtree, i32 0, i32 0)), !dbg !2072
  %96 = load i64* @opt_len, align 8, !dbg !2073
  %97 = add i64 3, %96, !dbg !2073
  %98 = load i64* @compressed_len, align 8, !dbg !2073
  %99 = add i64 %98, %97, !dbg !2073
  store i64 %99, i64* @compressed_len, align 8, !dbg !2073
  br label %100

; <label>:100                                     ; preds = %87, %80
  br label %101

; <label>:101                                     ; preds = %100, %61
  br label %102

; <label>:102                                     ; preds = %101, %46
  call void @init_block(), !dbg !2074
  %103 = load i32* %3, align 4, !dbg !2075
  %104 = icmp ne i32 %103, 0, !dbg !2075
  br i1 %104, label %105, label %108, !dbg !2075

; <label>:105                                     ; preds = %102
  call void @bi_windup(), !dbg !2076
  %106 = load i64* @compressed_len, align 8, !dbg !2078
  %107 = add i64 %106, 7, !dbg !2078
  store i64 %107, i64* @compressed_len, align 8, !dbg !2078
  br label %108, !dbg !2079

; <label>:108                                     ; preds = %105, %102
  %109 = load i64* @compressed_len, align 8, !dbg !2080
  %110 = lshr i64 %109, 3, !dbg !2080
  ret i64 %110, !dbg !2080
}

define internal void @set_file_type() nounwind uwtable {
  %n = alloca i32, align 4
  %ascii_freq = alloca i32, align 4
  %bin_freq = alloca i32, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !2081), !dbg !2083
  store i32 0, i32* %n, align 4, !dbg !2084
  call void @llvm.dbg.declare(metadata !22, metadata !2085), !dbg !2086
  store i32 0, i32* %ascii_freq, align 4, !dbg !2087
  call void @llvm.dbg.declare(metadata !22, metadata !2088), !dbg !2089
  store i32 0, i32* %bin_freq, align 4, !dbg !2090
  br label %1, !dbg !2091

; <label>:1                                       ; preds = %4, %0
  %2 = load i32* %n, align 4, !dbg !2091
  %3 = icmp slt i32 %2, 7, !dbg !2091
  br i1 %3, label %4, label %15, !dbg !2091

; <label>:4                                       ; preds = %1
  %5 = load i32* %n, align 4, !dbg !2092
  %6 = add nsw i32 %5, 1, !dbg !2092
  store i32 %6, i32* %n, align 4, !dbg !2092
  %7 = sext i32 %5 to i64, !dbg !2092
  %8 = getelementptr inbounds [573 x %struct.ct_data]* @dyn_ltree, i32 0, i64 %7, !dbg !2092
  %9 = getelementptr inbounds %struct.ct_data* %8, i32 0, i32 0, !dbg !2092
  %10 = bitcast %union.anon.10* %9 to i16*, !dbg !2092
  %11 = load i16* %10, align 2, !dbg !2092
  %12 = zext i16 %11 to i32, !dbg !2092
  %13 = load i32* %bin_freq, align 4, !dbg !2092
  %14 = add i32 %13, %12, !dbg !2092
  store i32 %14, i32* %bin_freq, align 4, !dbg !2092
  br label %1, !dbg !2092

; <label>:15                                      ; preds = %1
  br label %16, !dbg !2093

; <label>:16                                      ; preds = %19, %15
  %17 = load i32* %n, align 4, !dbg !2093
  %18 = icmp slt i32 %17, 128, !dbg !2093
  br i1 %18, label %19, label %30, !dbg !2093

; <label>:19                                      ; preds = %16
  %20 = load i32* %n, align 4, !dbg !2094
  %21 = add nsw i32 %20, 1, !dbg !2094
  store i32 %21, i32* %n, align 4, !dbg !2094
  %22 = sext i32 %20 to i64, !dbg !2094
  %23 = getelementptr inbounds [573 x %struct.ct_data]* @dyn_ltree, i32 0, i64 %22, !dbg !2094
  %24 = getelementptr inbounds %struct.ct_data* %23, i32 0, i32 0, !dbg !2094
  %25 = bitcast %union.anon.10* %24 to i16*, !dbg !2094
  %26 = load i16* %25, align 2, !dbg !2094
  %27 = zext i16 %26 to i32, !dbg !2094
  %28 = load i32* %ascii_freq, align 4, !dbg !2094
  %29 = add i32 %28, %27, !dbg !2094
  store i32 %29, i32* %ascii_freq, align 4, !dbg !2094
  br label %16, !dbg !2094

; <label>:30                                      ; preds = %16
  br label %31, !dbg !2095

; <label>:31                                      ; preds = %34, %30
  %32 = load i32* %n, align 4, !dbg !2095
  %33 = icmp slt i32 %32, 256, !dbg !2095
  br i1 %33, label %34, label %45, !dbg !2095

; <label>:34                                      ; preds = %31
  %35 = load i32* %n, align 4, !dbg !2096
  %36 = add nsw i32 %35, 1, !dbg !2096
  store i32 %36, i32* %n, align 4, !dbg !2096
  %37 = sext i32 %35 to i64, !dbg !2096
  %38 = getelementptr inbounds [573 x %struct.ct_data]* @dyn_ltree, i32 0, i64 %37, !dbg !2096
  %39 = getelementptr inbounds %struct.ct_data* %38, i32 0, i32 0, !dbg !2096
  %40 = bitcast %union.anon.10* %39 to i16*, !dbg !2096
  %41 = load i16* %40, align 2, !dbg !2096
  %42 = zext i16 %41 to i32, !dbg !2096
  %43 = load i32* %bin_freq, align 4, !dbg !2096
  %44 = add i32 %43, %42, !dbg !2096
  store i32 %44, i32* %bin_freq, align 4, !dbg !2096
  br label %31, !dbg !2096

; <label>:45                                      ; preds = %31
  %46 = load i32* %bin_freq, align 4, !dbg !2097
  %47 = load i32* %ascii_freq, align 4, !dbg !2097
  %48 = lshr i32 %47, 2, !dbg !2097
  %49 = icmp ugt i32 %46, %48, !dbg !2097
  %50 = select i1 %49, i32 0, i32 1, !dbg !2097
  %51 = trunc i32 %50 to i16, !dbg !2097
  %52 = load i16** @file_type, align 8, !dbg !2097
  store i16 %51, i16* %52, align 2, !dbg !2097
  %53 = load i16** @file_type, align 8, !dbg !2098
  %54 = load i16* %53, align 2, !dbg !2098
  %55 = zext i16 %54 to i32, !dbg !2098
  %56 = icmp eq i32 %55, 0, !dbg !2098
  br i1 %56, label %57, label %59, !dbg !2098

; <label>:57                                      ; preds = %45
  br i1 false, label %58, label %59, !dbg !2098

; <label>:58                                      ; preds = %57
  call void @warn(i8* getelementptr inbounds ([23 x i8]* @.str115, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str216, i32 0, i32 0)), !dbg !2099
  br label %59, !dbg !2101

; <label>:59                                      ; preds = %58, %57, %45
  ret void, !dbg !2102
}

define internal void @build_tree(%struct.tree_desc* %desc) nounwind uwtable {
  %1 = alloca %struct.tree_desc*, align 8
  %tree = alloca %struct.ct_data*, align 8
  %stree = alloca %struct.ct_data*, align 8
  %elems = alloca i32, align 4
  %n = alloca i32, align 4
  %m = alloca i32, align 4
  %max_code = alloca i32, align 4
  %node = alloca i32, align 4
  %new = alloca i32, align 4
  store %struct.tree_desc* %desc, %struct.tree_desc** %1, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !2103), !dbg !2104
  call void @llvm.dbg.declare(metadata !22, metadata !2105), !dbg !2107
  %2 = load %struct.tree_desc** %1, align 8, !dbg !2108
  %3 = getelementptr inbounds %struct.tree_desc* %2, i32 0, i32 0, !dbg !2108
  %4 = load %struct.ct_data** %3, align 8, !dbg !2108
  store %struct.ct_data* %4, %struct.ct_data** %tree, align 8, !dbg !2108
  call void @llvm.dbg.declare(metadata !22, metadata !2109), !dbg !2110
  %5 = load %struct.tree_desc** %1, align 8, !dbg !2111
  %6 = getelementptr inbounds %struct.tree_desc* %5, i32 0, i32 1, !dbg !2111
  %7 = load %struct.ct_data** %6, align 8, !dbg !2111
  store %struct.ct_data* %7, %struct.ct_data** %stree, align 8, !dbg !2111
  call void @llvm.dbg.declare(metadata !22, metadata !2112), !dbg !2113
  %8 = load %struct.tree_desc** %1, align 8, !dbg !2114
  %9 = getelementptr inbounds %struct.tree_desc* %8, i32 0, i32 4, !dbg !2114
  %10 = load i32* %9, align 4, !dbg !2114
  store i32 %10, i32* %elems, align 4, !dbg !2114
  call void @llvm.dbg.declare(metadata !22, metadata !2115), !dbg !2116
  call void @llvm.dbg.declare(metadata !22, metadata !2117), !dbg !2118
  call void @llvm.dbg.declare(metadata !22, metadata !2119), !dbg !2120
  store i32 -1, i32* %max_code, align 4, !dbg !2121
  call void @llvm.dbg.declare(metadata !22, metadata !2122), !dbg !2123
  %11 = load i32* %elems, align 4, !dbg !2124
  store i32 %11, i32* %node, align 4, !dbg !2124
  store i32 0, i32* @heap_len, align 4, !dbg !2125
  store i32 573, i32* @heap_max, align 4, !dbg !2125
  store i32 0, i32* %n, align 4, !dbg !2126
  br label %12, !dbg !2126

; <label>:12                                      ; preds = %43, %0
  %13 = load i32* %n, align 4, !dbg !2126
  %14 = load i32* %elems, align 4, !dbg !2126
  %15 = icmp slt i32 %13, %14, !dbg !2126
  br i1 %15, label %16, label %46, !dbg !2126

; <label>:16                                      ; preds = %12
  %17 = load i32* %n, align 4, !dbg !2128
  %18 = sext i32 %17 to i64, !dbg !2128
  %19 = load %struct.ct_data** %tree, align 8, !dbg !2128
  %20 = getelementptr inbounds %struct.ct_data* %19, i64 %18, !dbg !2128
  %21 = getelementptr inbounds %struct.ct_data* %20, i32 0, i32 0, !dbg !2128
  %22 = bitcast %union.anon.10* %21 to i16*, !dbg !2128
  %23 = load i16* %22, align 2, !dbg !2128
  %24 = zext i16 %23 to i32, !dbg !2128
  %25 = icmp ne i32 %24, 0, !dbg !2128
  br i1 %25, label %26, label %35, !dbg !2128

; <label>:26                                      ; preds = %16
  %27 = load i32* %n, align 4, !dbg !2130
  store i32 %27, i32* %max_code, align 4, !dbg !2130
  %28 = load i32* @heap_len, align 4, !dbg !2130
  %29 = add nsw i32 %28, 1, !dbg !2130
  store i32 %29, i32* @heap_len, align 4, !dbg !2130
  %30 = sext i32 %29 to i64, !dbg !2130
  %31 = getelementptr inbounds [573 x i32]* @heap, i32 0, i64 %30, !dbg !2130
  store i32 %27, i32* %31, align 4, !dbg !2130
  %32 = load i32* %n, align 4, !dbg !2132
  %33 = sext i32 %32 to i64, !dbg !2132
  %34 = getelementptr inbounds [573 x i8]* @depth, i32 0, i64 %33, !dbg !2132
  store i8 0, i8* %34, align 1, !dbg !2132
  br label %42, !dbg !2133

; <label>:35                                      ; preds = %16
  %36 = load i32* %n, align 4, !dbg !2134
  %37 = sext i32 %36 to i64, !dbg !2134
  %38 = load %struct.ct_data** %tree, align 8, !dbg !2134
  %39 = getelementptr inbounds %struct.ct_data* %38, i64 %37, !dbg !2134
  %40 = getelementptr inbounds %struct.ct_data* %39, i32 0, i32 1, !dbg !2134
  %41 = bitcast %union.anon.0* %40 to i16*, !dbg !2134
  store i16 0, i16* %41, align 2, !dbg !2134
  br label %42

; <label>:42                                      ; preds = %35, %26
  br label %43, !dbg !2136

; <label>:43                                      ; preds = %42
  %44 = load i32* %n, align 4, !dbg !2137
  %45 = add nsw i32 %44, 1, !dbg !2137
  store i32 %45, i32* %n, align 4, !dbg !2137
  br label %12, !dbg !2137

; <label>:46                                      ; preds = %12
  br label %47, !dbg !2138

; <label>:47                                      ; preds = %87, %46
  %48 = load i32* @heap_len, align 4, !dbg !2138
  %49 = icmp slt i32 %48, 2, !dbg !2138
  br i1 %49, label %50, label %88, !dbg !2138

; <label>:50                                      ; preds = %47
  call void @llvm.dbg.declare(metadata !22, metadata !2139), !dbg !2141
  %51 = load i32* %max_code, align 4, !dbg !2142
  %52 = icmp slt i32 %51, 2, !dbg !2142
  br i1 %52, label %53, label %56, !dbg !2142

; <label>:53                                      ; preds = %50
  %54 = load i32* %max_code, align 4, !dbg !2142
  %55 = add nsw i32 %54, 1, !dbg !2142
  store i32 %55, i32* %max_code, align 4, !dbg !2142
  br label %57, !dbg !2142

; <label>:56                                      ; preds = %50
  br label %57, !dbg !2142

; <label>:57                                      ; preds = %56, %53
  %58 = phi i32 [ %55, %53 ], [ 0, %56 ], !dbg !2142
  %59 = load i32* @heap_len, align 4, !dbg !2142
  %60 = add nsw i32 %59, 1, !dbg !2142
  store i32 %60, i32* @heap_len, align 4, !dbg !2142
  %61 = sext i32 %60 to i64, !dbg !2142
  %62 = getelementptr inbounds [573 x i32]* @heap, i32 0, i64 %61, !dbg !2142
  store i32 %58, i32* %62, align 4, !dbg !2142
  store i32 %58, i32* %new, align 4, !dbg !2142
  %63 = load i32* %new, align 4, !dbg !2143
  %64 = sext i32 %63 to i64, !dbg !2143
  %65 = load %struct.ct_data** %tree, align 8, !dbg !2143
  %66 = getelementptr inbounds %struct.ct_data* %65, i64 %64, !dbg !2143
  %67 = getelementptr inbounds %struct.ct_data* %66, i32 0, i32 0, !dbg !2143
  %68 = bitcast %union.anon.10* %67 to i16*, !dbg !2143
  store i16 1, i16* %68, align 2, !dbg !2143
  %69 = load i32* %new, align 4, !dbg !2144
  %70 = sext i32 %69 to i64, !dbg !2144
  %71 = getelementptr inbounds [573 x i8]* @depth, i32 0, i64 %70, !dbg !2144
  store i8 0, i8* %71, align 1, !dbg !2144
  %72 = load i64* @opt_len, align 8, !dbg !2145
  %73 = add i64 %72, -1, !dbg !2145
  store i64 %73, i64* @opt_len, align 8, !dbg !2145
  %74 = load %struct.ct_data** %stree, align 8, !dbg !2146
  %75 = icmp ne %struct.ct_data* %74, null, !dbg !2146
  br i1 %75, label %76, label %87, !dbg !2146

; <label>:76                                      ; preds = %57
  %77 = load i32* %new, align 4, !dbg !2147
  %78 = sext i32 %77 to i64, !dbg !2147
  %79 = load %struct.ct_data** %stree, align 8, !dbg !2147
  %80 = getelementptr inbounds %struct.ct_data* %79, i64 %78, !dbg !2147
  %81 = getelementptr inbounds %struct.ct_data* %80, i32 0, i32 1, !dbg !2147
  %82 = bitcast %union.anon.0* %81 to i16*, !dbg !2147
  %83 = load i16* %82, align 2, !dbg !2147
  %84 = zext i16 %83 to i64, !dbg !2147
  %85 = load i64* @static_len, align 8, !dbg !2147
  %86 = sub i64 %85, %84, !dbg !2147
  store i64 %86, i64* @static_len, align 8, !dbg !2147
  br label %87, !dbg !2147

; <label>:87                                      ; preds = %76, %57
  br label %47, !dbg !2148

; <label>:88                                      ; preds = %47
  %89 = load i32* %max_code, align 4, !dbg !2149
  %90 = load %struct.tree_desc** %1, align 8, !dbg !2149
  %91 = getelementptr inbounds %struct.tree_desc* %90, i32 0, i32 6, !dbg !2149
  store i32 %89, i32* %91, align 4, !dbg !2149
  %92 = load i32* @heap_len, align 4, !dbg !2150
  %93 = sdiv i32 %92, 2, !dbg !2150
  store i32 %93, i32* %n, align 4, !dbg !2150
  br label %94, !dbg !2150

; <label>:94                                      ; preds = %100, %88
  %95 = load i32* %n, align 4, !dbg !2150
  %96 = icmp sge i32 %95, 1, !dbg !2150
  br i1 %96, label %97, label %103, !dbg !2150

; <label>:97                                      ; preds = %94
  %98 = load %struct.ct_data** %tree, align 8, !dbg !2152
  %99 = load i32* %n, align 4, !dbg !2152
  call void (...)* bitcast (void (%struct.ct_data*, i32)* @pqdownheap to void (...)*)(%struct.ct_data* %98, i32 %99), !dbg !2152
  br label %100, !dbg !2152

; <label>:100                                     ; preds = %97
  %101 = load i32* %n, align 4, !dbg !2153
  %102 = add nsw i32 %101, -1, !dbg !2153
  store i32 %102, i32* %n, align 4, !dbg !2153
  br label %94, !dbg !2153

; <label>:103                                     ; preds = %94
  br label %104, !dbg !2154

; <label>:104                                     ; preds = %194, %103
  %105 = load i32* getelementptr inbounds ([573 x i32]* @heap, i32 0, i64 1), align 4, !dbg !2155
  store i32 %105, i32* %n, align 4, !dbg !2155
  %106 = load i32* @heap_len, align 4, !dbg !2155
  %107 = add nsw i32 %106, -1, !dbg !2155
  store i32 %107, i32* @heap_len, align 4, !dbg !2155
  %108 = sext i32 %106 to i64, !dbg !2155
  %109 = getelementptr inbounds [573 x i32]* @heap, i32 0, i64 %108, !dbg !2155
  %110 = load i32* %109, align 4, !dbg !2155
  store i32 %110, i32* getelementptr inbounds ([573 x i32]* @heap, i32 0, i64 1), align 4, !dbg !2155
  %111 = load %struct.ct_data** %tree, align 8, !dbg !2155
  call void (...)* bitcast (void (%struct.ct_data*, i32)* @pqdownheap to void (...)*)(%struct.ct_data* %111, i32 1), !dbg !2155
  %112 = load i32* getelementptr inbounds ([573 x i32]* @heap, i32 0, i64 1), align 4, !dbg !2158
  store i32 %112, i32* %m, align 4, !dbg !2158
  %113 = load i32* %n, align 4, !dbg !2159
  %114 = load i32* @heap_max, align 4, !dbg !2159
  %115 = add nsw i32 %114, -1, !dbg !2159
  store i32 %115, i32* @heap_max, align 4, !dbg !2159
  %116 = sext i32 %115 to i64, !dbg !2159
  %117 = getelementptr inbounds [573 x i32]* @heap, i32 0, i64 %116, !dbg !2159
  store i32 %113, i32* %117, align 4, !dbg !2159
  %118 = load i32* %m, align 4, !dbg !2160
  %119 = load i32* @heap_max, align 4, !dbg !2160
  %120 = add nsw i32 %119, -1, !dbg !2160
  store i32 %120, i32* @heap_max, align 4, !dbg !2160
  %121 = sext i32 %120 to i64, !dbg !2160
  %122 = getelementptr inbounds [573 x i32]* @heap, i32 0, i64 %121, !dbg !2160
  store i32 %118, i32* %122, align 4, !dbg !2160
  %123 = load i32* %n, align 4, !dbg !2161
  %124 = sext i32 %123 to i64, !dbg !2161
  %125 = load %struct.ct_data** %tree, align 8, !dbg !2161
  %126 = getelementptr inbounds %struct.ct_data* %125, i64 %124, !dbg !2161
  %127 = getelementptr inbounds %struct.ct_data* %126, i32 0, i32 0, !dbg !2161
  %128 = bitcast %union.anon.10* %127 to i16*, !dbg !2161
  %129 = load i16* %128, align 2, !dbg !2161
  %130 = zext i16 %129 to i32, !dbg !2161
  %131 = load i32* %m, align 4, !dbg !2161
  %132 = sext i32 %131 to i64, !dbg !2161
  %133 = load %struct.ct_data** %tree, align 8, !dbg !2161
  %134 = getelementptr inbounds %struct.ct_data* %133, i64 %132, !dbg !2161
  %135 = getelementptr inbounds %struct.ct_data* %134, i32 0, i32 0, !dbg !2161
  %136 = bitcast %union.anon.10* %135 to i16*, !dbg !2161
  %137 = load i16* %136, align 2, !dbg !2161
  %138 = zext i16 %137 to i32, !dbg !2161
  %139 = add nsw i32 %130, %138, !dbg !2161
  %140 = trunc i32 %139 to i16, !dbg !2161
  %141 = load i32* %node, align 4, !dbg !2161
  %142 = sext i32 %141 to i64, !dbg !2161
  %143 = load %struct.ct_data** %tree, align 8, !dbg !2161
  %144 = getelementptr inbounds %struct.ct_data* %143, i64 %142, !dbg !2161
  %145 = getelementptr inbounds %struct.ct_data* %144, i32 0, i32 0, !dbg !2161
  %146 = bitcast %union.anon.10* %145 to i16*, !dbg !2161
  store i16 %140, i16* %146, align 2, !dbg !2161
  %147 = load i32* %n, align 4, !dbg !2162
  %148 = sext i32 %147 to i64, !dbg !2162
  %149 = getelementptr inbounds [573 x i8]* @depth, i32 0, i64 %148, !dbg !2162
  %150 = load i8* %149, align 1, !dbg !2162
  %151 = zext i8 %150 to i32, !dbg !2162
  %152 = load i32* %m, align 4, !dbg !2162
  %153 = sext i32 %152 to i64, !dbg !2162
  %154 = getelementptr inbounds [573 x i8]* @depth, i32 0, i64 %153, !dbg !2162
  %155 = load i8* %154, align 1, !dbg !2162
  %156 = zext i8 %155 to i32, !dbg !2162
  %157 = icmp sge i32 %151, %156, !dbg !2162
  br i1 %157, label %158, label %164, !dbg !2162

; <label>:158                                     ; preds = %104
  %159 = load i32* %n, align 4, !dbg !2162
  %160 = sext i32 %159 to i64, !dbg !2162
  %161 = getelementptr inbounds [573 x i8]* @depth, i32 0, i64 %160, !dbg !2162
  %162 = load i8* %161, align 1, !dbg !2162
  %163 = zext i8 %162 to i32, !dbg !2162
  br label %170, !dbg !2162

; <label>:164                                     ; preds = %104
  %165 = load i32* %m, align 4, !dbg !2162
  %166 = sext i32 %165 to i64, !dbg !2162
  %167 = getelementptr inbounds [573 x i8]* @depth, i32 0, i64 %166, !dbg !2162
  %168 = load i8* %167, align 1, !dbg !2162
  %169 = zext i8 %168 to i32, !dbg !2162
  br label %170, !dbg !2162

; <label>:170                                     ; preds = %164, %158
  %171 = phi i32 [ %163, %158 ], [ %169, %164 ], !dbg !2162
  %172 = add nsw i32 %171, 1, !dbg !2162
  %173 = trunc i32 %172 to i8, !dbg !2162
  %174 = load i32* %node, align 4, !dbg !2162
  %175 = sext i32 %174 to i64, !dbg !2162
  %176 = getelementptr inbounds [573 x i8]* @depth, i32 0, i64 %175, !dbg !2162
  store i8 %173, i8* %176, align 1, !dbg !2162
  %177 = load i32* %node, align 4, !dbg !2163
  %178 = trunc i32 %177 to i16, !dbg !2163
  %179 = load i32* %m, align 4, !dbg !2163
  %180 = sext i32 %179 to i64, !dbg !2163
  %181 = load %struct.ct_data** %tree, align 8, !dbg !2163
  %182 = getelementptr inbounds %struct.ct_data* %181, i64 %180, !dbg !2163
  %183 = getelementptr inbounds %struct.ct_data* %182, i32 0, i32 1, !dbg !2163
  %184 = bitcast %union.anon.0* %183 to i16*, !dbg !2163
  store i16 %178, i16* %184, align 2, !dbg !2163
  %185 = load i32* %n, align 4, !dbg !2163
  %186 = sext i32 %185 to i64, !dbg !2163
  %187 = load %struct.ct_data** %tree, align 8, !dbg !2163
  %188 = getelementptr inbounds %struct.ct_data* %187, i64 %186, !dbg !2163
  %189 = getelementptr inbounds %struct.ct_data* %188, i32 0, i32 1, !dbg !2163
  %190 = bitcast %union.anon.0* %189 to i16*, !dbg !2163
  store i16 %178, i16* %190, align 2, !dbg !2163
  %191 = load i32* %node, align 4, !dbg !2164
  %192 = add nsw i32 %191, 1, !dbg !2164
  store i32 %192, i32* %node, align 4, !dbg !2164
  store i32 %191, i32* getelementptr inbounds ([573 x i32]* @heap, i32 0, i64 1), align 4, !dbg !2164
  %193 = load %struct.ct_data** %tree, align 8, !dbg !2165
  call void (...)* bitcast (void (%struct.ct_data*, i32)* @pqdownheap to void (...)*)(%struct.ct_data* %193, i32 1), !dbg !2165
  br label %194, !dbg !2166

; <label>:194                                     ; preds = %170
  %195 = load i32* @heap_len, align 4, !dbg !2166
  %196 = icmp sge i32 %195, 2, !dbg !2166
  br i1 %196, label %104, label %197, !dbg !2166

; <label>:197                                     ; preds = %194
  %198 = load i32* getelementptr inbounds ([573 x i32]* @heap, i32 0, i64 1), align 4, !dbg !2167
  %199 = load i32* @heap_max, align 4, !dbg !2167
  %200 = add nsw i32 %199, -1, !dbg !2167
  store i32 %200, i32* @heap_max, align 4, !dbg !2167
  %201 = sext i32 %200 to i64, !dbg !2167
  %202 = getelementptr inbounds [573 x i32]* @heap, i32 0, i64 %201, !dbg !2167
  store i32 %198, i32* %202, align 4, !dbg !2167
  %203 = load %struct.tree_desc** %1, align 8, !dbg !2168
  call void (...)* bitcast (void (%struct.tree_desc*)* @gen_bitlen to void (...)*)(%struct.tree_desc* %203), !dbg !2168
  %204 = load %struct.ct_data** %tree, align 8, !dbg !2169
  %205 = load i32* %max_code, align 4, !dbg !2169
  call void (...)* bitcast (void (%struct.ct_data*, i32)* @gen_codes to void (...)*)(%struct.ct_data* %204, i32 %205), !dbg !2169
  ret void, !dbg !2170
}

define internal i32 @build_bl_tree() nounwind uwtable {
  %max_blindex = alloca i32, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !2171), !dbg !2173
  %1 = load i32* getelementptr inbounds (%struct.tree_desc* @l_desc, i32 0, i32 6), align 4, !dbg !2174
  call void (...)* bitcast (void (%struct.ct_data*, i32)* @scan_tree to void (...)*)(%struct.ct_data* getelementptr inbounds ([573 x %struct.ct_data]* @dyn_ltree, i32 0, i32 0), i32 %1), !dbg !2174
  %2 = load i32* getelementptr inbounds (%struct.tree_desc* @d_desc, i32 0, i32 6), align 4, !dbg !2175
  call void (...)* bitcast (void (%struct.ct_data*, i32)* @scan_tree to void (...)*)(%struct.ct_data* getelementptr inbounds ([61 x %struct.ct_data]* @dyn_dtree, i32 0, i32 0), i32 %2), !dbg !2175
  call void (...)* bitcast (void (%struct.tree_desc*)* @build_tree to void (...)*)(%struct.tree_desc* @bl_desc), !dbg !2176
  store i32 18, i32* %max_blindex, align 4, !dbg !2177
  br label %3, !dbg !2177

; <label>:3                                       ; preds = %20, %0
  %4 = load i32* %max_blindex, align 4, !dbg !2177
  %5 = icmp sge i32 %4, 3, !dbg !2177
  br i1 %5, label %6, label %23, !dbg !2177

; <label>:6                                       ; preds = %3
  %7 = load i32* %max_blindex, align 4, !dbg !2179
  %8 = sext i32 %7 to i64, !dbg !2179
  %9 = getelementptr inbounds [19 x i8]* @bl_order, i32 0, i64 %8, !dbg !2179
  %10 = load i8* %9, align 1, !dbg !2179
  %11 = zext i8 %10 to i64, !dbg !2179
  %12 = getelementptr inbounds [39 x %struct.ct_data]* @bl_tree, i32 0, i64 %11, !dbg !2179
  %13 = getelementptr inbounds %struct.ct_data* %12, i32 0, i32 1, !dbg !2179
  %14 = bitcast %union.anon.0* %13 to i16*, !dbg !2179
  %15 = load i16* %14, align 2, !dbg !2179
  %16 = zext i16 %15 to i32, !dbg !2179
  %17 = icmp ne i32 %16, 0, !dbg !2179
  br i1 %17, label %18, label %19, !dbg !2179

; <label>:18                                      ; preds = %6
  br label %23, !dbg !2181

; <label>:19                                      ; preds = %6
  br label %20, !dbg !2182

; <label>:20                                      ; preds = %19
  %21 = load i32* %max_blindex, align 4, !dbg !2183
  %22 = add nsw i32 %21, -1, !dbg !2183
  store i32 %22, i32* %max_blindex, align 4, !dbg !2183
  br label %3, !dbg !2183

; <label>:23                                      ; preds = %18, %3
  %24 = load i32* %max_blindex, align 4, !dbg !2184
  %25 = add nsw i32 %24, 1, !dbg !2184
  %26 = mul nsw i32 3, %25, !dbg !2184
  %27 = add nsw i32 %26, 5, !dbg !2184
  %28 = add nsw i32 %27, 5, !dbg !2184
  %29 = add nsw i32 %28, 4, !dbg !2184
  %30 = sext i32 %29 to i64, !dbg !2184
  %31 = load i64* @opt_len, align 8, !dbg !2184
  %32 = add i64 %31, %30, !dbg !2184
  store i64 %32, i64* @opt_len, align 8, !dbg !2184
  %33 = load i32* %max_blindex, align 4, !dbg !2185
  ret i32 %33, !dbg !2185
}

define internal void @compress_block(%struct.ct_data* %ltree, %struct.ct_data* %dtree) nounwind uwtable {
  %1 = alloca %struct.ct_data*, align 8
  %2 = alloca %struct.ct_data*, align 8
  %dist = alloca i32, align 4
  %lc = alloca i32, align 4
  %lx = alloca i32, align 4
  %dx = alloca i32, align 4
  %fx = alloca i32, align 4
  %flag = alloca i8, align 1
  %code = alloca i32, align 4
  %extra = alloca i32, align 4
  store %struct.ct_data* %ltree, %struct.ct_data** %1, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !2186), !dbg !2187
  store %struct.ct_data* %dtree, %struct.ct_data** %2, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !2188), !dbg !2189
  call void @llvm.dbg.declare(metadata !22, metadata !2190), !dbg !2192
  call void @llvm.dbg.declare(metadata !22, metadata !2193), !dbg !2194
  call void @llvm.dbg.declare(metadata !22, metadata !2195), !dbg !2196
  store i32 0, i32* %lx, align 4, !dbg !2197
  call void @llvm.dbg.declare(metadata !22, metadata !2198), !dbg !2199
  store i32 0, i32* %dx, align 4, !dbg !2200
  call void @llvm.dbg.declare(metadata !22, metadata !2201), !dbg !2202
  store i32 0, i32* %fx, align 4, !dbg !2203
  call void @llvm.dbg.declare(metadata !22, metadata !2204), !dbg !2205
  store i8 0, i8* %flag, align 1, !dbg !2206
  call void @llvm.dbg.declare(metadata !22, metadata !2207), !dbg !2208
  call void @llvm.dbg.declare(metadata !22, metadata !2209), !dbg !2210
  %3 = load i32* @last_lit, align 4, !dbg !2211
  %4 = icmp ne i32 %3, 0, !dbg !2211
  br i1 %4, label %5, label %152, !dbg !2211

; <label>:5                                       ; preds = %0
  br label %6, !dbg !2212

; <label>:6                                       ; preds = %147, %5
  %7 = load i32* %lx, align 4, !dbg !2213
  %8 = and i32 %7, 7, !dbg !2213
  %9 = icmp eq i32 %8, 0, !dbg !2213
  br i1 %9, label %10, label %16, !dbg !2213

; <label>:10                                      ; preds = %6
  %11 = load i32* %fx, align 4, !dbg !2215
  %12 = add i32 %11, 1, !dbg !2215
  store i32 %12, i32* %fx, align 4, !dbg !2215
  %13 = zext i32 %11 to i64, !dbg !2215
  %14 = getelementptr inbounds [4096 x i8]* @flag_buf, i32 0, i64 %13, !dbg !2215
  %15 = load i8* %14, align 1, !dbg !2215
  store i8 %15, i8* %flag, align 1, !dbg !2215
  br label %16, !dbg !2215

; <label>:16                                      ; preds = %10, %6
  %17 = load i32* %lx, align 4, !dbg !2216
  %18 = add i32 %17, 1, !dbg !2216
  store i32 %18, i32* %lx, align 4, !dbg !2216
  %19 = zext i32 %17 to i64, !dbg !2216
  %20 = getelementptr inbounds [0 x i8]* @inbuf, i32 0, i64 %19, !dbg !2216
  %21 = load i8* %20, align 1, !dbg !2216
  %22 = zext i8 %21 to i32, !dbg !2216
  store i32 %22, i32* %lc, align 4, !dbg !2216
  %23 = load i8* %flag, align 1, !dbg !2217
  %24 = zext i8 %23 to i32, !dbg !2217
  %25 = and i32 %24, 1, !dbg !2217
  %26 = icmp eq i32 %25, 0, !dbg !2217
  br i1 %26, label %27, label %44, !dbg !2217

; <label>:27                                      ; preds = %16
  %28 = load i32* %lc, align 4, !dbg !2218
  %29 = sext i32 %28 to i64, !dbg !2218
  %30 = load %struct.ct_data** %1, align 8, !dbg !2218
  %31 = getelementptr inbounds %struct.ct_data* %30, i64 %29, !dbg !2218
  %32 = getelementptr inbounds %struct.ct_data* %31, i32 0, i32 0, !dbg !2218
  %33 = bitcast %union.anon.10* %32 to i16*, !dbg !2218
  %34 = load i16* %33, align 2, !dbg !2218
  %35 = zext i16 %34 to i32, !dbg !2218
  %36 = load i32* %lc, align 4, !dbg !2218
  %37 = sext i32 %36 to i64, !dbg !2218
  %38 = load %struct.ct_data** %1, align 8, !dbg !2218
  %39 = getelementptr inbounds %struct.ct_data* %38, i64 %37, !dbg !2218
  %40 = getelementptr inbounds %struct.ct_data* %39, i32 0, i32 1, !dbg !2218
  %41 = bitcast %union.anon.0* %40 to i16*, !dbg !2218
  %42 = load i16* %41, align 2, !dbg !2218
  %43 = zext i16 %42 to i32, !dbg !2218
  call void @send_bits(i32 %35, i32 %43), !dbg !2218
  br label %142, !dbg !2220

; <label>:44                                      ; preds = %16
  %45 = load i32* %lc, align 4, !dbg !2221
  %46 = sext i32 %45 to i64, !dbg !2221
  %47 = getelementptr inbounds [256 x i8]* @length_code, i32 0, i64 %46, !dbg !2221
  %48 = load i8* %47, align 1, !dbg !2221
  %49 = zext i8 %48 to i32, !dbg !2221
  store i32 %49, i32* %code, align 4, !dbg !2221
  %50 = load i32* %code, align 4, !dbg !2223
  %51 = add i32 %50, 256, !dbg !2223
  %52 = add i32 %51, 1, !dbg !2223
  %53 = zext i32 %52 to i64, !dbg !2223
  %54 = load %struct.ct_data** %1, align 8, !dbg !2223
  %55 = getelementptr inbounds %struct.ct_data* %54, i64 %53, !dbg !2223
  %56 = getelementptr inbounds %struct.ct_data* %55, i32 0, i32 0, !dbg !2223
  %57 = bitcast %union.anon.10* %56 to i16*, !dbg !2223
  %58 = load i16* %57, align 2, !dbg !2223
  %59 = zext i16 %58 to i32, !dbg !2223
  %60 = load i32* %code, align 4, !dbg !2223
  %61 = add i32 %60, 256, !dbg !2223
  %62 = add i32 %61, 1, !dbg !2223
  %63 = zext i32 %62 to i64, !dbg !2223
  %64 = load %struct.ct_data** %1, align 8, !dbg !2223
  %65 = getelementptr inbounds %struct.ct_data* %64, i64 %63, !dbg !2223
  %66 = getelementptr inbounds %struct.ct_data* %65, i32 0, i32 1, !dbg !2223
  %67 = bitcast %union.anon.0* %66 to i16*, !dbg !2223
  %68 = load i16* %67, align 2, !dbg !2223
  %69 = zext i16 %68 to i32, !dbg !2223
  call void @send_bits(i32 %59, i32 %69), !dbg !2223
  %70 = load i32* %code, align 4, !dbg !2224
  %71 = zext i32 %70 to i64, !dbg !2224
  %72 = getelementptr inbounds [29 x i32]* @extra_lbits, i32 0, i64 %71, !dbg !2224
  %73 = load i32* %72, align 4, !dbg !2224
  store i32 %73, i32* %extra, align 4, !dbg !2224
  %74 = load i32* %extra, align 4, !dbg !2225
  %75 = icmp ne i32 %74, 0, !dbg !2225
  br i1 %75, label %76, label %85, !dbg !2225

; <label>:76                                      ; preds = %44
  %77 = load i32* %code, align 4, !dbg !2226
  %78 = zext i32 %77 to i64, !dbg !2226
  %79 = getelementptr inbounds [29 x i32]* @base_length, i32 0, i64 %78, !dbg !2226
  %80 = load i32* %79, align 4, !dbg !2226
  %81 = load i32* %lc, align 4, !dbg !2226
  %82 = sub nsw i32 %81, %80, !dbg !2226
  store i32 %82, i32* %lc, align 4, !dbg !2226
  %83 = load i32* %lc, align 4, !dbg !2228
  %84 = load i32* %extra, align 4, !dbg !2228
  call void @send_bits(i32 %83, i32 %84), !dbg !2228
  br label %85, !dbg !2229

; <label>:85                                      ; preds = %76, %44
  %86 = load i32* %dx, align 4, !dbg !2230
  %87 = add i32 %86, 1, !dbg !2230
  store i32 %87, i32* %dx, align 4, !dbg !2230
  %88 = zext i32 %86 to i64, !dbg !2230
  %89 = getelementptr inbounds [0 x i16]* @d_buf, i32 0, i64 %88, !dbg !2230
  %90 = load i16* %89, align 1, !dbg !2230
  %91 = zext i16 %90 to i32, !dbg !2230
  store i32 %91, i32* %dist, align 4, !dbg !2230
  %92 = load i32* %dist, align 4, !dbg !2231
  %93 = icmp ult i32 %92, 256, !dbg !2231
  br i1 %93, label %94, label %100, !dbg !2231

; <label>:94                                      ; preds = %85
  %95 = load i32* %dist, align 4, !dbg !2231
  %96 = zext i32 %95 to i64, !dbg !2231
  %97 = getelementptr inbounds [512 x i8]* @dist_code, i32 0, i64 %96, !dbg !2231
  %98 = load i8* %97, align 1, !dbg !2231
  %99 = zext i8 %98 to i32, !dbg !2231
  br label %108, !dbg !2231

; <label>:100                                     ; preds = %85
  %101 = load i32* %dist, align 4, !dbg !2231
  %102 = lshr i32 %101, 7, !dbg !2231
  %103 = add i32 256, %102, !dbg !2231
  %104 = zext i32 %103 to i64, !dbg !2231
  %105 = getelementptr inbounds [512 x i8]* @dist_code, i32 0, i64 %104, !dbg !2231
  %106 = load i8* %105, align 1, !dbg !2231
  %107 = zext i8 %106 to i32, !dbg !2231
  br label %108, !dbg !2231

; <label>:108                                     ; preds = %100, %94
  %109 = phi i32 [ %99, %94 ], [ %107, %100 ], !dbg !2231
  store i32 %109, i32* %code, align 4, !dbg !2231
  %110 = load i32* %code, align 4, !dbg !2232
  %111 = zext i32 %110 to i64, !dbg !2232
  %112 = load %struct.ct_data** %2, align 8, !dbg !2232
  %113 = getelementptr inbounds %struct.ct_data* %112, i64 %111, !dbg !2232
  %114 = getelementptr inbounds %struct.ct_data* %113, i32 0, i32 0, !dbg !2232
  %115 = bitcast %union.anon.10* %114 to i16*, !dbg !2232
  %116 = load i16* %115, align 2, !dbg !2232
  %117 = zext i16 %116 to i32, !dbg !2232
  %118 = load i32* %code, align 4, !dbg !2232
  %119 = zext i32 %118 to i64, !dbg !2232
  %120 = load %struct.ct_data** %2, align 8, !dbg !2232
  %121 = getelementptr inbounds %struct.ct_data* %120, i64 %119, !dbg !2232
  %122 = getelementptr inbounds %struct.ct_data* %121, i32 0, i32 1, !dbg !2232
  %123 = bitcast %union.anon.0* %122 to i16*, !dbg !2232
  %124 = load i16* %123, align 2, !dbg !2232
  %125 = zext i16 %124 to i32, !dbg !2232
  call void @send_bits(i32 %117, i32 %125), !dbg !2232
  %126 = load i32* %code, align 4, !dbg !2233
  %127 = zext i32 %126 to i64, !dbg !2233
  %128 = getelementptr inbounds [30 x i32]* @extra_dbits, i32 0, i64 %127, !dbg !2233
  %129 = load i32* %128, align 4, !dbg !2233
  store i32 %129, i32* %extra, align 4, !dbg !2233
  %130 = load i32* %extra, align 4, !dbg !2234
  %131 = icmp ne i32 %130, 0, !dbg !2234
  br i1 %131, label %132, label %141, !dbg !2234

; <label>:132                                     ; preds = %108
  %133 = load i32* %code, align 4, !dbg !2235
  %134 = zext i32 %133 to i64, !dbg !2235
  %135 = getelementptr inbounds [30 x i32]* @base_dist, i32 0, i64 %134, !dbg !2235
  %136 = load i32* %135, align 4, !dbg !2235
  %137 = load i32* %dist, align 4, !dbg !2235
  %138 = sub i32 %137, %136, !dbg !2235
  store i32 %138, i32* %dist, align 4, !dbg !2235
  %139 = load i32* %dist, align 4, !dbg !2237
  %140 = load i32* %extra, align 4, !dbg !2237
  call void @send_bits(i32 %139, i32 %140), !dbg !2237
  br label %141, !dbg !2238

; <label>:141                                     ; preds = %132, %108
  br label %142

; <label>:142                                     ; preds = %141, %27
  %143 = load i8* %flag, align 1, !dbg !2239
  %144 = zext i8 %143 to i32, !dbg !2239
  %145 = ashr i32 %144, 1, !dbg !2239
  %146 = trunc i32 %145 to i8, !dbg !2239
  store i8 %146, i8* %flag, align 1, !dbg !2239
  br label %147, !dbg !2240

; <label>:147                                     ; preds = %142
  %148 = load i32* %lx, align 4, !dbg !2240
  %149 = load i32* @last_lit, align 4, !dbg !2240
  %150 = icmp ult i32 %148, %149, !dbg !2240
  br i1 %150, label %6, label %151, !dbg !2240

; <label>:151                                     ; preds = %147
  br label %152, !dbg !2240

; <label>:152                                     ; preds = %151, %0
  %153 = load %struct.ct_data** %1, align 8, !dbg !2241
  %154 = getelementptr inbounds %struct.ct_data* %153, i64 256, !dbg !2241
  %155 = getelementptr inbounds %struct.ct_data* %154, i32 0, i32 0, !dbg !2241
  %156 = bitcast %union.anon.10* %155 to i16*, !dbg !2241
  %157 = load i16* %156, align 2, !dbg !2241
  %158 = zext i16 %157 to i32, !dbg !2241
  %159 = load %struct.ct_data** %1, align 8, !dbg !2241
  %160 = getelementptr inbounds %struct.ct_data* %159, i64 256, !dbg !2241
  %161 = getelementptr inbounds %struct.ct_data* %160, i32 0, i32 1, !dbg !2241
  %162 = bitcast %union.anon.0* %161 to i16*, !dbg !2241
  %163 = load i16* %162, align 2, !dbg !2241
  %164 = zext i16 %163 to i32, !dbg !2241
  call void @send_bits(i32 %158, i32 %164), !dbg !2241
  ret void, !dbg !2242
}

define internal void @send_all_trees(i32 %lcodes, i32 %dcodes, i32 %blcodes) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %rank = alloca i32, align 4
  store i32 %lcodes, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !2243), !dbg !2244
  store i32 %dcodes, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !2245), !dbg !2246
  store i32 %blcodes, i32* %3, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !2247), !dbg !2248
  call void @llvm.dbg.declare(metadata !22, metadata !2249), !dbg !2251
  %4 = load i32* %1, align 4, !dbg !2252
  %5 = sub nsw i32 %4, 257, !dbg !2252
  call void @send_bits(i32 %5, i32 5), !dbg !2252
  %6 = load i32* %2, align 4, !dbg !2253
  %7 = sub nsw i32 %6, 1, !dbg !2253
  call void @send_bits(i32 %7, i32 5), !dbg !2253
  %8 = load i32* %3, align 4, !dbg !2254
  %9 = sub nsw i32 %8, 4, !dbg !2254
  call void @send_bits(i32 %9, i32 4), !dbg !2254
  store i32 0, i32* %rank, align 4, !dbg !2255
  br label %10, !dbg !2255

; <label>:10                                      ; preds = %25, %0
  %11 = load i32* %rank, align 4, !dbg !2255
  %12 = load i32* %3, align 4, !dbg !2255
  %13 = icmp slt i32 %11, %12, !dbg !2255
  br i1 %13, label %14, label %28, !dbg !2255

; <label>:14                                      ; preds = %10
  %15 = load i32* %rank, align 4, !dbg !2257
  %16 = sext i32 %15 to i64, !dbg !2257
  %17 = getelementptr inbounds [19 x i8]* @bl_order, i32 0, i64 %16, !dbg !2257
  %18 = load i8* %17, align 1, !dbg !2257
  %19 = zext i8 %18 to i64, !dbg !2257
  %20 = getelementptr inbounds [39 x %struct.ct_data]* @bl_tree, i32 0, i64 %19, !dbg !2257
  %21 = getelementptr inbounds %struct.ct_data* %20, i32 0, i32 1, !dbg !2257
  %22 = bitcast %union.anon.0* %21 to i16*, !dbg !2257
  %23 = load i16* %22, align 2, !dbg !2257
  %24 = zext i16 %23 to i32, !dbg !2257
  call void @send_bits(i32 %24, i32 3), !dbg !2257
  br label %25, !dbg !2259

; <label>:25                                      ; preds = %14
  %26 = load i32* %rank, align 4, !dbg !2260
  %27 = add nsw i32 %26, 1, !dbg !2260
  store i32 %27, i32* %rank, align 4, !dbg !2260
  br label %10, !dbg !2260

; <label>:28                                      ; preds = %10
  %29 = load i32* %1, align 4, !dbg !2261
  %30 = sub nsw i32 %29, 1, !dbg !2261
  call void (...)* bitcast (void (%struct.ct_data*, i32)* @send_tree to void (...)*)(%struct.ct_data* getelementptr inbounds ([573 x %struct.ct_data]* @dyn_ltree, i32 0, i32 0), i32 %30), !dbg !2261
  %31 = load i32* %2, align 4, !dbg !2262
  %32 = sub nsw i32 %31, 1, !dbg !2262
  call void (...)* bitcast (void (%struct.ct_data*, i32)* @send_tree to void (...)*)(%struct.ct_data* getelementptr inbounds ([61 x %struct.ct_data]* @dyn_dtree, i32 0, i32 0), i32 %32), !dbg !2262
  ret void, !dbg !2263
}

define i32 @ct_tally(i32 %dist, i32 %lc) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %out_length = alloca i64, align 8
  %in_length = alloca i64, align 8
  %dcode = alloca i32, align 4
  store i32 %dist, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !2264), !dbg !2265
  store i32 %lc, i32* %3, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !2266), !dbg !2267
  %4 = load i32* %3, align 4, !dbg !2268
  %5 = trunc i32 %4 to i8, !dbg !2268
  %6 = load i32* @last_lit, align 4, !dbg !2268
  %7 = add i32 %6, 1, !dbg !2268
  store i32 %7, i32* @last_lit, align 4, !dbg !2268
  %8 = zext i32 %6 to i64, !dbg !2268
  %9 = getelementptr inbounds [0 x i8]* @inbuf, i32 0, i64 %8, !dbg !2268
  store i8 %5, i8* %9, align 1, !dbg !2268
  %10 = load i32* %2, align 4, !dbg !2270
  %11 = icmp eq i32 %10, 0, !dbg !2270
  br i1 %11, label %12, label %20, !dbg !2270

; <label>:12                                      ; preds = %0
  %13 = load i32* %3, align 4, !dbg !2271
  %14 = sext i32 %13 to i64, !dbg !2271
  %15 = getelementptr inbounds [573 x %struct.ct_data]* @dyn_ltree, i32 0, i64 %14, !dbg !2271
  %16 = getelementptr inbounds %struct.ct_data* %15, i32 0, i32 0, !dbg !2271
  %17 = bitcast %union.anon.10* %16 to i16*, !dbg !2271
  %18 = load i16* %17, align 2, !dbg !2271
  %19 = add i16 %18, 1, !dbg !2271
  store i16 %19, i16* %17, align 2, !dbg !2271
  br label %72, !dbg !2273

; <label>:20                                      ; preds = %0
  %21 = load i32* %2, align 4, !dbg !2274
  %22 = add nsw i32 %21, -1, !dbg !2274
  store i32 %22, i32* %2, align 4, !dbg !2274
  %23 = load i32* %3, align 4, !dbg !2276
  %24 = sext i32 %23 to i64, !dbg !2276
  %25 = getelementptr inbounds [256 x i8]* @length_code, i32 0, i64 %24, !dbg !2276
  %26 = load i8* %25, align 1, !dbg !2276
  %27 = zext i8 %26 to i32, !dbg !2276
  %28 = add nsw i32 %27, 256, !dbg !2276
  %29 = add nsw i32 %28, 1, !dbg !2276
  %30 = sext i32 %29 to i64, !dbg !2276
  %31 = getelementptr inbounds [573 x %struct.ct_data]* @dyn_ltree, i32 0, i64 %30, !dbg !2276
  %32 = getelementptr inbounds %struct.ct_data* %31, i32 0, i32 0, !dbg !2276
  %33 = bitcast %union.anon.10* %32 to i16*, !dbg !2276
  %34 = load i16* %33, align 2, !dbg !2276
  %35 = add i16 %34, 1, !dbg !2276
  store i16 %35, i16* %33, align 2, !dbg !2276
  %36 = load i32* %2, align 4, !dbg !2277
  %37 = icmp slt i32 %36, 256, !dbg !2277
  br i1 %37, label %38, label %44, !dbg !2277

; <label>:38                                      ; preds = %20
  %39 = load i32* %2, align 4, !dbg !2277
  %40 = sext i32 %39 to i64, !dbg !2277
  %41 = getelementptr inbounds [512 x i8]* @dist_code, i32 0, i64 %40, !dbg !2277
  %42 = load i8* %41, align 1, !dbg !2277
  %43 = zext i8 %42 to i32, !dbg !2277
  br label %52, !dbg !2277

; <label>:44                                      ; preds = %20
  %45 = load i32* %2, align 4, !dbg !2277
  %46 = ashr i32 %45, 7, !dbg !2277
  %47 = add nsw i32 256, %46, !dbg !2277
  %48 = sext i32 %47 to i64, !dbg !2277
  %49 = getelementptr inbounds [512 x i8]* @dist_code, i32 0, i64 %48, !dbg !2277
  %50 = load i8* %49, align 1, !dbg !2277
  %51 = zext i8 %50 to i32, !dbg !2277
  br label %52, !dbg !2277

; <label>:52                                      ; preds = %44, %38
  %53 = phi i32 [ %43, %38 ], [ %51, %44 ], !dbg !2277
  %54 = sext i32 %53 to i64, !dbg !2277
  %55 = getelementptr inbounds [61 x %struct.ct_data]* @dyn_dtree, i32 0, i64 %54, !dbg !2277
  %56 = getelementptr inbounds %struct.ct_data* %55, i32 0, i32 0, !dbg !2277
  %57 = bitcast %union.anon.10* %56 to i16*, !dbg !2277
  %58 = load i16* %57, align 2, !dbg !2277
  %59 = add i16 %58, 1, !dbg !2277
  store i16 %59, i16* %57, align 2, !dbg !2277
  %60 = load i32* %2, align 4, !dbg !2278
  %61 = trunc i32 %60 to i16, !dbg !2278
  %62 = load i32* @last_dist, align 4, !dbg !2278
  %63 = add i32 %62, 1, !dbg !2278
  store i32 %63, i32* @last_dist, align 4, !dbg !2278
  %64 = zext i32 %62 to i64, !dbg !2278
  %65 = getelementptr inbounds [0 x i16]* @d_buf, i32 0, i64 %64, !dbg !2278
  store i16 %61, i16* %65, align 1, !dbg !2278
  %66 = load i8* @flag_bit, align 1, !dbg !2279
  %67 = zext i8 %66 to i32, !dbg !2279
  %68 = load i8* @flags, align 1, !dbg !2279
  %69 = zext i8 %68 to i32, !dbg !2279
  %70 = or i32 %69, %67, !dbg !2279
  %71 = trunc i32 %70 to i8, !dbg !2279
  store i8 %71, i8* @flags, align 1, !dbg !2279
  br label %72

; <label>:72                                      ; preds = %52, %12
  %73 = load i8* @flag_bit, align 1, !dbg !2280
  %74 = zext i8 %73 to i32, !dbg !2280
  %75 = shl i32 %74, 1, !dbg !2280
  %76 = trunc i32 %75 to i8, !dbg !2280
  store i8 %76, i8* @flag_bit, align 1, !dbg !2280
  %77 = load i32* @last_lit, align 4, !dbg !2281
  %78 = and i32 %77, 7, !dbg !2281
  %79 = icmp eq i32 %78, 0, !dbg !2281
  br i1 %79, label %80, label %86, !dbg !2281

; <label>:80                                      ; preds = %72
  %81 = load i8* @flags, align 1, !dbg !2282
  %82 = load i32* @last_flags, align 4, !dbg !2282
  %83 = add i32 %82, 1, !dbg !2282
  store i32 %83, i32* @last_flags, align 4, !dbg !2282
  %84 = zext i32 %82 to i64, !dbg !2282
  %85 = getelementptr inbounds [4096 x i8]* @flag_buf, i32 0, i64 %84, !dbg !2282
  store i8 %81, i8* %85, align 1, !dbg !2282
  store i8 0, i8* @flags, align 1, !dbg !2284
  store i8 1, i8* @flag_bit, align 1, !dbg !2284
  br label %86, !dbg !2285

; <label>:86                                      ; preds = %80, %72
  %87 = load i32* @level, align 4, !dbg !2286
  %88 = icmp sgt i32 %87, 2, !dbg !2286
  br i1 %88, label %89, label %138, !dbg !2286

; <label>:89                                      ; preds = %86
  %90 = load i32* @last_lit, align 4, !dbg !2286
  %91 = and i32 %90, 4095, !dbg !2286
  %92 = icmp eq i32 %91, 0, !dbg !2286
  br i1 %92, label %93, label %138, !dbg !2286

; <label>:93                                      ; preds = %89
  call void @llvm.dbg.declare(metadata !22, metadata !2287), !dbg !2289
  %94 = load i32* @last_lit, align 4, !dbg !2290
  %95 = zext i32 %94 to i64, !dbg !2290
  %96 = mul i64 %95, 8, !dbg !2290
  store i64 %96, i64* %out_length, align 8, !dbg !2290
  call void @llvm.dbg.declare(metadata !22, metadata !2291), !dbg !2292
  %97 = load i32* @strstart, align 4, !dbg !2293
  %98 = zext i32 %97 to i64, !dbg !2293
  %99 = load i64* @block_start, align 8, !dbg !2293
  %100 = sub i64 %98, %99, !dbg !2293
  store i64 %100, i64* %in_length, align 8, !dbg !2293
  call void @llvm.dbg.declare(metadata !22, metadata !2294), !dbg !2295
  store i32 0, i32* %dcode, align 4, !dbg !2296
  br label %101, !dbg !2296

; <label>:101                                     ; preds = %121, %93
  %102 = load i32* %dcode, align 4, !dbg !2296
  %103 = icmp slt i32 %102, 30, !dbg !2296
  br i1 %103, label %104, label %124, !dbg !2296

; <label>:104                                     ; preds = %101
  %105 = load i32* %dcode, align 4, !dbg !2298
  %106 = sext i32 %105 to i64, !dbg !2298
  %107 = getelementptr inbounds [61 x %struct.ct_data]* @dyn_dtree, i32 0, i64 %106, !dbg !2298
  %108 = getelementptr inbounds %struct.ct_data* %107, i32 0, i32 0, !dbg !2298
  %109 = bitcast %union.anon.10* %108 to i16*, !dbg !2298
  %110 = load i16* %109, align 2, !dbg !2298
  %111 = zext i16 %110 to i64, !dbg !2298
  %112 = load i32* %dcode, align 4, !dbg !2298
  %113 = sext i32 %112 to i64, !dbg !2298
  %114 = getelementptr inbounds [30 x i32]* @extra_dbits, i32 0, i64 %113, !dbg !2298
  %115 = load i32* %114, align 4, !dbg !2298
  %116 = sext i32 %115 to i64, !dbg !2298
  %117 = add nsw i64 5, %116, !dbg !2298
  %118 = mul i64 %111, %117, !dbg !2298
  %119 = load i64* %out_length, align 8, !dbg !2298
  %120 = add i64 %119, %118, !dbg !2298
  store i64 %120, i64* %out_length, align 8, !dbg !2298
  br label %121, !dbg !2300

; <label>:121                                     ; preds = %104
  %122 = load i32* %dcode, align 4, !dbg !2301
  %123 = add nsw i32 %122, 1, !dbg !2301
  store i32 %123, i32* %dcode, align 4, !dbg !2301
  br label %101, !dbg !2301

; <label>:124                                     ; preds = %101
  %125 = load i64* %out_length, align 8, !dbg !2302
  %126 = lshr i64 %125, 3, !dbg !2302
  store i64 %126, i64* %out_length, align 8, !dbg !2302
  %127 = load i32* @last_dist, align 4, !dbg !2303
  %128 = load i32* @last_lit, align 4, !dbg !2303
  %129 = udiv i32 %128, 2, !dbg !2303
  %130 = icmp ult i32 %127, %129, !dbg !2303
  br i1 %130, label %131, label %137, !dbg !2303

; <label>:131                                     ; preds = %124
  %132 = load i64* %out_length, align 8, !dbg !2303
  %133 = load i64* %in_length, align 8, !dbg !2303
  %134 = udiv i64 %133, 2, !dbg !2303
  %135 = icmp ult i64 %132, %134, !dbg !2303
  br i1 %135, label %136, label %137, !dbg !2303

; <label>:136                                     ; preds = %131
  store i32 1, i32* %1, !dbg !2304
  br label %147, !dbg !2304

; <label>:137                                     ; preds = %131, %124
  br label %138, !dbg !2305

; <label>:138                                     ; preds = %137, %89, %86
  %139 = load i32* @last_lit, align 4, !dbg !2306
  %140 = icmp eq i32 %139, 32767, !dbg !2306
  br i1 %140, label %144, label %141, !dbg !2306

; <label>:141                                     ; preds = %138
  %142 = load i32* @last_dist, align 4, !dbg !2306
  %143 = icmp eq i32 %142, 32768, !dbg !2306
  br label %144, !dbg !2306

; <label>:144                                     ; preds = %141, %138
  %145 = phi i1 [ true, %138 ], [ %143, %141 ]
  %146 = zext i1 %145 to i32, !dbg !2306
  store i32 %146, i32* %1, !dbg !2306
  br label %147, !dbg !2306

; <label>:147                                     ; preds = %144, %136
  %148 = load i32* %1, !dbg !2307
  ret i32 %148, !dbg !2307
}

define internal void @send_tree(%struct.ct_data* %tree, i32 %max_code) nounwind uwtable {
  %1 = alloca %struct.ct_data*, align 8
  %2 = alloca i32, align 4
  %n = alloca i32, align 4
  %prevlen = alloca i32, align 4
  %curlen = alloca i32, align 4
  %nextlen = alloca i32, align 4
  %count = alloca i32, align 4
  %max_count = alloca i32, align 4
  %min_count = alloca i32, align 4
  store %struct.ct_data* %tree, %struct.ct_data** %1, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !2308), !dbg !2309
  store i32 %max_code, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !2310), !dbg !2311
  call void @llvm.dbg.declare(metadata !22, metadata !2312), !dbg !2314
  call void @llvm.dbg.declare(metadata !22, metadata !2315), !dbg !2316
  store i32 -1, i32* %prevlen, align 4, !dbg !2317
  call void @llvm.dbg.declare(metadata !22, metadata !2318), !dbg !2319
  call void @llvm.dbg.declare(metadata !22, metadata !2320), !dbg !2321
  %3 = load %struct.ct_data** %1, align 8, !dbg !2322
  %4 = getelementptr inbounds %struct.ct_data* %3, i64 0, !dbg !2322
  %5 = getelementptr inbounds %struct.ct_data* %4, i32 0, i32 1, !dbg !2322
  %6 = bitcast %union.anon.0* %5 to i16*, !dbg !2322
  %7 = load i16* %6, align 2, !dbg !2322
  %8 = zext i16 %7 to i32, !dbg !2322
  store i32 %8, i32* %nextlen, align 4, !dbg !2322
  call void @llvm.dbg.declare(metadata !22, metadata !2323), !dbg !2324
  store i32 0, i32* %count, align 4, !dbg !2325
  call void @llvm.dbg.declare(metadata !22, metadata !2326), !dbg !2327
  store i32 7, i32* %max_count, align 4, !dbg !2328
  call void @llvm.dbg.declare(metadata !22, metadata !2329), !dbg !2330
  store i32 4, i32* %min_count, align 4, !dbg !2331
  %9 = load i32* %nextlen, align 4, !dbg !2332
  %10 = icmp eq i32 %9, 0, !dbg !2332
  br i1 %10, label %11, label %12, !dbg !2332

; <label>:11                                      ; preds = %0
  store i32 138, i32* %max_count, align 4, !dbg !2333
  store i32 3, i32* %min_count, align 4, !dbg !2333
  br label %12, !dbg !2333

; <label>:12                                      ; preds = %11, %0
  store i32 0, i32* %n, align 4, !dbg !2334
  br label %13, !dbg !2334

; <label>:13                                      ; preds = %126, %12
  %14 = load i32* %n, align 4, !dbg !2334
  %15 = load i32* %2, align 4, !dbg !2334
  %16 = icmp sle i32 %14, %15, !dbg !2334
  br i1 %16, label %17, label %129, !dbg !2334

; <label>:17                                      ; preds = %13
  %18 = load i32* %nextlen, align 4, !dbg !2336
  store i32 %18, i32* %curlen, align 4, !dbg !2336
  %19 = load i32* %n, align 4, !dbg !2338
  %20 = add nsw i32 %19, 1, !dbg !2338
  %21 = sext i32 %20 to i64, !dbg !2338
  %22 = load %struct.ct_data** %1, align 8, !dbg !2338
  %23 = getelementptr inbounds %struct.ct_data* %22, i64 %21, !dbg !2338
  %24 = getelementptr inbounds %struct.ct_data* %23, i32 0, i32 1, !dbg !2338
  %25 = bitcast %union.anon.0* %24 to i16*, !dbg !2338
  %26 = load i16* %25, align 2, !dbg !2338
  %27 = zext i16 %26 to i32, !dbg !2338
  store i32 %27, i32* %nextlen, align 4, !dbg !2338
  %28 = load i32* %count, align 4, !dbg !2339
  %29 = add nsw i32 %28, 1, !dbg !2339
  store i32 %29, i32* %count, align 4, !dbg !2339
  %30 = load i32* %max_count, align 4, !dbg !2339
  %31 = icmp slt i32 %29, %30, !dbg !2339
  br i1 %31, label %32, label %37, !dbg !2339

; <label>:32                                      ; preds = %17
  %33 = load i32* %curlen, align 4, !dbg !2339
  %34 = load i32* %nextlen, align 4, !dbg !2339
  %35 = icmp eq i32 %33, %34, !dbg !2339
  br i1 %35, label %36, label %37, !dbg !2339

; <label>:36                                      ; preds = %32
  br label %126, !dbg !2340

; <label>:37                                      ; preds = %32, %17
  %38 = load i32* %count, align 4, !dbg !2342
  %39 = load i32* %min_count, align 4, !dbg !2342
  %40 = icmp slt i32 %38, %39, !dbg !2342
  br i1 %40, label %41, label %62, !dbg !2342

; <label>:41                                      ; preds = %37
  br label %42, !dbg !2343

; <label>:42                                      ; preds = %57, %41
  %43 = load i32* %curlen, align 4, !dbg !2345
  %44 = sext i32 %43 to i64, !dbg !2345
  %45 = getelementptr inbounds [39 x %struct.ct_data]* @bl_tree, i32 0, i64 %44, !dbg !2345
  %46 = getelementptr inbounds %struct.ct_data* %45, i32 0, i32 0, !dbg !2345
  %47 = bitcast %union.anon.10* %46 to i16*, !dbg !2345
  %48 = load i16* %47, align 2, !dbg !2345
  %49 = zext i16 %48 to i32, !dbg !2345
  %50 = load i32* %curlen, align 4, !dbg !2345
  %51 = sext i32 %50 to i64, !dbg !2345
  %52 = getelementptr inbounds [39 x %struct.ct_data]* @bl_tree, i32 0, i64 %51, !dbg !2345
  %53 = getelementptr inbounds %struct.ct_data* %52, i32 0, i32 1, !dbg !2345
  %54 = bitcast %union.anon.0* %53 to i16*, !dbg !2345
  %55 = load i16* %54, align 2, !dbg !2345
  %56 = zext i16 %55 to i32, !dbg !2345
  call void @send_bits(i32 %49, i32 %56), !dbg !2345
  br label %57, !dbg !2347

; <label>:57                                      ; preds = %42
  %58 = load i32* %count, align 4, !dbg !2347
  %59 = add nsw i32 %58, -1, !dbg !2347
  store i32 %59, i32* %count, align 4, !dbg !2347
  %60 = icmp ne i32 %59, 0, !dbg !2347
  br i1 %60, label %42, label %61, !dbg !2347

; <label>:61                                      ; preds = %57
  br label %112, !dbg !2348

; <label>:62                                      ; preds = %37
  %63 = load i32* %curlen, align 4, !dbg !2349
  %64 = icmp ne i32 %63, 0, !dbg !2349
  br i1 %64, label %65, label %93, !dbg !2349

; <label>:65                                      ; preds = %62
  %66 = load i32* %curlen, align 4, !dbg !2350
  %67 = load i32* %prevlen, align 4, !dbg !2350
  %68 = icmp ne i32 %66, %67, !dbg !2350
  br i1 %68, label %69, label %86, !dbg !2350

; <label>:69                                      ; preds = %65
  %70 = load i32* %curlen, align 4, !dbg !2352
  %71 = sext i32 %70 to i64, !dbg !2352
  %72 = getelementptr inbounds [39 x %struct.ct_data]* @bl_tree, i32 0, i64 %71, !dbg !2352
  %73 = getelementptr inbounds %struct.ct_data* %72, i32 0, i32 0, !dbg !2352
  %74 = bitcast %union.anon.10* %73 to i16*, !dbg !2352
  %75 = load i16* %74, align 2, !dbg !2352
  %76 = zext i16 %75 to i32, !dbg !2352
  %77 = load i32* %curlen, align 4, !dbg !2352
  %78 = sext i32 %77 to i64, !dbg !2352
  %79 = getelementptr inbounds [39 x %struct.ct_data]* @bl_tree, i32 0, i64 %78, !dbg !2352
  %80 = getelementptr inbounds %struct.ct_data* %79, i32 0, i32 1, !dbg !2352
  %81 = bitcast %union.anon.0* %80 to i16*, !dbg !2352
  %82 = load i16* %81, align 2, !dbg !2352
  %83 = zext i16 %82 to i32, !dbg !2352
  call void @send_bits(i32 %76, i32 %83), !dbg !2352
  %84 = load i32* %count, align 4, !dbg !2354
  %85 = add nsw i32 %84, -1, !dbg !2354
  store i32 %85, i32* %count, align 4, !dbg !2354
  br label %86, !dbg !2355

; <label>:86                                      ; preds = %69, %65
  %87 = load i16* getelementptr inbounds ([39 x %struct.ct_data]* @bl_tree, i32 0, i64 16, i32 0, i32 0), align 2, !dbg !2356
  %88 = zext i16 %87 to i32, !dbg !2356
  %89 = load i16* getelementptr inbounds ([39 x %struct.ct_data]* @bl_tree, i32 0, i64 16, i32 1, i32 0), align 2, !dbg !2356
  %90 = zext i16 %89 to i32, !dbg !2356
  call void @send_bits(i32 %88, i32 %90), !dbg !2356
  %91 = load i32* %count, align 4, !dbg !2357
  %92 = sub nsw i32 %91, 3, !dbg !2357
  call void @send_bits(i32 %92, i32 2), !dbg !2357
  br label %111, !dbg !2358

; <label>:93                                      ; preds = %62
  %94 = load i32* %count, align 4, !dbg !2359
  %95 = icmp sle i32 %94, 10, !dbg !2359
  br i1 %95, label %96, label %103, !dbg !2359

; <label>:96                                      ; preds = %93
  %97 = load i16* getelementptr inbounds ([39 x %struct.ct_data]* @bl_tree, i32 0, i64 17, i32 0, i32 0), align 2, !dbg !2360
  %98 = zext i16 %97 to i32, !dbg !2360
  %99 = load i16* getelementptr inbounds ([39 x %struct.ct_data]* @bl_tree, i32 0, i64 17, i32 1, i32 0), align 2, !dbg !2360
  %100 = zext i16 %99 to i32, !dbg !2360
  call void @send_bits(i32 %98, i32 %100), !dbg !2360
  %101 = load i32* %count, align 4, !dbg !2362
  %102 = sub nsw i32 %101, 3, !dbg !2362
  call void @send_bits(i32 %102, i32 3), !dbg !2362
  br label %110, !dbg !2363

; <label>:103                                     ; preds = %93
  %104 = load i16* getelementptr inbounds ([39 x %struct.ct_data]* @bl_tree, i32 0, i64 18, i32 0, i32 0), align 2, !dbg !2364
  %105 = zext i16 %104 to i32, !dbg !2364
  %106 = load i16* getelementptr inbounds ([39 x %struct.ct_data]* @bl_tree, i32 0, i64 18, i32 1, i32 0), align 2, !dbg !2364
  %107 = zext i16 %106 to i32, !dbg !2364
  call void @send_bits(i32 %105, i32 %107), !dbg !2364
  %108 = load i32* %count, align 4, !dbg !2366
  %109 = sub nsw i32 %108, 11, !dbg !2366
  call void @send_bits(i32 %109, i32 7), !dbg !2366
  br label %110

; <label>:110                                     ; preds = %103, %96
  br label %111

; <label>:111                                     ; preds = %110, %86
  br label %112

; <label>:112                                     ; preds = %111, %61
  br label %113

; <label>:113                                     ; preds = %112
  store i32 0, i32* %count, align 4, !dbg !2367
  %114 = load i32* %curlen, align 4, !dbg !2368
  store i32 %114, i32* %prevlen, align 4, !dbg !2368
  %115 = load i32* %nextlen, align 4, !dbg !2369
  %116 = icmp eq i32 %115, 0, !dbg !2369
  br i1 %116, label %117, label %118, !dbg !2369

; <label>:117                                     ; preds = %113
  store i32 138, i32* %max_count, align 4, !dbg !2370
  store i32 3, i32* %min_count, align 4, !dbg !2370
  br label %125, !dbg !2372

; <label>:118                                     ; preds = %113
  %119 = load i32* %curlen, align 4, !dbg !2373
  %120 = load i32* %nextlen, align 4, !dbg !2373
  %121 = icmp eq i32 %119, %120, !dbg !2373
  br i1 %121, label %122, label %123, !dbg !2373

; <label>:122                                     ; preds = %118
  store i32 6, i32* %max_count, align 4, !dbg !2374
  store i32 3, i32* %min_count, align 4, !dbg !2374
  br label %124, !dbg !2376

; <label>:123                                     ; preds = %118
  store i32 7, i32* %max_count, align 4, !dbg !2377
  store i32 4, i32* %min_count, align 4, !dbg !2377
  br label %124

; <label>:124                                     ; preds = %123, %122
  br label %125

; <label>:125                                     ; preds = %124, %117
  br label %126, !dbg !2379

; <label>:126                                     ; preds = %125, %36
  %127 = load i32* %n, align 4, !dbg !2380
  %128 = add nsw i32 %127, 1, !dbg !2380
  store i32 %128, i32* %n, align 4, !dbg !2380
  br label %13, !dbg !2380

; <label>:129                                     ; preds = %13
  ret void, !dbg !2381
}

define internal void @scan_tree(%struct.ct_data* %tree, i32 %max_code) nounwind uwtable {
  %1 = alloca %struct.ct_data*, align 8
  %2 = alloca i32, align 4
  %n = alloca i32, align 4
  %prevlen = alloca i32, align 4
  %curlen = alloca i32, align 4
  %nextlen = alloca i32, align 4
  %count = alloca i32, align 4
  %max_count = alloca i32, align 4
  %min_count = alloca i32, align 4
  store %struct.ct_data* %tree, %struct.ct_data** %1, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !2382), !dbg !2383
  store i32 %max_code, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !2384), !dbg !2385
  call void @llvm.dbg.declare(metadata !22, metadata !2386), !dbg !2388
  call void @llvm.dbg.declare(metadata !22, metadata !2389), !dbg !2390
  store i32 -1, i32* %prevlen, align 4, !dbg !2391
  call void @llvm.dbg.declare(metadata !22, metadata !2392), !dbg !2393
  call void @llvm.dbg.declare(metadata !22, metadata !2394), !dbg !2395
  %3 = load %struct.ct_data** %1, align 8, !dbg !2396
  %4 = getelementptr inbounds %struct.ct_data* %3, i64 0, !dbg !2396
  %5 = getelementptr inbounds %struct.ct_data* %4, i32 0, i32 1, !dbg !2396
  %6 = bitcast %union.anon.0* %5 to i16*, !dbg !2396
  %7 = load i16* %6, align 2, !dbg !2396
  %8 = zext i16 %7 to i32, !dbg !2396
  store i32 %8, i32* %nextlen, align 4, !dbg !2396
  call void @llvm.dbg.declare(metadata !22, metadata !2397), !dbg !2398
  store i32 0, i32* %count, align 4, !dbg !2399
  call void @llvm.dbg.declare(metadata !22, metadata !2400), !dbg !2401
  store i32 7, i32* %max_count, align 4, !dbg !2402
  call void @llvm.dbg.declare(metadata !22, metadata !2403), !dbg !2404
  store i32 4, i32* %min_count, align 4, !dbg !2405
  %9 = load i32* %nextlen, align 4, !dbg !2406
  %10 = icmp eq i32 %9, 0, !dbg !2406
  br i1 %10, label %11, label %12, !dbg !2406

; <label>:11                                      ; preds = %0
  store i32 138, i32* %max_count, align 4, !dbg !2407
  store i32 3, i32* %min_count, align 4, !dbg !2407
  br label %12, !dbg !2407

; <label>:12                                      ; preds = %11, %0
  %13 = load i32* %2, align 4, !dbg !2408
  %14 = add nsw i32 %13, 1, !dbg !2408
  %15 = sext i32 %14 to i64, !dbg !2408
  %16 = load %struct.ct_data** %1, align 8, !dbg !2408
  %17 = getelementptr inbounds %struct.ct_data* %16, i64 %15, !dbg !2408
  %18 = getelementptr inbounds %struct.ct_data* %17, i32 0, i32 1, !dbg !2408
  %19 = bitcast %union.anon.0* %18 to i16*, !dbg !2408
  store i16 -1, i16* %19, align 2, !dbg !2408
  store i32 0, i32* %n, align 4, !dbg !2409
  br label %20, !dbg !2409

; <label>:20                                      ; preds = %102, %12
  %21 = load i32* %n, align 4, !dbg !2409
  %22 = load i32* %2, align 4, !dbg !2409
  %23 = icmp sle i32 %21, %22, !dbg !2409
  br i1 %23, label %24, label %105, !dbg !2409

; <label>:24                                      ; preds = %20
  %25 = load i32* %nextlen, align 4, !dbg !2411
  store i32 %25, i32* %curlen, align 4, !dbg !2411
  %26 = load i32* %n, align 4, !dbg !2413
  %27 = add nsw i32 %26, 1, !dbg !2413
  %28 = sext i32 %27 to i64, !dbg !2413
  %29 = load %struct.ct_data** %1, align 8, !dbg !2413
  %30 = getelementptr inbounds %struct.ct_data* %29, i64 %28, !dbg !2413
  %31 = getelementptr inbounds %struct.ct_data* %30, i32 0, i32 1, !dbg !2413
  %32 = bitcast %union.anon.0* %31 to i16*, !dbg !2413
  %33 = load i16* %32, align 2, !dbg !2413
  %34 = zext i16 %33 to i32, !dbg !2413
  store i32 %34, i32* %nextlen, align 4, !dbg !2413
  %35 = load i32* %count, align 4, !dbg !2414
  %36 = add nsw i32 %35, 1, !dbg !2414
  store i32 %36, i32* %count, align 4, !dbg !2414
  %37 = load i32* %max_count, align 4, !dbg !2414
  %38 = icmp slt i32 %36, %37, !dbg !2414
  br i1 %38, label %39, label %44, !dbg !2414

; <label>:39                                      ; preds = %24
  %40 = load i32* %curlen, align 4, !dbg !2414
  %41 = load i32* %nextlen, align 4, !dbg !2414
  %42 = icmp eq i32 %40, %41, !dbg !2414
  br i1 %42, label %43, label %44, !dbg !2414

; <label>:43                                      ; preds = %39
  br label %102, !dbg !2415

; <label>:44                                      ; preds = %39, %24
  %45 = load i32* %count, align 4, !dbg !2417
  %46 = load i32* %min_count, align 4, !dbg !2417
  %47 = icmp slt i32 %45, %46, !dbg !2417
  br i1 %47, label %48, label %59, !dbg !2417

; <label>:48                                      ; preds = %44
  %49 = load i32* %count, align 4, !dbg !2418
  %50 = load i32* %curlen, align 4, !dbg !2418
  %51 = sext i32 %50 to i64, !dbg !2418
  %52 = getelementptr inbounds [39 x %struct.ct_data]* @bl_tree, i32 0, i64 %51, !dbg !2418
  %53 = getelementptr inbounds %struct.ct_data* %52, i32 0, i32 0, !dbg !2418
  %54 = bitcast %union.anon.10* %53 to i16*, !dbg !2418
  %55 = load i16* %54, align 2, !dbg !2418
  %56 = zext i16 %55 to i32, !dbg !2418
  %57 = add nsw i32 %56, %49, !dbg !2418
  %58 = trunc i32 %57 to i16, !dbg !2418
  store i16 %58, i16* %54, align 2, !dbg !2418
  br label %88, !dbg !2420

; <label>:59                                      ; preds = %44
  %60 = load i32* %curlen, align 4, !dbg !2421
  %61 = icmp ne i32 %60, 0, !dbg !2421
  br i1 %61, label %62, label %77, !dbg !2421

; <label>:62                                      ; preds = %59
  %63 = load i32* %curlen, align 4, !dbg !2422
  %64 = load i32* %prevlen, align 4, !dbg !2422
  %65 = icmp ne i32 %63, %64, !dbg !2422
  br i1 %65, label %66, label %74, !dbg !2422

; <label>:66                                      ; preds = %62
  %67 = load i32* %curlen, align 4, !dbg !2424
  %68 = sext i32 %67 to i64, !dbg !2424
  %69 = getelementptr inbounds [39 x %struct.ct_data]* @bl_tree, i32 0, i64 %68, !dbg !2424
  %70 = getelementptr inbounds %struct.ct_data* %69, i32 0, i32 0, !dbg !2424
  %71 = bitcast %union.anon.10* %70 to i16*, !dbg !2424
  %72 = load i16* %71, align 2, !dbg !2424
  %73 = add i16 %72, 1, !dbg !2424
  store i16 %73, i16* %71, align 2, !dbg !2424
  br label %74, !dbg !2424

; <label>:74                                      ; preds = %66, %62
  %75 = load i16* getelementptr inbounds ([39 x %struct.ct_data]* @bl_tree, i32 0, i64 16, i32 0, i32 0), align 2, !dbg !2425
  %76 = add i16 %75, 1, !dbg !2425
  store i16 %76, i16* getelementptr inbounds ([39 x %struct.ct_data]* @bl_tree, i32 0, i64 16, i32 0, i32 0), align 2, !dbg !2425
  br label %87, !dbg !2426

; <label>:77                                      ; preds = %59
  %78 = load i32* %count, align 4, !dbg !2427
  %79 = icmp sle i32 %78, 10, !dbg !2427
  br i1 %79, label %80, label %83, !dbg !2427

; <label>:80                                      ; preds = %77
  %81 = load i16* getelementptr inbounds ([39 x %struct.ct_data]* @bl_tree, i32 0, i64 17, i32 0, i32 0), align 2, !dbg !2428
  %82 = add i16 %81, 1, !dbg !2428
  store i16 %82, i16* getelementptr inbounds ([39 x %struct.ct_data]* @bl_tree, i32 0, i64 17, i32 0, i32 0), align 2, !dbg !2428
  br label %86, !dbg !2430

; <label>:83                                      ; preds = %77
  %84 = load i16* getelementptr inbounds ([39 x %struct.ct_data]* @bl_tree, i32 0, i64 18, i32 0, i32 0), align 2, !dbg !2431
  %85 = add i16 %84, 1, !dbg !2431
  store i16 %85, i16* getelementptr inbounds ([39 x %struct.ct_data]* @bl_tree, i32 0, i64 18, i32 0, i32 0), align 2, !dbg !2431
  br label %86

; <label>:86                                      ; preds = %83, %80
  br label %87

; <label>:87                                      ; preds = %86, %74
  br label %88

; <label>:88                                      ; preds = %87, %48
  br label %89

; <label>:89                                      ; preds = %88
  store i32 0, i32* %count, align 4, !dbg !2433
  %90 = load i32* %curlen, align 4, !dbg !2434
  store i32 %90, i32* %prevlen, align 4, !dbg !2434
  %91 = load i32* %nextlen, align 4, !dbg !2435
  %92 = icmp eq i32 %91, 0, !dbg !2435
  br i1 %92, label %93, label %94, !dbg !2435

; <label>:93                                      ; preds = %89
  store i32 138, i32* %max_count, align 4, !dbg !2436
  store i32 3, i32* %min_count, align 4, !dbg !2436
  br label %101, !dbg !2438

; <label>:94                                      ; preds = %89
  %95 = load i32* %curlen, align 4, !dbg !2439
  %96 = load i32* %nextlen, align 4, !dbg !2439
  %97 = icmp eq i32 %95, %96, !dbg !2439
  br i1 %97, label %98, label %99, !dbg !2439

; <label>:98                                      ; preds = %94
  store i32 6, i32* %max_count, align 4, !dbg !2440
  store i32 3, i32* %min_count, align 4, !dbg !2440
  br label %100, !dbg !2442

; <label>:99                                      ; preds = %94
  store i32 7, i32* %max_count, align 4, !dbg !2443
  store i32 4, i32* %min_count, align 4, !dbg !2443
  br label %100

; <label>:100                                     ; preds = %99, %98
  br label %101

; <label>:101                                     ; preds = %100, %93
  br label %102, !dbg !2445

; <label>:102                                     ; preds = %101, %43
  %103 = load i32* %n, align 4, !dbg !2446
  %104 = add nsw i32 %103, 1, !dbg !2446
  store i32 %104, i32* %n, align 4, !dbg !2446
  br label %20, !dbg !2446

; <label>:105                                     ; preds = %20
  ret void, !dbg !2447
}

define internal void @pqdownheap(%struct.ct_data* %tree, i32 %k) nounwind uwtable {
  %1 = alloca %struct.ct_data*, align 8
  %2 = alloca i32, align 4
  %v = alloca i32, align 4
  %j = alloca i32, align 4
  store %struct.ct_data* %tree, %struct.ct_data** %1, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !2448), !dbg !2449
  store i32 %k, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !2450), !dbg !2451
  call void @llvm.dbg.declare(metadata !22, metadata !2452), !dbg !2454
  %3 = load i32* %2, align 4, !dbg !2455
  %4 = sext i32 %3 to i64, !dbg !2455
  %5 = getelementptr inbounds [573 x i32]* @heap, i32 0, i64 %4, !dbg !2455
  %6 = load i32* %5, align 4, !dbg !2455
  store i32 %6, i32* %v, align 4, !dbg !2455
  call void @llvm.dbg.declare(metadata !22, metadata !2456), !dbg !2457
  %7 = load i32* %2, align 4, !dbg !2458
  %8 = shl i32 %7, 1, !dbg !2458
  store i32 %8, i32* %j, align 4, !dbg !2458
  br label %9, !dbg !2459

; <label>:9                                       ; preds = %147, %0
  %10 = load i32* %j, align 4, !dbg !2459
  %11 = load i32* @heap_len, align 4, !dbg !2459
  %12 = icmp sle i32 %10, %11, !dbg !2459
  br i1 %12, label %13, label %158, !dbg !2459

; <label>:13                                      ; preds = %9
  %14 = load i32* %j, align 4, !dbg !2460
  %15 = load i32* @heap_len, align 4, !dbg !2460
  %16 = icmp slt i32 %14, %15, !dbg !2460
  br i1 %16, label %17, label %89, !dbg !2460

; <label>:17                                      ; preds = %13
  %18 = load i32* %j, align 4, !dbg !2460
  %19 = add nsw i32 %18, 1, !dbg !2460
  %20 = sext i32 %19 to i64, !dbg !2460
  %21 = getelementptr inbounds [573 x i32]* @heap, i32 0, i64 %20, !dbg !2460
  %22 = load i32* %21, align 4, !dbg !2460
  %23 = sext i32 %22 to i64, !dbg !2460
  %24 = load %struct.ct_data** %1, align 8, !dbg !2460
  %25 = getelementptr inbounds %struct.ct_data* %24, i64 %23, !dbg !2460
  %26 = getelementptr inbounds %struct.ct_data* %25, i32 0, i32 0, !dbg !2460
  %27 = bitcast %union.anon.10* %26 to i16*, !dbg !2460
  %28 = load i16* %27, align 2, !dbg !2460
  %29 = zext i16 %28 to i32, !dbg !2460
  %30 = load i32* %j, align 4, !dbg !2460
  %31 = sext i32 %30 to i64, !dbg !2460
  %32 = getelementptr inbounds [573 x i32]* @heap, i32 0, i64 %31, !dbg !2460
  %33 = load i32* %32, align 4, !dbg !2460
  %34 = sext i32 %33 to i64, !dbg !2460
  %35 = load %struct.ct_data** %1, align 8, !dbg !2460
  %36 = getelementptr inbounds %struct.ct_data* %35, i64 %34, !dbg !2460
  %37 = getelementptr inbounds %struct.ct_data* %36, i32 0, i32 0, !dbg !2460
  %38 = bitcast %union.anon.10* %37 to i16*, !dbg !2460
  %39 = load i16* %38, align 2, !dbg !2460
  %40 = zext i16 %39 to i32, !dbg !2460
  %41 = icmp slt i32 %29, %40, !dbg !2460
  br i1 %41, label %86, label %42, !dbg !2460

; <label>:42                                      ; preds = %17
  %43 = load i32* %j, align 4, !dbg !2460
  %44 = add nsw i32 %43, 1, !dbg !2460
  %45 = sext i32 %44 to i64, !dbg !2460
  %46 = getelementptr inbounds [573 x i32]* @heap, i32 0, i64 %45, !dbg !2460
  %47 = load i32* %46, align 4, !dbg !2460
  %48 = sext i32 %47 to i64, !dbg !2460
  %49 = load %struct.ct_data** %1, align 8, !dbg !2460
  %50 = getelementptr inbounds %struct.ct_data* %49, i64 %48, !dbg !2460
  %51 = getelementptr inbounds %struct.ct_data* %50, i32 0, i32 0, !dbg !2460
  %52 = bitcast %union.anon.10* %51 to i16*, !dbg !2460
  %53 = load i16* %52, align 2, !dbg !2460
  %54 = zext i16 %53 to i32, !dbg !2460
  %55 = load i32* %j, align 4, !dbg !2460
  %56 = sext i32 %55 to i64, !dbg !2460
  %57 = getelementptr inbounds [573 x i32]* @heap, i32 0, i64 %56, !dbg !2460
  %58 = load i32* %57, align 4, !dbg !2460
  %59 = sext i32 %58 to i64, !dbg !2460
  %60 = load %struct.ct_data** %1, align 8, !dbg !2460
  %61 = getelementptr inbounds %struct.ct_data* %60, i64 %59, !dbg !2460
  %62 = getelementptr inbounds %struct.ct_data* %61, i32 0, i32 0, !dbg !2460
  %63 = bitcast %union.anon.10* %62 to i16*, !dbg !2460
  %64 = load i16* %63, align 2, !dbg !2460
  %65 = zext i16 %64 to i32, !dbg !2460
  %66 = icmp eq i32 %54, %65, !dbg !2460
  br i1 %66, label %67, label %89, !dbg !2460

; <label>:67                                      ; preds = %42
  %68 = load i32* %j, align 4, !dbg !2460
  %69 = add nsw i32 %68, 1, !dbg !2460
  %70 = sext i32 %69 to i64, !dbg !2460
  %71 = getelementptr inbounds [573 x i32]* @heap, i32 0, i64 %70, !dbg !2460
  %72 = load i32* %71, align 4, !dbg !2460
  %73 = sext i32 %72 to i64, !dbg !2460
  %74 = getelementptr inbounds [573 x i8]* @depth, i32 0, i64 %73, !dbg !2460
  %75 = load i8* %74, align 1, !dbg !2460
  %76 = zext i8 %75 to i32, !dbg !2460
  %77 = load i32* %j, align 4, !dbg !2460
  %78 = sext i32 %77 to i64, !dbg !2460
  %79 = getelementptr inbounds [573 x i32]* @heap, i32 0, i64 %78, !dbg !2460
  %80 = load i32* %79, align 4, !dbg !2460
  %81 = sext i32 %80 to i64, !dbg !2460
  %82 = getelementptr inbounds [573 x i8]* @depth, i32 0, i64 %81, !dbg !2460
  %83 = load i8* %82, align 1, !dbg !2460
  %84 = zext i8 %83 to i32, !dbg !2460
  %85 = icmp sle i32 %76, %84, !dbg !2460
  br i1 %85, label %86, label %89, !dbg !2460

; <label>:86                                      ; preds = %67, %17
  %87 = load i32* %j, align 4, !dbg !2462
  %88 = add nsw i32 %87, 1, !dbg !2462
  store i32 %88, i32* %j, align 4, !dbg !2462
  br label %89, !dbg !2462

; <label>:89                                      ; preds = %86, %67, %42, %13
  %90 = load i32* %v, align 4, !dbg !2463
  %91 = sext i32 %90 to i64, !dbg !2463
  %92 = load %struct.ct_data** %1, align 8, !dbg !2463
  %93 = getelementptr inbounds %struct.ct_data* %92, i64 %91, !dbg !2463
  %94 = getelementptr inbounds %struct.ct_data* %93, i32 0, i32 0, !dbg !2463
  %95 = bitcast %union.anon.10* %94 to i16*, !dbg !2463
  %96 = load i16* %95, align 2, !dbg !2463
  %97 = zext i16 %96 to i32, !dbg !2463
  %98 = load i32* %j, align 4, !dbg !2463
  %99 = sext i32 %98 to i64, !dbg !2463
  %100 = getelementptr inbounds [573 x i32]* @heap, i32 0, i64 %99, !dbg !2463
  %101 = load i32* %100, align 4, !dbg !2463
  %102 = sext i32 %101 to i64, !dbg !2463
  %103 = load %struct.ct_data** %1, align 8, !dbg !2463
  %104 = getelementptr inbounds %struct.ct_data* %103, i64 %102, !dbg !2463
  %105 = getelementptr inbounds %struct.ct_data* %104, i32 0, i32 0, !dbg !2463
  %106 = bitcast %union.anon.10* %105 to i16*, !dbg !2463
  %107 = load i16* %106, align 2, !dbg !2463
  %108 = zext i16 %107 to i32, !dbg !2463
  %109 = icmp slt i32 %97, %108, !dbg !2463
  br i1 %109, label %146, label %110, !dbg !2463

; <label>:110                                     ; preds = %89
  %111 = load i32* %v, align 4, !dbg !2463
  %112 = sext i32 %111 to i64, !dbg !2463
  %113 = load %struct.ct_data** %1, align 8, !dbg !2463
  %114 = getelementptr inbounds %struct.ct_data* %113, i64 %112, !dbg !2463
  %115 = getelementptr inbounds %struct.ct_data* %114, i32 0, i32 0, !dbg !2463
  %116 = bitcast %union.anon.10* %115 to i16*, !dbg !2463
  %117 = load i16* %116, align 2, !dbg !2463
  %118 = zext i16 %117 to i32, !dbg !2463
  %119 = load i32* %j, align 4, !dbg !2463
  %120 = sext i32 %119 to i64, !dbg !2463
  %121 = getelementptr inbounds [573 x i32]* @heap, i32 0, i64 %120, !dbg !2463
  %122 = load i32* %121, align 4, !dbg !2463
  %123 = sext i32 %122 to i64, !dbg !2463
  %124 = load %struct.ct_data** %1, align 8, !dbg !2463
  %125 = getelementptr inbounds %struct.ct_data* %124, i64 %123, !dbg !2463
  %126 = getelementptr inbounds %struct.ct_data* %125, i32 0, i32 0, !dbg !2463
  %127 = bitcast %union.anon.10* %126 to i16*, !dbg !2463
  %128 = load i16* %127, align 2, !dbg !2463
  %129 = zext i16 %128 to i32, !dbg !2463
  %130 = icmp eq i32 %118, %129, !dbg !2463
  br i1 %130, label %131, label %147, !dbg !2463

; <label>:131                                     ; preds = %110
  %132 = load i32* %v, align 4, !dbg !2463
  %133 = sext i32 %132 to i64, !dbg !2463
  %134 = getelementptr inbounds [573 x i8]* @depth, i32 0, i64 %133, !dbg !2463
  %135 = load i8* %134, align 1, !dbg !2463
  %136 = zext i8 %135 to i32, !dbg !2463
  %137 = load i32* %j, align 4, !dbg !2463
  %138 = sext i32 %137 to i64, !dbg !2463
  %139 = getelementptr inbounds [573 x i32]* @heap, i32 0, i64 %138, !dbg !2463
  %140 = load i32* %139, align 4, !dbg !2463
  %141 = sext i32 %140 to i64, !dbg !2463
  %142 = getelementptr inbounds [573 x i8]* @depth, i32 0, i64 %141, !dbg !2463
  %143 = load i8* %142, align 1, !dbg !2463
  %144 = zext i8 %143 to i32, !dbg !2463
  %145 = icmp sle i32 %136, %144, !dbg !2463
  br i1 %145, label %146, label %147, !dbg !2463

; <label>:146                                     ; preds = %131, %89
  br label %158, !dbg !2464

; <label>:147                                     ; preds = %131, %110
  %148 = load i32* %j, align 4, !dbg !2465
  %149 = sext i32 %148 to i64, !dbg !2465
  %150 = getelementptr inbounds [573 x i32]* @heap, i32 0, i64 %149, !dbg !2465
  %151 = load i32* %150, align 4, !dbg !2465
  %152 = load i32* %2, align 4, !dbg !2465
  %153 = sext i32 %152 to i64, !dbg !2465
  %154 = getelementptr inbounds [573 x i32]* @heap, i32 0, i64 %153, !dbg !2465
  store i32 %151, i32* %154, align 4, !dbg !2465
  %155 = load i32* %j, align 4, !dbg !2466
  store i32 %155, i32* %2, align 4, !dbg !2466
  %156 = load i32* %j, align 4, !dbg !2467
  %157 = shl i32 %156, 1, !dbg !2467
  store i32 %157, i32* %j, align 4, !dbg !2467
  br label %9, !dbg !2468

; <label>:158                                     ; preds = %146, %9
  %159 = load i32* %v, align 4, !dbg !2469
  %160 = load i32* %2, align 4, !dbg !2469
  %161 = sext i32 %160 to i64, !dbg !2469
  %162 = getelementptr inbounds [573 x i32]* @heap, i32 0, i64 %161, !dbg !2469
  store i32 %159, i32* %162, align 4, !dbg !2469
  ret void, !dbg !2470
}

define internal void @gen_bitlen(%struct.tree_desc* %desc) nounwind uwtable {
  %1 = alloca %struct.tree_desc*, align 8
  %tree = alloca %struct.ct_data*, align 8
  %extra = alloca i32*, align 8
  %base = alloca i32, align 4
  %max_code = alloca i32, align 4
  %max_length = alloca i32, align 4
  %stree = alloca %struct.ct_data*, align 8
  %h = alloca i32, align 4
  %n = alloca i32, align 4
  %m = alloca i32, align 4
  %bits = alloca i32, align 4
  %xbits = alloca i32, align 4
  %f = alloca i16, align 2
  %overflow = alloca i32, align 4
  store %struct.tree_desc* %desc, %struct.tree_desc** %1, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !2471), !dbg !2472
  call void @llvm.dbg.declare(metadata !22, metadata !2473), !dbg !2475
  %2 = load %struct.tree_desc** %1, align 8, !dbg !2476
  %3 = getelementptr inbounds %struct.tree_desc* %2, i32 0, i32 0, !dbg !2476
  %4 = load %struct.ct_data** %3, align 8, !dbg !2476
  store %struct.ct_data* %4, %struct.ct_data** %tree, align 8, !dbg !2476
  call void @llvm.dbg.declare(metadata !22, metadata !2477), !dbg !2478
  %5 = load %struct.tree_desc** %1, align 8, !dbg !2479
  %6 = getelementptr inbounds %struct.tree_desc* %5, i32 0, i32 2, !dbg !2479
  %7 = load i32** %6, align 8, !dbg !2479
  store i32* %7, i32** %extra, align 8, !dbg !2479
  call void @llvm.dbg.declare(metadata !22, metadata !2480), !dbg !2481
  %8 = load %struct.tree_desc** %1, align 8, !dbg !2482
  %9 = getelementptr inbounds %struct.tree_desc* %8, i32 0, i32 3, !dbg !2482
  %10 = load i32* %9, align 4, !dbg !2482
  store i32 %10, i32* %base, align 4, !dbg !2482
  call void @llvm.dbg.declare(metadata !22, metadata !2483), !dbg !2484
  %11 = load %struct.tree_desc** %1, align 8, !dbg !2485
  %12 = getelementptr inbounds %struct.tree_desc* %11, i32 0, i32 6, !dbg !2485
  %13 = load i32* %12, align 4, !dbg !2485
  store i32 %13, i32* %max_code, align 4, !dbg !2485
  call void @llvm.dbg.declare(metadata !22, metadata !2486), !dbg !2487
  %14 = load %struct.tree_desc** %1, align 8, !dbg !2488
  %15 = getelementptr inbounds %struct.tree_desc* %14, i32 0, i32 5, !dbg !2488
  %16 = load i32* %15, align 4, !dbg !2488
  store i32 %16, i32* %max_length, align 4, !dbg !2488
  call void @llvm.dbg.declare(metadata !22, metadata !2489), !dbg !2490
  %17 = load %struct.tree_desc** %1, align 8, !dbg !2491
  %18 = getelementptr inbounds %struct.tree_desc* %17, i32 0, i32 1, !dbg !2491
  %19 = load %struct.ct_data** %18, align 8, !dbg !2491
  store %struct.ct_data* %19, %struct.ct_data** %stree, align 8, !dbg !2491
  call void @llvm.dbg.declare(metadata !22, metadata !2492), !dbg !2493
  call void @llvm.dbg.declare(metadata !22, metadata !2494), !dbg !2495
  call void @llvm.dbg.declare(metadata !22, metadata !2496), !dbg !2497
  call void @llvm.dbg.declare(metadata !22, metadata !2498), !dbg !2499
  call void @llvm.dbg.declare(metadata !22, metadata !2500), !dbg !2501
  call void @llvm.dbg.declare(metadata !22, metadata !2502), !dbg !2503
  call void @llvm.dbg.declare(metadata !22, metadata !2504), !dbg !2505
  store i32 0, i32* %overflow, align 4, !dbg !2506
  store i32 0, i32* %bits, align 4, !dbg !2507
  br label %20, !dbg !2507

; <label>:20                                      ; preds = %27, %0
  %21 = load i32* %bits, align 4, !dbg !2507
  %22 = icmp sle i32 %21, 15, !dbg !2507
  br i1 %22, label %23, label %30, !dbg !2507

; <label>:23                                      ; preds = %20
  %24 = load i32* %bits, align 4, !dbg !2509
  %25 = sext i32 %24 to i64, !dbg !2509
  %26 = getelementptr inbounds [16 x i16]* @bl_count, i32 0, i64 %25, !dbg !2509
  store i16 0, i16* %26, align 2, !dbg !2509
  br label %27, !dbg !2509

; <label>:27                                      ; preds = %23
  %28 = load i32* %bits, align 4, !dbg !2510
  %29 = add nsw i32 %28, 1, !dbg !2510
  store i32 %29, i32* %bits, align 4, !dbg !2510
  br label %20, !dbg !2510

; <label>:30                                      ; preds = %20
  %31 = load i32* @heap_max, align 4, !dbg !2511
  %32 = sext i32 %31 to i64, !dbg !2511
  %33 = getelementptr inbounds [573 x i32]* @heap, i32 0, i64 %32, !dbg !2511
  %34 = load i32* %33, align 4, !dbg !2511
  %35 = sext i32 %34 to i64, !dbg !2511
  %36 = load %struct.ct_data** %tree, align 8, !dbg !2511
  %37 = getelementptr inbounds %struct.ct_data* %36, i64 %35, !dbg !2511
  %38 = getelementptr inbounds %struct.ct_data* %37, i32 0, i32 1, !dbg !2511
  %39 = bitcast %union.anon.0* %38 to i16*, !dbg !2511
  store i16 0, i16* %39, align 2, !dbg !2511
  %40 = load i32* @heap_max, align 4, !dbg !2512
  %41 = add nsw i32 %40, 1, !dbg !2512
  store i32 %41, i32* %h, align 4, !dbg !2512
  br label %42, !dbg !2512

; <label>:42                                      ; preds = %139, %30
  %43 = load i32* %h, align 4, !dbg !2512
  %44 = icmp slt i32 %43, 573, !dbg !2512
  br i1 %44, label %45, label %142, !dbg !2512

; <label>:45                                      ; preds = %42
  %46 = load i32* %h, align 4, !dbg !2514
  %47 = sext i32 %46 to i64, !dbg !2514
  %48 = getelementptr inbounds [573 x i32]* @heap, i32 0, i64 %47, !dbg !2514
  %49 = load i32* %48, align 4, !dbg !2514
  store i32 %49, i32* %n, align 4, !dbg !2514
  %50 = load i32* %n, align 4, !dbg !2516
  %51 = sext i32 %50 to i64, !dbg !2516
  %52 = load %struct.ct_data** %tree, align 8, !dbg !2516
  %53 = getelementptr inbounds %struct.ct_data* %52, i64 %51, !dbg !2516
  %54 = getelementptr inbounds %struct.ct_data* %53, i32 0, i32 1, !dbg !2516
  %55 = bitcast %union.anon.0* %54 to i16*, !dbg !2516
  %56 = load i16* %55, align 2, !dbg !2516
  %57 = zext i16 %56 to i64, !dbg !2516
  %58 = load %struct.ct_data** %tree, align 8, !dbg !2516
  %59 = getelementptr inbounds %struct.ct_data* %58, i64 %57, !dbg !2516
  %60 = getelementptr inbounds %struct.ct_data* %59, i32 0, i32 1, !dbg !2516
  %61 = bitcast %union.anon.0* %60 to i16*, !dbg !2516
  %62 = load i16* %61, align 2, !dbg !2516
  %63 = zext i16 %62 to i32, !dbg !2516
  %64 = add nsw i32 %63, 1, !dbg !2516
  store i32 %64, i32* %bits, align 4, !dbg !2516
  %65 = load i32* %bits, align 4, !dbg !2517
  %66 = load i32* %max_length, align 4, !dbg !2517
  %67 = icmp sgt i32 %65, %66, !dbg !2517
  br i1 %67, label %68, label %72, !dbg !2517

; <label>:68                                      ; preds = %45
  %69 = load i32* %max_length, align 4, !dbg !2518
  store i32 %69, i32* %bits, align 4, !dbg !2518
  %70 = load i32* %overflow, align 4, !dbg !2518
  %71 = add nsw i32 %70, 1, !dbg !2518
  store i32 %71, i32* %overflow, align 4, !dbg !2518
  br label %72, !dbg !2518

; <label>:72                                      ; preds = %68, %45
  %73 = load i32* %bits, align 4, !dbg !2519
  %74 = trunc i32 %73 to i16, !dbg !2519
  %75 = load i32* %n, align 4, !dbg !2519
  %76 = sext i32 %75 to i64, !dbg !2519
  %77 = load %struct.ct_data** %tree, align 8, !dbg !2519
  %78 = getelementptr inbounds %struct.ct_data* %77, i64 %76, !dbg !2519
  %79 = getelementptr inbounds %struct.ct_data* %78, i32 0, i32 1, !dbg !2519
  %80 = bitcast %union.anon.0* %79 to i16*, !dbg !2519
  store i16 %74, i16* %80, align 2, !dbg !2519
  %81 = load i32* %n, align 4, !dbg !2520
  %82 = load i32* %max_code, align 4, !dbg !2520
  %83 = icmp sgt i32 %81, %82, !dbg !2520
  br i1 %83, label %84, label %85, !dbg !2520

; <label>:84                                      ; preds = %72
  br label %139, !dbg !2521

; <label>:85                                      ; preds = %72
  %86 = load i32* %bits, align 4, !dbg !2522
  %87 = sext i32 %86 to i64, !dbg !2522
  %88 = getelementptr inbounds [16 x i16]* @bl_count, i32 0, i64 %87, !dbg !2522
  %89 = load i16* %88, align 2, !dbg !2522
  %90 = add i16 %89, 1, !dbg !2522
  store i16 %90, i16* %88, align 2, !dbg !2522
  store i32 0, i32* %xbits, align 4, !dbg !2523
  %91 = load i32* %n, align 4, !dbg !2524
  %92 = load i32* %base, align 4, !dbg !2524
  %93 = icmp sge i32 %91, %92, !dbg !2524
  br i1 %93, label %94, label %102, !dbg !2524

; <label>:94                                      ; preds = %85
  %95 = load i32* %n, align 4, !dbg !2525
  %96 = load i32* %base, align 4, !dbg !2525
  %97 = sub nsw i32 %95, %96, !dbg !2525
  %98 = sext i32 %97 to i64, !dbg !2525
  %99 = load i32** %extra, align 8, !dbg !2525
  %100 = getelementptr inbounds i32* %99, i64 %98, !dbg !2525
  %101 = load i32* %100, align 4, !dbg !2525
  store i32 %101, i32* %xbits, align 4, !dbg !2525
  br label %102, !dbg !2525

; <label>:102                                     ; preds = %94, %85
  %103 = load i32* %n, align 4, !dbg !2526
  %104 = sext i32 %103 to i64, !dbg !2526
  %105 = load %struct.ct_data** %tree, align 8, !dbg !2526
  %106 = getelementptr inbounds %struct.ct_data* %105, i64 %104, !dbg !2526
  %107 = getelementptr inbounds %struct.ct_data* %106, i32 0, i32 0, !dbg !2526
  %108 = bitcast %union.anon.10* %107 to i16*, !dbg !2526
  %109 = load i16* %108, align 2, !dbg !2526
  store i16 %109, i16* %f, align 2, !dbg !2526
  %110 = load i16* %f, align 2, !dbg !2527
  %111 = zext i16 %110 to i64, !dbg !2527
  %112 = load i32* %bits, align 4, !dbg !2527
  %113 = load i32* %xbits, align 4, !dbg !2527
  %114 = add nsw i32 %112, %113, !dbg !2527
  %115 = sext i32 %114 to i64, !dbg !2527
  %116 = mul i64 %111, %115, !dbg !2527
  %117 = load i64* @opt_len, align 8, !dbg !2527
  %118 = add i64 %117, %116, !dbg !2527
  store i64 %118, i64* @opt_len, align 8, !dbg !2527
  %119 = load %struct.ct_data** %stree, align 8, !dbg !2528
  %120 = icmp ne %struct.ct_data* %119, null, !dbg !2528
  br i1 %120, label %121, label %138, !dbg !2528

; <label>:121                                     ; preds = %102
  %122 = load i16* %f, align 2, !dbg !2529
  %123 = zext i16 %122 to i64, !dbg !2529
  %124 = load i32* %n, align 4, !dbg !2529
  %125 = sext i32 %124 to i64, !dbg !2529
  %126 = load %struct.ct_data** %stree, align 8, !dbg !2529
  %127 = getelementptr inbounds %struct.ct_data* %126, i64 %125, !dbg !2529
  %128 = getelementptr inbounds %struct.ct_data* %127, i32 0, i32 1, !dbg !2529
  %129 = bitcast %union.anon.0* %128 to i16*, !dbg !2529
  %130 = load i16* %129, align 2, !dbg !2529
  %131 = zext i16 %130 to i32, !dbg !2529
  %132 = load i32* %xbits, align 4, !dbg !2529
  %133 = add nsw i32 %131, %132, !dbg !2529
  %134 = sext i32 %133 to i64, !dbg !2529
  %135 = mul i64 %123, %134, !dbg !2529
  %136 = load i64* @static_len, align 8, !dbg !2529
  %137 = add i64 %136, %135, !dbg !2529
  store i64 %137, i64* @static_len, align 8, !dbg !2529
  br label %138, !dbg !2529

; <label>:138                                     ; preds = %121, %102
  br label %139, !dbg !2530

; <label>:139                                     ; preds = %138, %84
  %140 = load i32* %h, align 4, !dbg !2531
  %141 = add nsw i32 %140, 1, !dbg !2531
  store i32 %141, i32* %h, align 4, !dbg !2531
  br label %42, !dbg !2531

; <label>:142                                     ; preds = %42
  %143 = load i32* %overflow, align 4, !dbg !2532
  %144 = icmp eq i32 %143, 0, !dbg !2532
  br i1 %144, label %145, label %146, !dbg !2532

; <label>:145                                     ; preds = %142
  br label %257, !dbg !2533

; <label>:146                                     ; preds = %142
  br label %147, !dbg !2534

; <label>:147                                     ; preds = %181, %146
  %148 = load i32* %max_length, align 4, !dbg !2535
  %149 = sub nsw i32 %148, 1, !dbg !2535
  store i32 %149, i32* %bits, align 4, !dbg !2535
  br label %150, !dbg !2537

; <label>:150                                     ; preds = %157, %147
  %151 = load i32* %bits, align 4, !dbg !2537
  %152 = sext i32 %151 to i64, !dbg !2537
  %153 = getelementptr inbounds [16 x i16]* @bl_count, i32 0, i64 %152, !dbg !2537
  %154 = load i16* %153, align 2, !dbg !2537
  %155 = zext i16 %154 to i32, !dbg !2537
  %156 = icmp eq i32 %155, 0, !dbg !2537
  br i1 %156, label %157, label %160, !dbg !2537

; <label>:157                                     ; preds = %150
  %158 = load i32* %bits, align 4, !dbg !2538
  %159 = add nsw i32 %158, -1, !dbg !2538
  store i32 %159, i32* %bits, align 4, !dbg !2538
  br label %150, !dbg !2538

; <label>:160                                     ; preds = %150
  %161 = load i32* %bits, align 4, !dbg !2539
  %162 = sext i32 %161 to i64, !dbg !2539
  %163 = getelementptr inbounds [16 x i16]* @bl_count, i32 0, i64 %162, !dbg !2539
  %164 = load i16* %163, align 2, !dbg !2539
  %165 = add i16 %164, -1, !dbg !2539
  store i16 %165, i16* %163, align 2, !dbg !2539
  %166 = load i32* %bits, align 4, !dbg !2540
  %167 = add nsw i32 %166, 1, !dbg !2540
  %168 = sext i32 %167 to i64, !dbg !2540
  %169 = getelementptr inbounds [16 x i16]* @bl_count, i32 0, i64 %168, !dbg !2540
  %170 = load i16* %169, align 2, !dbg !2540
  %171 = zext i16 %170 to i32, !dbg !2540
  %172 = add nsw i32 %171, 2, !dbg !2540
  %173 = trunc i32 %172 to i16, !dbg !2540
  store i16 %173, i16* %169, align 2, !dbg !2540
  %174 = load i32* %max_length, align 4, !dbg !2541
  %175 = sext i32 %174 to i64, !dbg !2541
  %176 = getelementptr inbounds [16 x i16]* @bl_count, i32 0, i64 %175, !dbg !2541
  %177 = load i16* %176, align 2, !dbg !2541
  %178 = add i16 %177, -1, !dbg !2541
  store i16 %178, i16* %176, align 2, !dbg !2541
  %179 = load i32* %overflow, align 4, !dbg !2542
  %180 = sub nsw i32 %179, 2, !dbg !2542
  store i32 %180, i32* %overflow, align 4, !dbg !2542
  br label %181, !dbg !2543

; <label>:181                                     ; preds = %160
  %182 = load i32* %overflow, align 4, !dbg !2543
  %183 = icmp sgt i32 %182, 0, !dbg !2543
  br i1 %183, label %147, label %184, !dbg !2543

; <label>:184                                     ; preds = %181
  %185 = load i32* %max_length, align 4, !dbg !2544
  store i32 %185, i32* %bits, align 4, !dbg !2544
  br label %186, !dbg !2544

; <label>:186                                     ; preds = %254, %184
  %187 = load i32* %bits, align 4, !dbg !2544
  %188 = icmp ne i32 %187, 0, !dbg !2544
  br i1 %188, label %189, label %257, !dbg !2544

; <label>:189                                     ; preds = %186
  %190 = load i32* %bits, align 4, !dbg !2546
  %191 = sext i32 %190 to i64, !dbg !2546
  %192 = getelementptr inbounds [16 x i16]* @bl_count, i32 0, i64 %191, !dbg !2546
  %193 = load i16* %192, align 2, !dbg !2546
  %194 = zext i16 %193 to i32, !dbg !2546
  store i32 %194, i32* %n, align 4, !dbg !2546
  br label %195, !dbg !2548

; <label>:195                                     ; preds = %250, %207, %189
  %196 = load i32* %n, align 4, !dbg !2548
  %197 = icmp ne i32 %196, 0, !dbg !2548
  br i1 %197, label %198, label %253, !dbg !2548

; <label>:198                                     ; preds = %195
  %199 = load i32* %h, align 4, !dbg !2549
  %200 = add nsw i32 %199, -1, !dbg !2549
  store i32 %200, i32* %h, align 4, !dbg !2549
  %201 = sext i32 %200 to i64, !dbg !2549
  %202 = getelementptr inbounds [573 x i32]* @heap, i32 0, i64 %201, !dbg !2549
  %203 = load i32* %202, align 4, !dbg !2549
  store i32 %203, i32* %m, align 4, !dbg !2549
  %204 = load i32* %m, align 4, !dbg !2551
  %205 = load i32* %max_code, align 4, !dbg !2551
  %206 = icmp sgt i32 %204, %205, !dbg !2551
  br i1 %206, label %207, label %208, !dbg !2551

; <label>:207                                     ; preds = %198
  br label %195, !dbg !2552

; <label>:208                                     ; preds = %198
  %209 = load i32* %m, align 4, !dbg !2553
  %210 = sext i32 %209 to i64, !dbg !2553
  %211 = load %struct.ct_data** %tree, align 8, !dbg !2553
  %212 = getelementptr inbounds %struct.ct_data* %211, i64 %210, !dbg !2553
  %213 = getelementptr inbounds %struct.ct_data* %212, i32 0, i32 1, !dbg !2553
  %214 = bitcast %union.anon.0* %213 to i16*, !dbg !2553
  %215 = load i16* %214, align 2, !dbg !2553
  %216 = zext i16 %215 to i32, !dbg !2553
  %217 = load i32* %bits, align 4, !dbg !2553
  %218 = icmp ne i32 %216, %217, !dbg !2553
  br i1 %218, label %219, label %250, !dbg !2553

; <label>:219                                     ; preds = %208
  %220 = load i32* %bits, align 4, !dbg !2554
  %221 = sext i32 %220 to i64, !dbg !2554
  %222 = load i32* %m, align 4, !dbg !2554
  %223 = sext i32 %222 to i64, !dbg !2554
  %224 = load %struct.ct_data** %tree, align 8, !dbg !2554
  %225 = getelementptr inbounds %struct.ct_data* %224, i64 %223, !dbg !2554
  %226 = getelementptr inbounds %struct.ct_data* %225, i32 0, i32 1, !dbg !2554
  %227 = bitcast %union.anon.0* %226 to i16*, !dbg !2554
  %228 = load i16* %227, align 2, !dbg !2554
  %229 = zext i16 %228 to i64, !dbg !2554
  %230 = sub nsw i64 %221, %229, !dbg !2554
  %231 = load i32* %m, align 4, !dbg !2554
  %232 = sext i32 %231 to i64, !dbg !2554
  %233 = load %struct.ct_data** %tree, align 8, !dbg !2554
  %234 = getelementptr inbounds %struct.ct_data* %233, i64 %232, !dbg !2554
  %235 = getelementptr inbounds %struct.ct_data* %234, i32 0, i32 0, !dbg !2554
  %236 = bitcast %union.anon.10* %235 to i16*, !dbg !2554
  %237 = load i16* %236, align 2, !dbg !2554
  %238 = zext i16 %237 to i64, !dbg !2554
  %239 = mul nsw i64 %230, %238, !dbg !2554
  %240 = load i64* @opt_len, align 8, !dbg !2554
  %241 = add i64 %240, %239, !dbg !2554
  store i64 %241, i64* @opt_len, align 8, !dbg !2554
  %242 = load i32* %bits, align 4, !dbg !2556
  %243 = trunc i32 %242 to i16, !dbg !2556
  %244 = load i32* %m, align 4, !dbg !2556
  %245 = sext i32 %244 to i64, !dbg !2556
  %246 = load %struct.ct_data** %tree, align 8, !dbg !2556
  %247 = getelementptr inbounds %struct.ct_data* %246, i64 %245, !dbg !2556
  %248 = getelementptr inbounds %struct.ct_data* %247, i32 0, i32 1, !dbg !2556
  %249 = bitcast %union.anon.0* %248 to i16*, !dbg !2556
  store i16 %243, i16* %249, align 2, !dbg !2556
  br label %250, !dbg !2557

; <label>:250                                     ; preds = %219, %208
  %251 = load i32* %n, align 4, !dbg !2558
  %252 = add nsw i32 %251, -1, !dbg !2558
  store i32 %252, i32* %n, align 4, !dbg !2558
  br label %195, !dbg !2559

; <label>:253                                     ; preds = %195
  br label %254, !dbg !2560

; <label>:254                                     ; preds = %253
  %255 = load i32* %bits, align 4, !dbg !2561
  %256 = add nsw i32 %255, -1, !dbg !2561
  store i32 %256, i32* %bits, align 4, !dbg !2561
  br label %186, !dbg !2561

; <label>:257                                     ; preds = %186, %145
  ret void, !dbg !2562
}

define i32 @unlzh(i32 %in, i32 %out) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %in, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !2563), !dbg !2564
  store i32 %out, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !2565), !dbg !2566
  call void @llvm.dbg.declare(metadata !22, metadata !2567), !dbg !2569
  %3 = load i32* %1, align 4, !dbg !2570
  store i32 %3, i32* @ifd, align 4, !dbg !2570
  %4 = load i32* %2, align 4, !dbg !2571
  store i32 %4, i32* @ofd, align 4, !dbg !2571
  call void @decode_start(), !dbg !2572
  br label %5, !dbg !2573

; <label>:5                                       ; preds = %19, %0
  %6 = load i32* @done, align 4, !dbg !2573
  %7 = icmp ne i32 %6, 0, !dbg !2573
  %8 = xor i1 %7, true, !dbg !2573
  br i1 %8, label %9, label %20, !dbg !2573

; <label>:9                                       ; preds = %5
  %10 = call i32 (...)* bitcast (i32 (i32, i8*)* @decode to i32 (...)*)(i32 8192, i8* getelementptr inbounds ([0 x i8]* @window, i32 0, i32 0)), !dbg !2574
  store i32 %10, i32* %n, align 4, !dbg !2574
  %11 = load i32* @test, align 4, !dbg !2576
  %12 = icmp ne i32 %11, 0, !dbg !2576
  br i1 %12, label %19, label %13, !dbg !2576

; <label>:13                                      ; preds = %9
  %14 = load i32* %n, align 4, !dbg !2576
  %15 = icmp ugt i32 %14, 0, !dbg !2576
  br i1 %15, label %16, label %19, !dbg !2576

; <label>:16                                      ; preds = %13
  %17 = load i32* %2, align 4, !dbg !2577
  %18 = load i32* %n, align 4, !dbg !2577
  call void @write_buf(i32 %17, i8* getelementptr inbounds ([0 x i8]* @window, i32 0, i32 0), i32 %18), !dbg !2577
  br label %19, !dbg !2579

; <label>:19                                      ; preds = %16, %13, %9
  br label %5, !dbg !2580

; <label>:20                                      ; preds = %5
  ret i32 0, !dbg !2581
}

define internal void @decode_start() nounwind uwtable {
  call void @huf_decode_start(), !dbg !2582
  store i32 0, i32* @j, align 4, !dbg !2584
  store i32 0, i32* @done, align 4, !dbg !2585
  ret void, !dbg !2586
}

define internal i32 @decode(i32 %count, i8* %buffer) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 8
  %r = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 %count, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !2587), !dbg !2588
  store i8* %buffer, i8** %3, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !2589), !dbg !2590
  call void @llvm.dbg.declare(metadata !22, metadata !2591), !dbg !2593
  call void @llvm.dbg.declare(metadata !22, metadata !2594), !dbg !2595
  store i32 0, i32* %r, align 4, !dbg !2596
  br label %4, !dbg !2597

; <label>:4                                       ; preds = %27, %0
  %5 = load i32* @j, align 4, !dbg !2597
  %6 = add nsw i32 %5, -1, !dbg !2597
  store i32 %6, i32* @j, align 4, !dbg !2597
  %7 = icmp sge i32 %6, 0, !dbg !2597
  br i1 %7, label %8, label %28, !dbg !2597

; <label>:8                                       ; preds = %4
  %9 = load i32* @decode.i, align 4, !dbg !2598
  %10 = zext i32 %9 to i64, !dbg !2598
  %11 = load i8** %3, align 8, !dbg !2598
  %12 = getelementptr inbounds i8* %11, i64 %10, !dbg !2598
  %13 = load i8* %12, align 1, !dbg !2598
  %14 = load i32* %r, align 4, !dbg !2598
  %15 = zext i32 %14 to i64, !dbg !2598
  %16 = load i8** %3, align 8, !dbg !2598
  %17 = getelementptr inbounds i8* %16, i64 %15, !dbg !2598
  store i8 %13, i8* %17, align 1, !dbg !2598
  %18 = load i32* @decode.i, align 4, !dbg !2600
  %19 = add i32 %18, 1, !dbg !2600
  %20 = and i32 %19, 8191, !dbg !2600
  store i32 %20, i32* @decode.i, align 4, !dbg !2600
  %21 = load i32* %r, align 4, !dbg !2601
  %22 = add i32 %21, 1, !dbg !2601
  store i32 %22, i32* %r, align 4, !dbg !2601
  %23 = load i32* %2, align 4, !dbg !2601
  %24 = icmp eq i32 %22, %23, !dbg !2601
  br i1 %24, label %25, label %27, !dbg !2601

; <label>:25                                      ; preds = %8
  %26 = load i32* %r, align 4, !dbg !2602
  store i32 %26, i32* %1, !dbg !2602
  br label %86, !dbg !2602

; <label>:27                                      ; preds = %8
  br label %4, !dbg !2603

; <label>:28                                      ; preds = %4
  br label %29, !dbg !2604

; <label>:29                                      ; preds = %85, %28
  %30 = call i32 @decode_c(), !dbg !2606
  store i32 %30, i32* %c, align 4, !dbg !2606
  %31 = load i32* %c, align 4, !dbg !2608
  %32 = icmp eq i32 %31, 510, !dbg !2608
  br i1 %32, label %33, label %35, !dbg !2608

; <label>:33                                      ; preds = %29
  store i32 1, i32* @done, align 4, !dbg !2609
  %34 = load i32* %r, align 4, !dbg !2611
  store i32 %34, i32* %1, !dbg !2611
  br label %86, !dbg !2611

; <label>:35                                      ; preds = %29
  %36 = load i32* %c, align 4, !dbg !2612
  %37 = icmp ule i32 %36, 255, !dbg !2612
  br i1 %37, label %38, label %52, !dbg !2612

; <label>:38                                      ; preds = %35
  %39 = load i32* %c, align 4, !dbg !2613
  %40 = trunc i32 %39 to i8, !dbg !2613
  %41 = load i32* %r, align 4, !dbg !2613
  %42 = zext i32 %41 to i64, !dbg !2613
  %43 = load i8** %3, align 8, !dbg !2613
  %44 = getelementptr inbounds i8* %43, i64 %42, !dbg !2613
  store i8 %40, i8* %44, align 1, !dbg !2613
  %45 = load i32* %r, align 4, !dbg !2615
  %46 = add i32 %45, 1, !dbg !2615
  store i32 %46, i32* %r, align 4, !dbg !2615
  %47 = load i32* %2, align 4, !dbg !2615
  %48 = icmp eq i32 %46, %47, !dbg !2615
  br i1 %48, label %49, label %51, !dbg !2615

; <label>:49                                      ; preds = %38
  %50 = load i32* %r, align 4, !dbg !2616
  store i32 %50, i32* %1, !dbg !2616
  br label %86, !dbg !2616

; <label>:51                                      ; preds = %38
  br label %85, !dbg !2617

; <label>:52                                      ; preds = %35
  %53 = load i32* %c, align 4, !dbg !2618
  %54 = sub i32 %53, 253, !dbg !2618
  store i32 %54, i32* @j, align 4, !dbg !2618
  %55 = load i32* %r, align 4, !dbg !2620
  %56 = call i32 @decode_p(), !dbg !2621
  %57 = sub i32 %55, %56, !dbg !2621
  %58 = sub i32 %57, 1, !dbg !2621
  %59 = and i32 %58, 8191, !dbg !2621
  store i32 %59, i32* @decode.i, align 4, !dbg !2621
  br label %60, !dbg !2622

; <label>:60                                      ; preds = %83, %52
  %61 = load i32* @j, align 4, !dbg !2622
  %62 = add nsw i32 %61, -1, !dbg !2622
  store i32 %62, i32* @j, align 4, !dbg !2622
  %63 = icmp sge i32 %62, 0, !dbg !2622
  br i1 %63, label %64, label %84, !dbg !2622

; <label>:64                                      ; preds = %60
  %65 = load i32* @decode.i, align 4, !dbg !2623
  %66 = zext i32 %65 to i64, !dbg !2623
  %67 = load i8** %3, align 8, !dbg !2623
  %68 = getelementptr inbounds i8* %67, i64 %66, !dbg !2623
  %69 = load i8* %68, align 1, !dbg !2623
  %70 = load i32* %r, align 4, !dbg !2623
  %71 = zext i32 %70 to i64, !dbg !2623
  %72 = load i8** %3, align 8, !dbg !2623
  %73 = getelementptr inbounds i8* %72, i64 %71, !dbg !2623
  store i8 %69, i8* %73, align 1, !dbg !2623
  %74 = load i32* @decode.i, align 4, !dbg !2625
  %75 = add i32 %74, 1, !dbg !2625
  %76 = and i32 %75, 8191, !dbg !2625
  store i32 %76, i32* @decode.i, align 4, !dbg !2625
  %77 = load i32* %r, align 4, !dbg !2626
  %78 = add i32 %77, 1, !dbg !2626
  store i32 %78, i32* %r, align 4, !dbg !2626
  %79 = load i32* %2, align 4, !dbg !2626
  %80 = icmp eq i32 %78, %79, !dbg !2626
  br i1 %80, label %81, label %83, !dbg !2626

; <label>:81                                      ; preds = %64
  %82 = load i32* %r, align 4, !dbg !2627
  store i32 %82, i32* %1, !dbg !2627
  br label %86, !dbg !2627

; <label>:83                                      ; preds = %64
  br label %60, !dbg !2628

; <label>:84                                      ; preds = %60
  br label %85

; <label>:85                                      ; preds = %84, %51
  br label %29, !dbg !2629

; <label>:86                                      ; preds = %81, %49, %33, %25
  %87 = load i32* %1, !dbg !2630
  ret i32 %87, !dbg !2630
}

define internal i32 @decode_c() nounwind uwtable {
  %1 = alloca i32, align 4
  %j = alloca i32, align 4
  %mask = alloca i32, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !2631), !dbg !2633
  call void @llvm.dbg.declare(metadata !22, metadata !2634), !dbg !2635
  %2 = load i32* @blocksize, align 4, !dbg !2636
  %3 = icmp eq i32 %2, 0, !dbg !2636
  br i1 %3, label %4, label %10, !dbg !2636

; <label>:4                                       ; preds = %0
  %5 = call i32 (...)* bitcast (i32 (i32)* @getbits to i32 (...)*)(i32 16), !dbg !2637
  store i32 %5, i32* @blocksize, align 4, !dbg !2637
  %6 = load i32* @blocksize, align 4, !dbg !2639
  %7 = icmp eq i32 %6, 0, !dbg !2639
  br i1 %7, label %8, label %9, !dbg !2639

; <label>:8                                       ; preds = %4
  store i32 510, i32* %1, !dbg !2640
  br label %55, !dbg !2640

; <label>:9                                       ; preds = %4
  call void (...)* bitcast (void (i32, i32, i32)* @read_pt_len to void (...)*)(i32 19, i32 5, i32 3), !dbg !2642
  call void @read_c_len(), !dbg !2643
  call void (...)* bitcast (void (i32, i32, i32)* @read_pt_len to void (...)*)(i32 14, i32 4, i32 -1), !dbg !2644
  br label %10, !dbg !2645

; <label>:10                                      ; preds = %9, %0
  %11 = load i32* @blocksize, align 4, !dbg !2646
  %12 = add i32 %11, -1, !dbg !2646
  store i32 %12, i32* @blocksize, align 4, !dbg !2646
  %13 = load i16* @bitbuf, align 2, !dbg !2647
  %14 = zext i16 %13 to i32, !dbg !2647
  %15 = ashr i32 %14, 4, !dbg !2647
  %16 = sext i32 %15 to i64, !dbg !2647
  %17 = getelementptr inbounds [0 x i16]* @d_buf, i32 0, i64 %16, !dbg !2647
  %18 = load i16* %17, align 1, !dbg !2647
  %19 = zext i16 %18 to i32, !dbg !2647
  store i32 %19, i32* %j, align 4, !dbg !2647
  %20 = load i32* %j, align 4, !dbg !2648
  %21 = icmp uge i32 %20, 510, !dbg !2648
  br i1 %21, label %22, label %48, !dbg !2648

; <label>:22                                      ; preds = %10
  store i32 8, i32* %mask, align 4, !dbg !2649
  br label %23, !dbg !2651

; <label>:23                                      ; preds = %44, %22
  %24 = load i16* @bitbuf, align 2, !dbg !2652
  %25 = zext i16 %24 to i32, !dbg !2652
  %26 = load i32* %mask, align 4, !dbg !2652
  %27 = and i32 %25, %26, !dbg !2652
  %28 = icmp ne i32 %27, 0, !dbg !2652
  br i1 %28, label %29, label %35, !dbg !2652

; <label>:29                                      ; preds = %23
  %30 = load i32* %j, align 4, !dbg !2654
  %31 = zext i32 %30 to i64, !dbg !2654
  %32 = getelementptr inbounds i16* getelementptr inbounds ([0 x i16]* @prev, i32 0, i64 32768), i64 %31, !dbg !2654
  %33 = load i16* %32, align 2, !dbg !2654
  %34 = zext i16 %33 to i32, !dbg !2654
  store i32 %34, i32* %j, align 4, !dbg !2654
  br label %41, !dbg !2654

; <label>:35                                      ; preds = %23
  %36 = load i32* %j, align 4, !dbg !2655
  %37 = zext i32 %36 to i64, !dbg !2655
  %38 = getelementptr inbounds [0 x i16]* @prev, i32 0, i64 %37, !dbg !2655
  %39 = load i16* %38, align 1, !dbg !2655
  %40 = zext i16 %39 to i32, !dbg !2655
  store i32 %40, i32* %j, align 4, !dbg !2655
  br label %41

; <label>:41                                      ; preds = %35, %29
  %42 = load i32* %mask, align 4, !dbg !2656
  %43 = lshr i32 %42, 1, !dbg !2656
  store i32 %43, i32* %mask, align 4, !dbg !2656
  br label %44, !dbg !2657

; <label>:44                                      ; preds = %41
  %45 = load i32* %j, align 4, !dbg !2657
  %46 = icmp uge i32 %45, 510, !dbg !2657
  br i1 %46, label %23, label %47, !dbg !2657

; <label>:47                                      ; preds = %44
  br label %48, !dbg !2658

; <label>:48                                      ; preds = %47, %10
  %49 = load i32* %j, align 4, !dbg !2659
  %50 = zext i32 %49 to i64, !dbg !2659
  %51 = getelementptr inbounds [0 x i8]* @outbuf, i32 0, i64 %50, !dbg !2659
  %52 = load i8* %51, align 1, !dbg !2659
  %53 = zext i8 %52 to i32, !dbg !2659
  call void (...)* bitcast (void (i32)* @fillbuf to void (...)*)(i32 %53), !dbg !2659
  %54 = load i32* %j, align 4, !dbg !2660
  store i32 %54, i32* %1, !dbg !2660
  br label %55, !dbg !2660

; <label>:55                                      ; preds = %48, %8
  %56 = load i32* %1, !dbg !2661
  ret i32 %56, !dbg !2661
}

define internal i32 @decode_p() nounwind uwtable {
  %j = alloca i32, align 4
  %mask = alloca i32, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !2662), !dbg !2664
  call void @llvm.dbg.declare(metadata !22, metadata !2665), !dbg !2666
  %1 = load i16* @bitbuf, align 2, !dbg !2667
  %2 = zext i16 %1 to i32, !dbg !2667
  %3 = ashr i32 %2, 8, !dbg !2667
  %4 = sext i32 %3 to i64, !dbg !2667
  %5 = getelementptr inbounds [256 x i16]* @pt_table, i32 0, i64 %4, !dbg !2667
  %6 = load i16* %5, align 2, !dbg !2667
  %7 = zext i16 %6 to i32, !dbg !2667
  store i32 %7, i32* %j, align 4, !dbg !2667
  %8 = load i32* %j, align 4, !dbg !2668
  %9 = icmp uge i32 %8, 14, !dbg !2668
  br i1 %9, label %10, label %36, !dbg !2668

; <label>:10                                      ; preds = %0
  store i32 128, i32* %mask, align 4, !dbg !2669
  br label %11, !dbg !2671

; <label>:11                                      ; preds = %32, %10
  %12 = load i16* @bitbuf, align 2, !dbg !2672
  %13 = zext i16 %12 to i32, !dbg !2672
  %14 = load i32* %mask, align 4, !dbg !2672
  %15 = and i32 %13, %14, !dbg !2672
  %16 = icmp ne i32 %15, 0, !dbg !2672
  br i1 %16, label %17, label %23, !dbg !2672

; <label>:17                                      ; preds = %11
  %18 = load i32* %j, align 4, !dbg !2674
  %19 = zext i32 %18 to i64, !dbg !2674
  %20 = getelementptr inbounds i16* getelementptr inbounds ([0 x i16]* @prev, i32 0, i64 32768), i64 %19, !dbg !2674
  %21 = load i16* %20, align 2, !dbg !2674
  %22 = zext i16 %21 to i32, !dbg !2674
  store i32 %22, i32* %j, align 4, !dbg !2674
  br label %29, !dbg !2674

; <label>:23                                      ; preds = %11
  %24 = load i32* %j, align 4, !dbg !2675
  %25 = zext i32 %24 to i64, !dbg !2675
  %26 = getelementptr inbounds [0 x i16]* @prev, i32 0, i64 %25, !dbg !2675
  %27 = load i16* %26, align 1, !dbg !2675
  %28 = zext i16 %27 to i32, !dbg !2675
  store i32 %28, i32* %j, align 4, !dbg !2675
  br label %29

; <label>:29                                      ; preds = %23, %17
  %30 = load i32* %mask, align 4, !dbg !2676
  %31 = lshr i32 %30, 1, !dbg !2676
  store i32 %31, i32* %mask, align 4, !dbg !2676
  br label %32, !dbg !2677

; <label>:32                                      ; preds = %29
  %33 = load i32* %j, align 4, !dbg !2677
  %34 = icmp uge i32 %33, 14, !dbg !2677
  br i1 %34, label %11, label %35, !dbg !2677

; <label>:35                                      ; preds = %32
  br label %36, !dbg !2678

; <label>:36                                      ; preds = %35, %0
  %37 = load i32* %j, align 4, !dbg !2679
  %38 = zext i32 %37 to i64, !dbg !2679
  %39 = getelementptr inbounds [19 x i8]* @pt_len, i32 0, i64 %38, !dbg !2679
  %40 = load i8* %39, align 1, !dbg !2679
  %41 = zext i8 %40 to i32, !dbg !2679
  call void (...)* bitcast (void (i32)* @fillbuf to void (...)*)(i32 %41), !dbg !2679
  %42 = load i32* %j, align 4, !dbg !2680
  %43 = icmp ne i32 %42, 0, !dbg !2680
  br i1 %43, label %44, label %52, !dbg !2680

; <label>:44                                      ; preds = %36
  %45 = load i32* %j, align 4, !dbg !2681
  %46 = sub i32 %45, 1, !dbg !2681
  %47 = shl i32 1, %46, !dbg !2681
  %48 = load i32* %j, align 4, !dbg !2682
  %49 = sub i32 %48, 1, !dbg !2682
  %50 = call i32 (...)* bitcast (i32 (i32)* @getbits to i32 (...)*)(i32 %49), !dbg !2682
  %51 = add i32 %47, %50, !dbg !2682
  store i32 %51, i32* %j, align 4, !dbg !2682
  br label %52, !dbg !2682

; <label>:52                                      ; preds = %44, %36
  %53 = load i32* %j, align 4, !dbg !2683
  ret i32 %53, !dbg !2683
}

define internal void @fillbuf(i32 %n) nounwind uwtable {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !2684), !dbg !2685
  %2 = load i32* %1, align 4, !dbg !2686
  %3 = load i16* @bitbuf, align 2, !dbg !2686
  %4 = zext i16 %3 to i32, !dbg !2686
  %5 = shl i32 %4, %2, !dbg !2686
  %6 = trunc i32 %5 to i16, !dbg !2686
  store i16 %6, i16* @bitbuf, align 2, !dbg !2686
  br label %7, !dbg !2688

; <label>:7                                       ; preds = %38, %0
  %8 = load i32* %1, align 4, !dbg !2688
  %9 = load i32* @bitcount, align 4, !dbg !2688
  %10 = icmp sgt i32 %8, %9, !dbg !2688
  br i1 %10, label %11, label %39, !dbg !2688

; <label>:11                                      ; preds = %7
  %12 = load i32* @subbitbuf, align 4, !dbg !2689
  %13 = load i32* @bitcount, align 4, !dbg !2689
  %14 = load i32* %1, align 4, !dbg !2689
  %15 = sub nsw i32 %14, %13, !dbg !2689
  store i32 %15, i32* %1, align 4, !dbg !2689
  %16 = shl i32 %12, %15, !dbg !2689
  %17 = load i16* @bitbuf, align 2, !dbg !2689
  %18 = zext i16 %17 to i32, !dbg !2689
  %19 = or i32 %18, %16, !dbg !2689
  %20 = trunc i32 %19 to i16, !dbg !2689
  store i16 %20, i16* @bitbuf, align 2, !dbg !2689
  %21 = load i32* @inptr, align 4, !dbg !2691
  %22 = load i32* @insize, align 4, !dbg !2691
  %23 = icmp ult i32 %21, %22, !dbg !2691
  br i1 %23, label %24, label %31, !dbg !2691

; <label>:24                                      ; preds = %11
  %25 = load i32* @inptr, align 4, !dbg !2691
  %26 = add i32 %25, 1, !dbg !2691
  store i32 %26, i32* @inptr, align 4, !dbg !2691
  %27 = zext i32 %25 to i64, !dbg !2691
  %28 = getelementptr inbounds [0 x i8]* @inbuf, i32 0, i64 %27, !dbg !2691
  %29 = load i8* %28, align 1, !dbg !2691
  %30 = zext i8 %29 to i32, !dbg !2691
  br label %33, !dbg !2691

; <label>:31                                      ; preds = %11
  %32 = call i32 @fill_inbuf(i32 1), !dbg !2692
  br label %33, !dbg !2692

; <label>:33                                      ; preds = %31, %24
  %34 = phi i32 [ %30, %24 ], [ %32, %31 ], !dbg !2692
  store i32 %34, i32* @subbitbuf, align 4, !dbg !2692
  %35 = load i32* @subbitbuf, align 4, !dbg !2693
  %36 = icmp eq i32 %35, -1, !dbg !2693
  br i1 %36, label %37, label %38, !dbg !2693

; <label>:37                                      ; preds = %33
  store i32 0, i32* @subbitbuf, align 4, !dbg !2694
  br label %38, !dbg !2694

; <label>:38                                      ; preds = %37, %33
  store i32 8, i32* @bitcount, align 4, !dbg !2695
  br label %7, !dbg !2696

; <label>:39                                      ; preds = %7
  %40 = load i32* @subbitbuf, align 4, !dbg !2697
  %41 = load i32* %1, align 4, !dbg !2697
  %42 = load i32* @bitcount, align 4, !dbg !2697
  %43 = sub nsw i32 %42, %41, !dbg !2697
  store i32 %43, i32* @bitcount, align 4, !dbg !2697
  %44 = lshr i32 %40, %43, !dbg !2697
  %45 = load i16* @bitbuf, align 2, !dbg !2697
  %46 = zext i16 %45 to i32, !dbg !2697
  %47 = or i32 %46, %44, !dbg !2697
  %48 = trunc i32 %47 to i16, !dbg !2697
  store i16 %48, i16* @bitbuf, align 2, !dbg !2697
  ret void, !dbg !2698
}

define internal i32 @getbits(i32 %n) nounwind uwtable {
  %1 = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !2699), !dbg !2700
  call void @llvm.dbg.declare(metadata !22, metadata !2701), !dbg !2703
  %2 = load i16* @bitbuf, align 2, !dbg !2704
  %3 = zext i16 %2 to i32, !dbg !2704
  %4 = load i32* %1, align 4, !dbg !2704
  %5 = sext i32 %4 to i64, !dbg !2704
  %6 = sub i64 16, %5, !dbg !2704
  %7 = trunc i64 %6 to i32, !dbg !2704
  %8 = ashr i32 %3, %7, !dbg !2704
  store i32 %8, i32* %x, align 4, !dbg !2704
  %9 = load i32* %1, align 4, !dbg !2705
  call void (...)* bitcast (void (i32)* @fillbuf to void (...)*)(i32 %9), !dbg !2705
  %10 = load i32* %x, align 4, !dbg !2706
  ret i32 %10, !dbg !2706
}

define internal void @read_pt_len(i32 %nn, i32 %nbit, i32 %i_special) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %i = alloca i32, align 4
  %c = alloca i32, align 4
  %n = alloca i32, align 4
  %mask = alloca i32, align 4
  store i32 %nn, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !2707), !dbg !2708
  store i32 %nbit, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !2709), !dbg !2710
  store i32 %i_special, i32* %3, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !2711), !dbg !2712
  call void @llvm.dbg.declare(metadata !22, metadata !2713), !dbg !2715
  call void @llvm.dbg.declare(metadata !22, metadata !2716), !dbg !2717
  call void @llvm.dbg.declare(metadata !22, metadata !2718), !dbg !2719
  call void @llvm.dbg.declare(metadata !22, metadata !2720), !dbg !2721
  %4 = load i32* %2, align 4, !dbg !2722
  %5 = call i32 (...)* bitcast (i32 (i32)* @getbits to i32 (...)*)(i32 %4), !dbg !2722
  store i32 %5, i32* %n, align 4, !dbg !2722
  %6 = load i32* %n, align 4, !dbg !2723
  %7 = icmp eq i32 %6, 0, !dbg !2723
  br i1 %7, label %8, label %36, !dbg !2723

; <label>:8                                       ; preds = %0
  %9 = load i32* %2, align 4, !dbg !2724
  %10 = call i32 (...)* bitcast (i32 (i32)* @getbits to i32 (...)*)(i32 %9), !dbg !2724
  store i32 %10, i32* %c, align 4, !dbg !2724
  store i32 0, i32* %i, align 4, !dbg !2726
  br label %11, !dbg !2726

; <label>:11                                      ; preds = %19, %8
  %12 = load i32* %i, align 4, !dbg !2726
  %13 = load i32* %1, align 4, !dbg !2726
  %14 = icmp slt i32 %12, %13, !dbg !2726
  br i1 %14, label %15, label %22, !dbg !2726

; <label>:15                                      ; preds = %11
  %16 = load i32* %i, align 4, !dbg !2728
  %17 = sext i32 %16 to i64, !dbg !2728
  %18 = getelementptr inbounds [19 x i8]* @pt_len, i32 0, i64 %17, !dbg !2728
  store i8 0, i8* %18, align 1, !dbg !2728
  br label %19, !dbg !2728

; <label>:19                                      ; preds = %15
  %20 = load i32* %i, align 4, !dbg !2729
  %21 = add nsw i32 %20, 1, !dbg !2729
  store i32 %21, i32* %i, align 4, !dbg !2729
  br label %11, !dbg !2729

; <label>:22                                      ; preds = %11
  store i32 0, i32* %i, align 4, !dbg !2730
  br label %23, !dbg !2730

; <label>:23                                      ; preds = %32, %22
  %24 = load i32* %i, align 4, !dbg !2730
  %25 = icmp slt i32 %24, 256, !dbg !2730
  br i1 %25, label %26, label %35, !dbg !2730

; <label>:26                                      ; preds = %23
  %27 = load i32* %c, align 4, !dbg !2732
  %28 = trunc i32 %27 to i16, !dbg !2732
  %29 = load i32* %i, align 4, !dbg !2732
  %30 = sext i32 %29 to i64, !dbg !2732
  %31 = getelementptr inbounds [256 x i16]* @pt_table, i32 0, i64 %30, !dbg !2732
  store i16 %28, i16* %31, align 2, !dbg !2732
  br label %32, !dbg !2732

; <label>:32                                      ; preds = %26
  %33 = load i32* %i, align 4, !dbg !2733
  %34 = add nsw i32 %33, 1, !dbg !2733
  store i32 %34, i32* %i, align 4, !dbg !2733
  br label %23, !dbg !2733

; <label>:35                                      ; preds = %23
  br label %103, !dbg !2734

; <label>:36                                      ; preds = %0
  store i32 0, i32* %i, align 4, !dbg !2735
  br label %37, !dbg !2737

; <label>:37                                      ; preds = %90, %36
  %38 = load i32* %i, align 4, !dbg !2737
  %39 = load i32* %n, align 4, !dbg !2737
  %40 = icmp slt i32 %38, %39, !dbg !2737
  br i1 %40, label %41, label %91, !dbg !2737

; <label>:41                                      ; preds = %37
  %42 = load i16* @bitbuf, align 2, !dbg !2738
  %43 = zext i16 %42 to i32, !dbg !2738
  %44 = ashr i32 %43, 13, !dbg !2738
  store i32 %44, i32* %c, align 4, !dbg !2738
  %45 = load i32* %c, align 4, !dbg !2740
  %46 = icmp eq i32 %45, 7, !dbg !2740
  br i1 %46, label %47, label %60, !dbg !2740

; <label>:47                                      ; preds = %41
  store i32 4096, i32* %mask, align 4, !dbg !2741
  br label %48, !dbg !2743

; <label>:48                                      ; preds = %54, %47
  %49 = load i32* %mask, align 4, !dbg !2743
  %50 = load i16* @bitbuf, align 2, !dbg !2743
  %51 = zext i16 %50 to i32, !dbg !2743
  %52 = and i32 %49, %51, !dbg !2743
  %53 = icmp ne i32 %52, 0, !dbg !2743
  br i1 %53, label %54, label %59, !dbg !2743

; <label>:54                                      ; preds = %48
  %55 = load i32* %mask, align 4, !dbg !2744
  %56 = lshr i32 %55, 1, !dbg !2744
  store i32 %56, i32* %mask, align 4, !dbg !2744
  %57 = load i32* %c, align 4, !dbg !2746
  %58 = add nsw i32 %57, 1, !dbg !2746
  store i32 %58, i32* %c, align 4, !dbg !2746
  br label %48, !dbg !2747

; <label>:59                                      ; preds = %48
  br label %60, !dbg !2748

; <label>:60                                      ; preds = %59, %41
  %61 = load i32* %c, align 4, !dbg !2749
  %62 = icmp slt i32 %61, 7, !dbg !2749
  br i1 %62, label %63, label %64, !dbg !2749

; <label>:63                                      ; preds = %60
  br label %67, !dbg !2749

; <label>:64                                      ; preds = %60
  %65 = load i32* %c, align 4, !dbg !2749
  %66 = sub nsw i32 %65, 3, !dbg !2749
  br label %67, !dbg !2749

; <label>:67                                      ; preds = %64, %63
  %68 = phi i32 [ 3, %63 ], [ %66, %64 ], !dbg !2749
  call void (...)* bitcast (void (i32)* @fillbuf to void (...)*)(i32 %68), !dbg !2749
  %69 = load i32* %c, align 4, !dbg !2750
  %70 = trunc i32 %69 to i8, !dbg !2750
  %71 = load i32* %i, align 4, !dbg !2750
  %72 = add nsw i32 %71, 1, !dbg !2750
  store i32 %72, i32* %i, align 4, !dbg !2750
  %73 = sext i32 %71 to i64, !dbg !2750
  %74 = getelementptr inbounds [19 x i8]* @pt_len, i32 0, i64 %73, !dbg !2750
  store i8 %70, i8* %74, align 1, !dbg !2750
  %75 = load i32* %i, align 4, !dbg !2751
  %76 = load i32* %3, align 4, !dbg !2751
  %77 = icmp eq i32 %75, %76, !dbg !2751
  br i1 %77, label %78, label %90, !dbg !2751

; <label>:78                                      ; preds = %67
  %79 = call i32 (...)* bitcast (i32 (i32)* @getbits to i32 (...)*)(i32 2), !dbg !2752
  store i32 %79, i32* %c, align 4, !dbg !2752
  br label %80, !dbg !2754

; <label>:80                                      ; preds = %84, %78
  %81 = load i32* %c, align 4, !dbg !2754
  %82 = add nsw i32 %81, -1, !dbg !2754
  store i32 %82, i32* %c, align 4, !dbg !2754
  %83 = icmp sge i32 %82, 0, !dbg !2754
  br i1 %83, label %84, label %89, !dbg !2754

; <label>:84                                      ; preds = %80
  %85 = load i32* %i, align 4, !dbg !2755
  %86 = add nsw i32 %85, 1, !dbg !2755
  store i32 %86, i32* %i, align 4, !dbg !2755
  %87 = sext i32 %85 to i64, !dbg !2755
  %88 = getelementptr inbounds [19 x i8]* @pt_len, i32 0, i64 %87, !dbg !2755
  store i8 0, i8* %88, align 1, !dbg !2755
  br label %80, !dbg !2755

; <label>:89                                      ; preds = %80
  br label %90, !dbg !2756

; <label>:90                                      ; preds = %89, %67
  br label %37, !dbg !2757

; <label>:91                                      ; preds = %37
  br label %92, !dbg !2758

; <label>:92                                      ; preds = %96, %91
  %93 = load i32* %i, align 4, !dbg !2758
  %94 = load i32* %1, align 4, !dbg !2758
  %95 = icmp slt i32 %93, %94, !dbg !2758
  br i1 %95, label %96, label %101, !dbg !2758

; <label>:96                                      ; preds = %92
  %97 = load i32* %i, align 4, !dbg !2759
  %98 = add nsw i32 %97, 1, !dbg !2759
  store i32 %98, i32* %i, align 4, !dbg !2759
  %99 = sext i32 %97 to i64, !dbg !2759
  %100 = getelementptr inbounds [19 x i8]* @pt_len, i32 0, i64 %99, !dbg !2759
  store i8 0, i8* %100, align 1, !dbg !2759
  br label %92, !dbg !2759

; <label>:101                                     ; preds = %92
  %102 = load i32* %1, align 4, !dbg !2760
  call void (...)* bitcast (void (i32, i8*, i32, i16*)* @make_table to void (...)*)(i32 %102, i8* getelementptr inbounds ([19 x i8]* @pt_len, i32 0, i32 0), i32 8, i16* getelementptr inbounds ([256 x i16]* @pt_table, i32 0, i32 0)), !dbg !2760
  br label %103

; <label>:103                                     ; preds = %101, %35
  ret void, !dbg !2761
}

define internal void @read_c_len() nounwind uwtable {
  %i = alloca i32, align 4
  %c = alloca i32, align 4
  %n = alloca i32, align 4
  %mask = alloca i32, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !2762), !dbg !2764
  call void @llvm.dbg.declare(metadata !22, metadata !2765), !dbg !2766
  call void @llvm.dbg.declare(metadata !22, metadata !2767), !dbg !2768
  call void @llvm.dbg.declare(metadata !22, metadata !2769), !dbg !2770
  %1 = call i32 (...)* bitcast (i32 (i32)* @getbits to i32 (...)*)(i32 9), !dbg !2771
  store i32 %1, i32* %n, align 4, !dbg !2771
  %2 = load i32* %n, align 4, !dbg !2772
  %3 = icmp eq i32 %2, 0, !dbg !2772
  br i1 %3, label %4, label %30, !dbg !2772

; <label>:4                                       ; preds = %0
  %5 = call i32 (...)* bitcast (i32 (i32)* @getbits to i32 (...)*)(i32 9), !dbg !2773
  store i32 %5, i32* %c, align 4, !dbg !2773
  store i32 0, i32* %i, align 4, !dbg !2775
  br label %6, !dbg !2775

; <label>:6                                       ; preds = %13, %4
  %7 = load i32* %i, align 4, !dbg !2775
  %8 = icmp slt i32 %7, 510, !dbg !2775
  br i1 %8, label %9, label %16, !dbg !2775

; <label>:9                                       ; preds = %6
  %10 = load i32* %i, align 4, !dbg !2777
  %11 = sext i32 %10 to i64, !dbg !2777
  %12 = getelementptr inbounds [0 x i8]* @outbuf, i32 0, i64 %11, !dbg !2777
  store i8 0, i8* %12, align 1, !dbg !2777
  br label %13, !dbg !2777

; <label>:13                                      ; preds = %9
  %14 = load i32* %i, align 4, !dbg !2778
  %15 = add nsw i32 %14, 1, !dbg !2778
  store i32 %15, i32* %i, align 4, !dbg !2778
  br label %6, !dbg !2778

; <label>:16                                      ; preds = %6
  store i32 0, i32* %i, align 4, !dbg !2779
  br label %17, !dbg !2779

; <label>:17                                      ; preds = %26, %16
  %18 = load i32* %i, align 4, !dbg !2779
  %19 = icmp slt i32 %18, 4096, !dbg !2779
  br i1 %19, label %20, label %29, !dbg !2779

; <label>:20                                      ; preds = %17
  %21 = load i32* %c, align 4, !dbg !2781
  %22 = trunc i32 %21 to i16, !dbg !2781
  %23 = load i32* %i, align 4, !dbg !2781
  %24 = sext i32 %23 to i64, !dbg !2781
  %25 = getelementptr inbounds [0 x i16]* @d_buf, i32 0, i64 %24, !dbg !2781
  store i16 %22, i16* %25, align 1, !dbg !2781
  br label %26, !dbg !2781

; <label>:26                                      ; preds = %20
  %27 = load i32* %i, align 4, !dbg !2782
  %28 = add nsw i32 %27, 1, !dbg !2782
  store i32 %28, i32* %i, align 4, !dbg !2782
  br label %17, !dbg !2782

; <label>:29                                      ; preds = %17
  br label %123, !dbg !2783

; <label>:30                                      ; preds = %0
  store i32 0, i32* %i, align 4, !dbg !2784
  br label %31, !dbg !2786

; <label>:31                                      ; preds = %112, %30
  %32 = load i32* %i, align 4, !dbg !2786
  %33 = load i32* %n, align 4, !dbg !2786
  %34 = icmp slt i32 %32, %33, !dbg !2786
  br i1 %34, label %35, label %113, !dbg !2786

; <label>:35                                      ; preds = %31
  %36 = load i16* @bitbuf, align 2, !dbg !2787
  %37 = zext i16 %36 to i32, !dbg !2787
  %38 = ashr i32 %37, 8, !dbg !2787
  %39 = sext i32 %38 to i64, !dbg !2787
  %40 = getelementptr inbounds [256 x i16]* @pt_table, i32 0, i64 %39, !dbg !2787
  %41 = load i16* %40, align 2, !dbg !2787
  %42 = zext i16 %41 to i32, !dbg !2787
  store i32 %42, i32* %c, align 4, !dbg !2787
  %43 = load i32* %c, align 4, !dbg !2789
  %44 = icmp sge i32 %43, 19, !dbg !2789
  br i1 %44, label %45, label %71, !dbg !2789

; <label>:45                                      ; preds = %35
  store i32 128, i32* %mask, align 4, !dbg !2790
  br label %46, !dbg !2792

; <label>:46                                      ; preds = %67, %45
  %47 = load i16* @bitbuf, align 2, !dbg !2793
  %48 = zext i16 %47 to i32, !dbg !2793
  %49 = load i32* %mask, align 4, !dbg !2793
  %50 = and i32 %48, %49, !dbg !2793
  %51 = icmp ne i32 %50, 0, !dbg !2793
  br i1 %51, label %52, label %58, !dbg !2793

; <label>:52                                      ; preds = %46
  %53 = load i32* %c, align 4, !dbg !2795
  %54 = sext i32 %53 to i64, !dbg !2795
  %55 = getelementptr inbounds i16* getelementptr inbounds ([0 x i16]* @prev, i32 0, i64 32768), i64 %54, !dbg !2795
  %56 = load i16* %55, align 2, !dbg !2795
  %57 = zext i16 %56 to i32, !dbg !2795
  store i32 %57, i32* %c, align 4, !dbg !2795
  br label %64, !dbg !2795

; <label>:58                                      ; preds = %46
  %59 = load i32* %c, align 4, !dbg !2796
  %60 = sext i32 %59 to i64, !dbg !2796
  %61 = getelementptr inbounds [0 x i16]* @prev, i32 0, i64 %60, !dbg !2796
  %62 = load i16* %61, align 1, !dbg !2796
  %63 = zext i16 %62 to i32, !dbg !2796
  store i32 %63, i32* %c, align 4, !dbg !2796
  br label %64

; <label>:64                                      ; preds = %58, %52
  %65 = load i32* %mask, align 4, !dbg !2797
  %66 = lshr i32 %65, 1, !dbg !2797
  store i32 %66, i32* %mask, align 4, !dbg !2797
  br label %67, !dbg !2798

; <label>:67                                      ; preds = %64
  %68 = load i32* %c, align 4, !dbg !2798
  %69 = icmp sge i32 %68, 19, !dbg !2798
  br i1 %69, label %46, label %70, !dbg !2798

; <label>:70                                      ; preds = %67
  br label %71, !dbg !2799

; <label>:71                                      ; preds = %70, %35
  %72 = load i32* %c, align 4, !dbg !2800
  %73 = sext i32 %72 to i64, !dbg !2800
  %74 = getelementptr inbounds [19 x i8]* @pt_len, i32 0, i64 %73, !dbg !2800
  %75 = load i8* %74, align 1, !dbg !2800
  %76 = zext i8 %75 to i32, !dbg !2800
  call void (...)* bitcast (void (i32)* @fillbuf to void (...)*)(i32 %76), !dbg !2800
  %77 = load i32* %c, align 4, !dbg !2801
  %78 = icmp sle i32 %77, 2, !dbg !2801
  br i1 %78, label %79, label %104, !dbg !2801

; <label>:79                                      ; preds = %71
  %80 = load i32* %c, align 4, !dbg !2802
  %81 = icmp eq i32 %80, 0, !dbg !2802
  br i1 %81, label %82, label %83, !dbg !2802

; <label>:82                                      ; preds = %79
  store i32 1, i32* %c, align 4, !dbg !2804
  br label %93, !dbg !2804

; <label>:83                                      ; preds = %79
  %84 = load i32* %c, align 4, !dbg !2805
  %85 = icmp eq i32 %84, 1, !dbg !2805
  br i1 %85, label %86, label %89, !dbg !2805

; <label>:86                                      ; preds = %83
  %87 = call i32 (...)* bitcast (i32 (i32)* @getbits to i32 (...)*)(i32 4), !dbg !2806
  %88 = add i32 %87, 3, !dbg !2806
  store i32 %88, i32* %c, align 4, !dbg !2806
  br label %92, !dbg !2806

; <label>:89                                      ; preds = %83
  %90 = call i32 (...)* bitcast (i32 (i32)* @getbits to i32 (...)*)(i32 9), !dbg !2807
  %91 = add i32 %90, 20, !dbg !2807
  store i32 %91, i32* %c, align 4, !dbg !2807
  br label %92

; <label>:92                                      ; preds = %89, %86
  br label %93

; <label>:93                                      ; preds = %92, %82
  br label %94, !dbg !2808

; <label>:94                                      ; preds = %98, %93
  %95 = load i32* %c, align 4, !dbg !2808
  %96 = add nsw i32 %95, -1, !dbg !2808
  store i32 %96, i32* %c, align 4, !dbg !2808
  %97 = icmp sge i32 %96, 0, !dbg !2808
  br i1 %97, label %98, label %103, !dbg !2808

; <label>:98                                      ; preds = %94
  %99 = load i32* %i, align 4, !dbg !2809
  %100 = add nsw i32 %99, 1, !dbg !2809
  store i32 %100, i32* %i, align 4, !dbg !2809
  %101 = sext i32 %99 to i64, !dbg !2809
  %102 = getelementptr inbounds [0 x i8]* @outbuf, i32 0, i64 %101, !dbg !2809
  store i8 0, i8* %102, align 1, !dbg !2809
  br label %94, !dbg !2809

; <label>:103                                     ; preds = %94
  br label %112, !dbg !2810

; <label>:104                                     ; preds = %71
  %105 = load i32* %c, align 4, !dbg !2811
  %106 = sub nsw i32 %105, 2, !dbg !2811
  %107 = trunc i32 %106 to i8, !dbg !2811
  %108 = load i32* %i, align 4, !dbg !2811
  %109 = add nsw i32 %108, 1, !dbg !2811
  store i32 %109, i32* %i, align 4, !dbg !2811
  %110 = sext i32 %108 to i64, !dbg !2811
  %111 = getelementptr inbounds [0 x i8]* @outbuf, i32 0, i64 %110, !dbg !2811
  store i8 %107, i8* %111, align 1, !dbg !2811
  br label %112

; <label>:112                                     ; preds = %104, %103
  br label %31, !dbg !2812

; <label>:113                                     ; preds = %31
  br label %114, !dbg !2813

; <label>:114                                     ; preds = %117, %113
  %115 = load i32* %i, align 4, !dbg !2813
  %116 = icmp slt i32 %115, 510, !dbg !2813
  br i1 %116, label %117, label %122, !dbg !2813

; <label>:117                                     ; preds = %114
  %118 = load i32* %i, align 4, !dbg !2814
  %119 = add nsw i32 %118, 1, !dbg !2814
  store i32 %119, i32* %i, align 4, !dbg !2814
  %120 = sext i32 %118 to i64, !dbg !2814
  %121 = getelementptr inbounds [0 x i8]* @outbuf, i32 0, i64 %120, !dbg !2814
  store i8 0, i8* %121, align 1, !dbg !2814
  br label %114, !dbg !2814

; <label>:122                                     ; preds = %114
  call void (...)* bitcast (void (i32, i8*, i32, i16*)* @make_table to void (...)*)(i32 510, i8* getelementptr inbounds ([0 x i8]* @outbuf, i32 0, i32 0), i32 12, i16* getelementptr inbounds ([0 x i16]* @d_buf, i32 0, i32 0)), !dbg !2815
  br label %123

; <label>:123                                     ; preds = %122, %29
  ret void, !dbg !2816
}

define internal void @make_table(i32 %nchar, i8* %bitlen, i32 %tablebits, i16* %table) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i16*, align 8
  %count = alloca [17 x i16], align 16
  %weight = alloca [17 x i16], align 16
  %start = alloca [18 x i16], align 16
  %p = alloca i16*, align 8
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  %len = alloca i32, align 4
  %ch = alloca i32, align 4
  %jutbits = alloca i32, align 4
  %avail = alloca i32, align 4
  %nextcode = alloca i32, align 4
  %mask = alloca i32, align 4
  store i32 %nchar, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !2817), !dbg !2818
  store i8* %bitlen, i8** %2, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !2819), !dbg !2820
  store i32 %tablebits, i32* %3, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !2821), !dbg !2822
  store i16* %table, i16** %4, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !2823), !dbg !2824
  call void @llvm.dbg.declare(metadata !22, metadata !2825), !dbg !2828
  call void @llvm.dbg.declare(metadata !22, metadata !2829), !dbg !2830
  call void @llvm.dbg.declare(metadata !22, metadata !2831), !dbg !2835
  call void @llvm.dbg.declare(metadata !22, metadata !2836), !dbg !2837
  call void @llvm.dbg.declare(metadata !22, metadata !2838), !dbg !2839
  call void @llvm.dbg.declare(metadata !22, metadata !2840), !dbg !2841
  call void @llvm.dbg.declare(metadata !22, metadata !2842), !dbg !2843
  call void @llvm.dbg.declare(metadata !22, metadata !2844), !dbg !2845
  call void @llvm.dbg.declare(metadata !22, metadata !2846), !dbg !2847
  call void @llvm.dbg.declare(metadata !22, metadata !2848), !dbg !2849
  call void @llvm.dbg.declare(metadata !22, metadata !2850), !dbg !2851
  call void @llvm.dbg.declare(metadata !22, metadata !2852), !dbg !2853
  store i32 1, i32* %i, align 4, !dbg !2854
  br label %5, !dbg !2854

; <label>:5                                       ; preds = %12, %0
  %6 = load i32* %i, align 4, !dbg !2854
  %7 = icmp ule i32 %6, 16, !dbg !2854
  br i1 %7, label %8, label %15, !dbg !2854

; <label>:8                                       ; preds = %5
  %9 = load i32* %i, align 4, !dbg !2856
  %10 = zext i32 %9 to i64, !dbg !2856
  %11 = getelementptr inbounds [17 x i16]* %count, i32 0, i64 %10, !dbg !2856
  store i16 0, i16* %11, align 2, !dbg !2856
  br label %12, !dbg !2856

; <label>:12                                      ; preds = %8
  %13 = load i32* %i, align 4, !dbg !2857
  %14 = add i32 %13, 1, !dbg !2857
  store i32 %14, i32* %i, align 4, !dbg !2857
  br label %5, !dbg !2857

; <label>:15                                      ; preds = %5
  store i32 0, i32* %i, align 4, !dbg !2858
  br label %16, !dbg !2858

; <label>:16                                      ; preds = %30, %15
  %17 = load i32* %i, align 4, !dbg !2858
  %18 = load i32* %1, align 4, !dbg !2858
  %19 = icmp ult i32 %17, %18, !dbg !2858
  br i1 %19, label %20, label %33, !dbg !2858

; <label>:20                                      ; preds = %16
  %21 = load i32* %i, align 4, !dbg !2860
  %22 = zext i32 %21 to i64, !dbg !2860
  %23 = load i8** %2, align 8, !dbg !2860
  %24 = getelementptr inbounds i8* %23, i64 %22, !dbg !2860
  %25 = load i8* %24, align 1, !dbg !2860
  %26 = zext i8 %25 to i64, !dbg !2860
  %27 = getelementptr inbounds [17 x i16]* %count, i32 0, i64 %26, !dbg !2860
  %28 = load i16* %27, align 2, !dbg !2860
  %29 = add i16 %28, 1, !dbg !2860
  store i16 %29, i16* %27, align 2, !dbg !2860
  br label %30, !dbg !2860

; <label>:30                                      ; preds = %20
  %31 = load i32* %i, align 4, !dbg !2861
  %32 = add i32 %31, 1, !dbg !2861
  store i32 %32, i32* %i, align 4, !dbg !2861
  br label %16, !dbg !2861

; <label>:33                                      ; preds = %16
  %34 = getelementptr inbounds [18 x i16]* %start, i32 0, i64 1, !dbg !2862
  store i16 0, i16* %34, align 2, !dbg !2862
  store i32 1, i32* %i, align 4, !dbg !2863
  br label %35, !dbg !2863

; <label>:35                                      ; preds = %58, %33
  %36 = load i32* %i, align 4, !dbg !2863
  %37 = icmp ule i32 %36, 16, !dbg !2863
  br i1 %37, label %38, label %61, !dbg !2863

; <label>:38                                      ; preds = %35
  %39 = load i32* %i, align 4, !dbg !2865
  %40 = zext i32 %39 to i64, !dbg !2865
  %41 = getelementptr inbounds [18 x i16]* %start, i32 0, i64 %40, !dbg !2865
  %42 = load i16* %41, align 2, !dbg !2865
  %43 = zext i16 %42 to i32, !dbg !2865
  %44 = load i32* %i, align 4, !dbg !2865
  %45 = zext i32 %44 to i64, !dbg !2865
  %46 = getelementptr inbounds [17 x i16]* %count, i32 0, i64 %45, !dbg !2865
  %47 = load i16* %46, align 2, !dbg !2865
  %48 = zext i16 %47 to i32, !dbg !2865
  %49 = load i32* %i, align 4, !dbg !2865
  %50 = sub i32 16, %49, !dbg !2865
  %51 = shl i32 %48, %50, !dbg !2865
  %52 = add nsw i32 %43, %51, !dbg !2865
  %53 = trunc i32 %52 to i16, !dbg !2865
  %54 = load i32* %i, align 4, !dbg !2865
  %55 = add i32 %54, 1, !dbg !2865
  %56 = zext i32 %55 to i64, !dbg !2865
  %57 = getelementptr inbounds [18 x i16]* %start, i32 0, i64 %56, !dbg !2865
  store i16 %53, i16* %57, align 2, !dbg !2865
  br label %58, !dbg !2865

; <label>:58                                      ; preds = %38
  %59 = load i32* %i, align 4, !dbg !2866
  %60 = add i32 %59, 1, !dbg !2866
  store i32 %60, i32* %i, align 4, !dbg !2866
  br label %35, !dbg !2866

; <label>:61                                      ; preds = %35
  %62 = getelementptr inbounds [18 x i16]* %start, i32 0, i64 17, !dbg !2867
  %63 = load i16* %62, align 2, !dbg !2867
  %64 = zext i16 %63 to i32, !dbg !2867
  %65 = and i32 %64, 65535, !dbg !2867
  %66 = icmp ne i32 %65, 0, !dbg !2867
  br i1 %66, label %67, label %68, !dbg !2867

; <label>:67                                      ; preds = %61
  call void @error(i8* getelementptr inbounds ([11 x i8]* @.str21, i32 0, i32 0)), !dbg !2868
  br label %68, !dbg !2868

; <label>:68                                      ; preds = %67, %61
  %69 = load i32* %3, align 4, !dbg !2869
  %70 = sub nsw i32 16, %69, !dbg !2869
  store i32 %70, i32* %jutbits, align 4, !dbg !2869
  store i32 1, i32* %i, align 4, !dbg !2870
  br label %71, !dbg !2870

; <label>:71                                      ; preds = %92, %68
  %72 = load i32* %i, align 4, !dbg !2870
  %73 = load i32* %3, align 4, !dbg !2870
  %74 = icmp ule i32 %72, %73, !dbg !2870
  br i1 %74, label %75, label %95, !dbg !2870

; <label>:75                                      ; preds = %71
  %76 = load i32* %jutbits, align 4, !dbg !2872
  %77 = load i32* %i, align 4, !dbg !2872
  %78 = zext i32 %77 to i64, !dbg !2872
  %79 = getelementptr inbounds [18 x i16]* %start, i32 0, i64 %78, !dbg !2872
  %80 = load i16* %79, align 2, !dbg !2872
  %81 = zext i16 %80 to i32, !dbg !2872
  %82 = ashr i32 %81, %76, !dbg !2872
  %83 = trunc i32 %82 to i16, !dbg !2872
  store i16 %83, i16* %79, align 2, !dbg !2872
  %84 = load i32* %3, align 4, !dbg !2874
  %85 = load i32* %i, align 4, !dbg !2874
  %86 = sub i32 %84, %85, !dbg !2874
  %87 = shl i32 1, %86, !dbg !2874
  %88 = trunc i32 %87 to i16, !dbg !2874
  %89 = load i32* %i, align 4, !dbg !2874
  %90 = zext i32 %89 to i64, !dbg !2874
  %91 = getelementptr inbounds [17 x i16]* %weight, i32 0, i64 %90, !dbg !2874
  store i16 %88, i16* %91, align 2, !dbg !2874
  br label %92, !dbg !2875

; <label>:92                                      ; preds = %75
  %93 = load i32* %i, align 4, !dbg !2876
  %94 = add i32 %93, 1, !dbg !2876
  store i32 %94, i32* %i, align 4, !dbg !2876
  br label %71, !dbg !2876

; <label>:95                                      ; preds = %71
  br label %96, !dbg !2877

; <label>:96                                      ; preds = %99, %95
  %97 = load i32* %i, align 4, !dbg !2877
  %98 = icmp ule i32 %97, 16, !dbg !2877
  br i1 %98, label %99, label %109, !dbg !2877

; <label>:99                                      ; preds = %96
  %100 = load i32* %i, align 4, !dbg !2878
  %101 = sub i32 16, %100, !dbg !2878
  %102 = shl i32 1, %101, !dbg !2878
  %103 = trunc i32 %102 to i16, !dbg !2878
  %104 = load i32* %i, align 4, !dbg !2878
  %105 = zext i32 %104 to i64, !dbg !2878
  %106 = getelementptr inbounds [17 x i16]* %weight, i32 0, i64 %105, !dbg !2878
  store i16 %103, i16* %106, align 2, !dbg !2878
  %107 = load i32* %i, align 4, !dbg !2880
  %108 = add i32 %107, 1, !dbg !2880
  store i32 %108, i32* %i, align 4, !dbg !2880
  br label %96, !dbg !2881

; <label>:109                                     ; preds = %96
  %110 = load i32* %3, align 4, !dbg !2882
  %111 = add nsw i32 %110, 1, !dbg !2882
  %112 = sext i32 %111 to i64, !dbg !2882
  %113 = getelementptr inbounds [18 x i16]* %start, i32 0, i64 %112, !dbg !2882
  %114 = load i16* %113, align 2, !dbg !2882
  %115 = zext i16 %114 to i32, !dbg !2882
  %116 = load i32* %jutbits, align 4, !dbg !2882
  %117 = ashr i32 %115, %116, !dbg !2882
  store i32 %117, i32* %i, align 4, !dbg !2882
  %118 = load i32* %i, align 4, !dbg !2883
  %119 = icmp ne i32 %118, 0, !dbg !2883
  br i1 %119, label %120, label %134, !dbg !2883

; <label>:120                                     ; preds = %109
  %121 = load i32* %3, align 4, !dbg !2884
  %122 = shl i32 1, %121, !dbg !2884
  store i32 %122, i32* %k, align 4, !dbg !2884
  br label %123, !dbg !2886

; <label>:123                                     ; preds = %127, %120
  %124 = load i32* %i, align 4, !dbg !2886
  %125 = load i32* %k, align 4, !dbg !2886
  %126 = icmp ne i32 %124, %125, !dbg !2886
  br i1 %126, label %127, label %133, !dbg !2886

; <label>:127                                     ; preds = %123
  %128 = load i32* %i, align 4, !dbg !2887
  %129 = add i32 %128, 1, !dbg !2887
  store i32 %129, i32* %i, align 4, !dbg !2887
  %130 = zext i32 %128 to i64, !dbg !2887
  %131 = load i16** %4, align 8, !dbg !2887
  %132 = getelementptr inbounds i16* %131, i64 %130, !dbg !2887
  store i16 0, i16* %132, align 2, !dbg !2887
  br label %123, !dbg !2887

; <label>:133                                     ; preds = %123
  br label %134, !dbg !2888

; <label>:134                                     ; preds = %133, %109
  %135 = load i32* %1, align 4, !dbg !2889
  store i32 %135, i32* %avail, align 4, !dbg !2889
  %136 = load i32* %3, align 4, !dbg !2890
  %137 = sub nsw i32 15, %136, !dbg !2890
  %138 = shl i32 1, %137, !dbg !2890
  store i32 %138, i32* %mask, align 4, !dbg !2890
  store i32 0, i32* %ch, align 4, !dbg !2891
  br label %139, !dbg !2891

; <label>:139                                     ; preds = %252, %134
  %140 = load i32* %ch, align 4, !dbg !2891
  %141 = load i32* %1, align 4, !dbg !2891
  %142 = icmp ult i32 %140, %141, !dbg !2891
  br i1 %142, label %143, label %255, !dbg !2891

; <label>:143                                     ; preds = %139
  %144 = load i32* %ch, align 4, !dbg !2893
  %145 = zext i32 %144 to i64, !dbg !2893
  %146 = load i8** %2, align 8, !dbg !2893
  %147 = getelementptr inbounds i8* %146, i64 %145, !dbg !2893
  %148 = load i8* %147, align 1, !dbg !2893
  %149 = zext i8 %148 to i32, !dbg !2893
  store i32 %149, i32* %len, align 4, !dbg !2893
  %150 = icmp eq i32 %149, 0, !dbg !2893
  br i1 %150, label %151, label %152, !dbg !2893

; <label>:151                                     ; preds = %143
  br label %252, !dbg !2895

; <label>:152                                     ; preds = %143
  %153 = load i32* %len, align 4, !dbg !2896
  %154 = zext i32 %153 to i64, !dbg !2896
  %155 = getelementptr inbounds [18 x i16]* %start, i32 0, i64 %154, !dbg !2896
  %156 = load i16* %155, align 2, !dbg !2896
  %157 = zext i16 %156 to i32, !dbg !2896
  %158 = load i32* %len, align 4, !dbg !2896
  %159 = zext i32 %158 to i64, !dbg !2896
  %160 = getelementptr inbounds [17 x i16]* %weight, i32 0, i64 %159, !dbg !2896
  %161 = load i16* %160, align 2, !dbg !2896
  %162 = zext i16 %161 to i32, !dbg !2896
  %163 = add nsw i32 %157, %162, !dbg !2896
  store i32 %163, i32* %nextcode, align 4, !dbg !2896
  %164 = load i32* %len, align 4, !dbg !2897
  %165 = load i32* %3, align 4, !dbg !2897
  %166 = icmp ule i32 %164, %165, !dbg !2897
  br i1 %166, label %167, label %188, !dbg !2897

; <label>:167                                     ; preds = %152
  %168 = load i32* %len, align 4, !dbg !2898
  %169 = zext i32 %168 to i64, !dbg !2898
  %170 = getelementptr inbounds [18 x i16]* %start, i32 0, i64 %169, !dbg !2898
  %171 = load i16* %170, align 2, !dbg !2898
  %172 = zext i16 %171 to i32, !dbg !2898
  store i32 %172, i32* %i, align 4, !dbg !2898
  br label %173, !dbg !2898

; <label>:173                                     ; preds = %184, %167
  %174 = load i32* %i, align 4, !dbg !2898
  %175 = load i32* %nextcode, align 4, !dbg !2898
  %176 = icmp ult i32 %174, %175, !dbg !2898
  br i1 %176, label %177, label %187, !dbg !2898

; <label>:177                                     ; preds = %173
  %178 = load i32* %ch, align 4, !dbg !2901
  %179 = trunc i32 %178 to i16, !dbg !2901
  %180 = load i32* %i, align 4, !dbg !2901
  %181 = zext i32 %180 to i64, !dbg !2901
  %182 = load i16** %4, align 8, !dbg !2901
  %183 = getelementptr inbounds i16* %182, i64 %181, !dbg !2901
  store i16 %179, i16* %183, align 2, !dbg !2901
  br label %184, !dbg !2901

; <label>:184                                     ; preds = %177
  %185 = load i32* %i, align 4, !dbg !2902
  %186 = add i32 %185, 1, !dbg !2902
  store i32 %186, i32* %i, align 4, !dbg !2902
  br label %173, !dbg !2902

; <label>:187                                     ; preds = %173
  br label %246, !dbg !2903

; <label>:188                                     ; preds = %152
  %189 = load i32* %len, align 4, !dbg !2904
  %190 = zext i32 %189 to i64, !dbg !2904
  %191 = getelementptr inbounds [18 x i16]* %start, i32 0, i64 %190, !dbg !2904
  %192 = load i16* %191, align 2, !dbg !2904
  %193 = zext i16 %192 to i32, !dbg !2904
  store i32 %193, i32* %k, align 4, !dbg !2904
  %194 = load i32* %k, align 4, !dbg !2906
  %195 = load i32* %jutbits, align 4, !dbg !2906
  %196 = lshr i32 %194, %195, !dbg !2906
  %197 = zext i32 %196 to i64, !dbg !2906
  %198 = load i16** %4, align 8, !dbg !2906
  %199 = getelementptr inbounds i16* %198, i64 %197, !dbg !2906
  store i16* %199, i16** %p, align 8, !dbg !2906
  %200 = load i32* %len, align 4, !dbg !2907
  %201 = load i32* %3, align 4, !dbg !2907
  %202 = sub i32 %200, %201, !dbg !2907
  store i32 %202, i32* %i, align 4, !dbg !2907
  br label %203, !dbg !2908

; <label>:203                                     ; preds = %237, %188
  %204 = load i32* %i, align 4, !dbg !2908
  %205 = icmp ne i32 %204, 0, !dbg !2908
  br i1 %205, label %206, label %242, !dbg !2908

; <label>:206                                     ; preds = %203
  %207 = load i16** %p, align 8, !dbg !2909
  %208 = load i16* %207, align 2, !dbg !2909
  %209 = zext i16 %208 to i32, !dbg !2909
  %210 = icmp eq i32 %209, 0, !dbg !2909
  br i1 %210, label %211, label %222, !dbg !2909

; <label>:211                                     ; preds = %206
  %212 = load i32* %avail, align 4, !dbg !2911
  %213 = zext i32 %212 to i64, !dbg !2911
  %214 = getelementptr inbounds [0 x i16]* @prev, i32 0, i64 %213, !dbg !2911
  store i16 0, i16* %214, align 1, !dbg !2911
  %215 = load i32* %avail, align 4, !dbg !2911
  %216 = zext i32 %215 to i64, !dbg !2911
  %217 = getelementptr inbounds i16* getelementptr inbounds ([0 x i16]* @prev, i32 0, i64 32768), i64 %216, !dbg !2911
  store i16 0, i16* %217, align 2, !dbg !2911
  %218 = load i32* %avail, align 4, !dbg !2913
  %219 = add i32 %218, 1, !dbg !2913
  store i32 %219, i32* %avail, align 4, !dbg !2913
  %220 = trunc i32 %218 to i16, !dbg !2913
  %221 = load i16** %p, align 8, !dbg !2913
  store i16 %220, i16* %221, align 2, !dbg !2913
  br label %222, !dbg !2914

; <label>:222                                     ; preds = %211, %206
  %223 = load i32* %k, align 4, !dbg !2915
  %224 = load i32* %mask, align 4, !dbg !2915
  %225 = and i32 %223, %224, !dbg !2915
  %226 = icmp ne i32 %225, 0, !dbg !2915
  br i1 %226, label %227, label %232, !dbg !2915

; <label>:227                                     ; preds = %222
  %228 = load i16** %p, align 8, !dbg !2916
  %229 = load i16* %228, align 2, !dbg !2916
  %230 = zext i16 %229 to i64, !dbg !2916
  %231 = getelementptr inbounds i16* getelementptr inbounds ([0 x i16]* @prev, i32 0, i64 32768), i64 %230, !dbg !2916
  store i16* %231, i16** %p, align 8, !dbg !2916
  br label %237, !dbg !2916

; <label>:232                                     ; preds = %222
  %233 = load i16** %p, align 8, !dbg !2917
  %234 = load i16* %233, align 2, !dbg !2917
  %235 = zext i16 %234 to i64, !dbg !2917
  %236 = getelementptr inbounds [0 x i16]* @prev, i32 0, i64 %235, !dbg !2917
  store i16* %236, i16** %p, align 8, !dbg !2917
  br label %237

; <label>:237                                     ; preds = %232, %227
  %238 = load i32* %k, align 4, !dbg !2918
  %239 = shl i32 %238, 1, !dbg !2918
  store i32 %239, i32* %k, align 4, !dbg !2918
  %240 = load i32* %i, align 4, !dbg !2919
  %241 = add i32 %240, -1, !dbg !2919
  store i32 %241, i32* %i, align 4, !dbg !2919
  br label %203, !dbg !2920

; <label>:242                                     ; preds = %203
  %243 = load i32* %ch, align 4, !dbg !2921
  %244 = trunc i32 %243 to i16, !dbg !2921
  %245 = load i16** %p, align 8, !dbg !2921
  store i16 %244, i16* %245, align 2, !dbg !2921
  br label %246

; <label>:246                                     ; preds = %242, %187
  %247 = load i32* %nextcode, align 4, !dbg !2922
  %248 = trunc i32 %247 to i16, !dbg !2922
  %249 = load i32* %len, align 4, !dbg !2922
  %250 = zext i32 %249 to i64, !dbg !2922
  %251 = getelementptr inbounds [18 x i16]* %start, i32 0, i64 %250, !dbg !2922
  store i16 %248, i16* %251, align 2, !dbg !2922
  br label %252, !dbg !2923

; <label>:252                                     ; preds = %246, %151
  %253 = load i32* %ch, align 4, !dbg !2924
  %254 = add i32 %253, 1, !dbg !2924
  store i32 %254, i32* %ch, align 4, !dbg !2924
  br label %139, !dbg !2924

; <label>:255                                     ; preds = %139
  ret void, !dbg !2925
}

define internal void @huf_decode_start() nounwind uwtable {
  call void @init_getbits(), !dbg !2926
  store i32 0, i32* @blocksize, align 4, !dbg !2928
  ret void, !dbg !2929
}

define internal void @init_getbits() nounwind uwtable {
  store i16 0, i16* @bitbuf, align 2, !dbg !2930
  store i32 0, i32* @subbitbuf, align 4, !dbg !2932
  store i32 0, i32* @bitcount, align 4, !dbg !2933
  call void (...)* bitcast (void (i32)* @fillbuf to void (...)*)(i32 16), !dbg !2934
  ret void, !dbg !2935
}

define i32 @unlzw(i32 %in, i32 %out) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %stackp = alloca i8*, align 8
  %code = alloca i64, align 8
  %finchar = alloca i32, align 4
  %oldcode = alloca i64, align 8
  %incode = alloca i64, align 8
  %inbits = alloca i64, align 8
  %posbits = alloca i64, align 8
  %outpos = alloca i32, align 4
  %bitmask = alloca i32, align 4
  %free_ent = alloca i64, align 8
  %maxcode = alloca i64, align 8
  %maxmaxcode = alloca i64, align 8
  %n_bits = alloca i32, align 4
  %rsize = alloca i32, align 4
  %i = alloca i32, align 4
  %e = alloca i32, align 4
  %o = alloca i32, align 4
  %p = alloca i8*, align 8
  %i1 = alloca i32, align 4
  store i32 %in, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !2936), !dbg !2937
  store i32 %out, i32* %3, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !2938), !dbg !2939
  call void @llvm.dbg.declare(metadata !22, metadata !2940), !dbg !2944
  call void @llvm.dbg.declare(metadata !22, metadata !2945), !dbg !2947
  call void @llvm.dbg.declare(metadata !22, metadata !2948), !dbg !2949
  call void @llvm.dbg.declare(metadata !22, metadata !2950), !dbg !2951
  call void @llvm.dbg.declare(metadata !22, metadata !2952), !dbg !2953
  call void @llvm.dbg.declare(metadata !22, metadata !2954), !dbg !2955
  call void @llvm.dbg.declare(metadata !22, metadata !2956), !dbg !2957
  call void @llvm.dbg.declare(metadata !22, metadata !2958), !dbg !2959
  call void @llvm.dbg.declare(metadata !22, metadata !2960), !dbg !2961
  call void @llvm.dbg.declare(metadata !22, metadata !2962), !dbg !2963
  call void @llvm.dbg.declare(metadata !22, metadata !2964), !dbg !2965
  call void @llvm.dbg.declare(metadata !22, metadata !2966), !dbg !2967
  call void @llvm.dbg.declare(metadata !22, metadata !2968), !dbg !2969
  call void @llvm.dbg.declare(metadata !22, metadata !2970), !dbg !2971
  %4 = load i32* @inptr, align 4, !dbg !2972
  %5 = load i32* @insize, align 4, !dbg !2972
  %6 = icmp ult i32 %4, %5, !dbg !2972
  br i1 %6, label %7, label %14, !dbg !2972

; <label>:7                                       ; preds = %0
  %8 = load i32* @inptr, align 4, !dbg !2972
  %9 = add i32 %8, 1, !dbg !2972
  store i32 %9, i32* @inptr, align 4, !dbg !2972
  %10 = zext i32 %8 to i64, !dbg !2972
  %11 = getelementptr inbounds [0 x i8]* @inbuf, i32 0, i64 %10, !dbg !2972
  %12 = load i8* %11, align 1, !dbg !2972
  %13 = zext i8 %12 to i32, !dbg !2972
  br label %16, !dbg !2972

; <label>:14                                      ; preds = %0
  %15 = call i32 @fill_inbuf(i32 0), !dbg !2973
  br label %16, !dbg !2973

; <label>:16                                      ; preds = %14, %7
  %17 = phi i32 [ %13, %7 ], [ %15, %14 ], !dbg !2973
  store i32 %17, i32* @maxbits, align 4, !dbg !2973
  %18 = load i32* @maxbits, align 4, !dbg !2974
  %19 = and i32 %18, 128, !dbg !2974
  store i32 %19, i32* @block_mode, align 4, !dbg !2974
  %20 = load i32* @maxbits, align 4, !dbg !2975
  %21 = and i32 %20, 96, !dbg !2975
  %22 = icmp ne i32 %21, 0, !dbg !2975
  br i1 %22, label %23, label %37, !dbg !2975

; <label>:23                                      ; preds = %16
  %24 = load i32* @quiet, align 4, !dbg !2976
  %25 = icmp ne i32 %24, 0, !dbg !2976
  br i1 %25, label %32, label %26, !dbg !2976

; <label>:26                                      ; preds = %23
  %27 = load %struct.__sFILE** @__stderrp, align 8, !dbg !2976
  %28 = load i8** @progname, align 8, !dbg !2976
  %29 = load i32* @maxbits, align 4, !dbg !2976
  %30 = and i32 %29, 96, !dbg !2976
  %31 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %27, i8* getelementptr inbounds ([38 x i8]* @.str22, i32 0, i32 0), i8* %28, i8* getelementptr inbounds ([0 x i8]* @ifname, i32 0, i32 0), i32 %30), !dbg !2976
  br label %32, !dbg !2976

; <label>:32                                      ; preds = %26, %23
  %33 = load i32* @exit_code, align 4, !dbg !2976
  %34 = icmp eq i32 %33, 0, !dbg !2976
  br i1 %34, label %35, label %36, !dbg !2976

; <label>:35                                      ; preds = %32
  store i32 2, i32* @exit_code, align 4, !dbg !2976
  br label %36, !dbg !2976

; <label>:36                                      ; preds = %35, %32
  br label %37, !dbg !2979

; <label>:37                                      ; preds = %36, %16
  %38 = load i32* @maxbits, align 4, !dbg !2980
  %39 = and i32 %38, 31, !dbg !2980
  store i32 %39, i32* @maxbits, align 4, !dbg !2980
  %40 = load i32* @maxbits, align 4, !dbg !2981
  %41 = zext i32 %40 to i64, !dbg !2981
  %42 = shl i64 1, %41, !dbg !2981
  store i64 %42, i64* %maxmaxcode, align 8, !dbg !2981
  %43 = load i32* @maxbits, align 4, !dbg !2982
  %44 = icmp sgt i32 %43, 16, !dbg !2982
  br i1 %44, label %45, label %50, !dbg !2982

; <label>:45                                      ; preds = %37
  %46 = load %struct.__sFILE** @__stderrp, align 8, !dbg !2983
  %47 = load i8** @progname, align 8, !dbg !2983
  %48 = load i32* @maxbits, align 4, !dbg !2983
  %49 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %46, i8* getelementptr inbounds ([59 x i8]* @.str123, i32 0, i32 0), i8* %47, i8* getelementptr inbounds ([0 x i8]* @ifname, i32 0, i32 0), i32 %48, i32 16), !dbg !2983
  store i32 1, i32* @exit_code, align 4, !dbg !2985
  store i32 1, i32* %1, !dbg !2986
  br label %408, !dbg !2986

; <label>:50                                      ; preds = %37
  %51 = load i32* @insize, align 4, !dbg !2987
  store i32 %51, i32* %rsize, align 4, !dbg !2987
  store i32 9, i32* %n_bits, align 4, !dbg !2988
  store i64 511, i64* %maxcode, align 8, !dbg !2988
  %52 = load i32* %n_bits, align 4, !dbg !2989
  %53 = shl i32 1, %52, !dbg !2989
  %54 = sub nsw i32 %53, 1, !dbg !2989
  store i32 %54, i32* %bitmask, align 4, !dbg !2989
  store i64 -1, i64* %oldcode, align 8, !dbg !2990
  store i32 0, i32* %finchar, align 4, !dbg !2991
  store i32 0, i32* %outpos, align 4, !dbg !2992
  %55 = load i32* @inptr, align 4, !dbg !2993
  %56 = shl i32 %55, 3, !dbg !2993
  %57 = zext i32 %56 to i64, !dbg !2993
  store i64 %57, i64* %posbits, align 8, !dbg !2993
  %58 = load i32* @block_mode, align 4, !dbg !2994
  %59 = icmp ne i32 %58, 0, !dbg !2994
  %60 = select i1 %59, i32 257, i32 256, !dbg !2994
  %61 = sext i32 %60 to i64, !dbg !2994
  store i64 %61, i64* %free_ent, align 8, !dbg !2994
  call void @llvm.memset.p0i8.i64(i8* bitcast ([0 x i16]* @prev to i8*), i8 0, i64 256, i32 1, i1 false), !dbg !2995
  store i64 255, i64* %code, align 8, !dbg !2996
  br label %62, !dbg !2996

; <label>:62                                      ; preds = %70, %50
  %63 = load i64* %code, align 8, !dbg !2996
  %64 = icmp sge i64 %63, 0, !dbg !2996
  br i1 %64, label %65, label %73, !dbg !2996

; <label>:65                                      ; preds = %62
  %66 = load i64* %code, align 8, !dbg !2998
  %67 = trunc i64 %66 to i8, !dbg !2998
  %68 = load i64* %code, align 8, !dbg !2998
  %69 = getelementptr inbounds [0 x i8]* @window, i32 0, i64 %68, !dbg !2998
  store i8 %67, i8* %69, align 1, !dbg !2998
  br label %70, !dbg !3000

; <label>:70                                      ; preds = %65
  %71 = load i64* %code, align 8, !dbg !3001
  %72 = add nsw i64 %71, -1, !dbg !3001
  store i64 %72, i64* %code, align 8, !dbg !3001
  br label %62, !dbg !3001

; <label>:73                                      ; preds = %62
  br label %74, !dbg !3002

; <label>:74                                      ; preds = %391, %73
  call void @llvm.dbg.declare(metadata !22, metadata !3003), !dbg !3005
  call void @llvm.dbg.declare(metadata !22, metadata !3006), !dbg !3007
  call void @llvm.dbg.declare(metadata !22, metadata !3008), !dbg !3009
  br label %75, !dbg !3010

; <label>:75                                      ; preds = %233, %179, %74
  %76 = load i32* @insize, align 4, !dbg !3011
  %77 = load i64* %posbits, align 8, !dbg !3011
  %78 = ashr i64 %77, 3, !dbg !3011
  %79 = trunc i64 %78 to i32, !dbg !3011
  store i32 %79, i32* %o, align 4, !dbg !3011
  %80 = sub i32 %76, %79, !dbg !3011
  store i32 %80, i32* %e, align 4, !dbg !3011
  store i32 0, i32* %i, align 4, !dbg !3012
  br label %81, !dbg !3012

; <label>:81                                      ; preds = %95, %75
  %82 = load i32* %i, align 4, !dbg !3012
  %83 = load i32* %e, align 4, !dbg !3012
  %84 = icmp slt i32 %82, %83, !dbg !3012
  br i1 %84, label %85, label %98, !dbg !3012

; <label>:85                                      ; preds = %81
  %86 = load i32* %i, align 4, !dbg !3014
  %87 = load i32* %o, align 4, !dbg !3014
  %88 = add nsw i32 %86, %87, !dbg !3014
  %89 = sext i32 %88 to i64, !dbg !3014
  %90 = getelementptr inbounds [0 x i8]* @inbuf, i32 0, i64 %89, !dbg !3014
  %91 = load i8* %90, align 1, !dbg !3014
  %92 = load i32* %i, align 4, !dbg !3014
  %93 = sext i32 %92 to i64, !dbg !3014
  %94 = getelementptr inbounds [0 x i8]* @inbuf, i32 0, i64 %93, !dbg !3014
  store i8 %91, i8* %94, align 1, !dbg !3014
  br label %95, !dbg !3016

; <label>:95                                      ; preds = %85
  %96 = load i32* %i, align 4, !dbg !3017
  %97 = add nsw i32 %96, 1, !dbg !3017
  store i32 %97, i32* %i, align 4, !dbg !3017
  br label %81, !dbg !3017

; <label>:98                                      ; preds = %81
  %99 = load i32* %e, align 4, !dbg !3018
  store i32 %99, i32* @insize, align 4, !dbg !3018
  store i64 0, i64* %posbits, align 8, !dbg !3019
  %100 = load i32* @insize, align 4, !dbg !3020
  %101 = icmp ult i32 %100, 64, !dbg !3020
  br i1 %101, label %102, label %119, !dbg !3020

; <label>:102                                     ; preds = %98
  %103 = load i32* %2, align 4, !dbg !3021
  %104 = load i32* @insize, align 4, !dbg !3021
  %105 = zext i32 %104 to i64, !dbg !3021
  %106 = getelementptr inbounds i8* getelementptr inbounds ([0 x i8]* @inbuf, i32 0, i32 0), i64 %105, !dbg !3021
  %107 = call i64 @read(i32 %103, i8* %106, i64 32768), !dbg !3021
  %108 = trunc i64 %107 to i32, !dbg !3021
  store i32 %108, i32* %rsize, align 4, !dbg !3021
  %109 = icmp eq i32 %108, -1, !dbg !3021
  br i1 %109, label %110, label %111, !dbg !3021

; <label>:110                                     ; preds = %102
  call void @read_error(), !dbg !3023
  br label %111, !dbg !3025

; <label>:111                                     ; preds = %110, %102
  %112 = load i32* %rsize, align 4, !dbg !3026
  %113 = load i32* @insize, align 4, !dbg !3026
  %114 = add i32 %113, %112, !dbg !3026
  store i32 %114, i32* @insize, align 4, !dbg !3026
  %115 = load i32* %rsize, align 4, !dbg !3027
  %116 = sext i32 %115 to i64, !dbg !3027
  %117 = load i64* @bytes_in, align 8, !dbg !3027
  %118 = add i64 %117, %116, !dbg !3027
  store i64 %118, i64* @bytes_in, align 8, !dbg !3027
  br label %119, !dbg !3028

; <label>:119                                     ; preds = %111, %98
  %120 = load i32* %rsize, align 4, !dbg !3029
  %121 = icmp ne i32 %120, 0, !dbg !3029
  br i1 %121, label %122, label %131, !dbg !3029

; <label>:122                                     ; preds = %119
  %123 = load i32* @insize, align 4, !dbg !3029
  %124 = zext i32 %123 to i64, !dbg !3029
  %125 = load i32* @insize, align 4, !dbg !3029
  %126 = load i32* %n_bits, align 4, !dbg !3029
  %127 = urem i32 %125, %126, !dbg !3029
  %128 = zext i32 %127 to i64, !dbg !3029
  %129 = sub nsw i64 %124, %128, !dbg !3029
  %130 = shl i64 %129, 3, !dbg !3029
  br label %139, !dbg !3029

; <label>:131                                     ; preds = %119
  %132 = load i32* @insize, align 4, !dbg !3029
  %133 = zext i32 %132 to i64, !dbg !3029
  %134 = shl i64 %133, 3, !dbg !3029
  %135 = load i32* %n_bits, align 4, !dbg !3029
  %136 = sub nsw i32 %135, 1, !dbg !3029
  %137 = sext i32 %136 to i64, !dbg !3029
  %138 = sub nsw i64 %134, %137, !dbg !3029
  br label %139, !dbg !3029

; <label>:139                                     ; preds = %131, %122
  %140 = phi i64 [ %130, %122 ], [ %138, %131 ], !dbg !3029
  store i64 %140, i64* %inbits, align 8, !dbg !3029
  br label %141, !dbg !3030

; <label>:141                                     ; preds = %388, %219, %139
  %142 = load i64* %inbits, align 8, !dbg !3030
  %143 = load i64* %posbits, align 8, !dbg !3030
  %144 = icmp sgt i64 %142, %143, !dbg !3030
  br i1 %144, label %145, label %390, !dbg !3030

; <label>:145                                     ; preds = %141
  %146 = load i64* %free_ent, align 8, !dbg !3031
  %147 = load i64* %maxcode, align 8, !dbg !3031
  %148 = icmp sgt i64 %146, %147, !dbg !3031
  br i1 %148, label %149, label %183, !dbg !3031

; <label>:149                                     ; preds = %145
  %150 = load i64* %posbits, align 8, !dbg !3033
  %151 = sub nsw i64 %150, 1, !dbg !3033
  %152 = load i32* %n_bits, align 4, !dbg !3033
  %153 = shl i32 %152, 3, !dbg !3033
  %154 = sext i32 %153 to i64, !dbg !3033
  %155 = load i64* %posbits, align 8, !dbg !3033
  %156 = sub nsw i64 %155, 1, !dbg !3033
  %157 = load i32* %n_bits, align 4, !dbg !3033
  %158 = shl i32 %157, 3, !dbg !3033
  %159 = sext i32 %158 to i64, !dbg !3033
  %160 = add nsw i64 %156, %159, !dbg !3033
  %161 = load i32* %n_bits, align 4, !dbg !3033
  %162 = shl i32 %161, 3, !dbg !3033
  %163 = sext i32 %162 to i64, !dbg !3033
  %164 = srem i64 %160, %163, !dbg !3033
  %165 = sub nsw i64 %154, %164, !dbg !3033
  %166 = add nsw i64 %151, %165, !dbg !3033
  store i64 %166, i64* %posbits, align 8, !dbg !3033
  %167 = load i32* %n_bits, align 4, !dbg !3035
  %168 = add nsw i32 %167, 1, !dbg !3035
  store i32 %168, i32* %n_bits, align 4, !dbg !3035
  %169 = load i32* %n_bits, align 4, !dbg !3036
  %170 = load i32* @maxbits, align 4, !dbg !3036
  %171 = icmp eq i32 %169, %170, !dbg !3036
  br i1 %171, label %172, label %174, !dbg !3036

; <label>:172                                     ; preds = %149
  %173 = load i64* %maxmaxcode, align 8, !dbg !3037
  store i64 %173, i64* %maxcode, align 8, !dbg !3037
  br label %179, !dbg !3039

; <label>:174                                     ; preds = %149
  %175 = load i32* %n_bits, align 4, !dbg !3040
  %176 = zext i32 %175 to i64, !dbg !3040
  %177 = shl i64 1, %176, !dbg !3040
  %178 = sub nsw i64 %177, 1, !dbg !3040
  store i64 %178, i64* %maxcode, align 8, !dbg !3040
  br label %179

; <label>:179                                     ; preds = %174, %172
  %180 = load i32* %n_bits, align 4, !dbg !3042
  %181 = shl i32 1, %180, !dbg !3042
  %182 = sub nsw i32 %181, 1, !dbg !3042
  store i32 %182, i32* %bitmask, align 4, !dbg !3042
  br label %75, !dbg !3043

; <label>:183                                     ; preds = %145
  call void @llvm.dbg.declare(metadata !22, metadata !3044), !dbg !3046
  %184 = load i64* %posbits, align 8, !dbg !3046
  %185 = ashr i64 %184, 3, !dbg !3046
  %186 = getelementptr inbounds [0 x i8]* @inbuf, i32 0, i64 %185, !dbg !3046
  store i8* %186, i8** %p, align 8, !dbg !3046
  %187 = load i8** %p, align 8, !dbg !3046
  %188 = getelementptr inbounds i8* %187, i64 0, !dbg !3046
  %189 = load i8* %188, align 1, !dbg !3046
  %190 = zext i8 %189 to i64, !dbg !3046
  %191 = load i8** %p, align 8, !dbg !3046
  %192 = getelementptr inbounds i8* %191, i64 1, !dbg !3046
  %193 = load i8* %192, align 1, !dbg !3046
  %194 = zext i8 %193 to i64, !dbg !3046
  %195 = shl i64 %194, 8, !dbg !3046
  %196 = or i64 %190, %195, !dbg !3046
  %197 = load i8** %p, align 8, !dbg !3046
  %198 = getelementptr inbounds i8* %197, i64 2, !dbg !3046
  %199 = load i8* %198, align 1, !dbg !3046
  %200 = zext i8 %199 to i64, !dbg !3046
  %201 = shl i64 %200, 16, !dbg !3046
  %202 = or i64 %196, %201, !dbg !3046
  %203 = load i64* %posbits, align 8, !dbg !3046
  %204 = and i64 %203, 7, !dbg !3046
  %205 = ashr i64 %202, %204, !dbg !3046
  %206 = load i32* %bitmask, align 4, !dbg !3046
  %207 = zext i32 %206 to i64, !dbg !3046
  %208 = and i64 %205, %207, !dbg !3046
  store i64 %208, i64* %code, align 8, !dbg !3046
  %209 = load i32* %n_bits, align 4, !dbg !3046
  %210 = sext i32 %209 to i64, !dbg !3046
  %211 = load i64* %posbits, align 8, !dbg !3046
  %212 = add nsw i64 %211, %210, !dbg !3046
  store i64 %212, i64* %posbits, align 8, !dbg !3046
  %213 = load i64* %oldcode, align 8, !dbg !3047
  %214 = icmp eq i64 %213, -1, !dbg !3047
  br i1 %214, label %215, label %227, !dbg !3047

; <label>:215                                     ; preds = %183
  %216 = load i64* %code, align 8, !dbg !3048
  %217 = icmp sge i64 %216, 256, !dbg !3048
  br i1 %217, label %218, label %219, !dbg !3048

; <label>:218                                     ; preds = %215
  call void @error(i8* getelementptr inbounds ([15 x i8]* @.str224, i32 0, i32 0)), !dbg !3050
  br label %219, !dbg !3050

; <label>:219                                     ; preds = %218, %215
  %220 = load i64* %code, align 8, !dbg !3051
  store i64 %220, i64* %oldcode, align 8, !dbg !3051
  %221 = trunc i64 %220 to i32, !dbg !3051
  store i32 %221, i32* %finchar, align 4, !dbg !3051
  %222 = trunc i32 %221 to i8, !dbg !3051
  %223 = load i32* %outpos, align 4, !dbg !3051
  %224 = add nsw i32 %223, 1, !dbg !3051
  store i32 %224, i32* %outpos, align 4, !dbg !3051
  %225 = sext i32 %223 to i64, !dbg !3051
  %226 = getelementptr inbounds [0 x i8]* @outbuf, i32 0, i64 %225, !dbg !3051
  store i8 %222, i8* %226, align 1, !dbg !3051
  br label %141, !dbg !3052

; <label>:227                                     ; preds = %183
  %228 = load i64* %code, align 8, !dbg !3053
  %229 = icmp eq i64 %228, 256, !dbg !3053
  br i1 %229, label %230, label %254, !dbg !3053

; <label>:230                                     ; preds = %227
  %231 = load i32* @block_mode, align 4, !dbg !3053
  %232 = icmp ne i32 %231, 0, !dbg !3053
  br i1 %232, label %233, label %254, !dbg !3053

; <label>:233                                     ; preds = %230
  call void @llvm.memset.p0i8.i64(i8* bitcast ([0 x i16]* @prev to i8*), i8 0, i64 256, i32 1, i1 false), !dbg !3054
  store i64 256, i64* %free_ent, align 8, !dbg !3056
  %234 = load i64* %posbits, align 8, !dbg !3057
  %235 = sub nsw i64 %234, 1, !dbg !3057
  %236 = load i32* %n_bits, align 4, !dbg !3057
  %237 = shl i32 %236, 3, !dbg !3057
  %238 = sext i32 %237 to i64, !dbg !3057
  %239 = load i64* %posbits, align 8, !dbg !3057
  %240 = sub nsw i64 %239, 1, !dbg !3057
  %241 = load i32* %n_bits, align 4, !dbg !3057
  %242 = shl i32 %241, 3, !dbg !3057
  %243 = sext i32 %242 to i64, !dbg !3057
  %244 = add nsw i64 %240, %243, !dbg !3057
  %245 = load i32* %n_bits, align 4, !dbg !3057
  %246 = shl i32 %245, 3, !dbg !3057
  %247 = sext i32 %246 to i64, !dbg !3057
  %248 = srem i64 %244, %247, !dbg !3057
  %249 = sub nsw i64 %238, %248, !dbg !3057
  %250 = add nsw i64 %235, %249, !dbg !3057
  store i64 %250, i64* %posbits, align 8, !dbg !3057
  store i32 9, i32* %n_bits, align 4, !dbg !3058
  store i64 511, i64* %maxcode, align 8, !dbg !3058
  %251 = load i32* %n_bits, align 4, !dbg !3059
  %252 = shl i32 1, %251, !dbg !3059
  %253 = sub nsw i32 %252, 1, !dbg !3059
  store i32 %253, i32* %bitmask, align 4, !dbg !3059
  br label %75, !dbg !3060

; <label>:254                                     ; preds = %230, %227
  %255 = load i64* %code, align 8, !dbg !3061
  store i64 %255, i64* %incode, align 8, !dbg !3061
  store i8* bitcast (i16* getelementptr inbounds ([0 x i16]* @d_buf, i32 0, i64 32767) to i8*), i8** %stackp, align 8, !dbg !3062
  %256 = load i64* %code, align 8, !dbg !3063
  %257 = load i64* %free_ent, align 8, !dbg !3063
  %258 = icmp sge i64 %256, %257, !dbg !3063
  br i1 %258, label %259, label %286, !dbg !3063

; <label>:259                                     ; preds = %254
  %260 = load i64* %code, align 8, !dbg !3064
  %261 = load i64* %free_ent, align 8, !dbg !3064
  %262 = icmp sgt i64 %260, %261, !dbg !3064
  br i1 %262, label %263, label %280, !dbg !3064

; <label>:263                                     ; preds = %259
  %264 = load i32* @test, align 4, !dbg !3066
  %265 = icmp ne i32 %264, 0, !dbg !3066
  br i1 %265, label %276, label %266, !dbg !3066

; <label>:266                                     ; preds = %263
  %267 = load i32* %outpos, align 4, !dbg !3066
  %268 = icmp sgt i32 %267, 0, !dbg !3066
  br i1 %268, label %269, label %276, !dbg !3066

; <label>:269                                     ; preds = %266
  %270 = load i32* %3, align 4, !dbg !3068
  %271 = load i32* %outpos, align 4, !dbg !3068
  call void @write_buf(i32 %270, i8* getelementptr inbounds ([0 x i8]* @outbuf, i32 0, i32 0), i32 %271), !dbg !3068
  %272 = load i32* %outpos, align 4, !dbg !3070
  %273 = sext i32 %272 to i64, !dbg !3070
  %274 = load i64* @bytes_out, align 8, !dbg !3070
  %275 = add i64 %274, %273, !dbg !3070
  store i64 %275, i64* @bytes_out, align 8, !dbg !3070
  br label %276, !dbg !3071

; <label>:276                                     ; preds = %269, %266, %263
  %277 = load i32* @to_stdout, align 4, !dbg !3072
  %278 = icmp ne i32 %277, 0, !dbg !3072
  %279 = select i1 %278, i8* getelementptr inbounds ([15 x i8]* @.str224, i32 0, i32 0), i8* getelementptr inbounds ([46 x i8]* @.str325, i32 0, i32 0), !dbg !3072
  call void @error(i8* %279), !dbg !3072
  br label %280, !dbg !3073

; <label>:280                                     ; preds = %276, %259
  %281 = load i32* %finchar, align 4, !dbg !3074
  %282 = trunc i32 %281 to i8, !dbg !3074
  %283 = load i8** %stackp, align 8, !dbg !3074
  %284 = getelementptr inbounds i8* %283, i32 -1, !dbg !3074
  store i8* %284, i8** %stackp, align 8, !dbg !3074
  store i8 %282, i8* %284, align 1, !dbg !3074
  %285 = load i64* %oldcode, align 8, !dbg !3075
  store i64 %285, i64* %code, align 8, !dbg !3075
  br label %286, !dbg !3076

; <label>:286                                     ; preds = %280, %254
  br label %287, !dbg !3077

; <label>:287                                     ; preds = %290, %286
  %288 = load i64* %code, align 8, !dbg !3077
  %289 = icmp uge i64 %288, 256, !dbg !3077
  br i1 %289, label %290, label %300, !dbg !3077

; <label>:290                                     ; preds = %287
  %291 = load i64* %code, align 8, !dbg !3078
  %292 = getelementptr inbounds [0 x i8]* @window, i32 0, i64 %291, !dbg !3078
  %293 = load i8* %292, align 1, !dbg !3078
  %294 = load i8** %stackp, align 8, !dbg !3078
  %295 = getelementptr inbounds i8* %294, i32 -1, !dbg !3078
  store i8* %295, i8** %stackp, align 8, !dbg !3078
  store i8 %293, i8* %295, align 1, !dbg !3078
  %296 = load i64* %code, align 8, !dbg !3080
  %297 = getelementptr inbounds [0 x i16]* @prev, i32 0, i64 %296, !dbg !3080
  %298 = load i16* %297, align 1, !dbg !3080
  %299 = zext i16 %298 to i64, !dbg !3080
  store i64 %299, i64* %code, align 8, !dbg !3080
  br label %287, !dbg !3081

; <label>:300                                     ; preds = %287
  %301 = load i64* %code, align 8, !dbg !3082
  %302 = getelementptr inbounds [0 x i8]* @window, i32 0, i64 %301, !dbg !3082
  %303 = load i8* %302, align 1, !dbg !3082
  %304 = zext i8 %303 to i32, !dbg !3082
  store i32 %304, i32* %finchar, align 4, !dbg !3082
  %305 = trunc i32 %304 to i8, !dbg !3082
  %306 = load i8** %stackp, align 8, !dbg !3082
  %307 = getelementptr inbounds i8* %306, i32 -1, !dbg !3082
  store i8* %307, i8** %stackp, align 8, !dbg !3082
  store i8 %305, i8* %307, align 1, !dbg !3082
  call void @llvm.dbg.declare(metadata !22, metadata !3083), !dbg !3085
  %308 = load i32* %outpos, align 4, !dbg !3086
  %309 = load i8** %stackp, align 8, !dbg !3086
  %310 = ptrtoint i8* %309 to i64, !dbg !3086
  %311 = sub i64 ptrtoint (i16* getelementptr inbounds ([0 x i16]* @d_buf, i32 0, i64 32767) to i64), %310, !dbg !3086
  %312 = trunc i64 %311 to i32, !dbg !3086
  store i32 %312, i32* %i1, align 4, !dbg !3086
  %313 = add nsw i32 %308, %312, !dbg !3086
  %314 = icmp sge i32 %313, 16384, !dbg !3086
  br i1 %314, label %315, label %363, !dbg !3086

; <label>:315                                     ; preds = %300
  br label %316, !dbg !3087

; <label>:316                                     ; preds = %356, %315
  %317 = load i32* %i1, align 4, !dbg !3089
  %318 = load i32* %outpos, align 4, !dbg !3089
  %319 = sub nsw i32 16384, %318, !dbg !3089
  %320 = icmp sgt i32 %317, %319, !dbg !3089
  br i1 %320, label %321, label %324, !dbg !3089

; <label>:321                                     ; preds = %316
  %322 = load i32* %outpos, align 4, !dbg !3091
  %323 = sub nsw i32 16384, %322, !dbg !3091
  store i32 %323, i32* %i1, align 4, !dbg !3091
  br label %324, !dbg !3091

; <label>:324                                     ; preds = %321, %316
  %325 = load i32* %i1, align 4, !dbg !3092
  %326 = icmp sgt i32 %325, 0, !dbg !3092
  br i1 %326, label %327, label %337, !dbg !3092

; <label>:327                                     ; preds = %324
  %328 = load i32* %outpos, align 4, !dbg !3093
  %329 = sext i32 %328 to i64, !dbg !3093
  %330 = getelementptr inbounds i8* getelementptr inbounds ([0 x i8]* @outbuf, i32 0, i32 0), i64 %329, !dbg !3093
  %331 = load i8** %stackp, align 8, !dbg !3093
  %332 = load i32* %i1, align 4, !dbg !3093
  %333 = sext i32 %332 to i64, !dbg !3093
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %330, i8* %331, i64 %333, i32 1, i1 false), !dbg !3093
  %334 = load i32* %i1, align 4, !dbg !3095
  %335 = load i32* %outpos, align 4, !dbg !3095
  %336 = add nsw i32 %335, %334, !dbg !3095
  store i32 %336, i32* %outpos, align 4, !dbg !3095
  br label %337, !dbg !3096

; <label>:337                                     ; preds = %327, %324
  %338 = load i32* %outpos, align 4, !dbg !3097
  %339 = icmp sge i32 %338, 16384, !dbg !3097
  br i1 %339, label %340, label %351, !dbg !3097

; <label>:340                                     ; preds = %337
  %341 = load i32* @test, align 4, !dbg !3098
  %342 = icmp ne i32 %341, 0, !dbg !3098
  br i1 %342, label %350, label %343, !dbg !3098

; <label>:343                                     ; preds = %340
  %344 = load i32* %3, align 4, !dbg !3100
  %345 = load i32* %outpos, align 4, !dbg !3100
  call void @write_buf(i32 %344, i8* getelementptr inbounds ([0 x i8]* @outbuf, i32 0, i32 0), i32 %345), !dbg !3100
  %346 = load i32* %outpos, align 4, !dbg !3102
  %347 = sext i32 %346 to i64, !dbg !3102
  %348 = load i64* @bytes_out, align 8, !dbg !3102
  %349 = add i64 %348, %347, !dbg !3102
  store i64 %349, i64* @bytes_out, align 8, !dbg !3102
  br label %350, !dbg !3103

; <label>:350                                     ; preds = %343, %340
  store i32 0, i32* %outpos, align 4, !dbg !3104
  br label %351, !dbg !3105

; <label>:351                                     ; preds = %350, %337
  %352 = load i32* %i1, align 4, !dbg !3106
  %353 = load i8** %stackp, align 8, !dbg !3106
  %354 = sext i32 %352 to i64, !dbg !3106
  %355 = getelementptr inbounds i8* %353, i64 %354, !dbg !3106
  store i8* %355, i8** %stackp, align 8, !dbg !3106
  br label %356, !dbg !3107

; <label>:356                                     ; preds = %351
  %357 = load i8** %stackp, align 8, !dbg !3107
  %358 = ptrtoint i8* %357 to i64, !dbg !3107
  %359 = sub i64 ptrtoint (i16* getelementptr inbounds ([0 x i16]* @d_buf, i32 0, i64 32767) to i64), %358, !dbg !3107
  %360 = trunc i64 %359 to i32, !dbg !3107
  store i32 %360, i32* %i1, align 4, !dbg !3107
  %361 = icmp sgt i32 %360, 0, !dbg !3107
  br i1 %361, label %316, label %362, !dbg !3107

; <label>:362                                     ; preds = %356
  br label %373, !dbg !3108

; <label>:363                                     ; preds = %300
  %364 = load i32* %outpos, align 4, !dbg !3109
  %365 = sext i32 %364 to i64, !dbg !3109
  %366 = getelementptr inbounds i8* getelementptr inbounds ([0 x i8]* @outbuf, i32 0, i32 0), i64 %365, !dbg !3109
  %367 = load i8** %stackp, align 8, !dbg !3109
  %368 = load i32* %i1, align 4, !dbg !3109
  %369 = sext i32 %368 to i64, !dbg !3109
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %366, i8* %367, i64 %369, i32 1, i1 false), !dbg !3109
  %370 = load i32* %i1, align 4, !dbg !3111
  %371 = load i32* %outpos, align 4, !dbg !3111
  %372 = add nsw i32 %371, %370, !dbg !3111
  store i32 %372, i32* %outpos, align 4, !dbg !3111
  br label %373

; <label>:373                                     ; preds = %363, %362
  %374 = load i64* %free_ent, align 8, !dbg !3112
  store i64 %374, i64* %code, align 8, !dbg !3112
  %375 = load i64* %maxmaxcode, align 8, !dbg !3112
  %376 = icmp slt i64 %374, %375, !dbg !3112
  br i1 %376, label %377, label %388, !dbg !3112

; <label>:377                                     ; preds = %373
  %378 = load i64* %oldcode, align 8, !dbg !3113
  %379 = trunc i64 %378 to i16, !dbg !3113
  %380 = load i64* %code, align 8, !dbg !3113
  %381 = getelementptr inbounds [0 x i16]* @prev, i32 0, i64 %380, !dbg !3113
  store i16 %379, i16* %381, align 1, !dbg !3113
  %382 = load i32* %finchar, align 4, !dbg !3115
  %383 = trunc i32 %382 to i8, !dbg !3115
  %384 = load i64* %code, align 8, !dbg !3115
  %385 = getelementptr inbounds [0 x i8]* @window, i32 0, i64 %384, !dbg !3115
  store i8 %383, i8* %385, align 1, !dbg !3115
  %386 = load i64* %code, align 8, !dbg !3116
  %387 = add nsw i64 %386, 1, !dbg !3116
  store i64 %387, i64* %free_ent, align 8, !dbg !3116
  br label %388, !dbg !3117

; <label>:388                                     ; preds = %377, %373
  %389 = load i64* %incode, align 8, !dbg !3118
  store i64 %389, i64* %oldcode, align 8, !dbg !3118
  br label %141, !dbg !3119

; <label>:390                                     ; preds = %141
  br label %391, !dbg !3120

; <label>:391                                     ; preds = %390
  %392 = load i32* %rsize, align 4, !dbg !3120
  %393 = icmp ne i32 %392, 0, !dbg !3120
  br i1 %393, label %74, label %394, !dbg !3120

; <label>:394                                     ; preds = %391
  %395 = load i32* @test, align 4, !dbg !3121
  %396 = icmp ne i32 %395, 0, !dbg !3121
  br i1 %396, label %407, label %397, !dbg !3121

; <label>:397                                     ; preds = %394
  %398 = load i32* %outpos, align 4, !dbg !3121
  %399 = icmp sgt i32 %398, 0, !dbg !3121
  br i1 %399, label %400, label %407, !dbg !3121

; <label>:400                                     ; preds = %397
  %401 = load i32* %3, align 4, !dbg !3122
  %402 = load i32* %outpos, align 4, !dbg !3122
  call void @write_buf(i32 %401, i8* getelementptr inbounds ([0 x i8]* @outbuf, i32 0, i32 0), i32 %402), !dbg !3122
  %403 = load i32* %outpos, align 4, !dbg !3124
  %404 = sext i32 %403 to i64, !dbg !3124
  %405 = load i64* @bytes_out, align 8, !dbg !3124
  %406 = add i64 %405, %404, !dbg !3124
  store i64 %406, i64* @bytes_out, align 8, !dbg !3124
  br label %407, !dbg !3125

; <label>:407                                     ; preds = %400, %397, %394
  store i32 0, i32* %1, !dbg !3126
  br label %408, !dbg !3126

; <label>:408                                     ; preds = %407, %45
  %409 = load i32* %1, !dbg !3127
  ret i32 %409, !dbg !3127
}

declare i64 @read(i32, i8*, i64)

define i32 @unpack(i32 %in, i32 %out) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %len = alloca i32, align 4
  %eob = alloca i32, align 4
  %peek = alloca i32, align 4
  %peek_mask = alloca i32, align 4
  %mask = alloca i64, align 8
  store i32 %in, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !3128), !dbg !3129
  store i32 %out, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !3130), !dbg !3131
  call void @llvm.dbg.declare(metadata !22, metadata !3132), !dbg !3134
  call void @llvm.dbg.declare(metadata !22, metadata !3135), !dbg !3136
  call void @llvm.dbg.declare(metadata !22, metadata !3137), !dbg !3138
  call void @llvm.dbg.declare(metadata !22, metadata !3139), !dbg !3140
  %3 = load i32* %1, align 4, !dbg !3141
  store i32 %3, i32* @ifd, align 4, !dbg !3141
  %4 = load i32* %2, align 4, !dbg !3142
  store i32 %4, i32* @ofd, align 4, !dbg !3142
  call void @read_tree(), !dbg !3143
  call void @build_tree30(), !dbg !3144
  store i32 0, i32* @valid, align 4, !dbg !3145
  store i64 0, i64* @bitbuf26, align 8, !dbg !3145
  %5 = load i32* @peek_bits, align 4, !dbg !3146
  %6 = shl i32 1, %5, !dbg !3146
  %7 = sub nsw i32 %6, 1, !dbg !3146
  store i32 %7, i32* %peek_mask, align 4, !dbg !3146
  %8 = load i32* @max_len, align 4, !dbg !3147
  %9 = sext i32 %8 to i64, !dbg !3147
  %10 = getelementptr inbounds [26 x i32]* @leaves, i32 0, i64 %9, !dbg !3147
  %11 = load i32* %10, align 4, !dbg !3147
  %12 = sub nsw i32 %11, 1, !dbg !3147
  store i32 %12, i32* %eob, align 4, !dbg !3147
  br label %13, !dbg !3148

; <label>:13                                      ; preds = %142, %0
  br label %14, !dbg !3150

; <label>:14                                      ; preds = %33, %13
  %15 = load i32* @valid, align 4, !dbg !3150
  %16 = load i32* @peek_bits, align 4, !dbg !3150
  %17 = icmp slt i32 %15, %16, !dbg !3150
  br i1 %17, label %18, label %39, !dbg !3150

; <label>:18                                      ; preds = %14
  %19 = load i64* @bitbuf26, align 8, !dbg !3150
  %20 = shl i64 %19, 8, !dbg !3150
  %21 = load i32* @inptr, align 4, !dbg !3150
  %22 = load i32* @insize, align 4, !dbg !3150
  %23 = icmp ult i32 %21, %22, !dbg !3150
  br i1 %23, label %24, label %31, !dbg !3150

; <label>:24                                      ; preds = %18
  %25 = load i32* @inptr, align 4, !dbg !3150
  %26 = add i32 %25, 1, !dbg !3150
  store i32 %26, i32* @inptr, align 4, !dbg !3150
  %27 = zext i32 %25 to i64, !dbg !3150
  %28 = getelementptr inbounds [0 x i8]* @inbuf, i32 0, i64 %27, !dbg !3150
  %29 = load i8* %28, align 1, !dbg !3150
  %30 = zext i8 %29 to i32, !dbg !3150
  br label %33, !dbg !3150

; <label>:31                                      ; preds = %18
  %32 = call i32 @fill_inbuf(i32 0), !dbg !3150
  br label %33, !dbg !3150

; <label>:33                                      ; preds = %31, %24
  %34 = phi i32 [ %30, %24 ], [ %32, %31 ], !dbg !3150
  %35 = sext i32 %34 to i64, !dbg !3150
  %36 = or i64 %20, %35, !dbg !3150
  store i64 %36, i64* @bitbuf26, align 8, !dbg !3150
  %37 = load i32* @valid, align 4, !dbg !3150
  %38 = add nsw i32 %37, 8, !dbg !3150
  store i32 %38, i32* @valid, align 4, !dbg !3150
  br label %14, !dbg !3150

; <label>:39                                      ; preds = %14
  %40 = load i64* @bitbuf26, align 8, !dbg !3150
  %41 = load i32* @valid, align 4, !dbg !3150
  %42 = load i32* @peek_bits, align 4, !dbg !3150
  %43 = sub nsw i32 %41, %42, !dbg !3150
  %44 = zext i32 %43 to i64, !dbg !3150
  %45 = lshr i64 %40, %44, !dbg !3150
  %46 = load i32* %peek_mask, align 4, !dbg !3150
  %47 = zext i32 %46 to i64, !dbg !3150
  %48 = and i64 %45, %47, !dbg !3150
  %49 = trunc i64 %48 to i32, !dbg !3150
  store i32 %49, i32* %peek, align 4, !dbg !3150
  %50 = load i32* %peek, align 4, !dbg !3153
  %51 = zext i32 %50 to i64, !dbg !3153
  %52 = getelementptr inbounds [0 x i8]* @outbuf, i32 0, i64 %51, !dbg !3153
  %53 = load i8* %52, align 1, !dbg !3153
  %54 = zext i8 %53 to i32, !dbg !3153
  store i32 %54, i32* %len, align 4, !dbg !3153
  %55 = load i32* %len, align 4, !dbg !3154
  %56 = icmp sgt i32 %55, 0, !dbg !3154
  br i1 %56, label %57, label %63, !dbg !3154

; <label>:57                                      ; preds = %39
  %58 = load i32* @peek_bits, align 4, !dbg !3155
  %59 = load i32* %len, align 4, !dbg !3155
  %60 = sub nsw i32 %58, %59, !dbg !3155
  %61 = load i32* %peek, align 4, !dbg !3155
  %62 = lshr i32 %61, %60, !dbg !3155
  store i32 %62, i32* %peek, align 4, !dbg !3155
  br label %116, !dbg !3157

; <label>:63                                      ; preds = %39
  call void @llvm.dbg.declare(metadata !22, metadata !3158), !dbg !3160
  %64 = load i32* %peek_mask, align 4, !dbg !3161
  %65 = zext i32 %64 to i64, !dbg !3161
  store i64 %65, i64* %mask, align 8, !dbg !3161
  %66 = load i32* @peek_bits, align 4, !dbg !3162
  store i32 %66, i32* %len, align 4, !dbg !3162
  br label %67, !dbg !3163

; <label>:67                                      ; preds = %108, %63
  %68 = load i32* %len, align 4, !dbg !3164
  %69 = add nsw i32 %68, 1, !dbg !3164
  store i32 %69, i32* %len, align 4, !dbg !3164
  %70 = load i64* %mask, align 8, !dbg !3164
  %71 = shl i64 %70, 1, !dbg !3164
  %72 = add i64 %71, 1, !dbg !3164
  store i64 %72, i64* %mask, align 8, !dbg !3164
  br label %73, !dbg !3166

; <label>:73                                      ; preds = %92, %67
  %74 = load i32* @valid, align 4, !dbg !3166
  %75 = load i32* %len, align 4, !dbg !3166
  %76 = icmp slt i32 %74, %75, !dbg !3166
  br i1 %76, label %77, label %98, !dbg !3166

; <label>:77                                      ; preds = %73
  %78 = load i64* @bitbuf26, align 8, !dbg !3166
  %79 = shl i64 %78, 8, !dbg !3166
  %80 = load i32* @inptr, align 4, !dbg !3166
  %81 = load i32* @insize, align 4, !dbg !3166
  %82 = icmp ult i32 %80, %81, !dbg !3166
  br i1 %82, label %83, label %90, !dbg !3166

; <label>:83                                      ; preds = %77
  %84 = load i32* @inptr, align 4, !dbg !3166
  %85 = add i32 %84, 1, !dbg !3166
  store i32 %85, i32* @inptr, align 4, !dbg !3166
  %86 = zext i32 %84 to i64, !dbg !3166
  %87 = getelementptr inbounds [0 x i8]* @inbuf, i32 0, i64 %86, !dbg !3166
  %88 = load i8* %87, align 1, !dbg !3166
  %89 = zext i8 %88 to i32, !dbg !3166
  br label %92, !dbg !3166

; <label>:90                                      ; preds = %77
  %91 = call i32 @fill_inbuf(i32 0), !dbg !3166
  br label %92, !dbg !3166

; <label>:92                                      ; preds = %90, %83
  %93 = phi i32 [ %89, %83 ], [ %91, %90 ], !dbg !3166
  %94 = sext i32 %93 to i64, !dbg !3166
  %95 = or i64 %79, %94, !dbg !3166
  store i64 %95, i64* @bitbuf26, align 8, !dbg !3166
  %96 = load i32* @valid, align 4, !dbg !3166
  %97 = add nsw i32 %96, 8, !dbg !3166
  store i32 %97, i32* @valid, align 4, !dbg !3166
  br label %73, !dbg !3166

; <label>:98                                      ; preds = %73
  %99 = load i64* @bitbuf26, align 8, !dbg !3166
  %100 = load i32* @valid, align 4, !dbg !3166
  %101 = load i32* %len, align 4, !dbg !3166
  %102 = sub nsw i32 %100, %101, !dbg !3166
  %103 = zext i32 %102 to i64, !dbg !3166
  %104 = lshr i64 %99, %103, !dbg !3166
  %105 = load i64* %mask, align 8, !dbg !3166
  %106 = and i64 %104, %105, !dbg !3166
  %107 = trunc i64 %106 to i32, !dbg !3166
  store i32 %107, i32* %peek, align 4, !dbg !3166
  br label %108, !dbg !3168

; <label>:108                                     ; preds = %98
  %109 = load i32* %peek, align 4, !dbg !3168
  %110 = load i32* %len, align 4, !dbg !3168
  %111 = sext i32 %110 to i64, !dbg !3168
  %112 = getelementptr inbounds [26 x i32]* @parents, i32 0, i64 %111, !dbg !3168
  %113 = load i32* %112, align 4, !dbg !3168
  %114 = icmp ult i32 %109, %113, !dbg !3168
  br i1 %114, label %67, label %115, !dbg !3168

; <label>:115                                     ; preds = %108
  br label %116

; <label>:116                                     ; preds = %115, %57
  %117 = load i32* %peek, align 4, !dbg !3169
  %118 = load i32* %eob, align 4, !dbg !3169
  %119 = icmp eq i32 %117, %118, !dbg !3169
  br i1 %119, label %120, label %125, !dbg !3169

; <label>:120                                     ; preds = %116
  %121 = load i32* %len, align 4, !dbg !3169
  %122 = load i32* @max_len, align 4, !dbg !3169
  %123 = icmp eq i32 %121, %122, !dbg !3169
  br i1 %123, label %124, label %125, !dbg !3169

; <label>:124                                     ; preds = %120
  br label %146, !dbg !3170

; <label>:125                                     ; preds = %120, %116
  %126 = load i32* %peek, align 4, !dbg !3171
  %127 = load i32* %len, align 4, !dbg !3171
  %128 = sext i32 %127 to i64, !dbg !3171
  %129 = getelementptr inbounds [26 x i32]* @lit_base, i32 0, i64 %128, !dbg !3171
  %130 = load i32* %129, align 4, !dbg !3171
  %131 = add i32 %126, %130, !dbg !3171
  %132 = zext i32 %131 to i64, !dbg !3171
  %133 = getelementptr inbounds [256 x i8]* @literal, i32 0, i64 %132, !dbg !3171
  %134 = load i8* %133, align 1, !dbg !3171
  %135 = load i32* @outcnt, align 4, !dbg !3171
  %136 = add i32 %135, 1, !dbg !3171
  store i32 %136, i32* @outcnt, align 4, !dbg !3171
  %137 = zext i32 %135 to i64, !dbg !3171
  %138 = getelementptr inbounds [0 x i8]* @window, i32 0, i64 %137, !dbg !3171
  store i8 %134, i8* %138, align 1, !dbg !3171
  %139 = load i32* @outcnt, align 4, !dbg !3171
  %140 = icmp eq i32 %139, 32768, !dbg !3171
  br i1 %140, label %141, label %142, !dbg !3171

; <label>:141                                     ; preds = %125
  call void @flush_window(), !dbg !3171
  br label %142, !dbg !3171

; <label>:142                                     ; preds = %141, %125
  %143 = load i32* %len, align 4, !dbg !3173
  %144 = load i32* @valid, align 4, !dbg !3173
  %145 = sub nsw i32 %144, %143, !dbg !3173
  store i32 %145, i32* @valid, align 4, !dbg !3173
  br label %13, !dbg !3174

; <label>:146                                     ; preds = %124
  call void @flush_window(), !dbg !3175
  %147 = load i64* @orig_len, align 8, !dbg !3176
  %148 = load i64* @bytes_out, align 8, !dbg !3176
  %149 = icmp ne i64 %147, %148, !dbg !3176
  br i1 %149, label %150, label %151, !dbg !3176

; <label>:150                                     ; preds = %146
  call void @error(i8* getelementptr inbounds ([38 x i8]* @.str27, i32 0, i32 0)), !dbg !3177
  br label %151, !dbg !3179

; <label>:151                                     ; preds = %150, %146
  ret i32 0, !dbg !3180
}

define internal void @read_tree() nounwind uwtable {
  %len = alloca i32, align 4
  %base = alloca i32, align 4
  %n = alloca i32, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !3181), !dbg !3183
  call void @llvm.dbg.declare(metadata !22, metadata !3184), !dbg !3185
  call void @llvm.dbg.declare(metadata !22, metadata !3186), !dbg !3187
  store i64 0, i64* @orig_len, align 8, !dbg !3188
  store i32 1, i32* %n, align 4, !dbg !3189
  br label %1, !dbg !3189

; <label>:1                                       ; preds = %23, %0
  %2 = load i32* %n, align 4, !dbg !3189
  %3 = icmp sle i32 %2, 4, !dbg !3189
  br i1 %3, label %4, label %26, !dbg !3189

; <label>:4                                       ; preds = %1
  %5 = load i64* @orig_len, align 8, !dbg !3191
  %6 = shl i64 %5, 8, !dbg !3191
  %7 = load i32* @inptr, align 4, !dbg !3191
  %8 = load i32* @insize, align 4, !dbg !3191
  %9 = icmp ult i32 %7, %8, !dbg !3191
  br i1 %9, label %10, label %17, !dbg !3191

; <label>:10                                      ; preds = %4
  %11 = load i32* @inptr, align 4, !dbg !3191
  %12 = add i32 %11, 1, !dbg !3191
  store i32 %12, i32* @inptr, align 4, !dbg !3191
  %13 = zext i32 %11 to i64, !dbg !3191
  %14 = getelementptr inbounds [0 x i8]* @inbuf, i32 0, i64 %13, !dbg !3191
  %15 = load i8* %14, align 1, !dbg !3191
  %16 = zext i8 %15 to i32, !dbg !3191
  br label %19, !dbg !3191

; <label>:17                                      ; preds = %4
  %18 = call i32 @fill_inbuf(i32 0), !dbg !3192
  br label %19, !dbg !3192

; <label>:19                                      ; preds = %17, %10
  %20 = phi i32 [ %16, %10 ], [ %18, %17 ], !dbg !3192
  %21 = sext i32 %20 to i64, !dbg !3192
  %22 = or i64 %6, %21, !dbg !3192
  store i64 %22, i64* @orig_len, align 8, !dbg !3192
  br label %23, !dbg !3192

; <label>:23                                      ; preds = %19
  %24 = load i32* %n, align 4, !dbg !3193
  %25 = add nsw i32 %24, 1, !dbg !3193
  store i32 %25, i32* %n, align 4, !dbg !3193
  br label %1, !dbg !3193

; <label>:26                                      ; preds = %1
  %27 = load i32* @inptr, align 4, !dbg !3194
  %28 = load i32* @insize, align 4, !dbg !3194
  %29 = icmp ult i32 %27, %28, !dbg !3194
  br i1 %29, label %30, label %37, !dbg !3194

; <label>:30                                      ; preds = %26
  %31 = load i32* @inptr, align 4, !dbg !3194
  %32 = add i32 %31, 1, !dbg !3194
  store i32 %32, i32* @inptr, align 4, !dbg !3194
  %33 = zext i32 %31 to i64, !dbg !3194
  %34 = getelementptr inbounds [0 x i8]* @inbuf, i32 0, i64 %33, !dbg !3194
  %35 = load i8* %34, align 1, !dbg !3194
  %36 = zext i8 %35 to i32, !dbg !3194
  br label %39, !dbg !3194

; <label>:37                                      ; preds = %26
  %38 = call i32 @fill_inbuf(i32 0), !dbg !3195
  br label %39, !dbg !3195

; <label>:39                                      ; preds = %37, %30
  %40 = phi i32 [ %36, %30 ], [ %38, %37 ], !dbg !3195
  store i32 %40, i32* @max_len, align 4, !dbg !3195
  %41 = load i32* @max_len, align 4, !dbg !3196
  %42 = icmp sgt i32 %41, 25, !dbg !3196
  br i1 %42, label %43, label %44, !dbg !3196

; <label>:43                                      ; preds = %39
  call void @error(i8* getelementptr inbounds ([50 x i8]* @.str128, i32 0, i32 0)), !dbg !3197
  br label %44, !dbg !3199

; <label>:44                                      ; preds = %43, %39
  store i32 0, i32* %n, align 4, !dbg !3200
  store i32 1, i32* %len, align 4, !dbg !3201
  br label %45, !dbg !3201

; <label>:45                                      ; preds = %73, %44
  %46 = load i32* %len, align 4, !dbg !3201
  %47 = load i32* @max_len, align 4, !dbg !3201
  %48 = icmp sle i32 %46, %47, !dbg !3201
  br i1 %48, label %49, label %76, !dbg !3201

; <label>:49                                      ; preds = %45
  %50 = load i32* @inptr, align 4, !dbg !3203
  %51 = load i32* @insize, align 4, !dbg !3203
  %52 = icmp ult i32 %50, %51, !dbg !3203
  br i1 %52, label %53, label %60, !dbg !3203

; <label>:53                                      ; preds = %49
  %54 = load i32* @inptr, align 4, !dbg !3203
  %55 = add i32 %54, 1, !dbg !3203
  store i32 %55, i32* @inptr, align 4, !dbg !3203
  %56 = zext i32 %54 to i64, !dbg !3203
  %57 = getelementptr inbounds [0 x i8]* @inbuf, i32 0, i64 %56, !dbg !3203
  %58 = load i8* %57, align 1, !dbg !3203
  %59 = zext i8 %58 to i32, !dbg !3203
  br label %62, !dbg !3203

; <label>:60                                      ; preds = %49
  %61 = call i32 @fill_inbuf(i32 0), !dbg !3205
  br label %62, !dbg !3205

; <label>:62                                      ; preds = %60, %53
  %63 = phi i32 [ %59, %53 ], [ %61, %60 ], !dbg !3205
  %64 = load i32* %len, align 4, !dbg !3205
  %65 = sext i32 %64 to i64, !dbg !3205
  %66 = getelementptr inbounds [26 x i32]* @leaves, i32 0, i64 %65, !dbg !3205
  store i32 %63, i32* %66, align 4, !dbg !3205
  %67 = load i32* %len, align 4, !dbg !3206
  %68 = sext i32 %67 to i64, !dbg !3206
  %69 = getelementptr inbounds [26 x i32]* @leaves, i32 0, i64 %68, !dbg !3206
  %70 = load i32* %69, align 4, !dbg !3206
  %71 = load i32* %n, align 4, !dbg !3206
  %72 = add nsw i32 %71, %70, !dbg !3206
  store i32 %72, i32* %n, align 4, !dbg !3206
  br label %73, !dbg !3207

; <label>:73                                      ; preds = %62
  %74 = load i32* %len, align 4, !dbg !3208
  %75 = add nsw i32 %74, 1, !dbg !3208
  store i32 %75, i32* %len, align 4, !dbg !3208
  br label %45, !dbg !3208

; <label>:76                                      ; preds = %45
  %77 = load i32* %n, align 4, !dbg !3209
  %78 = icmp sgt i32 %77, 256, !dbg !3209
  br i1 %78, label %79, label %80, !dbg !3209

; <label>:79                                      ; preds = %76
  call void @error(i8* getelementptr inbounds ([32 x i8]* @.str229, i32 0, i32 0)), !dbg !3210
  br label %80, !dbg !3212

; <label>:80                                      ; preds = %79, %76
  %81 = load i32* @max_len, align 4, !dbg !3213
  %82 = sext i32 %81 to i64, !dbg !3213
  %83 = getelementptr inbounds [26 x i32]* @leaves, i32 0, i64 %82, !dbg !3213
  %84 = load i32* %83, align 4, !dbg !3213
  %85 = add nsw i32 %84, 1, !dbg !3213
  store i32 %85, i32* %83, align 4, !dbg !3213
  store i32 0, i32* %base, align 4, !dbg !3214
  store i32 1, i32* %len, align 4, !dbg !3215
  br label %86, !dbg !3215

; <label>:86                                      ; preds = %126, %80
  %87 = load i32* %len, align 4, !dbg !3215
  %88 = load i32* @max_len, align 4, !dbg !3215
  %89 = icmp sle i32 %87, %88, !dbg !3215
  br i1 %89, label %90, label %129, !dbg !3215

; <label>:90                                      ; preds = %86
  %91 = load i32* %base, align 4, !dbg !3217
  %92 = load i32* %len, align 4, !dbg !3217
  %93 = sext i32 %92 to i64, !dbg !3217
  %94 = getelementptr inbounds [26 x i32]* @lit_base, i32 0, i64 %93, !dbg !3217
  store i32 %91, i32* %94, align 4, !dbg !3217
  %95 = load i32* %len, align 4, !dbg !3219
  %96 = sext i32 %95 to i64, !dbg !3219
  %97 = getelementptr inbounds [26 x i32]* @leaves, i32 0, i64 %96, !dbg !3219
  %98 = load i32* %97, align 4, !dbg !3219
  store i32 %98, i32* %n, align 4, !dbg !3219
  br label %99, !dbg !3219

; <label>:99                                      ; preds = %122, %90
  %100 = load i32* %n, align 4, !dbg !3219
  %101 = icmp sgt i32 %100, 0, !dbg !3219
  br i1 %101, label %102, label %125, !dbg !3219

; <label>:102                                     ; preds = %99
  %103 = load i32* @inptr, align 4, !dbg !3221
  %104 = load i32* @insize, align 4, !dbg !3221
  %105 = icmp ult i32 %103, %104, !dbg !3221
  br i1 %105, label %106, label %113, !dbg !3221

; <label>:106                                     ; preds = %102
  %107 = load i32* @inptr, align 4, !dbg !3221
  %108 = add i32 %107, 1, !dbg !3221
  store i32 %108, i32* @inptr, align 4, !dbg !3221
  %109 = zext i32 %107 to i64, !dbg !3221
  %110 = getelementptr inbounds [0 x i8]* @inbuf, i32 0, i64 %109, !dbg !3221
  %111 = load i8* %110, align 1, !dbg !3221
  %112 = zext i8 %111 to i32, !dbg !3221
  br label %115, !dbg !3221

; <label>:113                                     ; preds = %102
  %114 = call i32 @fill_inbuf(i32 0), !dbg !3223
  br label %115, !dbg !3223

; <label>:115                                     ; preds = %113, %106
  %116 = phi i32 [ %112, %106 ], [ %114, %113 ], !dbg !3223
  %117 = trunc i32 %116 to i8, !dbg !3223
  %118 = load i32* %base, align 4, !dbg !3223
  %119 = add nsw i32 %118, 1, !dbg !3223
  store i32 %119, i32* %base, align 4, !dbg !3223
  %120 = sext i32 %118 to i64, !dbg !3223
  %121 = getelementptr inbounds [256 x i8]* @literal, i32 0, i64 %120, !dbg !3223
  store i8 %117, i8* %121, align 1, !dbg !3223
  br label %122, !dbg !3224

; <label>:122                                     ; preds = %115
  %123 = load i32* %n, align 4, !dbg !3225
  %124 = add nsw i32 %123, -1, !dbg !3225
  store i32 %124, i32* %n, align 4, !dbg !3225
  br label %99, !dbg !3225

; <label>:125                                     ; preds = %99
  br label %126, !dbg !3226

; <label>:126                                     ; preds = %125
  %127 = load i32* %len, align 4, !dbg !3227
  %128 = add nsw i32 %127, 1, !dbg !3227
  store i32 %128, i32* %len, align 4, !dbg !3227
  br label %86, !dbg !3227

; <label>:129                                     ; preds = %86
  %130 = load i32* @max_len, align 4, !dbg !3228
  %131 = sext i32 %130 to i64, !dbg !3228
  %132 = getelementptr inbounds [26 x i32]* @leaves, i32 0, i64 %131, !dbg !3228
  %133 = load i32* %132, align 4, !dbg !3228
  %134 = add nsw i32 %133, 1, !dbg !3228
  store i32 %134, i32* %132, align 4, !dbg !3228
  ret void, !dbg !3229
}

define internal void @build_tree30() nounwind uwtable {
  %nodes = alloca i32, align 4
  %len = alloca i32, align 4
  %prefixp = alloca i8*, align 8
  %prefixes = alloca i32, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !3230), !dbg !3232
  store i32 0, i32* %nodes, align 4, !dbg !3233
  call void @llvm.dbg.declare(metadata !22, metadata !3234), !dbg !3235
  call void @llvm.dbg.declare(metadata !22, metadata !3236), !dbg !3238
  %1 = load i32* @max_len, align 4, !dbg !3239
  store i32 %1, i32* %len, align 4, !dbg !3239
  br label %2, !dbg !3239

; <label>:2                                       ; preds = %24, %0
  %3 = load i32* %len, align 4, !dbg !3239
  %4 = icmp sge i32 %3, 1, !dbg !3239
  br i1 %4, label %5, label %27, !dbg !3239

; <label>:5                                       ; preds = %2
  %6 = load i32* %nodes, align 4, !dbg !3241
  %7 = ashr i32 %6, 1, !dbg !3241
  store i32 %7, i32* %nodes, align 4, !dbg !3241
  %8 = load i32* %nodes, align 4, !dbg !3243
  %9 = load i32* %len, align 4, !dbg !3243
  %10 = sext i32 %9 to i64, !dbg !3243
  %11 = getelementptr inbounds [26 x i32]* @parents, i32 0, i64 %10, !dbg !3243
  store i32 %8, i32* %11, align 4, !dbg !3243
  %12 = load i32* %nodes, align 4, !dbg !3244
  %13 = load i32* %len, align 4, !dbg !3244
  %14 = sext i32 %13 to i64, !dbg !3244
  %15 = getelementptr inbounds [26 x i32]* @lit_base, i32 0, i64 %14, !dbg !3244
  %16 = load i32* %15, align 4, !dbg !3244
  %17 = sub nsw i32 %16, %12, !dbg !3244
  store i32 %17, i32* %15, align 4, !dbg !3244
  %18 = load i32* %len, align 4, !dbg !3245
  %19 = sext i32 %18 to i64, !dbg !3245
  %20 = getelementptr inbounds [26 x i32]* @leaves, i32 0, i64 %19, !dbg !3245
  %21 = load i32* %20, align 4, !dbg !3245
  %22 = load i32* %nodes, align 4, !dbg !3245
  %23 = add nsw i32 %22, %21, !dbg !3245
  store i32 %23, i32* %nodes, align 4, !dbg !3245
  br label %24, !dbg !3246

; <label>:24                                      ; preds = %5
  %25 = load i32* %len, align 4, !dbg !3247
  %26 = add nsw i32 %25, -1, !dbg !3247
  store i32 %26, i32* %len, align 4, !dbg !3247
  br label %2, !dbg !3247

; <label>:27                                      ; preds = %2
  %28 = load i32* @max_len, align 4, !dbg !3248
  %29 = icmp sle i32 %28, 12, !dbg !3248
  br i1 %29, label %30, label %32, !dbg !3248

; <label>:30                                      ; preds = %27
  %31 = load i32* @max_len, align 4, !dbg !3248
  br label %33, !dbg !3248

; <label>:32                                      ; preds = %27
  br label %33, !dbg !3248

; <label>:33                                      ; preds = %32, %30
  %34 = phi i32 [ %31, %30 ], [ 12, %32 ], !dbg !3248
  store i32 %34, i32* @peek_bits, align 4, !dbg !3248
  %35 = load i32* @peek_bits, align 4, !dbg !3249
  %36 = shl i32 1, %35, !dbg !3249
  %37 = sext i32 %36 to i64, !dbg !3249
  %38 = getelementptr inbounds [0 x i8]* @outbuf, i32 0, i64 %37, !dbg !3249
  store i8* %38, i8** %prefixp, align 8, !dbg !3249
  store i32 1, i32* %len, align 4, !dbg !3250
  br label %39, !dbg !3250

; <label>:39                                      ; preds = %62, %33
  %40 = load i32* %len, align 4, !dbg !3250
  %41 = load i32* @peek_bits, align 4, !dbg !3250
  %42 = icmp sle i32 %40, %41, !dbg !3250
  br i1 %42, label %43, label %65, !dbg !3250

; <label>:43                                      ; preds = %39
  call void @llvm.dbg.declare(metadata !22, metadata !3252), !dbg !3254
  %44 = load i32* %len, align 4, !dbg !3255
  %45 = sext i32 %44 to i64, !dbg !3255
  %46 = getelementptr inbounds [26 x i32]* @leaves, i32 0, i64 %45, !dbg !3255
  %47 = load i32* %46, align 4, !dbg !3255
  %48 = load i32* @peek_bits, align 4, !dbg !3255
  %49 = load i32* %len, align 4, !dbg !3255
  %50 = sub nsw i32 %48, %49, !dbg !3255
  %51 = shl i32 %47, %50, !dbg !3255
  store i32 %51, i32* %prefixes, align 4, !dbg !3255
  br label %52, !dbg !3256

; <label>:52                                      ; preds = %56, %43
  %53 = load i32* %prefixes, align 4, !dbg !3256
  %54 = add nsw i32 %53, -1, !dbg !3256
  store i32 %54, i32* %prefixes, align 4, !dbg !3256
  %55 = icmp ne i32 %53, 0, !dbg !3256
  br i1 %55, label %56, label %61, !dbg !3256

; <label>:56                                      ; preds = %52
  %57 = load i32* %len, align 4, !dbg !3257
  %58 = trunc i32 %57 to i8, !dbg !3257
  %59 = load i8** %prefixp, align 8, !dbg !3257
  %60 = getelementptr inbounds i8* %59, i32 -1, !dbg !3257
  store i8* %60, i8** %prefixp, align 8, !dbg !3257
  store i8 %58, i8* %60, align 1, !dbg !3257
  br label %52, !dbg !3257

; <label>:61                                      ; preds = %52
  br label %62, !dbg !3258

; <label>:62                                      ; preds = %61
  %63 = load i32* %len, align 4, !dbg !3259
  %64 = add nsw i32 %63, 1, !dbg !3259
  store i32 %64, i32* %len, align 4, !dbg !3259
  br label %39, !dbg !3259

; <label>:65                                      ; preds = %39
  br label %66, !dbg !3260

; <label>:66                                      ; preds = %69, %65
  %67 = load i8** %prefixp, align 8, !dbg !3260
  %68 = icmp ugt i8* %67, getelementptr inbounds ([0 x i8]* @outbuf, i32 0, i32 0), !dbg !3260
  br i1 %68, label %69, label %72, !dbg !3260

; <label>:69                                      ; preds = %66
  %70 = load i8** %prefixp, align 8, !dbg !3261
  %71 = getelementptr inbounds i8* %70, i32 -1, !dbg !3261
  store i8* %71, i8** %prefixp, align 8, !dbg !3261
  store i8 0, i8* %71, align 1, !dbg !3261
  br label %66, !dbg !3261

; <label>:72                                      ; preds = %66
  ret void, !dbg !3262
}

define i32 @check_zipfile(i32 %in) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %h = alloca i8*, align 8
  store i32 %in, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !3263), !dbg !3264
  call void @llvm.dbg.declare(metadata !22, metadata !3265), !dbg !3269
  %3 = load i32* @inptr, align 4, !dbg !3270
  %4 = zext i32 %3 to i64, !dbg !3270
  %5 = getelementptr inbounds i8* getelementptr inbounds ([0 x i8]* @inbuf, i32 0, i32 0), i64 %4, !dbg !3270
  store i8* %5, i8** %h, align 8, !dbg !3270
  %6 = load i32* %2, align 4, !dbg !3271
  store i32 %6, i32* @ifd, align 4, !dbg !3271
  %7 = load i8** %h, align 8, !dbg !3272
  %8 = getelementptr inbounds i8* %7, i64 26, !dbg !3272
  %9 = getelementptr inbounds i8* %8, i64 0, !dbg !3272
  %10 = load i8* %9, align 1, !dbg !3272
  %11 = zext i8 %10 to i16, !dbg !3272
  %12 = zext i16 %11 to i32, !dbg !3272
  %13 = load i8** %h, align 8, !dbg !3272
  %14 = getelementptr inbounds i8* %13, i64 26, !dbg !3272
  %15 = getelementptr inbounds i8* %14, i64 1, !dbg !3272
  %16 = load i8* %15, align 1, !dbg !3272
  %17 = zext i8 %16 to i16, !dbg !3272
  %18 = zext i16 %17 to i32, !dbg !3272
  %19 = shl i32 %18, 8, !dbg !3272
  %20 = or i32 %12, %19, !dbg !3272
  %21 = add nsw i32 30, %20, !dbg !3272
  %22 = load i8** %h, align 8, !dbg !3272
  %23 = getelementptr inbounds i8* %22, i64 28, !dbg !3272
  %24 = getelementptr inbounds i8* %23, i64 0, !dbg !3272
  %25 = load i8* %24, align 1, !dbg !3272
  %26 = zext i8 %25 to i16, !dbg !3272
  %27 = zext i16 %26 to i32, !dbg !3272
  %28 = load i8** %h, align 8, !dbg !3272
  %29 = getelementptr inbounds i8* %28, i64 28, !dbg !3272
  %30 = getelementptr inbounds i8* %29, i64 1, !dbg !3272
  %31 = load i8* %30, align 1, !dbg !3272
  %32 = zext i8 %31 to i16, !dbg !3272
  %33 = zext i16 %32 to i32, !dbg !3272
  %34 = shl i32 %33, 8, !dbg !3272
  %35 = or i32 %27, %34, !dbg !3272
  %36 = add nsw i32 %21, %35, !dbg !3272
  %37 = load i32* @inptr, align 4, !dbg !3272
  %38 = add i32 %37, %36, !dbg !3272
  store i32 %38, i32* @inptr, align 4, !dbg !3272
  %39 = load i32* @inptr, align 4, !dbg !3273
  %40 = load i32* @insize, align 4, !dbg !3273
  %41 = icmp ugt i32 %39, %40, !dbg !3273
  br i1 %41, label %74, label %42, !dbg !3273

; <label>:42                                      ; preds = %0
  %43 = load i8** %h, align 8, !dbg !3273
  %44 = getelementptr inbounds i8* %43, i64 0, !dbg !3273
  %45 = load i8* %44, align 1, !dbg !3273
  %46 = zext i8 %45 to i16, !dbg !3273
  %47 = zext i16 %46 to i32, !dbg !3273
  %48 = load i8** %h, align 8, !dbg !3273
  %49 = getelementptr inbounds i8* %48, i64 1, !dbg !3273
  %50 = load i8* %49, align 1, !dbg !3273
  %51 = zext i8 %50 to i16, !dbg !3273
  %52 = zext i16 %51 to i32, !dbg !3273
  %53 = shl i32 %52, 8, !dbg !3273
  %54 = or i32 %47, %53, !dbg !3273
  %55 = sext i32 %54 to i64, !dbg !3273
  %56 = load i8** %h, align 8, !dbg !3273
  %57 = getelementptr inbounds i8* %56, i64 2, !dbg !3273
  %58 = getelementptr inbounds i8* %57, i64 0, !dbg !3273
  %59 = load i8* %58, align 1, !dbg !3273
  %60 = zext i8 %59 to i16, !dbg !3273
  %61 = zext i16 %60 to i32, !dbg !3273
  %62 = load i8** %h, align 8, !dbg !3273
  %63 = getelementptr inbounds i8* %62, i64 2, !dbg !3273
  %64 = getelementptr inbounds i8* %63, i64 1, !dbg !3273
  %65 = load i8* %64, align 1, !dbg !3273
  %66 = zext i8 %65 to i16, !dbg !3273
  %67 = zext i16 %66 to i32, !dbg !3273
  %68 = shl i32 %67, 8, !dbg !3273
  %69 = or i32 %61, %68, !dbg !3273
  %70 = sext i32 %69 to i64, !dbg !3273
  %71 = shl i64 %70, 16, !dbg !3273
  %72 = or i64 %55, %71, !dbg !3273
  %73 = icmp ne i64 %72, 67324752, !dbg !3273
  br i1 %73, label %74, label %78, !dbg !3273

; <label>:74                                      ; preds = %42, %0
  %75 = load %struct.__sFILE** @__stderrp, align 8, !dbg !3274
  %76 = load i8** @progname, align 8, !dbg !3274
  %77 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %75, i8* getelementptr inbounds ([31 x i8]* @.str31, i32 0, i32 0), i8* %76, i8* getelementptr inbounds ([0 x i8]* @ifname, i32 0, i32 0)), !dbg !3274
  store i32 1, i32* @exit_code, align 4, !dbg !3276
  store i32 1, i32* %1, !dbg !3277
  br label %111, !dbg !3277

; <label>:78                                      ; preds = %42
  %79 = load i8** %h, align 8, !dbg !3278
  %80 = getelementptr inbounds i8* %79, i64 8, !dbg !3278
  %81 = load i8* %80, align 1, !dbg !3278
  %82 = zext i8 %81 to i32, !dbg !3278
  store i32 %82, i32* @method, align 4, !dbg !3278
  %83 = load i32* @method, align 4, !dbg !3279
  %84 = icmp ne i32 %83, 0, !dbg !3279
  br i1 %84, label %85, label %92, !dbg !3279

; <label>:85                                      ; preds = %78
  %86 = load i32* @method, align 4, !dbg !3279
  %87 = icmp ne i32 %86, 8, !dbg !3279
  br i1 %87, label %88, label %92, !dbg !3279

; <label>:88                                      ; preds = %85
  %89 = load %struct.__sFILE** @__stderrp, align 8, !dbg !3280
  %90 = load i8** @progname, align 8, !dbg !3280
  %91 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %89, i8* getelementptr inbounds ([58 x i8]* @.str132, i32 0, i32 0), i8* %90, i8* getelementptr inbounds ([0 x i8]* @ifname, i32 0, i32 0)), !dbg !3280
  store i32 1, i32* @exit_code, align 4, !dbg !3282
  store i32 1, i32* %1, !dbg !3283
  br label %111, !dbg !3283

; <label>:92                                      ; preds = %85, %78
  %93 = load i8** %h, align 8, !dbg !3284
  %94 = getelementptr inbounds i8* %93, i64 6, !dbg !3284
  %95 = load i8* %94, align 1, !dbg !3284
  %96 = zext i8 %95 to i32, !dbg !3284
  %97 = and i32 %96, 1, !dbg !3284
  store i32 %97, i32* @decrypt, align 4, !dbg !3284
  %98 = icmp ne i32 %97, 0, !dbg !3284
  br i1 %98, label %99, label %103, !dbg !3284

; <label>:99                                      ; preds = %92
  %100 = load %struct.__sFILE** @__stderrp, align 8, !dbg !3285
  %101 = load i8** @progname, align 8, !dbg !3285
  %102 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %100, i8* getelementptr inbounds ([38 x i8]* @.str233, i32 0, i32 0), i8* %101, i8* getelementptr inbounds ([0 x i8]* @ifname, i32 0, i32 0)), !dbg !3285
  store i32 1, i32* @exit_code, align 4, !dbg !3287
  store i32 1, i32* %1, !dbg !3288
  br label %111, !dbg !3288

; <label>:103                                     ; preds = %92
  %104 = load i8** %h, align 8, !dbg !3289
  %105 = getelementptr inbounds i8* %104, i64 6, !dbg !3289
  %106 = load i8* %105, align 1, !dbg !3289
  %107 = zext i8 %106 to i32, !dbg !3289
  %108 = and i32 %107, 8, !dbg !3289
  %109 = icmp ne i32 %108, 0, !dbg !3289
  %110 = zext i1 %109 to i32, !dbg !3289
  store i32 %110, i32* @ext_header, align 4, !dbg !3289
  store i32 1, i32* @pkzip, align 4, !dbg !3290
  store i32 0, i32* %1, !dbg !3291
  br label %111, !dbg !3291

; <label>:111                                     ; preds = %103, %99, %88, %74
  %112 = load i32* %1, !dbg !3292
  ret i32 %112, !dbg !3292
}

define i32 @unzip(i32 %in, i32 %out) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %orig_crc = alloca i64, align 8
  %orig_len = alloca i64, align 8
  %n = alloca i32, align 4
  %buf = alloca [16 x i8], align 16
  %res = alloca i32, align 4
  %n1 = alloca i64, align 8
  %c = alloca i8, align 1
  store i32 %in, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !3293), !dbg !3294
  store i32 %out, i32* %3, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !3295), !dbg !3296
  call void @llvm.dbg.declare(metadata !22, metadata !3297), !dbg !3300
  store i64 0, i64* %orig_crc, align 8, !dbg !3301
  call void @llvm.dbg.declare(metadata !22, metadata !3302), !dbg !3303
  store i64 0, i64* %orig_len, align 8, !dbg !3304
  call void @llvm.dbg.declare(metadata !22, metadata !3305), !dbg !3306
  call void @llvm.dbg.declare(metadata !22, metadata !3307), !dbg !3309
  %4 = load i32* %2, align 4, !dbg !3310
  store i32 %4, i32* @ifd, align 4, !dbg !3310
  %5 = load i32* %3, align 4, !dbg !3311
  store i32 %5, i32* @ofd, align 4, !dbg !3311
  %6 = call i64 @updcrc(i8* null, i32 0), !dbg !3312
  %7 = load i32* @pkzip, align 4, !dbg !3313
  %8 = icmp ne i32 %7, 0, !dbg !3313
  br i1 %8, label %9, label %53, !dbg !3313

; <label>:9                                       ; preds = %0
  %10 = load i32* @ext_header, align 4, !dbg !3313
  %11 = icmp ne i32 %10, 0, !dbg !3313
  br i1 %11, label %53, label %12, !dbg !3313

; <label>:12                                      ; preds = %9
  %13 = load i8* getelementptr inbounds ([0 x i8]* @inbuf, i32 0, i64 14), align 1, !dbg !3314
  %14 = zext i8 %13 to i16, !dbg !3314
  %15 = zext i16 %14 to i32, !dbg !3314
  %16 = load i8* getelementptr inbounds ([0 x i8]* @inbuf, i32 0, i64 15), align 1, !dbg !3314
  %17 = zext i8 %16 to i16, !dbg !3314
  %18 = zext i16 %17 to i32, !dbg !3314
  %19 = shl i32 %18, 8, !dbg !3314
  %20 = or i32 %15, %19, !dbg !3314
  %21 = sext i32 %20 to i64, !dbg !3314
  %22 = load i8* getelementptr inbounds ([0 x i8]* @inbuf, i32 0, i64 16), align 1, !dbg !3314
  %23 = zext i8 %22 to i16, !dbg !3314
  %24 = zext i16 %23 to i32, !dbg !3314
  %25 = load i8* getelementptr inbounds ([0 x i8]* @inbuf, i32 0, i64 17), align 1, !dbg !3314
  %26 = zext i8 %25 to i16, !dbg !3314
  %27 = zext i16 %26 to i32, !dbg !3314
  %28 = shl i32 %27, 8, !dbg !3314
  %29 = or i32 %24, %28, !dbg !3314
  %30 = sext i32 %29 to i64, !dbg !3314
  %31 = shl i64 %30, 16, !dbg !3314
  %32 = or i64 %21, %31, !dbg !3314
  store i64 %32, i64* %orig_crc, align 8, !dbg !3314
  %33 = load i8* getelementptr inbounds ([0 x i8]* @inbuf, i32 0, i64 22), align 1, !dbg !3316
  %34 = zext i8 %33 to i16, !dbg !3316
  %35 = zext i16 %34 to i32, !dbg !3316
  %36 = load i8* getelementptr inbounds ([0 x i8]* @inbuf, i32 0, i64 23), align 1, !dbg !3316
  %37 = zext i8 %36 to i16, !dbg !3316
  %38 = zext i16 %37 to i32, !dbg !3316
  %39 = shl i32 %38, 8, !dbg !3316
  %40 = or i32 %35, %39, !dbg !3316
  %41 = sext i32 %40 to i64, !dbg !3316
  %42 = load i8* getelementptr inbounds ([0 x i8]* @inbuf, i32 0, i64 24), align 1, !dbg !3316
  %43 = zext i8 %42 to i16, !dbg !3316
  %44 = zext i16 %43 to i32, !dbg !3316
  %45 = load i8* getelementptr inbounds ([0 x i8]* @inbuf, i32 0, i64 25), align 1, !dbg !3316
  %46 = zext i8 %45 to i16, !dbg !3316
  %47 = zext i16 %46 to i32, !dbg !3316
  %48 = shl i32 %47, 8, !dbg !3316
  %49 = or i32 %44, %48, !dbg !3316
  %50 = sext i32 %49 to i64, !dbg !3316
  %51 = shl i64 %50, 16, !dbg !3316
  %52 = or i64 %41, %51, !dbg !3316
  store i64 %52, i64* %orig_len, align 8, !dbg !3316
  br label %53, !dbg !3317

; <label>:53                                      ; preds = %12, %9, %0
  %54 = load i32* @method, align 4, !dbg !3318
  %55 = icmp eq i32 %54, 8, !dbg !3318
  br i1 %55, label %56, label %67, !dbg !3318

; <label>:56                                      ; preds = %53
  call void @llvm.dbg.declare(metadata !22, metadata !3319), !dbg !3321
  %57 = call i32 @inflate(), !dbg !3322
  store i32 %57, i32* %res, align 4, !dbg !3322
  %58 = load i32* %res, align 4, !dbg !3323
  %59 = icmp eq i32 %58, 3, !dbg !3323
  br i1 %59, label %60, label %61, !dbg !3323

; <label>:60                                      ; preds = %56
  call void @error(i8* getelementptr inbounds ([14 x i8]* @.str334, i32 0, i32 0)), !dbg !3324
  br label %66, !dbg !3326

; <label>:61                                      ; preds = %56
  %62 = load i32* %res, align 4, !dbg !3327
  %63 = icmp ne i32 %62, 0, !dbg !3327
  br i1 %63, label %64, label %65, !dbg !3327

; <label>:64                                      ; preds = %61
  call void @error(i8* getelementptr inbounds ([41 x i8]* @.str435, i32 0, i32 0)), !dbg !3328
  br label %65, !dbg !3330

; <label>:65                                      ; preds = %64, %61
  br label %66

; <label>:66                                      ; preds = %65, %60
  br label %178, !dbg !3331

; <label>:67                                      ; preds = %53
  %68 = load i32* @pkzip, align 4, !dbg !3332
  %69 = icmp ne i32 %68, 0, !dbg !3332
  br i1 %69, label %70, label %176, !dbg !3332

; <label>:70                                      ; preds = %67
  %71 = load i32* @method, align 4, !dbg !3332
  %72 = icmp eq i32 %71, 0, !dbg !3332
  br i1 %72, label %73, label %176, !dbg !3332

; <label>:73                                      ; preds = %70
  call void @llvm.dbg.declare(metadata !22, metadata !3333), !dbg !3335
  %74 = load i8* getelementptr inbounds ([0 x i8]* @inbuf, i32 0, i64 22), align 1, !dbg !3336
  %75 = zext i8 %74 to i16, !dbg !3336
  %76 = zext i16 %75 to i32, !dbg !3336
  %77 = load i8* getelementptr inbounds ([0 x i8]* @inbuf, i32 0, i64 23), align 1, !dbg !3336
  %78 = zext i8 %77 to i16, !dbg !3336
  %79 = zext i16 %78 to i32, !dbg !3336
  %80 = shl i32 %79, 8, !dbg !3336
  %81 = or i32 %76, %80, !dbg !3336
  %82 = sext i32 %81 to i64, !dbg !3336
  %83 = load i8* getelementptr inbounds ([0 x i8]* @inbuf, i32 0, i64 24), align 1, !dbg !3336
  %84 = zext i8 %83 to i16, !dbg !3336
  %85 = zext i16 %84 to i32, !dbg !3336
  %86 = load i8* getelementptr inbounds ([0 x i8]* @inbuf, i32 0, i64 25), align 1, !dbg !3336
  %87 = zext i8 %86 to i16, !dbg !3336
  %88 = zext i16 %87 to i32, !dbg !3336
  %89 = shl i32 %88, 8, !dbg !3336
  %90 = or i32 %85, %89, !dbg !3336
  %91 = sext i32 %90 to i64, !dbg !3336
  %92 = shl i64 %91, 16, !dbg !3336
  %93 = or i64 %82, %92, !dbg !3336
  store i64 %93, i64* %n1, align 8, !dbg !3336
  %94 = load i64* %n1, align 8, !dbg !3337
  %95 = load i8* getelementptr inbounds ([0 x i8]* @inbuf, i32 0, i64 18), align 1, !dbg !3337
  %96 = zext i8 %95 to i16, !dbg !3337
  %97 = zext i16 %96 to i32, !dbg !3337
  %98 = load i8* getelementptr inbounds ([0 x i8]* @inbuf, i32 0, i64 19), align 1, !dbg !3337
  %99 = zext i8 %98 to i16, !dbg !3337
  %100 = zext i16 %99 to i32, !dbg !3337
  %101 = shl i32 %100, 8, !dbg !3337
  %102 = or i32 %97, %101, !dbg !3337
  %103 = sext i32 %102 to i64, !dbg !3337
  %104 = load i8* getelementptr inbounds ([0 x i8]* @inbuf, i32 0, i64 20), align 1, !dbg !3337
  %105 = zext i8 %104 to i16, !dbg !3337
  %106 = zext i16 %105 to i32, !dbg !3337
  %107 = load i8* getelementptr inbounds ([0 x i8]* @inbuf, i32 0, i64 21), align 1, !dbg !3337
  %108 = zext i8 %107 to i16, !dbg !3337
  %109 = zext i16 %108 to i32, !dbg !3337
  %110 = shl i32 %109, 8, !dbg !3337
  %111 = or i32 %106, %110, !dbg !3337
  %112 = sext i32 %111 to i64, !dbg !3337
  %113 = shl i64 %112, 16, !dbg !3337
  %114 = or i64 %103, %113, !dbg !3337
  %115 = load i32* @decrypt, align 4, !dbg !3337
  %116 = icmp ne i32 %115, 0, !dbg !3337
  %117 = select i1 %116, i32 12, i32 0, !dbg !3337
  %118 = sext i32 %117 to i64, !dbg !3337
  %119 = sub i64 %114, %118, !dbg !3337
  %120 = icmp ne i64 %94, %119, !dbg !3337
  br i1 %120, label %121, label %145, !dbg !3337

; <label>:121                                     ; preds = %73
  %122 = load %struct.__sFILE** @__stderrp, align 8, !dbg !3338
  %123 = load i64* %n1, align 8, !dbg !3338
  %124 = load i8* getelementptr inbounds ([0 x i8]* @inbuf, i32 0, i64 18), align 1, !dbg !3338
  %125 = zext i8 %124 to i16, !dbg !3338
  %126 = zext i16 %125 to i32, !dbg !3338
  %127 = load i8* getelementptr inbounds ([0 x i8]* @inbuf, i32 0, i64 19), align 1, !dbg !3338
  %128 = zext i8 %127 to i16, !dbg !3338
  %129 = zext i16 %128 to i32, !dbg !3338
  %130 = shl i32 %129, 8, !dbg !3338
  %131 = or i32 %126, %130, !dbg !3338
  %132 = sext i32 %131 to i64, !dbg !3338
  %133 = load i8* getelementptr inbounds ([0 x i8]* @inbuf, i32 0, i64 20), align 1, !dbg !3338
  %134 = zext i8 %133 to i16, !dbg !3338
  %135 = zext i16 %134 to i32, !dbg !3338
  %136 = load i8* getelementptr inbounds ([0 x i8]* @inbuf, i32 0, i64 21), align 1, !dbg !3338
  %137 = zext i8 %136 to i16, !dbg !3338
  %138 = zext i16 %137 to i32, !dbg !3338
  %139 = shl i32 %138, 8, !dbg !3338
  %140 = or i32 %135, %139, !dbg !3338
  %141 = sext i32 %140 to i64, !dbg !3338
  %142 = shl i64 %141, 16, !dbg !3338
  %143 = or i64 %132, %142, !dbg !3338
  %144 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %122, i8* getelementptr inbounds ([18 x i8]* @.str536, i32 0, i32 0), i64 %123, i64 %143), !dbg !3338
  call void @error(i8* getelementptr inbounds ([41 x i8]* @.str637, i32 0, i32 0)), !dbg !3340
  br label %145, !dbg !3341

; <label>:145                                     ; preds = %121, %73
  br label %146, !dbg !3342

; <label>:146                                     ; preds = %174, %145
  %147 = load i64* %n1, align 8, !dbg !3342
  %148 = add i64 %147, -1, !dbg !3342
  store i64 %148, i64* %n1, align 8, !dbg !3342
  %149 = icmp ne i64 %147, 0, !dbg !3342
  br i1 %149, label %150, label %175, !dbg !3342

; <label>:150                                     ; preds = %146
  call void @llvm.dbg.declare(metadata !22, metadata !3343), !dbg !3345
  %151 = load i32* @inptr, align 4, !dbg !3346
  %152 = load i32* @insize, align 4, !dbg !3346
  %153 = icmp ult i32 %151, %152, !dbg !3346
  br i1 %153, label %154, label %161, !dbg !3346

; <label>:154                                     ; preds = %150
  %155 = load i32* @inptr, align 4, !dbg !3346
  %156 = add i32 %155, 1, !dbg !3346
  store i32 %156, i32* @inptr, align 4, !dbg !3346
  %157 = zext i32 %155 to i64, !dbg !3346
  %158 = getelementptr inbounds [0 x i8]* @inbuf, i32 0, i64 %157, !dbg !3346
  %159 = load i8* %158, align 1, !dbg !3346
  %160 = zext i8 %159 to i32, !dbg !3346
  br label %163, !dbg !3346

; <label>:161                                     ; preds = %150
  %162 = call i32 @fill_inbuf(i32 0), !dbg !3347
  br label %163, !dbg !3347

; <label>:163                                     ; preds = %161, %154
  %164 = phi i32 [ %160, %154 ], [ %162, %161 ], !dbg !3347
  %165 = trunc i32 %164 to i8, !dbg !3347
  store i8 %165, i8* %c, align 1, !dbg !3347
  %166 = load i8* %c, align 1, !dbg !3348
  %167 = load i32* @outcnt, align 4, !dbg !3348
  %168 = add i32 %167, 1, !dbg !3348
  store i32 %168, i32* @outcnt, align 4, !dbg !3348
  %169 = zext i32 %167 to i64, !dbg !3348
  %170 = getelementptr inbounds [0 x i8]* @window, i32 0, i64 %169, !dbg !3348
  store i8 %166, i8* %170, align 1, !dbg !3348
  %171 = load i32* @outcnt, align 4, !dbg !3348
  %172 = icmp eq i32 %171, 32768, !dbg !3348
  br i1 %172, label %173, label %174, !dbg !3348

; <label>:173                                     ; preds = %163
  call void @flush_window(), !dbg !3348
  br label %174, !dbg !3348

; <label>:174                                     ; preds = %173, %163
  br label %146, !dbg !3350

; <label>:175                                     ; preds = %146
  call void @flush_window(), !dbg !3351
  br label %177, !dbg !3352

; <label>:176                                     ; preds = %70, %67
  call void @error(i8* getelementptr inbounds ([31 x i8]* @.str738, i32 0, i32 0)), !dbg !3353
  br label %177

; <label>:177                                     ; preds = %176, %175
  br label %178

; <label>:178                                     ; preds = %177, %66
  %179 = load i32* @pkzip, align 4, !dbg !3355
  %180 = icmp ne i32 %179, 0, !dbg !3355
  br i1 %180, label %270, label %181, !dbg !3355

; <label>:181                                     ; preds = %178
  store i32 0, i32* %n, align 4, !dbg !3356
  br label %182, !dbg !3356

; <label>:182                                     ; preds = %204, %181
  %183 = load i32* %n, align 4, !dbg !3356
  %184 = icmp slt i32 %183, 8, !dbg !3356
  br i1 %184, label %185, label %207, !dbg !3356

; <label>:185                                     ; preds = %182
  %186 = load i32* @inptr, align 4, !dbg !3359
  %187 = load i32* @insize, align 4, !dbg !3359
  %188 = icmp ult i32 %186, %187, !dbg !3359
  br i1 %188, label %189, label %196, !dbg !3359

; <label>:189                                     ; preds = %185
  %190 = load i32* @inptr, align 4, !dbg !3359
  %191 = add i32 %190, 1, !dbg !3359
  store i32 %191, i32* @inptr, align 4, !dbg !3359
  %192 = zext i32 %190 to i64, !dbg !3359
  %193 = getelementptr inbounds [0 x i8]* @inbuf, i32 0, i64 %192, !dbg !3359
  %194 = load i8* %193, align 1, !dbg !3359
  %195 = zext i8 %194 to i32, !dbg !3359
  br label %198, !dbg !3359

; <label>:196                                     ; preds = %185
  %197 = call i32 @fill_inbuf(i32 0), !dbg !3361
  br label %198, !dbg !3361

; <label>:198                                     ; preds = %196, %189
  %199 = phi i32 [ %195, %189 ], [ %197, %196 ], !dbg !3361
  %200 = trunc i32 %199 to i8, !dbg !3361
  %201 = load i32* %n, align 4, !dbg !3361
  %202 = sext i32 %201 to i64, !dbg !3361
  %203 = getelementptr inbounds [16 x i8]* %buf, i32 0, i64 %202, !dbg !3361
  store i8 %200, i8* %203, align 1, !dbg !3361
  br label %204, !dbg !3362

; <label>:204                                     ; preds = %198
  %205 = load i32* %n, align 4, !dbg !3363
  %206 = add nsw i32 %205, 1, !dbg !3363
  store i32 %206, i32* %n, align 4, !dbg !3363
  br label %182, !dbg !3363

; <label>:207                                     ; preds = %182
  %208 = getelementptr inbounds [16 x i8]* %buf, i32 0, i64 0, !dbg !3364
  %209 = load i8* %208, align 1, !dbg !3364
  %210 = zext i8 %209 to i16, !dbg !3364
  %211 = zext i16 %210 to i32, !dbg !3364
  %212 = getelementptr inbounds [16 x i8]* %buf, i32 0, i64 1, !dbg !3364
  %213 = load i8* %212, align 1, !dbg !3364
  %214 = zext i8 %213 to i16, !dbg !3364
  %215 = zext i16 %214 to i32, !dbg !3364
  %216 = shl i32 %215, 8, !dbg !3364
  %217 = or i32 %211, %216, !dbg !3364
  %218 = sext i32 %217 to i64, !dbg !3364
  %219 = getelementptr inbounds [16 x i8]* %buf, i32 0, i32 0, !dbg !3364
  %220 = getelementptr inbounds i8* %219, i64 2, !dbg !3364
  %221 = getelementptr inbounds i8* %220, i64 0, !dbg !3364
  %222 = load i8* %221, align 1, !dbg !3364
  %223 = zext i8 %222 to i16, !dbg !3364
  %224 = zext i16 %223 to i32, !dbg !3364
  %225 = getelementptr inbounds [16 x i8]* %buf, i32 0, i32 0, !dbg !3364
  %226 = getelementptr inbounds i8* %225, i64 2, !dbg !3364
  %227 = getelementptr inbounds i8* %226, i64 1, !dbg !3364
  %228 = load i8* %227, align 1, !dbg !3364
  %229 = zext i8 %228 to i16, !dbg !3364
  %230 = zext i16 %229 to i32, !dbg !3364
  %231 = shl i32 %230, 8, !dbg !3364
  %232 = or i32 %224, %231, !dbg !3364
  %233 = sext i32 %232 to i64, !dbg !3364
  %234 = shl i64 %233, 16, !dbg !3364
  %235 = or i64 %218, %234, !dbg !3364
  store i64 %235, i64* %orig_crc, align 8, !dbg !3364
  %236 = getelementptr inbounds [16 x i8]* %buf, i32 0, i32 0, !dbg !3365
  %237 = getelementptr inbounds i8* %236, i64 4, !dbg !3365
  %238 = getelementptr inbounds i8* %237, i64 0, !dbg !3365
  %239 = load i8* %238, align 1, !dbg !3365
  %240 = zext i8 %239 to i16, !dbg !3365
  %241 = zext i16 %240 to i32, !dbg !3365
  %242 = getelementptr inbounds [16 x i8]* %buf, i32 0, i32 0, !dbg !3365
  %243 = getelementptr inbounds i8* %242, i64 4, !dbg !3365
  %244 = getelementptr inbounds i8* %243, i64 1, !dbg !3365
  %245 = load i8* %244, align 1, !dbg !3365
  %246 = zext i8 %245 to i16, !dbg !3365
  %247 = zext i16 %246 to i32, !dbg !3365
  %248 = shl i32 %247, 8, !dbg !3365
  %249 = or i32 %241, %248, !dbg !3365
  %250 = sext i32 %249 to i64, !dbg !3365
  %251 = getelementptr inbounds [16 x i8]* %buf, i32 0, i32 0, !dbg !3365
  %252 = getelementptr inbounds i8* %251, i64 4, !dbg !3365
  %253 = getelementptr inbounds i8* %252, i64 2, !dbg !3365
  %254 = getelementptr inbounds i8* %253, i64 0, !dbg !3365
  %255 = load i8* %254, align 1, !dbg !3365
  %256 = zext i8 %255 to i16, !dbg !3365
  %257 = zext i16 %256 to i32, !dbg !3365
  %258 = getelementptr inbounds [16 x i8]* %buf, i32 0, i32 0, !dbg !3365
  %259 = getelementptr inbounds i8* %258, i64 4, !dbg !3365
  %260 = getelementptr inbounds i8* %259, i64 2, !dbg !3365
  %261 = getelementptr inbounds i8* %260, i64 1, !dbg !3365
  %262 = load i8* %261, align 1, !dbg !3365
  %263 = zext i8 %262 to i16, !dbg !3365
  %264 = zext i16 %263 to i32, !dbg !3365
  %265 = shl i32 %264, 8, !dbg !3365
  %266 = or i32 %257, %265, !dbg !3365
  %267 = sext i32 %266 to i64, !dbg !3365
  %268 = shl i64 %267, 16, !dbg !3365
  %269 = or i64 %250, %268, !dbg !3365
  store i64 %269, i64* %orig_len, align 8, !dbg !3365
  br label %369, !dbg !3366

; <label>:270                                     ; preds = %178
  %271 = load i32* @ext_header, align 4, !dbg !3367
  %272 = icmp ne i32 %271, 0, !dbg !3367
  br i1 %272, label %273, label %368, !dbg !3367

; <label>:273                                     ; preds = %270
  store i32 0, i32* %n, align 4, !dbg !3368
  br label %274, !dbg !3368

; <label>:274                                     ; preds = %296, %273
  %275 = load i32* %n, align 4, !dbg !3368
  %276 = icmp slt i32 %275, 16, !dbg !3368
  br i1 %276, label %277, label %299, !dbg !3368

; <label>:277                                     ; preds = %274
  %278 = load i32* @inptr, align 4, !dbg !3371
  %279 = load i32* @insize, align 4, !dbg !3371
  %280 = icmp ult i32 %278, %279, !dbg !3371
  br i1 %280, label %281, label %288, !dbg !3371

; <label>:281                                     ; preds = %277
  %282 = load i32* @inptr, align 4, !dbg !3371
  %283 = add i32 %282, 1, !dbg !3371
  store i32 %283, i32* @inptr, align 4, !dbg !3371
  %284 = zext i32 %282 to i64, !dbg !3371
  %285 = getelementptr inbounds [0 x i8]* @inbuf, i32 0, i64 %284, !dbg !3371
  %286 = load i8* %285, align 1, !dbg !3371
  %287 = zext i8 %286 to i32, !dbg !3371
  br label %290, !dbg !3371

; <label>:288                                     ; preds = %277
  %289 = call i32 @fill_inbuf(i32 0), !dbg !3373
  br label %290, !dbg !3373

; <label>:290                                     ; preds = %288, %281
  %291 = phi i32 [ %287, %281 ], [ %289, %288 ], !dbg !3373
  %292 = trunc i32 %291 to i8, !dbg !3373
  %293 = load i32* %n, align 4, !dbg !3373
  %294 = sext i32 %293 to i64, !dbg !3373
  %295 = getelementptr inbounds [16 x i8]* %buf, i32 0, i64 %294, !dbg !3373
  store i8 %292, i8* %295, align 1, !dbg !3373
  br label %296, !dbg !3374

; <label>:296                                     ; preds = %290
  %297 = load i32* %n, align 4, !dbg !3375
  %298 = add nsw i32 %297, 1, !dbg !3375
  store i32 %298, i32* %n, align 4, !dbg !3375
  br label %274, !dbg !3375

; <label>:299                                     ; preds = %274
  %300 = getelementptr inbounds [16 x i8]* %buf, i32 0, i32 0, !dbg !3376
  %301 = getelementptr inbounds i8* %300, i64 4, !dbg !3376
  %302 = getelementptr inbounds i8* %301, i64 0, !dbg !3376
  %303 = load i8* %302, align 1, !dbg !3376
  %304 = zext i8 %303 to i16, !dbg !3376
  %305 = zext i16 %304 to i32, !dbg !3376
  %306 = getelementptr inbounds [16 x i8]* %buf, i32 0, i32 0, !dbg !3376
  %307 = getelementptr inbounds i8* %306, i64 4, !dbg !3376
  %308 = getelementptr inbounds i8* %307, i64 1, !dbg !3376
  %309 = load i8* %308, align 1, !dbg !3376
  %310 = zext i8 %309 to i16, !dbg !3376
  %311 = zext i16 %310 to i32, !dbg !3376
  %312 = shl i32 %311, 8, !dbg !3376
  %313 = or i32 %305, %312, !dbg !3376
  %314 = sext i32 %313 to i64, !dbg !3376
  %315 = getelementptr inbounds [16 x i8]* %buf, i32 0, i32 0, !dbg !3376
  %316 = getelementptr inbounds i8* %315, i64 4, !dbg !3376
  %317 = getelementptr inbounds i8* %316, i64 2, !dbg !3376
  %318 = getelementptr inbounds i8* %317, i64 0, !dbg !3376
  %319 = load i8* %318, align 1, !dbg !3376
  %320 = zext i8 %319 to i16, !dbg !3376
  %321 = zext i16 %320 to i32, !dbg !3376
  %322 = getelementptr inbounds [16 x i8]* %buf, i32 0, i32 0, !dbg !3376
  %323 = getelementptr inbounds i8* %322, i64 4, !dbg !3376
  %324 = getelementptr inbounds i8* %323, i64 2, !dbg !3376
  %325 = getelementptr inbounds i8* %324, i64 1, !dbg !3376
  %326 = load i8* %325, align 1, !dbg !3376
  %327 = zext i8 %326 to i16, !dbg !3376
  %328 = zext i16 %327 to i32, !dbg !3376
  %329 = shl i32 %328, 8, !dbg !3376
  %330 = or i32 %321, %329, !dbg !3376
  %331 = sext i32 %330 to i64, !dbg !3376
  %332 = shl i64 %331, 16, !dbg !3376
  %333 = or i64 %314, %332, !dbg !3376
  store i64 %333, i64* %orig_crc, align 8, !dbg !3376
  %334 = getelementptr inbounds [16 x i8]* %buf, i32 0, i32 0, !dbg !3377
  %335 = getelementptr inbounds i8* %334, i64 12, !dbg !3377
  %336 = getelementptr inbounds i8* %335, i64 0, !dbg !3377
  %337 = load i8* %336, align 1, !dbg !3377
  %338 = zext i8 %337 to i16, !dbg !3377
  %339 = zext i16 %338 to i32, !dbg !3377
  %340 = getelementptr inbounds [16 x i8]* %buf, i32 0, i32 0, !dbg !3377
  %341 = getelementptr inbounds i8* %340, i64 12, !dbg !3377
  %342 = getelementptr inbounds i8* %341, i64 1, !dbg !3377
  %343 = load i8* %342, align 1, !dbg !3377
  %344 = zext i8 %343 to i16, !dbg !3377
  %345 = zext i16 %344 to i32, !dbg !3377
  %346 = shl i32 %345, 8, !dbg !3377
  %347 = or i32 %339, %346, !dbg !3377
  %348 = sext i32 %347 to i64, !dbg !3377
  %349 = getelementptr inbounds [16 x i8]* %buf, i32 0, i32 0, !dbg !3377
  %350 = getelementptr inbounds i8* %349, i64 12, !dbg !3377
  %351 = getelementptr inbounds i8* %350, i64 2, !dbg !3377
  %352 = getelementptr inbounds i8* %351, i64 0, !dbg !3377
  %353 = load i8* %352, align 1, !dbg !3377
  %354 = zext i8 %353 to i16, !dbg !3377
  %355 = zext i16 %354 to i32, !dbg !3377
  %356 = getelementptr inbounds [16 x i8]* %buf, i32 0, i32 0, !dbg !3377
  %357 = getelementptr inbounds i8* %356, i64 12, !dbg !3377
  %358 = getelementptr inbounds i8* %357, i64 2, !dbg !3377
  %359 = getelementptr inbounds i8* %358, i64 1, !dbg !3377
  %360 = load i8* %359, align 1, !dbg !3377
  %361 = zext i8 %360 to i16, !dbg !3377
  %362 = zext i16 %361 to i32, !dbg !3377
  %363 = shl i32 %362, 8, !dbg !3377
  %364 = or i32 %355, %363, !dbg !3377
  %365 = sext i32 %364 to i64, !dbg !3377
  %366 = shl i64 %365, 16, !dbg !3377
  %367 = or i64 %348, %366, !dbg !3377
  store i64 %367, i64* %orig_len, align 8, !dbg !3377
  br label %368, !dbg !3378

; <label>:368                                     ; preds = %299, %270
  br label %369

; <label>:369                                     ; preds = %368, %207
  %370 = load i64* %orig_crc, align 8, !dbg !3379
  %371 = call i64 @updcrc(i8* getelementptr inbounds ([0 x i8]* @outbuf, i32 0, i32 0), i32 0), !dbg !3380
  %372 = icmp ne i64 %370, %371, !dbg !3380
  br i1 %372, label %373, label %374, !dbg !3380

; <label>:373                                     ; preds = %369
  call void @error(i8* getelementptr inbounds ([35 x i8]* @.str839, i32 0, i32 0)), !dbg !3381
  br label %374, !dbg !3383

; <label>:374                                     ; preds = %373, %369
  %375 = load i64* %orig_len, align 8, !dbg !3384
  %376 = load i64* @bytes_out, align 8, !dbg !3384
  %377 = icmp ne i64 %375, %376, !dbg !3384
  br i1 %377, label %378, label %379, !dbg !3384

; <label>:378                                     ; preds = %374
  call void @error(i8* getelementptr inbounds ([38 x i8]* @.str940, i32 0, i32 0)), !dbg !3385
  br label %379, !dbg !3387

; <label>:379                                     ; preds = %378, %374
  %380 = load i32* @pkzip, align 4, !dbg !3388
  %381 = icmp ne i32 %380, 0, !dbg !3388
  br i1 %381, label %382, label %447, !dbg !3388

; <label>:382                                     ; preds = %379
  %383 = load i32* @inptr, align 4, !dbg !3388
  %384 = add i32 %383, 4, !dbg !3388
  %385 = load i32* @insize, align 4, !dbg !3388
  %386 = icmp ult i32 %384, %385, !dbg !3388
  br i1 %386, label %387, label %447, !dbg !3388

; <label>:387                                     ; preds = %382
  %388 = load i32* @inptr, align 4, !dbg !3388
  %389 = zext i32 %388 to i64, !dbg !3388
  %390 = getelementptr inbounds i8* getelementptr inbounds ([0 x i8]* @inbuf, i32 0, i32 0), i64 %389, !dbg !3388
  %391 = getelementptr inbounds i8* %390, i64 0, !dbg !3388
  %392 = load i8* %391, align 1, !dbg !3388
  %393 = zext i8 %392 to i16, !dbg !3388
  %394 = zext i16 %393 to i32, !dbg !3388
  %395 = load i32* @inptr, align 4, !dbg !3388
  %396 = zext i32 %395 to i64, !dbg !3388
  %397 = getelementptr inbounds i8* getelementptr inbounds ([0 x i8]* @inbuf, i32 0, i32 0), i64 %396, !dbg !3388
  %398 = getelementptr inbounds i8* %397, i64 1, !dbg !3388
  %399 = load i8* %398, align 1, !dbg !3388
  %400 = zext i8 %399 to i16, !dbg !3388
  %401 = zext i16 %400 to i32, !dbg !3388
  %402 = shl i32 %401, 8, !dbg !3388
  %403 = or i32 %394, %402, !dbg !3388
  %404 = sext i32 %403 to i64, !dbg !3388
  %405 = load i32* @inptr, align 4, !dbg !3388
  %406 = zext i32 %405 to i64, !dbg !3388
  %407 = getelementptr inbounds i8* getelementptr inbounds ([0 x i8]* @inbuf, i32 0, i32 0), i64 %406, !dbg !3388
  %408 = getelementptr inbounds i8* %407, i64 2, !dbg !3388
  %409 = getelementptr inbounds i8* %408, i64 0, !dbg !3388
  %410 = load i8* %409, align 1, !dbg !3388
  %411 = zext i8 %410 to i16, !dbg !3388
  %412 = zext i16 %411 to i32, !dbg !3388
  %413 = load i32* @inptr, align 4, !dbg !3388
  %414 = zext i32 %413 to i64, !dbg !3388
  %415 = getelementptr inbounds i8* getelementptr inbounds ([0 x i8]* @inbuf, i32 0, i32 0), i64 %414, !dbg !3388
  %416 = getelementptr inbounds i8* %415, i64 2, !dbg !3388
  %417 = getelementptr inbounds i8* %416, i64 1, !dbg !3388
  %418 = load i8* %417, align 1, !dbg !3388
  %419 = zext i8 %418 to i16, !dbg !3388
  %420 = zext i16 %419 to i32, !dbg !3388
  %421 = shl i32 %420, 8, !dbg !3388
  %422 = or i32 %412, %421, !dbg !3388
  %423 = sext i32 %422 to i64, !dbg !3388
  %424 = shl i64 %423, 16, !dbg !3388
  %425 = or i64 %404, %424, !dbg !3388
  %426 = icmp eq i64 %425, 67324752, !dbg !3388
  br i1 %426, label %427, label %447, !dbg !3388

; <label>:427                                     ; preds = %387
  %428 = load i32* @to_stdout, align 4, !dbg !3389
  %429 = icmp ne i32 %428, 0, !dbg !3389
  br i1 %429, label %430, label %442, !dbg !3389

; <label>:430                                     ; preds = %427
  %431 = load i32* @quiet, align 4, !dbg !3391
  %432 = icmp ne i32 %431, 0, !dbg !3391
  br i1 %432, label %437, label %433, !dbg !3391

; <label>:433                                     ; preds = %430
  %434 = load %struct.__sFILE** @__stderrp, align 8, !dbg !3391
  %435 = load i8** @progname, align 8, !dbg !3391
  %436 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %434, i8* getelementptr inbounds ([46 x i8]* @.str1041, i32 0, i32 0), i8* %435, i8* getelementptr inbounds ([0 x i8]* @ifname, i32 0, i32 0)), !dbg !3391
  br label %437, !dbg !3391

; <label>:437                                     ; preds = %433, %430
  %438 = load i32* @exit_code, align 4, !dbg !3391
  %439 = icmp eq i32 %438, 0, !dbg !3391
  br i1 %439, label %440, label %441, !dbg !3391

; <label>:440                                     ; preds = %437
  store i32 2, i32* @exit_code, align 4, !dbg !3391
  br label %441, !dbg !3391

; <label>:441                                     ; preds = %440, %437
  br label %446, !dbg !3394

; <label>:442                                     ; preds = %427
  %443 = load %struct.__sFILE** @__stderrp, align 8, !dbg !3395
  %444 = load i8** @progname, align 8, !dbg !3395
  %445 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %443, i8* getelementptr inbounds ([45 x i8]* @.str1142, i32 0, i32 0), i8* %444, i8* getelementptr inbounds ([0 x i8]* @ifname, i32 0, i32 0)), !dbg !3395
  store i32 1, i32* @exit_code, align 4, !dbg !3397
  store i32 0, i32* @pkzip, align 4, !dbg !3398
  store i32 0, i32* @ext_header, align 4, !dbg !3398
  store i32 1, i32* %1, !dbg !3399
  br label %448, !dbg !3399

; <label>:446                                     ; preds = %441
  br label %447, !dbg !3400

; <label>:447                                     ; preds = %446, %387, %382, %379
  store i32 0, i32* @pkzip, align 4, !dbg !3401
  store i32 0, i32* @ext_header, align 4, !dbg !3401
  store i32 0, i32* %1, !dbg !3402
  br label %448, !dbg !3402

; <label>:448                                     ; preds = %447, %442
  %449 = load i32* %1, !dbg !3403
  ret i32 %449, !dbg !3403
}

define i32 @copy(i32 %in, i32 %out) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %in, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !3404), !dbg !3405
  store i32 %out, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !3406), !dbg !3407
  %3 = call i32* @__error(), !dbg !3408
  store i32 0, i32* %3, align 4, !dbg !3408
  br label %4, !dbg !3410

; <label>:4                                       ; preds = %12, %0
  %5 = load i32* @insize, align 4, !dbg !3410
  %6 = icmp ne i32 %5, 0, !dbg !3410
  br i1 %6, label %7, label %10, !dbg !3410

; <label>:7                                       ; preds = %4
  %8 = load i32* @insize, align 4, !dbg !3410
  %9 = icmp ne i32 %8, -1, !dbg !3410
  br label %10

; <label>:10                                      ; preds = %7, %4
  %11 = phi i1 [ false, %4 ], [ %9, %7 ]
  br i1 %11, label %12, label %22

; <label>:12                                      ; preds = %10
  %13 = load i32* %2, align 4, !dbg !3411
  %14 = load i32* @insize, align 4, !dbg !3411
  call void @write_buf(i32 %13, i8* getelementptr inbounds ([0 x i8]* @inbuf, i32 0, i32 0), i32 %14), !dbg !3411
  %15 = load i32* @insize, align 4, !dbg !3413
  %16 = zext i32 %15 to i64, !dbg !3413
  %17 = load i64* @bytes_out, align 8, !dbg !3413
  %18 = add nsw i64 %17, %16, !dbg !3413
  store i64 %18, i64* @bytes_out, align 8, !dbg !3413
  %19 = load i32* %1, align 4, !dbg !3414
  %20 = call i64 @read(i32 %19, i8* getelementptr inbounds ([0 x i8]* @inbuf, i32 0, i32 0), i64 32768), !dbg !3414
  %21 = trunc i64 %20 to i32, !dbg !3414
  store i32 %21, i32* @insize, align 4, !dbg !3414
  br label %4, !dbg !3415

; <label>:22                                      ; preds = %10
  %23 = load i32* @insize, align 4, !dbg !3416
  %24 = icmp eq i32 %23, -1, !dbg !3416
  br i1 %24, label %25, label %30, !dbg !3416

; <label>:25                                      ; preds = %22
  %26 = call i32* @__error(), !dbg !3417
  %27 = load i32* %26, align 4, !dbg !3417
  %28 = icmp ne i32 %27, 0, !dbg !3417
  br i1 %28, label %29, label %30, !dbg !3417

; <label>:29                                      ; preds = %25
  call void @read_error(), !dbg !3418
  br label %30, !dbg !3420

; <label>:30                                      ; preds = %29, %25, %22
  %31 = load i64* @bytes_out, align 8, !dbg !3421
  store i64 %31, i64* @bytes_in, align 8, !dbg !3421
  ret i32 0, !dbg !3422
}

declare i32* @__error()

define void @write_buf(i32 %fd, i8* %buf, i32 %cnt) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %fd, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !3423), !dbg !3424
  store i8* %buf, i8** %2, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !3425), !dbg !3426
  store i32 %cnt, i32* %3, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !3427), !dbg !3428
  call void @llvm.dbg.declare(metadata !22, metadata !3429), !dbg !3431
  br label %4, !dbg !3432

; <label>:4                                       ; preds = %17, %0
  %5 = load i32* %1, align 4, !dbg !3433
  %6 = load i8** %2, align 8, !dbg !3433
  %7 = load i32* %3, align 4, !dbg !3433
  %8 = zext i32 %7 to i64, !dbg !3433
  %9 = call i64 @write(i32 %5, i8* %6, i64 %8), !dbg !3433
  %10 = trunc i64 %9 to i32, !dbg !3433
  store i32 %10, i32* %n, align 4, !dbg !3433
  %11 = load i32* %3, align 4, !dbg !3433
  %12 = icmp ne i32 %10, %11, !dbg !3433
  br i1 %12, label %13, label %25, !dbg !3433

; <label>:13                                      ; preds = %4
  %14 = load i32* %n, align 4, !dbg !3434
  %15 = icmp eq i32 %14, -1, !dbg !3434
  br i1 %15, label %16, label %17, !dbg !3434

; <label>:16                                      ; preds = %13
  call void @write_error(), !dbg !3436
  br label %17, !dbg !3438

; <label>:17                                      ; preds = %16, %13
  %18 = load i32* %n, align 4, !dbg !3439
  %19 = load i32* %3, align 4, !dbg !3439
  %20 = sub i32 %19, %18, !dbg !3439
  store i32 %20, i32* %3, align 4, !dbg !3439
  %21 = load i8** %2, align 8, !dbg !3440
  %22 = load i32* %n, align 4, !dbg !3440
  %23 = zext i32 %22 to i64, !dbg !3440
  %24 = getelementptr inbounds i8* %21, i64 %23, !dbg !3440
  store i8* %24, i8** %2, align 8, !dbg !3440
  br label %4, !dbg !3441

; <label>:25                                      ; preds = %4
  ret void, !dbg !3442
}

define void @read_error() nounwind uwtable {
  %1 = load %struct.__sFILE** @__stderrp, align 8, !dbg !3443
  %2 = load i8** @progname, align 8, !dbg !3443
  %3 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %1, i8* getelementptr inbounds ([6 x i8]* @.str548, i32 0, i32 0), i8* %2), !dbg !3443
  %4 = call i32* @__error(), !dbg !3445
  %5 = load i32* %4, align 4, !dbg !3445
  %6 = icmp ne i32 %5, 0, !dbg !3445
  br i1 %6, label %7, label %8, !dbg !3445

; <label>:7                                       ; preds = %0
  call void @perror(i8* getelementptr inbounds ([0 x i8]* @ifname, i32 0, i32 0)), !dbg !3446
  br label %11, !dbg !3448

; <label>:8                                       ; preds = %0
  %9 = load %struct.__sFILE** @__stderrp, align 8, !dbg !3449
  %10 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %9, i8* getelementptr inbounds ([28 x i8]* @.str649, i32 0, i32 0), i8* getelementptr inbounds ([0 x i8]* @ifname, i32 0, i32 0)), !dbg !3449
  br label %11

; <label>:11                                      ; preds = %8, %7
  %12 = call i32 @abort_gzip(), !dbg !3451
  ret void, !dbg !3452
}

define i64 @updcrc(i8* %s, i32 %n) nounwind uwtable {
  %1 = alloca i8*, align 8
  %2 = alloca i32, align 4
  %c = alloca i64, align 8
  store i8* %s, i8** %1, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !3453), !dbg !3454
  store i32 %n, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !3455), !dbg !3456
  call void @llvm.dbg.declare(metadata !22, metadata !3457), !dbg !3459
  %3 = load i8** %1, align 8, !dbg !3460
  %4 = icmp eq i8* %3, null, !dbg !3460
  br i1 %4, label %5, label %6, !dbg !3460

; <label>:5                                       ; preds = %0
  store i64 4294967295, i64* %c, align 8, !dbg !3461
  br label %32, !dbg !3463

; <label>:6                                       ; preds = %0
  %7 = load i64* @updcrc.crc, align 8, !dbg !3464
  store i64 %7, i64* %c, align 8, !dbg !3464
  %8 = load i32* %2, align 4, !dbg !3466
  %9 = icmp ne i32 %8, 0, !dbg !3466
  br i1 %9, label %10, label %31, !dbg !3466

; <label>:10                                      ; preds = %6
  br label %11, !dbg !3467

; <label>:11                                      ; preds = %26, %10
  %12 = load i64* %c, align 8, !dbg !3468
  %13 = trunc i64 %12 to i32, !dbg !3468
  %14 = load i8** %1, align 8, !dbg !3468
  %15 = getelementptr inbounds i8* %14, i32 1, !dbg !3468
  store i8* %15, i8** %1, align 8, !dbg !3468
  %16 = load i8* %14, align 1, !dbg !3468
  %17 = zext i8 %16 to i32, !dbg !3468
  %18 = xor i32 %13, %17, !dbg !3468
  %19 = and i32 %18, 255, !dbg !3468
  %20 = sext i32 %19 to i64, !dbg !3468
  %21 = getelementptr inbounds [0 x i64]* bitcast ([256 x i64]* @crc_32_tab to [0 x i64]*), i32 0, i64 %20, !dbg !3468
  %22 = load i64* %21, align 1, !dbg !3468
  %23 = load i64* %c, align 8, !dbg !3468
  %24 = lshr i64 %23, 8, !dbg !3468
  %25 = xor i64 %22, %24, !dbg !3468
  store i64 %25, i64* %c, align 8, !dbg !3468
  br label %26, !dbg !3470

; <label>:26                                      ; preds = %11
  %27 = load i32* %2, align 4, !dbg !3470
  %28 = add i32 %27, -1, !dbg !3470
  store i32 %28, i32* %2, align 4, !dbg !3470
  %29 = icmp ne i32 %28, 0, !dbg !3470
  br i1 %29, label %11, label %30, !dbg !3470

; <label>:30                                      ; preds = %26
  br label %31, !dbg !3470

; <label>:31                                      ; preds = %30, %6
  br label %32

; <label>:32                                      ; preds = %31, %5
  %33 = load i64* %c, align 8, !dbg !3471
  store i64 %33, i64* @updcrc.crc, align 8, !dbg !3471
  %34 = load i64* %c, align 8, !dbg !3472
  %35 = xor i64 %34, 4294967295, !dbg !3472
  ret i64 %35, !dbg !3472
}

define void @clear_bufs() nounwind uwtable {
  store i32 0, i32* @outcnt, align 4, !dbg !3473
  store i32 0, i32* @inptr, align 4, !dbg !3475
  store i32 0, i32* @insize, align 4, !dbg !3475
  store i64 0, i64* @bytes_out, align 8, !dbg !3476
  store i64 0, i64* @bytes_in, align 8, !dbg !3476
  ret void, !dbg !3477
}

define i32 @fill_inbuf(i32 %eof_ok) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %len = alloca i32, align 4
  store i32 %eof_ok, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !3478), !dbg !3479
  call void @llvm.dbg.declare(metadata !22, metadata !3480), !dbg !3482
  store i32 0, i32* @insize, align 4, !dbg !3483
  %3 = call i32* @__error(), !dbg !3484
  store i32 0, i32* %3, align 4, !dbg !3484
  br label %4, !dbg !3485

; <label>:4                                       ; preds = %24, %0
  %5 = load i32* @ifd, align 4, !dbg !3486
  %6 = load i32* @insize, align 4, !dbg !3486
  %7 = zext i32 %6 to i64, !dbg !3486
  %8 = getelementptr inbounds i8* getelementptr inbounds ([0 x i8]* @inbuf, i32 0, i32 0), i64 %7, !dbg !3486
  %9 = load i32* @insize, align 4, !dbg !3486
  %10 = sub i32 32768, %9, !dbg !3486
  %11 = zext i32 %10 to i64, !dbg !3486
  %12 = call i64 @read(i32 %5, i8* %8, i64 %11), !dbg !3486
  %13 = trunc i64 %12 to i32, !dbg !3486
  store i32 %13, i32* %len, align 4, !dbg !3486
  %14 = load i32* %len, align 4, !dbg !3488
  %15 = icmp eq i32 %14, 0, !dbg !3488
  br i1 %15, label %19, label %16, !dbg !3488

; <label>:16                                      ; preds = %4
  %17 = load i32* %len, align 4, !dbg !3488
  %18 = icmp eq i32 %17, -1, !dbg !3488
  br i1 %18, label %19, label %20, !dbg !3488

; <label>:19                                      ; preds = %16, %4
  br label %27, !dbg !3489

; <label>:20                                      ; preds = %16
  %21 = load i32* %len, align 4, !dbg !3490
  %22 = load i32* @insize, align 4, !dbg !3490
  %23 = add i32 %22, %21, !dbg !3490
  store i32 %23, i32* @insize, align 4, !dbg !3490
  br label %24, !dbg !3491

; <label>:24                                      ; preds = %20
  %25 = load i32* @insize, align 4, !dbg !3491
  %26 = icmp ult i32 %25, 32768, !dbg !3491
  br i1 %26, label %4, label %27, !dbg !3491

; <label>:27                                      ; preds = %24, %19
  %28 = load i32* @insize, align 4, !dbg !3492
  %29 = icmp eq i32 %28, 0, !dbg !3492
  br i1 %29, label %30, label %35, !dbg !3492

; <label>:30                                      ; preds = %27
  %31 = load i32* %2, align 4, !dbg !3493
  %32 = icmp ne i32 %31, 0, !dbg !3493
  br i1 %32, label %33, label %34, !dbg !3493

; <label>:33                                      ; preds = %30
  store i32 -1, i32* %1, !dbg !3495
  br label %42, !dbg !3495

; <label>:34                                      ; preds = %30
  call void @read_error(), !dbg !3496
  br label %35, !dbg !3497

; <label>:35                                      ; preds = %34, %27
  %36 = load i32* @insize, align 4, !dbg !3498
  %37 = zext i32 %36 to i64, !dbg !3498
  %38 = load i64* @bytes_in, align 8, !dbg !3498
  %39 = add i64 %38, %37, !dbg !3498
  store i64 %39, i64* @bytes_in, align 8, !dbg !3498
  store i32 1, i32* @inptr, align 4, !dbg !3499
  %40 = load i8* getelementptr inbounds ([0 x i8]* @inbuf, i32 0, i64 0), align 1, !dbg !3500
  %41 = zext i8 %40 to i32, !dbg !3500
  store i32 %41, i32* %1, !dbg !3500
  br label %42, !dbg !3500

; <label>:42                                      ; preds = %35, %33
  %43 = load i32* %1, !dbg !3501
  ret i32 %43, !dbg !3501
}

define void @flush_outbuf() nounwind uwtable {
  %1 = load i32* @outcnt, align 4, !dbg !3502
  %2 = icmp eq i32 %1, 0, !dbg !3502
  br i1 %2, label %3, label %4, !dbg !3502

; <label>:3                                       ; preds = %0
  br label %11, !dbg !3504

; <label>:4                                       ; preds = %0
  %5 = load i32* @ofd, align 4, !dbg !3505
  %6 = load i32* @outcnt, align 4, !dbg !3505
  call void @write_buf(i32 %5, i8* getelementptr inbounds ([0 x i8]* @outbuf, i32 0, i32 0), i32 %6), !dbg !3505
  %7 = load i32* @outcnt, align 4, !dbg !3506
  %8 = zext i32 %7 to i64, !dbg !3506
  %9 = load i64* @bytes_out, align 8, !dbg !3506
  %10 = add i64 %9, %8, !dbg !3506
  store i64 %10, i64* @bytes_out, align 8, !dbg !3506
  store i32 0, i32* @outcnt, align 4, !dbg !3507
  br label %11, !dbg !3508

; <label>:11                                      ; preds = %4, %3
  ret void, !dbg !3508
}

define void @flush_window() nounwind uwtable {
  %1 = load i32* @outcnt, align 4, !dbg !3509
  %2 = icmp eq i32 %1, 0, !dbg !3509
  br i1 %2, label %3, label %4, !dbg !3509

; <label>:3                                       ; preds = %0
  br label %17, !dbg !3511

; <label>:4                                       ; preds = %0
  %5 = load i32* @outcnt, align 4, !dbg !3512
  %6 = call i64 (...)* bitcast (i64 (i8*, i32)* @updcrc to i64 (...)*)(i8* getelementptr inbounds ([0 x i8]* @window, i32 0, i32 0), i32 %5), !dbg !3512
  %7 = load i32* @test, align 4, !dbg !3513
  %8 = icmp ne i32 %7, 0, !dbg !3513
  br i1 %8, label %12, label %9, !dbg !3513

; <label>:9                                       ; preds = %4
  %10 = load i32* @ofd, align 4, !dbg !3514
  %11 = load i32* @outcnt, align 4, !dbg !3514
  call void @write_buf(i32 %10, i8* getelementptr inbounds ([0 x i8]* @window, i32 0, i32 0), i32 %11), !dbg !3514
  br label %12, !dbg !3516

; <label>:12                                      ; preds = %9, %4
  %13 = load i32* @outcnt, align 4, !dbg !3517
  %14 = zext i32 %13 to i64, !dbg !3517
  %15 = load i64* @bytes_out, align 8, !dbg !3517
  %16 = add i64 %15, %14, !dbg !3517
  store i64 %16, i64* @bytes_out, align 8, !dbg !3517
  store i32 0, i32* @outcnt, align 4, !dbg !3518
  br label %17, !dbg !3519

; <label>:17                                      ; preds = %12, %3
  ret void, !dbg !3519
}

declare i64 @write(i32, i8*, i64)

define void @write_error() nounwind uwtable {
  %1 = load %struct.__sFILE** @__stderrp, align 8, !dbg !3520
  %2 = load i8** @progname, align 8, !dbg !3520
  %3 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %1, i8* getelementptr inbounds ([6 x i8]* @.str548, i32 0, i32 0), i8* %2), !dbg !3520
  call void @perror(i8* getelementptr inbounds ([0 x i8]* @ofname, i32 0, i32 0)), !dbg !3522
  %4 = call i32 @abort_gzip(), !dbg !3523
  ret void, !dbg !3524
}

define i8* @strlwr(i8* %s) nounwind uwtable {
  %1 = alloca i8*, align 8
  %t = alloca i8*, align 8
  store i8* %s, i8** %1, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !3525), !dbg !3526
  call void @llvm.dbg.declare(metadata !22, metadata !3527), !dbg !3529
  %2 = load i8** %1, align 8, !dbg !3530
  store i8* %2, i8** %t, align 8, !dbg !3530
  br label %3, !dbg !3530

; <label>:3                                       ; preds = %27, %0
  %4 = load i8** %t, align 8, !dbg !3530
  %5 = load i8* %4, align 1, !dbg !3530
  %6 = icmp ne i8 %5, 0, !dbg !3530
  br i1 %6, label %7, label %30, !dbg !3530

; <label>:7                                       ; preds = %3
  %8 = load i8** %t, align 8, !dbg !3532
  %9 = load i8* %8, align 1, !dbg !3532
  %10 = sext i8 %9 to i32, !dbg !3532
  %11 = call i32 @__sbistype(i32 %10, i64 32768), !dbg !3532
  %12 = icmp ne i32 %11, 0, !dbg !3532
  br i1 %12, label %13, label %19, !dbg !3532

; <label>:13                                      ; preds = %7
  %14 = load i8** %t, align 8, !dbg !3532
  %15 = load i8* %14, align 1, !dbg !3532
  %16 = sext i8 %15 to i32, !dbg !3532
  %17 = sub nsw i32 %16, 65, !dbg !3532
  %18 = add nsw i32 %17, 97, !dbg !3532
  br label %23, !dbg !3532

; <label>:19                                      ; preds = %7
  %20 = load i8** %t, align 8, !dbg !3532
  %21 = load i8* %20, align 1, !dbg !3532
  %22 = sext i8 %21 to i32, !dbg !3532
  br label %23, !dbg !3532

; <label>:23                                      ; preds = %19, %13
  %24 = phi i32 [ %18, %13 ], [ %22, %19 ], !dbg !3532
  %25 = trunc i32 %24 to i8, !dbg !3532
  %26 = load i8** %t, align 8, !dbg !3532
  store i8 %25, i8* %26, align 1, !dbg !3532
  br label %27, !dbg !3532

; <label>:27                                      ; preds = %23
  %28 = load i8** %t, align 8, !dbg !3533
  %29 = getelementptr inbounds i8* %28, i32 1, !dbg !3533
  store i8* %29, i8** %t, align 8, !dbg !3533
  br label %3, !dbg !3533

; <label>:30                                      ; preds = %3
  %31 = load i8** %1, align 8, !dbg !3534
  ret i8* %31, !dbg !3534
}

define internal i32 @__sbistype(i32 %_c, i64 %_f) nounwind uwtable inlinehint {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  store i32 %_c, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !3535), !dbg !3536
  store i64 %_f, i64* %2, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !3537), !dbg !3538
  %3 = load i32* %1, align 4, !dbg !3539
  %4 = load i64* %2, align 8, !dbg !3539
  %5 = call i32 @__sbmaskrune(i32 %3, i64 %4), !dbg !3539
  %6 = icmp ne i32 %5, 0, !dbg !3539
  %7 = xor i1 %6, true, !dbg !3539
  %8 = xor i1 %7, true, !dbg !3539
  %9 = zext i1 %8 to i32, !dbg !3539
  ret i32 %9, !dbg !3539
}

define i8* @basename(i8* %fname) nounwind uwtable {
  %1 = alloca i8*, align 8
  %p = alloca i8*, align 8
  store i8* %fname, i8** %1, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !3541), !dbg !3542
  call void @llvm.dbg.declare(metadata !22, metadata !3543), !dbg !3545
  %2 = load i8** %1, align 8, !dbg !3546
  %3 = call i8* @strrchr(i8* %2, i32 47) nounwind readonly, !dbg !3546
  store i8* %3, i8** %p, align 8, !dbg !3546
  %4 = icmp ne i8* %3, null, !dbg !3546
  br i1 %4, label %5, label %8, !dbg !3546

; <label>:5                                       ; preds = %0
  %6 = load i8** %p, align 8, !dbg !3547
  %7 = getelementptr inbounds i8* %6, i64 1, !dbg !3547
  store i8* %7, i8** %1, align 8, !dbg !3547
  br label %8, !dbg !3547

; <label>:8                                       ; preds = %5, %0
  %9 = load i8** %1, align 8, !dbg !3548
  ret i8* %9, !dbg !3548
}

declare i8* @strrchr(i8*, i32) nounwind readonly

define void @make_simple_name(i8* %name) nounwind uwtable {
  %1 = alloca i8*, align 8
  %p = alloca i8*, align 8
  store i8* %name, i8** %1, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !3549), !dbg !3550
  call void @llvm.dbg.declare(metadata !22, metadata !3551), !dbg !3553
  %2 = load i8** %1, align 8, !dbg !3554
  %3 = call i8* @strrchr(i8* %2, i32 46) nounwind readonly, !dbg !3554
  store i8* %3, i8** %p, align 8, !dbg !3554
  %4 = load i8** %p, align 8, !dbg !3555
  %5 = icmp eq i8* %4, null, !dbg !3555
  br i1 %5, label %6, label %7, !dbg !3555

; <label>:6                                       ; preds = %0
  br label %28, !dbg !3556

; <label>:7                                       ; preds = %0
  %8 = load i8** %p, align 8, !dbg !3557
  %9 = load i8** %1, align 8, !dbg !3557
  %10 = icmp eq i8* %8, %9, !dbg !3557
  br i1 %10, label %11, label %14, !dbg !3557

; <label>:11                                      ; preds = %7
  %12 = load i8** %p, align 8, !dbg !3558
  %13 = getelementptr inbounds i8* %12, i32 1, !dbg !3558
  store i8* %13, i8** %p, align 8, !dbg !3558
  br label %14, !dbg !3558

; <label>:14                                      ; preds = %11, %7
  br label %15, !dbg !3559

; <label>:15                                      ; preds = %24, %14
  %16 = load i8** %p, align 8, !dbg !3560
  %17 = getelementptr inbounds i8* %16, i32 -1, !dbg !3560
  store i8* %17, i8** %p, align 8, !dbg !3560
  %18 = load i8* %17, align 1, !dbg !3560
  %19 = sext i8 %18 to i32, !dbg !3560
  %20 = icmp eq i32 %19, 46, !dbg !3560
  br i1 %20, label %21, label %23, !dbg !3560

; <label>:21                                      ; preds = %15
  %22 = load i8** %p, align 8, !dbg !3562
  store i8 95, i8* %22, align 1, !dbg !3562
  br label %23, !dbg !3562

; <label>:23                                      ; preds = %21, %15
  br label %24, !dbg !3563

; <label>:24                                      ; preds = %23
  %25 = load i8** %p, align 8, !dbg !3563
  %26 = load i8** %1, align 8, !dbg !3563
  %27 = icmp ne i8* %25, %26, !dbg !3563
  br i1 %27, label %15, label %28, !dbg !3563

; <label>:28                                      ; preds = %24, %6
  ret void, !dbg !3564
}

define i8* @add_envopt(i32* %argcp, i8*** %argvp, i8* %env) nounwind uwtable {
  %1 = alloca i8*, align 8
  %2 = alloca i32*, align 8
  %3 = alloca i8***, align 8
  %4 = alloca i8*, align 8
  %p = alloca i8*, align 8
  %oargv = alloca i8**, align 8
  %nargv = alloca i8**, align 8
  %oargc = alloca i32, align 4
  %nargc = alloca i32, align 4
  store i32* %argcp, i32** %2, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !3565), !dbg !3566
  store i8*** %argvp, i8**** %3, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !3567), !dbg !3568
  store i8* %env, i8** %4, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !3569), !dbg !3570
  call void @llvm.dbg.declare(metadata !22, metadata !3571), !dbg !3573
  call void @llvm.dbg.declare(metadata !22, metadata !3574), !dbg !3575
  call void @llvm.dbg.declare(metadata !22, metadata !3576), !dbg !3577
  call void @llvm.dbg.declare(metadata !22, metadata !3578), !dbg !3579
  %5 = load i32** %2, align 8, !dbg !3580
  %6 = load i32* %5, align 4, !dbg !3580
  store i32 %6, i32* %oargc, align 4, !dbg !3580
  call void @llvm.dbg.declare(metadata !22, metadata !3581), !dbg !3582
  store i32 0, i32* %nargc, align 4, !dbg !3583
  %7 = load i8** %4, align 8, !dbg !3584
  %8 = call i8* @getenv(i8* %7), !dbg !3584
  store i8* %8, i8** %4, align 8, !dbg !3584
  %9 = load i8** %4, align 8, !dbg !3585
  %10 = icmp eq i8* %9, null, !dbg !3585
  br i1 %10, label %11, label %12, !dbg !3585

; <label>:11                                      ; preds = %0
  store i8* null, i8** %1, !dbg !3586
  br label %121, !dbg !3586

; <label>:12                                      ; preds = %0
  %13 = load i8** %4, align 8, !dbg !3587
  %14 = call i64 @strlen(i8* %13) nounwind readonly, !dbg !3587
  %15 = add i64 %14, 1, !dbg !3587
  %16 = trunc i64 %15 to i32, !dbg !3587
  %17 = call i8* @xmalloc(i32 %16), !dbg !3587
  store i8* %17, i8** %p, align 8, !dbg !3587
  %18 = load i8** %p, align 8, !dbg !3588
  %19 = load i8** %4, align 8, !dbg !3588
  %20 = call i8* @strcpy(i8* %18, i8* %19), !dbg !3588
  store i8* %20, i8** %4, align 8, !dbg !3588
  %21 = load i8** %4, align 8, !dbg !3589
  store i8* %21, i8** %p, align 8, !dbg !3589
  br label %22, !dbg !3589

; <label>:22                                      ; preds = %48, %12
  %23 = load i8** %p, align 8, !dbg !3589
  %24 = load i8* %23, align 1, !dbg !3589
  %25 = icmp ne i8 %24, 0, !dbg !3589
  br i1 %25, label %26, label %51, !dbg !3589

; <label>:26                                      ; preds = %22
  %27 = load i8** %p, align 8, !dbg !3591
  %28 = call i64 @strspn(i8* %27, i8* getelementptr inbounds ([3 x i8]* @.str43, i32 0, i32 0)) nounwind readonly, !dbg !3591
  %29 = load i8** %p, align 8, !dbg !3591
  %30 = getelementptr inbounds i8* %29, i64 %28, !dbg !3591
  store i8* %30, i8** %p, align 8, !dbg !3591
  %31 = load i8** %p, align 8, !dbg !3593
  %32 = load i8* %31, align 1, !dbg !3593
  %33 = sext i8 %32 to i32, !dbg !3593
  %34 = icmp eq i32 %33, 0, !dbg !3593
  br i1 %34, label %35, label %36, !dbg !3593

; <label>:35                                      ; preds = %26
  br label %51, !dbg !3594

; <label>:36                                      ; preds = %26
  %37 = load i8** %p, align 8, !dbg !3595
  %38 = call i64 @strcspn(i8* %37, i8* getelementptr inbounds ([3 x i8]* @.str43, i32 0, i32 0)) nounwind readonly, !dbg !3595
  %39 = load i8** %p, align 8, !dbg !3595
  %40 = getelementptr inbounds i8* %39, i64 %38, !dbg !3595
  store i8* %40, i8** %p, align 8, !dbg !3595
  %41 = load i8** %p, align 8, !dbg !3596
  %42 = load i8* %41, align 1, !dbg !3596
  %43 = icmp ne i8 %42, 0, !dbg !3596
  br i1 %43, label %44, label %47, !dbg !3596

; <label>:44                                      ; preds = %36
  %45 = load i8** %p, align 8, !dbg !3597
  %46 = getelementptr inbounds i8* %45, i32 1, !dbg !3597
  store i8* %46, i8** %p, align 8, !dbg !3597
  store i8 0, i8* %45, align 1, !dbg !3597
  br label %47, !dbg !3597

; <label>:47                                      ; preds = %44, %36
  br label %48, !dbg !3598

; <label>:48                                      ; preds = %47
  %49 = load i32* %nargc, align 4, !dbg !3599
  %50 = add nsw i32 %49, 1, !dbg !3599
  store i32 %50, i32* %nargc, align 4, !dbg !3599
  br label %22, !dbg !3599

; <label>:51                                      ; preds = %35, %22
  %52 = load i32* %nargc, align 4, !dbg !3600
  %53 = icmp eq i32 %52, 0, !dbg !3600
  br i1 %53, label %54, label %56, !dbg !3600

; <label>:54                                      ; preds = %51
  %55 = load i8** %4, align 8, !dbg !3601
  call void @free(i8* %55), !dbg !3601
  store i8* null, i8** %1, !dbg !3603
  br label %121, !dbg !3603

; <label>:56                                      ; preds = %51
  %57 = load i32* %nargc, align 4, !dbg !3604
  %58 = load i32** %2, align 8, !dbg !3604
  %59 = load i32* %58, align 4, !dbg !3604
  %60 = add nsw i32 %59, %57, !dbg !3604
  store i32 %60, i32* %58, align 4, !dbg !3604
  %61 = load i32** %2, align 8, !dbg !3605
  %62 = load i32* %61, align 4, !dbg !3605
  %63 = add nsw i32 %62, 1, !dbg !3605
  %64 = sext i32 %63 to i64, !dbg !3605
  %65 = call noalias i8* @calloc(i64 %64, i64 8), !dbg !3605
  %66 = bitcast i8* %65 to i8**, !dbg !3605
  store i8** %66, i8*** %nargv, align 8, !dbg !3605
  %67 = load i8*** %nargv, align 8, !dbg !3606
  %68 = icmp eq i8** %67, null, !dbg !3606
  br i1 %68, label %69, label %70, !dbg !3606

; <label>:69                                      ; preds = %56
  call void @error(i8* getelementptr inbounds ([14 x i8]* @.str144, i32 0, i32 0)), !dbg !3607
  br label %70, !dbg !3607

; <label>:70                                      ; preds = %69, %56
  %71 = load i8**** %3, align 8, !dbg !3608
  %72 = load i8*** %71, align 8, !dbg !3608
  store i8** %72, i8*** %oargv, align 8, !dbg !3608
  %73 = load i8*** %nargv, align 8, !dbg !3609
  %74 = load i8**** %3, align 8, !dbg !3609
  store i8** %73, i8*** %74, align 8, !dbg !3609
  %75 = load i32* %oargc, align 4, !dbg !3610
  %76 = add nsw i32 %75, -1, !dbg !3610
  store i32 %76, i32* %oargc, align 4, !dbg !3610
  %77 = icmp slt i32 %75, 0, !dbg !3610
  br i1 %77, label %78, label %79, !dbg !3610

; <label>:78                                      ; preds = %70
  call void @error(i8* getelementptr inbounds ([8 x i8]* @.str245, i32 0, i32 0)), !dbg !3611
  br label %79, !dbg !3611

; <label>:79                                      ; preds = %78, %70
  %80 = load i8*** %oargv, align 8, !dbg !3612
  %81 = getelementptr inbounds i8** %80, i32 1, !dbg !3612
  store i8** %81, i8*** %oargv, align 8, !dbg !3612
  %82 = load i8** %80, align 8, !dbg !3612
  %83 = load i8*** %nargv, align 8, !dbg !3612
  %84 = getelementptr inbounds i8** %83, i32 1, !dbg !3612
  store i8** %84, i8*** %nargv, align 8, !dbg !3612
  store i8* %82, i8** %83, align 8, !dbg !3612
  %85 = load i8** %4, align 8, !dbg !3613
  store i8* %85, i8** %p, align 8, !dbg !3613
  br label %86, !dbg !3613

; <label>:86                                      ; preds = %104, %79
  %87 = load i32* %nargc, align 4, !dbg !3613
  %88 = icmp sgt i32 %87, 0, !dbg !3613
  br i1 %88, label %89, label %107, !dbg !3613

; <label>:89                                      ; preds = %86
  %90 = load i8** %p, align 8, !dbg !3615
  %91 = call i64 @strspn(i8* %90, i8* getelementptr inbounds ([3 x i8]* @.str43, i32 0, i32 0)) nounwind readonly, !dbg !3615
  %92 = load i8** %p, align 8, !dbg !3615
  %93 = getelementptr inbounds i8* %92, i64 %91, !dbg !3615
  store i8* %93, i8** %p, align 8, !dbg !3615
  %94 = load i8** %p, align 8, !dbg !3617
  %95 = load i8*** %nargv, align 8, !dbg !3617
  %96 = getelementptr inbounds i8** %95, i32 1, !dbg !3617
  store i8** %96, i8*** %nargv, align 8, !dbg !3617
  store i8* %94, i8** %95, align 8, !dbg !3617
  br label %97, !dbg !3618

; <label>:97                                      ; preds = %102, %89
  %98 = load i8** %p, align 8, !dbg !3618
  %99 = getelementptr inbounds i8* %98, i32 1, !dbg !3618
  store i8* %99, i8** %p, align 8, !dbg !3618
  %100 = load i8* %98, align 1, !dbg !3618
  %101 = icmp ne i8 %100, 0, !dbg !3618
  br i1 %101, label %102, label %103, !dbg !3618

; <label>:102                                     ; preds = %97
  br label %97, !dbg !3618

; <label>:103                                     ; preds = %97
  br label %104, !dbg !3619

; <label>:104                                     ; preds = %103
  %105 = load i32* %nargc, align 4, !dbg !3620
  %106 = add nsw i32 %105, -1, !dbg !3620
  store i32 %106, i32* %nargc, align 4, !dbg !3620
  br label %86, !dbg !3620

; <label>:107                                     ; preds = %86
  br label %108, !dbg !3621

; <label>:108                                     ; preds = %112, %107
  %109 = load i32* %oargc, align 4, !dbg !3621
  %110 = add nsw i32 %109, -1, !dbg !3621
  store i32 %110, i32* %oargc, align 4, !dbg !3621
  %111 = icmp ne i32 %109, 0, !dbg !3621
  br i1 %111, label %112, label %118, !dbg !3621

; <label>:112                                     ; preds = %108
  %113 = load i8*** %oargv, align 8, !dbg !3622
  %114 = getelementptr inbounds i8** %113, i32 1, !dbg !3622
  store i8** %114, i8*** %oargv, align 8, !dbg !3622
  %115 = load i8** %113, align 8, !dbg !3622
  %116 = load i8*** %nargv, align 8, !dbg !3622
  %117 = getelementptr inbounds i8** %116, i32 1, !dbg !3622
  store i8** %117, i8*** %nargv, align 8, !dbg !3622
  store i8* %115, i8** %116, align 8, !dbg !3622
  br label %108, !dbg !3622

; <label>:118                                     ; preds = %108
  %119 = load i8*** %nargv, align 8, !dbg !3623
  store i8* null, i8** %119, align 8, !dbg !3623
  %120 = load i8** %4, align 8, !dbg !3624
  store i8* %120, i8** %1, !dbg !3624
  br label %121, !dbg !3624

; <label>:121                                     ; preds = %118, %54, %11
  %122 = load i8** %1, !dbg !3625
  ret i8* %122, !dbg !3625
}

define i8* @xmalloc(i32 %size) nounwind uwtable {
  %1 = alloca i32, align 4
  %cp = alloca i8*, align 8
  store i32 %size, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !3626), !dbg !3627
  call void @llvm.dbg.declare(metadata !22, metadata !3628), !dbg !3630
  %2 = load i32* %1, align 4, !dbg !3631
  %3 = zext i32 %2 to i64, !dbg !3631
  %4 = call noalias i8* @malloc(i64 %3), !dbg !3631
  store i8* %4, i8** %cp, align 8, !dbg !3631
  %5 = load i8** %cp, align 8, !dbg !3632
  %6 = icmp eq i8* %5, null, !dbg !3632
  br i1 %6, label %7, label %8, !dbg !3632

; <label>:7                                       ; preds = %0
  call void (...)* bitcast (void (i8*)* @error to void (...)*)(i8* getelementptr inbounds ([14 x i8]* @.str144, i32 0, i32 0)), !dbg !3633
  br label %8, !dbg !3633

; <label>:8                                       ; preds = %7, %0
  %9 = load i8** %cp, align 8, !dbg !3634
  ret i8* %9, !dbg !3634
}

declare i64 @strlen(i8*) nounwind readonly

declare i8* @strcpy(i8*, i8*)

declare i64 @strspn(i8*, i8*) nounwind readonly

declare i64 @strcspn(i8*, i8*) nounwind readonly

declare noalias i8* @calloc(i64, i64)

define void @error(i8* %m) nounwind uwtable {
  %1 = alloca i8*, align 8
  store i8* %m, i8** %1, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !3635), !dbg !3636
  %2 = load %struct.__sFILE** @__stderrp, align 8, !dbg !3637
  %3 = load i8** @progname, align 8, !dbg !3637
  %4 = load i8** %1, align 8, !dbg !3637
  %5 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %2, i8* getelementptr inbounds ([13 x i8]* @.str346, i32 0, i32 0), i8* %3, i8* getelementptr inbounds ([0 x i8]* @ifname, i32 0, i32 0), i8* %4), !dbg !3637
  %6 = call i32 @abort_gzip(), !dbg !3639
  ret void, !dbg !3640
}

declare i32 @abort_gzip()

define void @warn(i8* %a, i8* %b) nounwind uwtable {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  store i8* %a, i8** %1, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !3641), !dbg !3642
  store i8* %b, i8** %2, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !3643), !dbg !3644
  %3 = load i32* @quiet, align 4, !dbg !3645
  %4 = icmp ne i32 %3, 0, !dbg !3645
  br i1 %4, label %11, label %5, !dbg !3645

; <label>:5                                       ; preds = %0
  %6 = load %struct.__sFILE** @__stderrp, align 8, !dbg !3645
  %7 = load i8** @progname, align 8, !dbg !3645
  %8 = load i8** %1, align 8, !dbg !3645
  %9 = load i8** %2, align 8, !dbg !3645
  %10 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %6, i8* getelementptr inbounds ([23 x i8]* @.str447, i32 0, i32 0), i8* %7, i8* getelementptr inbounds ([0 x i8]* @ifname, i32 0, i32 0), i8* %8, i8* %9), !dbg !3645
  br label %11, !dbg !3645

; <label>:11                                      ; preds = %5, %0
  %12 = load i32* @exit_code, align 4, !dbg !3645
  %13 = icmp eq i32 %12, 0, !dbg !3645
  br i1 %13, label %14, label %15, !dbg !3645

; <label>:14                                      ; preds = %11
  store i32 2, i32* @exit_code, align 4, !dbg !3645
  br label %15, !dbg !3645

; <label>:15                                      ; preds = %14, %11
  ret void, !dbg !3648
}

declare void @perror(i8*)

define void @display_ratio(i64 %num, i64 %den, %struct.__sFILE* %file) nounwind uwtable {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  %3 = alloca %struct.__sFILE*, align 8
  %ratio = alloca i64, align 8
  store i64 %num, i64* %1, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !3649), !dbg !3650
  store i64 %den, i64* %2, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !3651), !dbg !3652
  store %struct.__sFILE* %file, %struct.__sFILE** %3, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !3653), !dbg !3654
  call void @llvm.dbg.declare(metadata !22, metadata !3655), !dbg !3657
  %4 = load i64* %2, align 8, !dbg !3658
  %5 = icmp eq i64 %4, 0, !dbg !3658
  br i1 %5, label %6, label %7, !dbg !3658

; <label>:6                                       ; preds = %0
  store i64 0, i64* %ratio, align 8, !dbg !3659
  br label %21, !dbg !3661

; <label>:7                                       ; preds = %0
  %8 = load i64* %2, align 8, !dbg !3662
  %9 = icmp slt i64 %8, 2147483, !dbg !3662
  br i1 %9, label %10, label %15, !dbg !3662

; <label>:10                                      ; preds = %7
  %11 = load i64* %1, align 8, !dbg !3663
  %12 = mul nsw i64 1000, %11, !dbg !3663
  %13 = load i64* %2, align 8, !dbg !3663
  %14 = sdiv i64 %12, %13, !dbg !3663
  store i64 %14, i64* %ratio, align 8, !dbg !3663
  br label %20, !dbg !3665

; <label>:15                                      ; preds = %7
  %16 = load i64* %1, align 8, !dbg !3666
  %17 = load i64* %2, align 8, !dbg !3666
  %18 = sdiv i64 %17, 1000, !dbg !3666
  %19 = sdiv i64 %16, %18, !dbg !3666
  store i64 %19, i64* %ratio, align 8, !dbg !3666
  br label %20

; <label>:20                                      ; preds = %15, %10
  br label %21

; <label>:21                                      ; preds = %20, %6
  %22 = load i64* %ratio, align 8, !dbg !3668
  %23 = icmp slt i64 %22, 0, !dbg !3668
  br i1 %23, label %24, label %37, !dbg !3668

; <label>:24                                      ; preds = %21
  %25 = load i32* @__isthreaded, align 4, !dbg !3669
  %26 = icmp ne i32 %25, 0, !dbg !3669
  br i1 %26, label %30, label %27, !dbg !3669

; <label>:27                                      ; preds = %24
  %28 = load %struct.__sFILE** %3, align 8, !dbg !3669
  %29 = call i32 @__sputc(i32 45, %struct.__sFILE* %28), !dbg !3669
  br label %33, !dbg !3669

; <label>:30                                      ; preds = %24
  %31 = load %struct.__sFILE** %3, align 8, !dbg !3669
  %32 = call i32 @putc(i32 45, %struct.__sFILE* %31), !dbg !3669
  br label %33, !dbg !3669

; <label>:33                                      ; preds = %30, %27
  %34 = phi i32 [ %29, %27 ], [ %32, %30 ], !dbg !3669
  %35 = load i64* %ratio, align 8, !dbg !3671
  %36 = sub nsw i64 0, %35, !dbg !3671
  store i64 %36, i64* %ratio, align 8, !dbg !3671
  br label %48, !dbg !3672

; <label>:37                                      ; preds = %21
  %38 = load i32* @__isthreaded, align 4, !dbg !3673
  %39 = icmp ne i32 %38, 0, !dbg !3673
  br i1 %39, label %43, label %40, !dbg !3673

; <label>:40                                      ; preds = %37
  %41 = load %struct.__sFILE** %3, align 8, !dbg !3673
  %42 = call i32 @__sputc(i32 32, %struct.__sFILE* %41), !dbg !3673
  br label %46, !dbg !3673

; <label>:43                                      ; preds = %37
  %44 = load %struct.__sFILE** %3, align 8, !dbg !3673
  %45 = call i32 @putc(i32 32, %struct.__sFILE* %44), !dbg !3673
  br label %46, !dbg !3673

; <label>:46                                      ; preds = %43, %40
  %47 = phi i32 [ %42, %40 ], [ %45, %43 ], !dbg !3673
  br label %48

; <label>:48                                      ; preds = %46, %33
  %49 = load %struct.__sFILE** %3, align 8, !dbg !3675
  %50 = load i64* %ratio, align 8, !dbg !3675
  %51 = sdiv i64 %50, 10, !dbg !3675
  %52 = load i64* %ratio, align 8, !dbg !3675
  %53 = srem i64 %52, 10, !dbg !3675
  %54 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %49, i8* getelementptr inbounds ([12 x i8]* @.str750, i32 0, i32 0), i64 %51, i64 %53), !dbg !3675
  ret void, !dbg !3676
}

define internal i32 @__sputc(i32 %_c, %struct.__sFILE* %_p) nounwind uwtable inlinehint {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca %struct.__sFILE*, align 8
  store i32 %_c, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !3677), !dbg !3678
  store %struct.__sFILE* %_p, %struct.__sFILE** %3, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !3679), !dbg !3680
  %4 = load %struct.__sFILE** %3, align 8, !dbg !3681
  %5 = getelementptr inbounds %struct.__sFILE* %4, i32 0, i32 2, !dbg !3681
  %6 = load i32* %5, align 4, !dbg !3681
  %7 = add nsw i32 %6, -1, !dbg !3681
  store i32 %7, i32* %5, align 4, !dbg !3681
  %8 = icmp sge i32 %7, 0, !dbg !3681
  br i1 %8, label %22, label %9, !dbg !3681

; <label>:9                                       ; preds = %0
  %10 = load %struct.__sFILE** %3, align 8, !dbg !3681
  %11 = getelementptr inbounds %struct.__sFILE* %10, i32 0, i32 2, !dbg !3681
  %12 = load i32* %11, align 4, !dbg !3681
  %13 = load %struct.__sFILE** %3, align 8, !dbg !3681
  %14 = getelementptr inbounds %struct.__sFILE* %13, i32 0, i32 6, !dbg !3681
  %15 = load i32* %14, align 4, !dbg !3681
  %16 = icmp sge i32 %12, %15, !dbg !3681
  br i1 %16, label %17, label %30, !dbg !3681

; <label>:17                                      ; preds = %9
  %18 = load i32* %2, align 4, !dbg !3681
  %19 = trunc i32 %18 to i8, !dbg !3681
  %20 = sext i8 %19 to i32, !dbg !3681
  %21 = icmp ne i32 %20, 10, !dbg !3681
  br i1 %21, label %22, label %30, !dbg !3681

; <label>:22                                      ; preds = %17, %0
  %23 = load i32* %2, align 4, !dbg !3683
  %24 = trunc i32 %23 to i8, !dbg !3683
  %25 = load %struct.__sFILE** %3, align 8, !dbg !3683
  %26 = getelementptr inbounds %struct.__sFILE* %25, i32 0, i32 0, !dbg !3683
  %27 = load i8** %26, align 8, !dbg !3683
  %28 = getelementptr inbounds i8* %27, i32 1, !dbg !3683
  store i8* %28, i8** %26, align 8, !dbg !3683
  store i8 %24, i8* %27, align 1, !dbg !3683
  %29 = zext i8 %24 to i32, !dbg !3683
  store i32 %29, i32* %1, !dbg !3683
  br label %34, !dbg !3683

; <label>:30                                      ; preds = %17, %9
  %31 = load i32* %2, align 4, !dbg !3684
  %32 = load %struct.__sFILE** %3, align 8, !dbg !3684
  %33 = call i32 @__swbuf(i32 %31, %struct.__sFILE* %32), !dbg !3684
  store i32 %33, i32* %1, !dbg !3684
  br label %34, !dbg !3684

; <label>:34                                      ; preds = %30, %22
  %35 = load i32* %1, !dbg !3685
  ret i32 %35, !dbg !3685
}

declare i32 @putc(i32, %struct.__sFILE*)

declare i32 @__swbuf(i32, %struct.__sFILE*)

define internal i32 @__sbmaskrune(i32 %_c, i64 %_f) nounwind uwtable inlinehint {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  store i32 %_c, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !22, metadata !3686), !dbg !3687
  store i64 %_f, i64* %2, align 8
  call void @llvm.dbg.declare(metadata !22, metadata !3688), !dbg !3689
  %3 = load i32* %1, align 4, !dbg !3690
  %4 = icmp slt i32 %3, 0, !dbg !3690
  br i1 %4, label %9, label %5, !dbg !3690

; <label>:5                                       ; preds = %0
  %6 = load i32* %1, align 4, !dbg !3690
  %7 = load i32* @__mb_sb_limit, align 4, !dbg !3690
  %8 = icmp sge i32 %6, %7, !dbg !3690
  br i1 %8, label %9, label %10, !dbg !3690

; <label>:9                                       ; preds = %5, %0
  br label %19, !dbg !3690

; <label>:10                                      ; preds = %5
  %11 = load i32* %1, align 4, !dbg !3690
  %12 = sext i32 %11 to i64, !dbg !3690
  %13 = load %struct._RuneLocale** @_CurrentRuneLocale, align 8, !dbg !3690
  %14 = getelementptr inbounds %struct._RuneLocale* %13, i32 0, i32 5, !dbg !3690
  %15 = getelementptr inbounds [256 x i64]* %14, i32 0, i64 %12, !dbg !3690
  %16 = load i64* %15, align 8, !dbg !3690
  %17 = load i64* %2, align 8, !dbg !3690
  %18 = and i64 %16, %17, !dbg !3690
  br label %19, !dbg !3690

; <label>:19                                      ; preds = %10, %9
  %20 = phi i64 [ 0, %9 ], [ %18, %10 ], !dbg !3690
  %21 = trunc i64 %20 to i32, !dbg !3690
  ret i32 %21, !dbg !3690
}

!llvm.dbg.cu = !{!0, !38, !39, !86, !140, !204, !214, !341, !384, !392, !416, !430}

!0 = metadata !{i32 786449, i32 0, i32 12, metadata !"bits.c", metadata !"/home/capsicum/wvd/gzip-1.2.4", metadata !"clang version 3.1 (tags/RELEASE_31/final)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !28} ; [ DW_TAG_compile_unit ]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5, metadata !13, metadata !16, metadata !20, metadata !23}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"bi_init", metadata !"bi_init", metadata !"", metadata !6, i32 97, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, void (i32)* @bi_init, null, null, metadata !11, i32 99} ; [ DW_TAG_subprogram ]
!6 = metadata !{i32 786473, metadata !"bits.c", metadata !"/home/capsicum/wvd/gzip-1.2.4", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!8 = metadata !{null, metadata !9}
!9 = metadata !{i32 786454, null, metadata !"file_t", metadata !6, i32 151, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_typedef ]
!10 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!11 = metadata !{metadata !12}
!12 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!13 = metadata !{i32 786478, i32 0, metadata !6, metadata !"send_bits", metadata !"send_bits", metadata !"", metadata !6, i32 119, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, void (i32, i32)* @send_bits, null, null, metadata !11, i32 122} ; [ DW_TAG_subprogram ]
!14 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !15, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!15 = metadata !{null, metadata !10, metadata !10}
!16 = metadata !{i32 786478, i32 0, metadata !6, metadata !"bi_reverse", metadata !"bi_reverse", metadata !"", metadata !6, i32 148, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i32, i32)* @bi_reverse, null, null, metadata !11, i32 151} ; [ DW_TAG_subprogram ]
!17 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!18 = metadata !{metadata !19, metadata !19, metadata !10}
!19 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!20 = metadata !{i32 786478, i32 0, metadata !6, metadata !"bi_windup", metadata !"bi_windup", metadata !"", metadata !6, i32 163, metadata !21, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @bi_windup, null, null, metadata !11, i32 164} ; [ DW_TAG_subprogram ]
!21 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !22, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!22 = metadata !{null}
!23 = metadata !{i32 786478, i32 0, metadata !6, metadata !"copy_block", metadata !"copy_block", metadata !"", metadata !6, i32 181, metadata !24, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, void (i8*, i32, i32)* @copy_block, null, null, metadata !11, i32 185} ; [ DW_TAG_subprogram ]
!24 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !25, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!25 = metadata !{null, metadata !26, metadata !19, metadata !10}
!26 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !27} ; [ DW_TAG_pointer_type ]
!27 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!28 = metadata !{metadata !29}
!29 = metadata !{metadata !30, metadata !31, metadata !33, metadata !34}
!30 = metadata !{i32 786484, i32 0, null, metadata !"zfile", metadata !"zfile", metadata !"", metadata !6, i32 70, metadata !9, i32 1, i32 1, i32* @zfile} ; [ DW_TAG_variable ]
!31 = metadata !{i32 786484, i32 0, null, metadata !"bi_buf", metadata !"bi_buf", metadata !"", metadata !6, i32 72, metadata !32, i32 1, i32 1, i16* @bi_buf} ; [ DW_TAG_variable ]
!32 = metadata !{i32 786468, null, metadata !"unsigned short", null, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!33 = metadata !{i32 786484, i32 0, null, metadata !"bi_valid", metadata !"bi_valid", metadata !"", metadata !6, i32 82, metadata !10, i32 1, i32 1, i32* @bi_valid} ; [ DW_TAG_variable ]
!34 = metadata !{i32 786484, i32 0, null, metadata !"read_buf", metadata !"read_buf", metadata !"", metadata !6, i32 87, metadata !35, i32 0, i32 1, i32 (i8*, i32)** @read_buf} ; [ DW_TAG_variable ]
!35 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !36} ; [ DW_TAG_pointer_type ]
!36 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !37, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!37 = metadata !{metadata !10, metadata !26, metadata !19}
!38 = metadata !{i32 786449, i32 0, i32 12, metadata !"crypt.c", metadata !"/home/capsicum/wvd/gzip-1.2.4", metadata !"clang version 3.1 (tags/RELEASE_31/final)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !1, metadata !1} ; [ DW_TAG_compile_unit ]
!39 = metadata !{i32 786449, i32 0, i32 12, metadata !"deflate.c", metadata !"/home/capsicum/wvd/gzip-1.2.4", metadata !"clang version 3.1 (tags/RELEASE_31/final)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !40, metadata !58} ; [ DW_TAG_compile_unit ]
!40 = metadata !{metadata !41}
!41 = metadata !{metadata !42, metadata !48, metadata !52, metadata !56, metadata !57}
!42 = metadata !{i32 786478, i32 0, metadata !43, metadata !"lm_init", metadata !"lm_init", metadata !"", metadata !43, i32 286, metadata !44, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, void (i32, i16*)* @lm_init, null, null, metadata !11, i32 289} ; [ DW_TAG_subprogram ]
!43 = metadata !{i32 786473, metadata !"deflate.c", metadata !"/home/capsicum/wvd/gzip-1.2.4", null} ; [ DW_TAG_file_type ]
!44 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !45, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!45 = metadata !{null, metadata !10, metadata !46}
!46 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !47} ; [ DW_TAG_pointer_type ]
!47 = metadata !{i32 786454, null, metadata !"ush", metadata !43, i32 45, i64 0, i64 0, i64 0, i32 0, metadata !32} ; [ DW_TAG_typedef ]
!48 = metadata !{i32 786478, i32 0, metadata !43, metadata !"longest_match", metadata !"longest_match", metadata !"", metadata !43, i32 357, metadata !49, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i32)* @longest_match, null, null, metadata !11, i32 359} ; [ DW_TAG_subprogram ]
!49 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !50, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!50 = metadata !{metadata !10, metadata !51}
!51 = metadata !{i32 786454, null, metadata !"IPos", metadata !43, i32 129, i64 0, i64 0, i64 0, i32 0, metadata !19} ; [ DW_TAG_typedef ]
!52 = metadata !{i32 786478, i32 0, metadata !43, metadata !"deflate", metadata !"deflate", metadata !"", metadata !43, i32 661, metadata !53, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 ()* @deflate, null, null, metadata !11, i32 662} ; [ DW_TAG_subprogram ]
!53 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !54, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!54 = metadata !{metadata !55}
!55 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!56 = metadata !{i32 786478, i32 0, metadata !43, metadata !"deflate_fast", metadata !"deflate_fast", metadata !"", metadata !43, i32 580, metadata !53, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 ()* @deflate_fast, null, null, metadata !11, i32 581} ; [ DW_TAG_subprogram ]
!57 = metadata !{i32 786478, i32 0, metadata !43, metadata !"fill_window", metadata !"fill_window", metadata !"", metadata !43, i32 516, metadata !21, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @fill_window, null, null, metadata !11, i32 517} ; [ DW_TAG_subprogram ]
!58 = metadata !{metadata !59}
!59 = metadata !{metadata !60, metadata !62, metadata !64, metadata !65, metadata !66, metadata !67, metadata !68, metadata !69, metadata !70, metadata !71, metadata !72, metadata !73, metadata !74, metadata !75}
!60 = metadata !{i32 786484, i32 0, null, metadata !"window_size", metadata !"window_size", metadata !"", metadata !43, i32 154, metadata !61, i32 0, i32 1, i64* @window_size} ; [ DW_TAG_variable ]
!61 = metadata !{i32 786454, null, metadata !"ulg", metadata !43, i32 46, i64 0, i64 0, i64 0, i32 0, metadata !55} ; [ DW_TAG_typedef ]
!62 = metadata !{i32 786484, i32 0, null, metadata !"block_start", metadata !"block_start", metadata !"", metadata !43, i32 159, metadata !63, i32 0, i32 1, i64* @block_start} ; [ DW_TAG_variable ]
!63 = metadata !{i32 786468, null, metadata !"long int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!64 = metadata !{i32 786484, i32 0, null, metadata !"ins_h", metadata !"ins_h", metadata !"", metadata !43, i32 164, metadata !19, i32 1, i32 1, i32* @ins_h} ; [ DW_TAG_variable ]
!65 = metadata !{i32 786484, i32 0, null, metadata !"prev_length", metadata !"prev_length", metadata !"", metadata !43, i32 173, metadata !19, i32 0, i32 1, i32* @prev_length} ; [ DW_TAG_variable ]
!66 = metadata !{i32 786484, i32 0, null, metadata !"strstart", metadata !"strstart", metadata !"", metadata !43, i32 178, metadata !19, i32 0, i32 1, i32* @strstart} ; [ DW_TAG_variable ]
!67 = metadata !{i32 786484, i32 0, null, metadata !"match_start", metadata !"match_start", metadata !"", metadata !43, i32 179, metadata !19, i32 0, i32 1, i32* @match_start} ; [ DW_TAG_variable ]
!68 = metadata !{i32 786484, i32 0, null, metadata !"eofile", metadata !"eofile", metadata !"", metadata !43, i32 180, metadata !10, i32 1, i32 1, i32* @eofile} ; [ DW_TAG_variable ]
!69 = metadata !{i32 786484, i32 0, null, metadata !"lookahead", metadata !"lookahead", metadata !"", metadata !43, i32 181, metadata !19, i32 1, i32 1, i32* @lookahead} ; [ DW_TAG_variable ]
!70 = metadata !{i32 786484, i32 0, null, metadata !"max_chain_length", metadata !"max_chain_length", metadata !"", metadata !43, i32 183, metadata !19, i32 0, i32 1, i32* @max_chain_length} ; [ DW_TAG_variable ]
!71 = metadata !{i32 786484, i32 0, null, metadata !"max_lazy_match", metadata !"max_lazy_match", metadata !"", metadata !43, i32 188, metadata !19, i32 1, i32 1, i32* @max_lazy_match} ; [ DW_TAG_variable ]
!72 = metadata !{i32 786484, i32 0, null, metadata !"compr_level", metadata !"compr_level", metadata !"", metadata !43, i32 199, metadata !10, i32 1, i32 1, i32* @compr_level} ; [ DW_TAG_variable ]
!73 = metadata !{i32 786484, i32 0, null, metadata !"good_match", metadata !"good_match", metadata !"", metadata !43, i32 202, metadata !19, i32 0, i32 1, i32* @good_match} ; [ DW_TAG_variable ]
!74 = metadata !{i32 786484, i32 0, null, metadata !"nice_match", metadata !"nice_match", metadata !"", metadata !43, i32 222, metadata !10, i32 0, i32 1, i32* @nice_match} ; [ DW_TAG_variable ]
!75 = metadata !{i32 786484, i32 0, null, metadata !"configuration_table", metadata !"configuration_table", metadata !"", metadata !43, i32 225, metadata !76, i32 1, i32 1, [10 x %struct.config]* @configuration_table} ; [ DW_TAG_variable ]
!76 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 640, i64 16, i32 0, i32 0, metadata !77, metadata !84, i32 0, i32 0} ; [ DW_TAG_array_type ]
!77 = metadata !{i32 786454, null, metadata !"config", metadata !43, i32 217, i64 0, i64 0, i64 0, i32 0, metadata !78} ; [ DW_TAG_typedef ]
!78 = metadata !{i32 786451, null, metadata !"config", metadata !43, i32 212, i64 64, i64 16, i32 0, i32 0, null, metadata !79, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!79 = metadata !{metadata !80, metadata !81, metadata !82, metadata !83}
!80 = metadata !{i32 786445, metadata !78, metadata !"good_length", metadata !43, i32 213, i64 16, i64 16, i64 0, i32 0, metadata !47} ; [ DW_TAG_member ]
!81 = metadata !{i32 786445, metadata !78, metadata !"max_lazy", metadata !43, i32 214, i64 16, i64 16, i64 16, i32 0, metadata !47} ; [ DW_TAG_member ]
!82 = metadata !{i32 786445, metadata !78, metadata !"nice_length", metadata !43, i32 215, i64 16, i64 16, i64 32, i32 0, metadata !47} ; [ DW_TAG_member ]
!83 = metadata !{i32 786445, metadata !78, metadata !"max_chain", metadata !43, i32 216, i64 16, i64 16, i64 48, i32 0, metadata !47} ; [ DW_TAG_member ]
!84 = metadata !{metadata !85}
!85 = metadata !{i32 786465, i64 0, i64 9}        ; [ DW_TAG_subrange_type ]
!86 = metadata !{i32 786449, i32 0, i32 12, metadata !"getopt.c", metadata !"/home/capsicum/wvd/gzip-1.2.4", metadata !"clang version 3.1 (tags/RELEASE_31/final)", i1 true, i1 false, metadata !"", i32 0, metadata !87, metadata !1, metadata !95, metadata !130} ; [ DW_TAG_compile_unit ]
!87 = metadata !{metadata !88}
!88 = metadata !{metadata !89, metadata !89, metadata !89, metadata !89, metadata !89, metadata !89, metadata !89}
!89 = metadata !{i32 786436, null, metadata !"", metadata !90, i32 154, i64 32, i64 32, i32 0, i32 0, null, metadata !91, i32 0, i32 0} ; [ DW_TAG_enumeration_type ]
!90 = metadata !{i32 786473, metadata !"getopt.c", metadata !"/home/capsicum/wvd/gzip-1.2.4", null} ; [ DW_TAG_file_type ]
!91 = metadata !{metadata !92, metadata !93, metadata !94}
!92 = metadata !{i32 786472, metadata !"REQUIRE_ORDER", i64 0} ; [ DW_TAG_enumerator ]
!93 = metadata !{i32 786472, metadata !"PERMUTE", i64 1} ; [ DW_TAG_enumerator ]
!94 = metadata !{i32 786472, metadata !"RETURN_IN_ORDER", i64 2} ; [ DW_TAG_enumerator ]
!95 = metadata !{metadata !96}
!96 = metadata !{metadata !97, metadata !114, metadata !117, metadata !120, metadata !123, metadata !126}
!97 = metadata !{i32 786478, i32 0, metadata !90, metadata !"_getopt_internal", metadata !"_getopt_internal", metadata !"", metadata !90, i32 327, metadata !98, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i32, i8**, i8*, %struct.option*, i32*, i32)* @_getopt_internal, null, null, metadata !11, i32 334} ; [ DW_TAG_subprogram ]
!98 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !99, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!99 = metadata !{metadata !10, metadata !10, metadata !100, metadata !102, metadata !104, metadata !112, metadata !10}
!100 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !101} ; [ DW_TAG_pointer_type ]
!101 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !26} ; [ DW_TAG_const_type ]
!102 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !103} ; [ DW_TAG_pointer_type ]
!103 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !27} ; [ DW_TAG_const_type ]
!104 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !105} ; [ DW_TAG_pointer_type ]
!105 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !106} ; [ DW_TAG_const_type ]
!106 = metadata !{i32 786451, null, metadata !"option", metadata !107, i32 77, i64 256, i64 64, i32 0, i32 0, null, metadata !108, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!107 = metadata !{i32 786473, metadata !"./getopt.h", metadata !"/home/capsicum/wvd/gzip-1.2.4", null} ; [ DW_TAG_file_type ]
!108 = metadata !{metadata !109, metadata !110, metadata !111, metadata !113}
!109 = metadata !{i32 786445, metadata !106, metadata !"name", metadata !107, i32 80, i64 64, i64 64, i64 0, i32 0, metadata !102} ; [ DW_TAG_member ]
!110 = metadata !{i32 786445, metadata !106, metadata !"has_arg", metadata !107, i32 86, i64 32, i64 32, i64 64, i32 0, metadata !10} ; [ DW_TAG_member ]
!111 = metadata !{i32 786445, metadata !106, metadata !"flag", metadata !107, i32 87, i64 64, i64 64, i64 128, i32 0, metadata !112} ; [ DW_TAG_member ]
!112 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ]
!113 = metadata !{i32 786445, metadata !106, metadata !"val", metadata !107, i32 88, i64 32, i64 32, i64 192, i32 0, metadata !10} ; [ DW_TAG_member ]
!114 = metadata !{i32 786478, i32 0, metadata !90, metadata !"getopt", metadata !"getopt", metadata !"", metadata !90, i32 661, metadata !115, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i32, i8**, i8*)* @getopt, null, null, metadata !11, i32 665} ; [ DW_TAG_subprogram ]
!115 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !116, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!116 = metadata !{metadata !10, metadata !10, metadata !100, metadata !102}
!117 = metadata !{i32 786478, i32 0, metadata !90, metadata !"getopt_long", metadata !"getopt_long", metadata !"", metadata !90, i32 673, metadata !118, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i32, i8**, i8*, %struct.option*, i32*)* @getopt_long, null, null, metadata !11, i32 679} ; [ DW_TAG_subprogram ]
!118 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !119, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!119 = metadata !{metadata !10, metadata !10, metadata !100, metadata !102, metadata !104, metadata !112}
!120 = metadata !{i32 786478, i32 0, metadata !90, metadata !"my_index", metadata !"my_index", metadata !"", metadata !90, i32 194, metadata !121, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 false, i8* (i8*, i32)* @my_index, null, null, metadata !11, i32 197} ; [ DW_TAG_subprogram ]
!121 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !122, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!122 = metadata !{metadata !26, metadata !102, metadata !10}
!123 = metadata !{i32 786478, i32 0, metadata !90, metadata !"my_strlen", metadata !"my_strlen", metadata !"", metadata !90, i32 184, metadata !124, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i8*)* @my_strlen, null, null, metadata !11, i32 186} ; [ DW_TAG_subprogram ]
!124 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !125, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!125 = metadata !{metadata !10, metadata !102}
!126 = metadata !{i32 786478, i32 0, metadata !90, metadata !"exchange", metadata !"exchange", metadata !"", metadata !90, i32 242, metadata !127, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 false, void (i8**)* @exchange, null, null, metadata !11, i32 244} ; [ DW_TAG_subprogram ]
!127 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !128, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!128 = metadata !{null, metadata !129}
!129 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !26} ; [ DW_TAG_pointer_type ]
!130 = metadata !{metadata !131}
!131 = metadata !{metadata !132, metadata !133, metadata !134, metadata !135, metadata !136, metadata !137, metadata !138, metadata !139}
!132 = metadata !{i32 786484, i32 0, null, metadata !"optarg", metadata !"optarg", metadata !"", metadata !90, i32 87, metadata !26, i32 0, i32 1, i8** @optarg} ; [ DW_TAG_variable ]
!133 = metadata !{i32 786484, i32 0, null, metadata !"optind", metadata !"optind", metadata !"", metadata !90, i32 102, metadata !10, i32 0, i32 1, i32* @optind} ; [ DW_TAG_variable ]
!134 = metadata !{i32 786484, i32 0, null, metadata !"opterr", metadata !"opterr", metadata !"", metadata !90, i32 116, metadata !10, i32 0, i32 1, i32* @opterr} ; [ DW_TAG_variable ]
!135 = metadata !{i32 786484, i32 0, null, metadata !"optopt", metadata !"optopt", metadata !"", metadata !90, i32 123, metadata !10, i32 0, i32 1, i32* @optopt} ; [ DW_TAG_variable ]
!136 = metadata !{i32 786484, i32 0, null, metadata !"nextchar", metadata !"nextchar", metadata !"", metadata !90, i32 111, metadata !26, i32 1, i32 1, i8** @nextchar} ; [ DW_TAG_variable ]
!137 = metadata !{i32 786484, i32 0, null, metadata !"ordering", metadata !"ordering", metadata !"", metadata !90, i32 157, metadata !89, i32 1, i32 1, i32* @ordering} ; [ DW_TAG_variable ]
!138 = metadata !{i32 786484, i32 0, null, metadata !"first_nonopt", metadata !"first_nonopt", metadata !"", metadata !90, i32 215, metadata !10, i32 1, i32 1, i32* @first_nonopt} ; [ DW_TAG_variable ]
!139 = metadata !{i32 786484, i32 0, null, metadata !"last_nonopt", metadata !"last_nonopt", metadata !"", metadata !90, i32 216, metadata !10, i32 1, i32 1, i32* @last_nonopt} ; [ DW_TAG_variable ]
!140 = metadata !{i32 786449, i32 0, i32 12, metadata !"inflate.c", metadata !"/home/capsicum/wvd/gzip-1.2.4", metadata !"clang version 3.1 (tags/RELEASE_31/final)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !141, metadata !178} ; [ DW_TAG_compile_unit ]
!141 = metadata !{metadata !142}
!142 = metadata !{metadata !143, metadata !163, metadata !166, metadata !169, metadata !172, metadata !173, metadata !174, metadata !177}
!143 = metadata !{i32 786478, i32 0, metadata !144, metadata !"huft_build", metadata !"huft_build", metadata !"", metadata !144, i32 271, metadata !145, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i32*, i32, i32, i16*, i16*, %struct.huft**, i32*)* @huft_build, null, null, metadata !11, i32 284} ; [ DW_TAG_subprogram ]
!144 = metadata !{i32 786473, metadata !"inflate.c", metadata !"/home/capsicum/wvd/gzip-1.2.4", null} ; [ DW_TAG_file_type ]
!145 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !146, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!146 = metadata !{metadata !10, metadata !147, metadata !19, metadata !19, metadata !148, metadata !148, metadata !150, metadata !112}
!147 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !19} ; [ DW_TAG_pointer_type ]
!148 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !149} ; [ DW_TAG_pointer_type ]
!149 = metadata !{i32 786454, null, metadata !"ush", metadata !144, i32 45, i64 0, i64 0, i64 0, i32 0, metadata !32} ; [ DW_TAG_typedef ]
!150 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !151} ; [ DW_TAG_pointer_type ]
!151 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !152} ; [ DW_TAG_pointer_type ]
!152 = metadata !{i32 786451, null, metadata !"huft", metadata !144, i32 121, i64 128, i64 64, i32 0, i32 0, null, metadata !153, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!153 = metadata !{metadata !154, metadata !157, metadata !158}
!154 = metadata !{i32 786445, metadata !152, metadata !"e", metadata !144, i32 122, i64 8, i64 8, i64 0, i32 0, metadata !155} ; [ DW_TAG_member ]
!155 = metadata !{i32 786454, null, metadata !"uch", metadata !144, i32 44, i64 0, i64 0, i64 0, i32 0, metadata !156} ; [ DW_TAG_typedef ]
!156 = metadata !{i32 786468, null, metadata !"unsigned char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!157 = metadata !{i32 786445, metadata !152, metadata !"b", metadata !144, i32 123, i64 8, i64 8, i64 8, i32 0, metadata !155} ; [ DW_TAG_member ]
!158 = metadata !{i32 786445, metadata !152, metadata !"v", metadata !144, i32 127, i64 64, i64 64, i64 64, i32 0, metadata !159} ; [ DW_TAG_member ]
!159 = metadata !{i32 786455, metadata !152, metadata !"", metadata !144, i32 124, i64 64, i64 64, i64 0, i32 0, null, metadata !160, i32 0, i32 0} ; [ DW_TAG_union_type ]
!160 = metadata !{metadata !161, metadata !162}
!161 = metadata !{i32 786445, metadata !159, metadata !"n", metadata !144, i32 125, i64 16, i64 16, i64 0, i32 0, metadata !149} ; [ DW_TAG_member ]
!162 = metadata !{i32 786445, metadata !159, metadata !"t", metadata !144, i32 126, i64 64, i64 64, i64 0, i32 0, metadata !151} ; [ DW_TAG_member ]
!163 = metadata !{i32 786478, i32 0, metadata !144, metadata !"huft_free", metadata !"huft_free", metadata !"", metadata !144, i32 469, metadata !164, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (%struct.huft*)* @huft_free, null, null, metadata !11, i32 474} ; [ DW_TAG_subprogram ]
!164 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !165, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!165 = metadata !{metadata !10, metadata !151}
!166 = metadata !{i32 786478, i32 0, metadata !144, metadata !"inflate_codes", metadata !"inflate_codes", metadata !"", metadata !144, i32 490, metadata !167, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (%struct.huft*, %struct.huft*, i32, i32)* @inflate_codes, null, null, metadata !11, i32 495} ; [ DW_TAG_subprogram ]
!167 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !168, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!168 = metadata !{metadata !10, metadata !151, metadata !151, metadata !10, metadata !10}
!169 = metadata !{i32 786478, i32 0, metadata !144, metadata !"inflate_stored", metadata !"inflate_stored", metadata !"", metadata !144, i32 599, metadata !170, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @inflate_stored, null, null, metadata !11, i32 601} ; [ DW_TAG_subprogram ]
!170 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !171, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!171 = metadata !{metadata !10}
!172 = metadata !{i32 786478, i32 0, metadata !144, metadata !"inflate_fixed", metadata !"inflate_fixed", metadata !"", metadata !144, i32 652, metadata !170, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @inflate_fixed, null, null, metadata !11, i32 656} ; [ DW_TAG_subprogram ]
!173 = metadata !{i32 786478, i32 0, metadata !144, metadata !"inflate_dynamic", metadata !"inflate_dynamic", metadata !"", metadata !144, i32 703, metadata !170, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @inflate_dynamic, null, null, metadata !11, i32 705} ; [ DW_TAG_subprogram ]
!174 = metadata !{i32 786478, i32 0, metadata !144, metadata !"inflate_block", metadata !"inflate_block", metadata !"", metadata !144, i32 867, metadata !175, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i32*)* @inflate_block, null, null, metadata !11, i32 870} ; [ DW_TAG_subprogram ]
!175 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !176, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!176 = metadata !{metadata !10, metadata !112}
!177 = metadata !{i32 786478, i32 0, metadata !144, metadata !"inflate", metadata !"inflate", metadata !"", metadata !144, i32 913, metadata !170, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @inflate, null, null, metadata !11, i32 915} ; [ DW_TAG_subprogram ]
!178 = metadata !{metadata !179}
!179 = metadata !{metadata !180, metadata !184, metadata !185, metadata !186, metadata !188, metadata !189, metadata !190, metadata !194, metadata !198, metadata !199, metadata !203}
!180 = metadata !{i32 786484, i32 0, null, metadata !"mask_bits", metadata !"mask_bits", metadata !"", metadata !144, i32 209, metadata !181, i32 0, i32 1, [17 x i16]* @mask_bits} ; [ DW_TAG_variable ]
!181 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 272, i64 16, i32 0, i32 0, metadata !149, metadata !182, i32 0, i32 0} ; [ DW_TAG_array_type ]
!182 = metadata !{metadata !183}
!183 = metadata !{i32 786465, i64 0, i64 16}      ; [ DW_TAG_subrange_type ]
!184 = metadata !{i32 786484, i32 0, null, metadata !"lbits", metadata !"lbits", metadata !"", metadata !144, i32 259, metadata !10, i32 0, i32 1, i32* @lbits} ; [ DW_TAG_variable ]
!185 = metadata !{i32 786484, i32 0, null, metadata !"dbits", metadata !"dbits", metadata !"", metadata !144, i32 260, metadata !10, i32 0, i32 1, i32* @dbits} ; [ DW_TAG_variable ]
!186 = metadata !{i32 786484, i32 0, null, metadata !"bb", metadata !"bb", metadata !"", metadata !144, i32 206, metadata !187, i32 0, i32 1, i64* @bb} ; [ DW_TAG_variable ]
!187 = metadata !{i32 786454, null, metadata !"ulg", metadata !144, i32 46, i64 0, i64 0, i64 0, i32 0, metadata !55} ; [ DW_TAG_typedef ]
!188 = metadata !{i32 786484, i32 0, null, metadata !"bk", metadata !"bk", metadata !"", metadata !144, i32 207, metadata !19, i32 0, i32 1, i32* @bk} ; [ DW_TAG_variable ]
!189 = metadata !{i32 786484, i32 0, null, metadata !"hufts", metadata !"hufts", metadata !"", metadata !144, i32 268, metadata !19, i32 0, i32 1, i32* @hufts} ; [ DW_TAG_variable ]
!190 = metadata !{i32 786484, i32 0, null, metadata !"border", metadata !"border", metadata !"", metadata !144, i32 156, metadata !191, i32 1, i32 1, [19 x i32]* @border} ; [ DW_TAG_variable ]
!191 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 608, i64 32, i32 0, i32 0, metadata !19, metadata !192, i32 0, i32 0} ; [ DW_TAG_array_type ]
!192 = metadata !{metadata !193}
!193 = metadata !{i32 786465, i64 0, i64 18}      ; [ DW_TAG_subrange_type ]
!194 = metadata !{i32 786484, i32 0, null, metadata !"cpdext", metadata !"cpdext", metadata !"", metadata !144, i32 169, metadata !195, i32 1, i32 1, [30 x i16]* @cpdext} ; [ DW_TAG_variable ]
!195 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 480, i64 16, i32 0, i32 0, metadata !149, metadata !196, i32 0, i32 0} ; [ DW_TAG_array_type ]
!196 = metadata !{metadata !197}
!197 = metadata !{i32 786465, i64 0, i64 29}      ; [ DW_TAG_subrange_type ]
!198 = metadata !{i32 786484, i32 0, null, metadata !"cpdist", metadata !"cpdist", metadata !"", metadata !144, i32 165, metadata !195, i32 1, i32 1, [30 x i16]* @cpdist} ; [ DW_TAG_variable ]
!199 = metadata !{i32 786484, i32 0, null, metadata !"cplext", metadata !"cplext", metadata !"", metadata !144, i32 162, metadata !200, i32 1, i32 1, [31 x i16]* @cplext} ; [ DW_TAG_variable ]
!200 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 496, i64 16, i32 0, i32 0, metadata !149, metadata !201, i32 0, i32 0} ; [ DW_TAG_array_type ]
!201 = metadata !{metadata !202}
!202 = metadata !{i32 786465, i64 0, i64 30}      ; [ DW_TAG_subrange_type ]
!203 = metadata !{i32 786484, i32 0, null, metadata !"cplens", metadata !"cplens", metadata !"", metadata !144, i32 158, metadata !200, i32 1, i32 1, [31 x i16]* @cplens} ; [ DW_TAG_variable ]
!204 = metadata !{i32 786449, i32 0, i32 12, metadata !"lzw.c", metadata !"/home/capsicum/wvd/gzip-1.2.4", metadata !"clang version 3.1 (tags/RELEASE_31/final)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !205, metadata !211} ; [ DW_TAG_compile_unit ]
!205 = metadata !{metadata !206}
!206 = metadata !{metadata !207}
!207 = metadata !{i32 786478, i32 0, metadata !208, metadata !"lzw", metadata !"lzw", metadata !"", metadata !208, i32 16, metadata !209, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i32, i32)* @lzw, null, null, metadata !11, i32 18} ; [ DW_TAG_subprogram ]
!208 = metadata !{i32 786473, metadata !"lzw.c", metadata !"/home/capsicum/wvd/gzip-1.2.4", null} ; [ DW_TAG_file_type ]
!209 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !210, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!210 = metadata !{metadata !10, metadata !10, metadata !10}
!211 = metadata !{metadata !212}
!212 = metadata !{metadata !213}
!213 = metadata !{i32 786484, i32 0, null, metadata !"msg_done", metadata !"msg_done", metadata !"", metadata !208, i32 13, metadata !10, i32 1, i32 1, i32* @msg_done} ; [ DW_TAG_variable ]
!214 = metadata !{i32 786449, i32 0, i32 12, metadata !"trees.c", metadata !"/home/capsicum/wvd/gzip-1.2.4", metadata !"clang version 3.1 (tags/RELEASE_31/final)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !215, metadata !272} ; [ DW_TAG_compile_unit ]
!215 = metadata !{metadata !216}
!216 = metadata !{metadata !217, metadata !223, metadata !227, metadata !228, metadata !229, metadata !246, metadata !249, metadata !252, metadata !253, metadata !254, metadata !268, metadata !269, metadata !270, metadata !271}
!217 = metadata !{i32 786478, i32 0, metadata !218, metadata !"ct_init", metadata !"ct_init", metadata !"", metadata !218, i32 332, metadata !219, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, void (i16*, i32*)* @ct_init, null, null, metadata !11, i32 335} ; [ DW_TAG_subprogram ]
!218 = metadata !{i32 786473, metadata !"trees.c", metadata !"/home/capsicum/wvd/gzip-1.2.4", null} ; [ DW_TAG_file_type ]
!219 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !220, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!220 = metadata !{null, metadata !221, metadata !112}
!221 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !222} ; [ DW_TAG_pointer_type ]
!222 = metadata !{i32 786454, null, metadata !"ush", metadata !218, i32 45, i64 0, i64 0, i64 0, i32 0, metadata !32} ; [ DW_TAG_typedef ]
!223 = metadata !{i32 786478, i32 0, metadata !218, metadata !"flush_block", metadata !"flush_block", metadata !"", metadata !218, i32 853, metadata !224, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i64 (i8*, i64, i32)* @flush_block, null, null, metadata !11, i32 857} ; [ DW_TAG_subprogram ]
!224 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !225, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!225 = metadata !{metadata !226, metadata !26, metadata !226, metadata !10}
!226 = metadata !{i32 786454, null, metadata !"ulg", metadata !218, i32 46, i64 0, i64 0, i64 0, i32 0, metadata !55} ; [ DW_TAG_typedef ]
!227 = metadata !{i32 786478, i32 0, metadata !218, metadata !"ct_tally", metadata !"ct_tally", metadata !"", metadata !218, i32 958, metadata !209, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i32, i32)* @ct_tally, null, null, metadata !11, i32 961} ; [ DW_TAG_subprogram ]
!228 = metadata !{i32 786478, i32 0, metadata !218, metadata !"set_file_type", metadata !"set_file_type", metadata !"", metadata !218, i32 1063, metadata !21, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @set_file_type, null, null, metadata !11, i32 1064} ; [ DW_TAG_subprogram ]
!229 = metadata !{i32 786478, i32 0, metadata !218, metadata !"compress_block", metadata !"compress_block", metadata !"", metadata !218, i32 1011, metadata !230, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 false, void (%struct.ct_data*, %struct.ct_data*)* @compress_block, null, null, metadata !11, i32 1014} ; [ DW_TAG_subprogram ]
!230 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !231, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!231 = metadata !{null, metadata !232, metadata !232}
!232 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !233} ; [ DW_TAG_pointer_type ]
!233 = metadata !{i32 786454, null, metadata !"ct_data", metadata !218, i32 169, i64 0, i64 0, i64 0, i32 0, metadata !234} ; [ DW_TAG_typedef ]
!234 = metadata !{i32 786451, null, metadata !"ct_data", metadata !218, i32 160, i64 32, i64 16, i32 0, i32 0, null, metadata !235, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!235 = metadata !{metadata !236, metadata !241}
!236 = metadata !{i32 786445, metadata !234, metadata !"fc", metadata !218, i32 164, i64 16, i64 16, i64 0, i32 0, metadata !237} ; [ DW_TAG_member ]
!237 = metadata !{i32 786455, metadata !234, metadata !"", metadata !218, i32 161, i64 16, i64 16, i64 0, i32 0, null, metadata !238, i32 0, i32 0} ; [ DW_TAG_union_type ]
!238 = metadata !{metadata !239, metadata !240}
!239 = metadata !{i32 786445, metadata !237, metadata !"freq", metadata !218, i32 162, i64 16, i64 16, i64 0, i32 0, metadata !222} ; [ DW_TAG_member ]
!240 = metadata !{i32 786445, metadata !237, metadata !"code", metadata !218, i32 163, i64 16, i64 16, i64 0, i32 0, metadata !222} ; [ DW_TAG_member ]
!241 = metadata !{i32 786445, metadata !234, metadata !"dl", metadata !218, i32 168, i64 16, i64 16, i64 16, i32 0, metadata !242} ; [ DW_TAG_member ]
!242 = metadata !{i32 786455, metadata !234, metadata !"", metadata !218, i32 165, i64 16, i64 16, i64 0, i32 0, null, metadata !243, i32 0, i32 0} ; [ DW_TAG_union_type ]
!243 = metadata !{metadata !244, metadata !245}
!244 = metadata !{i32 786445, metadata !242, metadata !"dad", metadata !218, i32 166, i64 16, i64 16, i64 0, i32 0, metadata !222} ; [ DW_TAG_member ]
!245 = metadata !{i32 786445, metadata !242, metadata !"len", metadata !218, i32 167, i64 16, i64 16, i64 0, i32 0, metadata !222} ; [ DW_TAG_member ]
!246 = metadata !{i32 786478, i32 0, metadata !218, metadata !"send_all_trees", metadata !"send_all_trees", metadata !"", metadata !218, i32 823, metadata !247, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 false, void (i32, i32, i32)* @send_all_trees, null, null, metadata !11, i32 825} ; [ DW_TAG_subprogram ]
!247 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !248, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!248 = metadata !{null, metadata !10, metadata !10, metadata !10}
!249 = metadata !{i32 786478, i32 0, metadata !218, metadata !"send_tree", metadata !"send_tree", metadata !"", metadata !218, i32 740, metadata !250, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 false, void (%struct.ct_data*, i32)* @send_tree, null, null, metadata !11, i32 743} ; [ DW_TAG_subprogram ]
!250 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !251, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!251 = metadata !{null, metadata !232, metadata !10}
!252 = metadata !{i32 786478, i32 0, metadata !218, metadata !"build_bl_tree", metadata !"build_bl_tree", metadata !"", metadata !218, i32 790, metadata !170, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @build_bl_tree, null, null, metadata !11, i32 791} ; [ DW_TAG_subprogram ]
!253 = metadata !{i32 786478, i32 0, metadata !218, metadata !"scan_tree", metadata !"scan_tree", metadata !"", metadata !218, i32 696, metadata !250, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 false, void (%struct.ct_data*, i32)* @scan_tree, null, null, metadata !11, i32 699} ; [ DW_TAG_subprogram ]
!254 = metadata !{i32 786478, i32 0, metadata !218, metadata !"build_tree", metadata !"build_tree", metadata !"", metadata !218, i32 609, metadata !255, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 false, void (%struct.tree_desc*)* @build_tree, null, null, metadata !11, i32 611} ; [ DW_TAG_subprogram ]
!255 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !256, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!256 = metadata !{null, metadata !257}
!257 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !258} ; [ DW_TAG_pointer_type ]
!258 = metadata !{i32 786454, null, metadata !"tree_desc", metadata !218, i32 205, i64 0, i64 0, i64 0, i32 0, metadata !259} ; [ DW_TAG_typedef ]
!259 = metadata !{i32 786451, null, metadata !"tree_desc", metadata !218, i32 197, i64 320, i64 64, i32 0, i32 0, null, metadata !260, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!260 = metadata !{metadata !261, metadata !262, metadata !263, metadata !264, metadata !265, metadata !266, metadata !267}
!261 = metadata !{i32 786445, metadata !259, metadata !"dyn_tree", metadata !218, i32 198, i64 64, i64 64, i64 0, i32 0, metadata !232} ; [ DW_TAG_member ]
!262 = metadata !{i32 786445, metadata !259, metadata !"static_tree", metadata !218, i32 199, i64 64, i64 64, i64 64, i32 0, metadata !232} ; [ DW_TAG_member ]
!263 = metadata !{i32 786445, metadata !259, metadata !"extra_bits", metadata !218, i32 200, i64 64, i64 64, i64 128, i32 0, metadata !112} ; [ DW_TAG_member ]
!264 = metadata !{i32 786445, metadata !259, metadata !"extra_base", metadata !218, i32 201, i64 32, i64 32, i64 192, i32 0, metadata !10} ; [ DW_TAG_member ]
!265 = metadata !{i32 786445, metadata !259, metadata !"elems", metadata !218, i32 202, i64 32, i64 32, i64 224, i32 0, metadata !10} ; [ DW_TAG_member ]
!266 = metadata !{i32 786445, metadata !259, metadata !"max_length", metadata !218, i32 203, i64 32, i64 32, i64 256, i32 0, metadata !10} ; [ DW_TAG_member ]
!267 = metadata !{i32 786445, metadata !259, metadata !"max_code", metadata !218, i32 204, i64 32, i64 32, i64 288, i32 0, metadata !10} ; [ DW_TAG_member ]
!268 = metadata !{i32 786478, i32 0, metadata !218, metadata !"gen_bitlen", metadata !"gen_bitlen", metadata !"", metadata !218, i32 483, metadata !255, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 false, void (%struct.tree_desc*)* @gen_bitlen, null, null, metadata !11, i32 485} ; [ DW_TAG_subprogram ]
!269 = metadata !{i32 786478, i32 0, metadata !218, metadata !"pqdownheap", metadata !"pqdownheap", metadata !"", metadata !218, i32 451, metadata !250, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 false, void (%struct.ct_data*, i32)* @pqdownheap, null, null, metadata !11, i32 454} ; [ DW_TAG_subprogram ]
!270 = metadata !{i32 786478, i32 0, metadata !218, metadata !"gen_codes", metadata !"gen_codes", metadata !"", metadata !218, i32 568, metadata !250, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 false, void (%struct.ct_data*, i32)* @gen_codes, null, null, metadata !11, i32 571} ; [ DW_TAG_subprogram ]
!271 = metadata !{i32 786478, i32 0, metadata !218, metadata !"init_block", metadata !"init_block", metadata !"", metadata !218, i32 407, metadata !21, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @init_block, null, null, metadata !11, i32 408} ; [ DW_TAG_subprogram ]
!272 = metadata !{metadata !273}
!273 = metadata !{metadata !274, metadata !278, metadata !282, metadata !286, metadata !288, metadata !292, metadata !297, metadata !301, metadata !305, metadata !307, metadata !311, metadata !312, metadata !313, metadata !314, metadata !315, metadata !316, metadata !317, metadata !318, metadata !319, metadata !320, metadata !321, metadata !322, metadata !326, metadata !328, metadata !329, metadata !331, metadata !332, metadata !333, metadata !335, metadata !337, metadata !338, metadata !339, metadata !340}
!274 = metadata !{i32 786484, i32 0, null, metadata !"dyn_ltree", metadata !"dyn_ltree", metadata !"", metadata !218, i32 179, metadata !275, i32 1, i32 1, [573 x %struct.ct_data]* @dyn_ltree} ; [ DW_TAG_variable ]
!275 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 18336, i64 16, i32 0, i32 0, metadata !233, metadata !276, i32 0, i32 0} ; [ DW_TAG_array_type ]
!276 = metadata !{metadata !277}
!277 = metadata !{i32 786465, i64 0, i64 572}     ; [ DW_TAG_subrange_type ]
!278 = metadata !{i32 786484, i32 0, null, metadata !"dyn_dtree", metadata !"dyn_dtree", metadata !"", metadata !218, i32 180, metadata !279, i32 1, i32 1, [61 x %struct.ct_data]* @dyn_dtree} ; [ DW_TAG_variable ]
!279 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 1952, i64 16, i32 0, i32 0, metadata !233, metadata !280, i32 0, i32 0} ; [ DW_TAG_array_type ]
!280 = metadata !{metadata !281}
!281 = metadata !{i32 786465, i64 0, i64 60}      ; [ DW_TAG_subrange_type ]
!282 = metadata !{i32 786484, i32 0, null, metadata !"static_ltree", metadata !"static_ltree", metadata !"", metadata !218, i32 182, metadata !283, i32 1, i32 1, [288 x %struct.ct_data]* @static_ltree} ; [ DW_TAG_variable ]
!283 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 9216, i64 16, i32 0, i32 0, metadata !233, metadata !284, i32 0, i32 0} ; [ DW_TAG_array_type ]
!284 = metadata !{metadata !285}
!285 = metadata !{i32 786465, i64 0, i64 287}     ; [ DW_TAG_subrange_type ]
!286 = metadata !{i32 786484, i32 0, null, metadata !"static_dtree", metadata !"static_dtree", metadata !"", metadata !218, i32 189, metadata !287, i32 1, i32 1, [30 x %struct.ct_data]* @static_dtree} ; [ DW_TAG_variable ]
!287 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 960, i64 16, i32 0, i32 0, metadata !233, metadata !196, i32 0, i32 0} ; [ DW_TAG_array_type ]
!288 = metadata !{i32 786484, i32 0, null, metadata !"bl_count", metadata !"bl_count", metadata !"", metadata !218, i32 217, metadata !289, i32 1, i32 1, [16 x i16]* @bl_count} ; [ DW_TAG_variable ]
!289 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 256, i64 16, i32 0, i32 0, metadata !222, metadata !290, i32 0, i32 0} ; [ DW_TAG_array_type ]
!290 = metadata !{metadata !291}
!291 = metadata !{i32 786465, i64 0, i64 15}      ; [ DW_TAG_subrange_type ]
!292 = metadata !{i32 786484, i32 0, null, metadata !"length_code", metadata !"length_code", metadata !"", metadata !218, i32 236, metadata !293, i32 1, i32 1, [256 x i8]* @length_code} ; [ DW_TAG_variable ]
!293 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 2048, i64 8, i32 0, i32 0, metadata !294, metadata !295, i32 0, i32 0} ; [ DW_TAG_array_type ]
!294 = metadata !{i32 786454, null, metadata !"uch", metadata !218, i32 44, i64 0, i64 0, i64 0, i32 0, metadata !156} ; [ DW_TAG_typedef ]
!295 = metadata !{metadata !296}
!296 = metadata !{i32 786465, i64 0, i64 255}     ; [ DW_TAG_subrange_type ]
!297 = metadata !{i32 786484, i32 0, null, metadata !"dist_code", metadata !"dist_code", metadata !"", metadata !218, i32 239, metadata !298, i32 1, i32 1, [512 x i8]* @dist_code} ; [ DW_TAG_variable ]
!298 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 4096, i64 8, i32 0, i32 0, metadata !294, metadata !299, i32 0, i32 0} ; [ DW_TAG_array_type ]
!299 = metadata !{metadata !300}
!300 = metadata !{i32 786465, i64 0, i64 511}     ; [ DW_TAG_subrange_type ]
!301 = metadata !{i32 786484, i32 0, null, metadata !"base_length", metadata !"base_length", metadata !"", metadata !218, i32 245, metadata !302, i32 1, i32 1, [29 x i32]* @base_length} ; [ DW_TAG_variable ]
!302 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 928, i64 32, i32 0, i32 0, metadata !10, metadata !303, i32 0, i32 0} ; [ DW_TAG_array_type ]
!303 = metadata !{metadata !304}
!304 = metadata !{i32 786465, i64 0, i64 28}      ; [ DW_TAG_subrange_type ]
!305 = metadata !{i32 786484, i32 0, null, metadata !"base_dist", metadata !"base_dist", metadata !"", metadata !218, i32 248, metadata !306, i32 1, i32 1, [30 x i32]* @base_dist} ; [ DW_TAG_variable ]
!306 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 960, i64 32, i32 0, i32 0, metadata !10, metadata !196, i32 0, i32 0} ; [ DW_TAG_array_type ]
!307 = metadata !{i32 786484, i32 0, null, metadata !"flag_buf", metadata !"flag_buf", metadata !"", metadata !218, i32 256, metadata !308, i32 1, i32 1, [4096 x i8]* @flag_buf} ; [ DW_TAG_variable ]
!308 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 32768, i64 8, i32 0, i32 0, metadata !294, metadata !309, i32 0, i32 0} ; [ DW_TAG_array_type ]
!309 = metadata !{metadata !310}
!310 = metadata !{i32 786465, i64 0, i64 4095}    ; [ DW_TAG_subrange_type ]
!311 = metadata !{i32 786484, i32 0, null, metadata !"last_lit", metadata !"last_lit", metadata !"", metadata !218, i32 261, metadata !19, i32 1, i32 1, i32* @last_lit} ; [ DW_TAG_variable ]
!312 = metadata !{i32 786484, i32 0, null, metadata !"last_dist", metadata !"last_dist", metadata !"", metadata !218, i32 262, metadata !19, i32 1, i32 1, i32* @last_dist} ; [ DW_TAG_variable ]
!313 = metadata !{i32 786484, i32 0, null, metadata !"last_flags", metadata !"last_flags", metadata !"", metadata !218, i32 263, metadata !19, i32 1, i32 1, i32* @last_flags} ; [ DW_TAG_variable ]
!314 = metadata !{i32 786484, i32 0, null, metadata !"flags", metadata !"flags", metadata !"", metadata !218, i32 264, metadata !294, i32 1, i32 1, i8* @flags} ; [ DW_TAG_variable ]
!315 = metadata !{i32 786484, i32 0, null, metadata !"flag_bit", metadata !"flag_bit", metadata !"", metadata !218, i32 265, metadata !294, i32 1, i32 1, i8* @flag_bit} ; [ DW_TAG_variable ]
!316 = metadata !{i32 786484, i32 0, null, metadata !"opt_len", metadata !"opt_len", metadata !"", metadata !218, i32 271, metadata !226, i32 1, i32 1, i64* @opt_len} ; [ DW_TAG_variable ]
!317 = metadata !{i32 786484, i32 0, null, metadata !"static_len", metadata !"static_len", metadata !"", metadata !218, i32 272, metadata !226, i32 1, i32 1, i64* @static_len} ; [ DW_TAG_variable ]
!318 = metadata !{i32 786484, i32 0, null, metadata !"compressed_len", metadata !"compressed_len", metadata !"", metadata !218, i32 274, metadata !226, i32 1, i32 1, i64* @compressed_len} ; [ DW_TAG_variable ]
!319 = metadata !{i32 786484, i32 0, null, metadata !"input_len", metadata !"input_len", metadata !"", metadata !218, i32 276, metadata !226, i32 1, i32 1, i64* @input_len} ; [ DW_TAG_variable ]
!320 = metadata !{i32 786484, i32 0, null, metadata !"file_type", metadata !"file_type", metadata !"", metadata !218, i32 279, metadata !221, i32 0, i32 1, i16** @file_type} ; [ DW_TAG_variable ]
!321 = metadata !{i32 786484, i32 0, null, metadata !"file_method", metadata !"file_method", metadata !"", metadata !218, i32 280, metadata !112, i32 0, i32 1, i32** @file_method} ; [ DW_TAG_variable ]
!322 = metadata !{i32 786484, i32 0, null, metadata !"bl_tree", metadata !"bl_tree", metadata !"", metadata !218, i32 194, metadata !323, i32 1, i32 1, [39 x %struct.ct_data]* @bl_tree} ; [ DW_TAG_variable ]
!323 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 1248, i64 16, i32 0, i32 0, metadata !233, metadata !324, i32 0, i32 0} ; [ DW_TAG_array_type ]
!324 = metadata !{metadata !325}
!325 = metadata !{i32 786465, i64 0, i64 38}      ; [ DW_TAG_subrange_type ]
!326 = metadata !{i32 786484, i32 0, null, metadata !"bl_order", metadata !"bl_order", metadata !"", metadata !218, i32 220, metadata !327, i32 1, i32 1, [19 x i8]* @bl_order} ; [ DW_TAG_variable ]
!327 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 152, i64 8, i32 0, i32 0, metadata !294, metadata !192, i32 0, i32 0} ; [ DW_TAG_array_type ]
!328 = metadata !{i32 786484, i32 0, null, metadata !"bl_desc", metadata !"bl_desc", metadata !"", metadata !218, i32 213, metadata !258, i32 1, i32 1, %struct.tree_desc* @bl_desc} ; [ DW_TAG_variable ]
!329 = metadata !{i32 786484, i32 0, null, metadata !"extra_blbits", metadata !"extra_blbits", metadata !"", metadata !218, i32 100, metadata !330, i32 1, i32 1, [19 x i32]* @extra_blbits} ; [ DW_TAG_variable ]
!330 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 608, i64 32, i32 0, i32 0, metadata !10, metadata !192, i32 0, i32 0} ; [ DW_TAG_array_type ]
!331 = metadata !{i32 786484, i32 0, null, metadata !"d_desc", metadata !"d_desc", metadata !"", metadata !218, i32 210, metadata !258, i32 1, i32 1, %struct.tree_desc* @d_desc} ; [ DW_TAG_variable ]
!332 = metadata !{i32 786484, i32 0, null, metadata !"l_desc", metadata !"l_desc", metadata !"", metadata !218, i32 207, metadata !258, i32 1, i32 1, %struct.tree_desc* @l_desc} ; [ DW_TAG_variable ]
!333 = metadata !{i32 786484, i32 0, null, metadata !"depth", metadata !"depth", metadata !"", metadata !218, i32 233, metadata !334, i32 1, i32 1, [573 x i8]* @depth} ; [ DW_TAG_variable ]
!334 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 4584, i64 8, i32 0, i32 0, metadata !294, metadata !276, i32 0, i32 0} ; [ DW_TAG_array_type ]
!335 = metadata !{i32 786484, i32 0, null, metadata !"heap", metadata !"heap", metadata !"", metadata !218, i32 226, metadata !336, i32 1, i32 1, [573 x i32]* @heap} ; [ DW_TAG_variable ]
!336 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 18336, i64 32, i32 0, i32 0, metadata !10, metadata !276, i32 0, i32 0} ; [ DW_TAG_array_type ]
!337 = metadata !{i32 786484, i32 0, null, metadata !"heap_max", metadata !"heap_max", metadata !"", metadata !218, i32 228, metadata !10, i32 1, i32 1, i32* @heap_max} ; [ DW_TAG_variable ]
!338 = metadata !{i32 786484, i32 0, null, metadata !"heap_len", metadata !"heap_len", metadata !"", metadata !218, i32 227, metadata !10, i32 1, i32 1, i32* @heap_len} ; [ DW_TAG_variable ]
!339 = metadata !{i32 786484, i32 0, null, metadata !"extra_dbits", metadata !"extra_dbits", metadata !"", metadata !218, i32 97, metadata !306, i32 1, i32 1, [30 x i32]* @extra_dbits} ; [ DW_TAG_variable ]
!340 = metadata !{i32 786484, i32 0, null, metadata !"extra_lbits", metadata !"extra_lbits", metadata !"", metadata !218, i32 94, metadata !302, i32 1, i32 1, [29 x i32]* @extra_lbits} ; [ DW_TAG_variable ]
!341 = metadata !{i32 786449, i32 0, i32 12, metadata !"unlzh.c", metadata !"/home/capsicum/wvd/gzip-1.2.4", metadata !"clang version 3.1 (tags/RELEASE_31/final)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !342, metadata !371} ; [ DW_TAG_compile_unit ]
!342 = metadata !{metadata !343}
!343 = metadata !{metadata !344, metadata !346, metadata !351, metadata !354, metadata !357, metadata !360, metadata !361, metadata !362, metadata !367, metadata !368, metadata !369, metadata !370}
!344 = metadata !{i32 786478, i32 0, metadata !345, metadata !"unlzh", metadata !"unlzh", metadata !"", metadata !345, i32 385, metadata !209, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i32, i32)* @unlzh, null, null, metadata !11, i32 388} ; [ DW_TAG_subprogram ]
!345 = metadata !{i32 786473, metadata !"unlzh.c", metadata !"/home/capsicum/wvd/gzip-1.2.4", null} ; [ DW_TAG_file_type ]
!346 = metadata !{i32 786478, i32 0, metadata !345, metadata !"decode", metadata !"decode", metadata !"", metadata !345, i32 339, metadata !347, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i32, i8*)* @decode, null, null, metadata !11, i32 350} ; [ DW_TAG_subprogram ]
!347 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !348, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!348 = metadata !{metadata !19, metadata !19, metadata !349}
!349 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !350} ; [ DW_TAG_pointer_type ]
!350 = metadata !{i32 786454, null, metadata !"uch", metadata !345, i32 44, i64 0, i64 0, i64 0, i32 0, metadata !156} ; [ DW_TAG_typedef ]
!351 = metadata !{i32 786478, i32 0, metadata !345, metadata !"decode_p", metadata !"decode_p", metadata !"", metadata !345, i32 300, metadata !352, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @decode_p, null, null, metadata !11, i32 301} ; [ DW_TAG_subprogram ]
!352 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !353, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!353 = metadata !{metadata !19}
!354 = metadata !{i32 786478, i32 0, metadata !345, metadata !"getbits", metadata !"getbits", metadata !"", metadata !345, i32 122, metadata !355, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i32)* @getbits, null, null, metadata !11, i32 124} ; [ DW_TAG_subprogram ]
!355 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !356, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!356 = metadata !{metadata !19, metadata !10}
!357 = metadata !{i32 786478, i32 0, metadata !345, metadata !"fillbuf", metadata !"fillbuf", metadata !"", metadata !345, i32 109, metadata !358, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 false, void (i32)* @fillbuf, null, null, metadata !11, i32 111} ; [ DW_TAG_subprogram ]
!358 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !359, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!359 = metadata !{null, metadata !10}
!360 = metadata !{i32 786478, i32 0, metadata !345, metadata !"decode_c", metadata !"decode_c", metadata !"", metadata !345, i32 273, metadata !352, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @decode_c, null, null, metadata !11, i32 274} ; [ DW_TAG_subprogram ]
!361 = metadata !{i32 786478, i32 0, metadata !345, metadata !"read_c_len", metadata !"read_c_len", metadata !"", metadata !345, i32 238, metadata !21, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @read_c_len, null, null, metadata !11, i32 239} ; [ DW_TAG_subprogram ]
!362 = metadata !{i32 786478, i32 0, metadata !345, metadata !"make_table", metadata !"make_table", metadata !"", metadata !345, i32 141, metadata !363, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 false, void (i32, i8*, i32, i16*)* @make_table, null, null, metadata !11, i32 146} ; [ DW_TAG_subprogram ]
!363 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !364, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!364 = metadata !{null, metadata !10, metadata !349, metadata !10, metadata !365}
!365 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !366} ; [ DW_TAG_pointer_type ]
!366 = metadata !{i32 786454, null, metadata !"ush", metadata !345, i32 45, i64 0, i64 0, i64 0, i32 0, metadata !32} ; [ DW_TAG_typedef ]
!367 = metadata !{i32 786478, i32 0, metadata !345, metadata !"read_pt_len", metadata !"read_pt_len", metadata !"", metadata !345, i32 205, metadata !247, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 false, void (i32, i32, i32)* @read_pt_len, null, null, metadata !11, i32 209} ; [ DW_TAG_subprogram ]
!368 = metadata !{i32 786478, i32 0, metadata !345, metadata !"decode_start", metadata !"decode_start", metadata !"", metadata !345, i32 330, metadata !21, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @decode_start, null, null, metadata !11, i32 331} ; [ DW_TAG_subprogram ]
!369 = metadata !{i32 786478, i32 0, metadata !345, metadata !"huf_decode_start", metadata !"huf_decode_start", metadata !"", metadata !345, i32 318, metadata !21, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @huf_decode_start, null, null, metadata !11, i32 319} ; [ DW_TAG_subprogram ]
!370 = metadata !{i32 786478, i32 0, metadata !345, metadata !"init_getbits", metadata !"init_getbits", metadata !"", metadata !345, i32 131, metadata !21, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @init_getbits, null, null, metadata !11, i32 132} ; [ DW_TAG_subprogram ]
!371 = metadata !{metadata !372}
!372 = metadata !{metadata !373, metadata !374, metadata !375, metadata !377, metadata !378, metadata !379, metadata !381, metadata !382, metadata !383}
!373 = metadata !{i32 786484, i32 0, null, metadata !"done", metadata !"done", metadata !"", metadata !345, i32 328, metadata !10, i32 1, i32 1, i32* @done} ; [ DW_TAG_variable ]
!374 = metadata !{i32 786484, i32 0, metadata !346, metadata !"i", metadata !"i", metadata !"", metadata !345, i32 351, metadata !19, i32 1, i32 1, i32* @decode.i} ; [ DW_TAG_variable ]
!375 = metadata !{i32 786484, i32 0, null, metadata !"pt_len", metadata !"pt_len", metadata !"", metadata !345, i32 91, metadata !376, i32 1, i32 1, [19 x i8]* @pt_len} ; [ DW_TAG_variable ]
!376 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 152, i64 8, i32 0, i32 0, metadata !350, metadata !192, i32 0, i32 0} ; [ DW_TAG_array_type ]
!377 = metadata !{i32 786484, i32 0, null, metadata !"subbitbuf", metadata !"subbitbuf", metadata !"", metadata !345, i32 106, metadata !19, i32 1, i32 1, i32* @subbitbuf} ; [ DW_TAG_variable ]
!378 = metadata !{i32 786484, i32 0, null, metadata !"bitcount", metadata !"bitcount", metadata !"", metadata !345, i32 107, metadata !10, i32 1, i32 1, i32* @bitcount} ; [ DW_TAG_variable ]
!379 = metadata !{i32 786484, i32 0, null, metadata !"pt_table", metadata !"pt_table", metadata !"", metadata !345, i32 93, metadata !380, i32 1, i32 1, [256 x i16]* @pt_table} ; [ DW_TAG_variable ]
!380 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 4096, i64 16, i32 0, i32 0, metadata !366, metadata !295, i32 0, i32 0} ; [ DW_TAG_array_type ]
!381 = metadata !{i32 786484, i32 0, null, metadata !"bitbuf", metadata !"bitbuf", metadata !"", metadata !345, i32 105, metadata !366, i32 1, i32 1, i16* @bitbuf} ; [ DW_TAG_variable ]
!382 = metadata !{i32 786484, i32 0, null, metadata !"blocksize", metadata !"blocksize", metadata !"", metadata !345, i32 92, metadata !19, i32 1, i32 1, i32* @blocksize} ; [ DW_TAG_variable ]
!383 = metadata !{i32 786484, i32 0, null, metadata !"j", metadata !"j", metadata !"", metadata !345, i32 327, metadata !10, i32 1, i32 1, i32* @j} ; [ DW_TAG_variable ]
!384 = metadata !{i32 786449, i32 0, i32 12, metadata !"unlzw.c", metadata !"/home/capsicum/wvd/gzip-1.2.4", metadata !"clang version 3.1 (tags/RELEASE_31/final)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !385, metadata !389} ; [ DW_TAG_compile_unit ]
!385 = metadata !{metadata !386}
!386 = metadata !{metadata !387}
!387 = metadata !{i32 786478, i32 0, metadata !388, metadata !"unlzw", metadata !"unlzw", metadata !"", metadata !388, i32 192, metadata !209, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i32, i32)* @unlzw, null, null, metadata !11, i32 194} ; [ DW_TAG_subprogram ]
!388 = metadata !{i32 786473, metadata !"unlzw.c", metadata !"/home/capsicum/wvd/gzip-1.2.4", null} ; [ DW_TAG_file_type ]
!389 = metadata !{metadata !390}
!390 = metadata !{metadata !391}
!391 = metadata !{i32 786484, i32 0, null, metadata !"block_mode", metadata !"block_mode", metadata !"", metadata !388, i32 181, metadata !10, i32 0, i32 1, i32* @block_mode} ; [ DW_TAG_variable ]
!392 = metadata !{i32 786449, i32 0, i32 12, metadata !"unpack.c", metadata !"/home/capsicum/wvd/gzip-1.2.4", metadata !"clang version 3.1 (tags/RELEASE_31/final)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !393, metadata !399} ; [ DW_TAG_compile_unit ]
!393 = metadata !{metadata !394}
!394 = metadata !{metadata !395, metadata !397, metadata !398}
!395 = metadata !{i32 786478, i32 0, metadata !396, metadata !"unpack", metadata !"unpack", metadata !"", metadata !396, i32 185, metadata !209, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i32, i32)* @unpack, null, null, metadata !11, i32 187} ; [ DW_TAG_subprogram ]
!396 = metadata !{i32 786473, metadata !"unpack.c", metadata !"/home/capsicum/wvd/gzip-1.2.4", null} ; [ DW_TAG_file_type ]
!397 = metadata !{i32 786478, i32 0, metadata !396, metadata !"build_tree", metadata !"build_tree", metadata !"", metadata !396, i32 145, metadata !21, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @build_tree30, null, null, metadata !11, i32 146} ; [ DW_TAG_subprogram ]
!398 = metadata !{i32 786478, i32 0, metadata !396, metadata !"read_tree", metadata !"read_tree", metadata !"", metadata !396, i32 94, metadata !21, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @read_tree, null, null, metadata !11, i32 95} ; [ DW_TAG_subprogram ]
!399 = metadata !{metadata !400}
!400 = metadata !{metadata !401, metadata !403, metadata !404, metadata !407, metadata !411, metadata !412, metadata !413, metadata !414, metadata !415}
!401 = metadata !{i32 786484, i32 0, null, metadata !"orig_len", metadata !"orig_len", metadata !"", metadata !396, i32 32, metadata !402, i32 1, i32 1, i64* @orig_len} ; [ DW_TAG_variable ]
!402 = metadata !{i32 786454, null, metadata !"ulg", metadata !396, i32 46, i64 0, i64 0, i64 0, i32 0, metadata !55} ; [ DW_TAG_typedef ]
!403 = metadata !{i32 786484, i32 0, null, metadata !"max_len", metadata !"max_len", metadata !"", metadata !396, i32 33, metadata !10, i32 1, i32 1, i32* @max_len} ; [ DW_TAG_variable ]
!404 = metadata !{i32 786484, i32 0, null, metadata !"literal", metadata !"literal", metadata !"", metadata !396, i32 35, metadata !405, i32 1, i32 1, [256 x i8]* @literal} ; [ DW_TAG_variable ]
!405 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 2048, i64 8, i32 0, i32 0, metadata !406, metadata !295, i32 0, i32 0} ; [ DW_TAG_array_type ]
!406 = metadata !{i32 786454, null, metadata !"uch", metadata !396, i32 44, i64 0, i64 0, i64 0, i32 0, metadata !156} ; [ DW_TAG_typedef ]
!407 = metadata !{i32 786484, i32 0, null, metadata !"lit_base", metadata !"lit_base", metadata !"", metadata !396, i32 40, metadata !408, i32 1, i32 1, [26 x i32]* @lit_base} ; [ DW_TAG_variable ]
!408 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 832, i64 32, i32 0, i32 0, metadata !10, metadata !409, i32 0, i32 0} ; [ DW_TAG_array_type ]
!409 = metadata !{metadata !410}
!410 = metadata !{i32 786465, i64 0, i64 25}      ; [ DW_TAG_subrange_type ]
!411 = metadata !{i32 786484, i32 0, null, metadata !"leaves", metadata !"leaves", metadata !"", metadata !396, i32 46, metadata !408, i32 1, i32 1, [26 x i32]* @leaves} ; [ DW_TAG_variable ]
!412 = metadata !{i32 786484, i32 0, null, metadata !"parents", metadata !"parents", metadata !"", metadata !396, i32 47, metadata !408, i32 1, i32 1, [26 x i32]* @parents} ; [ DW_TAG_variable ]
!413 = metadata !{i32 786484, i32 0, null, metadata !"peek_bits", metadata !"peek_bits", metadata !"", metadata !396, i32 49, metadata !10, i32 1, i32 1, i32* @peek_bits} ; [ DW_TAG_variable ]
!414 = metadata !{i32 786484, i32 0, null, metadata !"bitbuf", metadata !"bitbuf", metadata !"", metadata !396, i32 64, metadata !402, i32 1, i32 1, i64* @bitbuf26} ; [ DW_TAG_variable ]
!415 = metadata !{i32 786484, i32 0, null, metadata !"valid", metadata !"valid", metadata !"", metadata !396, i32 67, metadata !10, i32 1, i32 1, i32* @valid} ; [ DW_TAG_variable ]
!416 = metadata !{i32 786449, i32 0, i32 12, metadata !"unzip.c", metadata !"/home/capsicum/wvd/gzip-1.2.4", metadata !"clang version 3.1 (tags/RELEASE_31/final)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !417, metadata !424} ; [ DW_TAG_compile_unit ]
!417 = metadata !{metadata !418}
!418 = metadata !{metadata !419, metadata !423}
!419 = metadata !{i32 786478, i32 0, metadata !420, metadata !"check_zipfile", metadata !"check_zipfile", metadata !"", metadata !420, i32 51, metadata !421, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i32)* @check_zipfile, null, null, metadata !11, i32 53} ; [ DW_TAG_subprogram ]
!420 = metadata !{i32 786473, metadata !"unzip.c", metadata !"/home/capsicum/wvd/gzip-1.2.4", null} ; [ DW_TAG_file_type ]
!421 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !422, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!422 = metadata !{metadata !10, metadata !10}
!423 = metadata !{i32 786478, i32 0, metadata !420, metadata !"unzip", metadata !"unzip", metadata !"", metadata !420, i32 99, metadata !209, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i32, i32)* @unzip, null, null, metadata !11, i32 101} ; [ DW_TAG_subprogram ]
!424 = metadata !{metadata !425}
!425 = metadata !{metadata !426, metadata !427, metadata !428, metadata !429}
!426 = metadata !{i32 786484, i32 0, null, metadata !"pkzip", metadata !"pkzip", metadata !"", metadata !420, i32 44, metadata !10, i32 0, i32 1, i32* @pkzip} ; [ DW_TAG_variable ]
!427 = metadata !{i32 786484, i32 0, null, metadata !"ext_header", metadata !"ext_header", metadata !"", metadata !420, i32 45, metadata !10, i32 0, i32 1, i32* @ext_header} ; [ DW_TAG_variable ]
!428 = metadata !{i32 786484, i32 0, null, metadata !"decrypt", metadata !"decrypt", metadata !"", metadata !420, i32 42, metadata !10, i32 0, i32 1, i32* @decrypt} ; [ DW_TAG_variable ]
!429 = metadata !{i32 786484, i32 0, null, metadata !"key", metadata !"key", metadata !"", metadata !420, i32 43, metadata !26, i32 0, i32 1, i8** @key} ; [ DW_TAG_variable ]
!430 = metadata !{i32 786449, i32 0, i32 12, metadata !"util.c", metadata !"/home/capsicum/wvd/gzip-1.2.4", metadata !"clang version 3.1 (tags/RELEASE_31/final)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !431, metadata !553} ; [ DW_TAG_compile_unit ]
!431 = metadata !{metadata !432}
!432 = metadata !{metadata !433, metadata !435, metadata !441, metadata !442, metadata !443, metadata !444, metadata !445, metadata !450, metadata !453, metadata !454, metadata !457, metadata !461, metadata !462, metadata !465, metadata !466, metadata !467, metadata !541, metadata !544, metadata !547, metadata !552}
!433 = metadata !{i32 786478, i32 0, metadata !434, metadata !"copy", metadata !"copy", metadata !"", metadata !434, i32 39, metadata !209, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i32, i32)* @copy, null, null, metadata !11, i32 41} ; [ DW_TAG_subprogram ]
!434 = metadata !{i32 786473, metadata !"util.c", metadata !"/home/capsicum/wvd/gzip-1.2.4", null} ; [ DW_TAG_file_type ]
!435 = metadata !{i32 786478, i32 0, metadata !434, metadata !"updcrc", metadata !"updcrc", metadata !"", metadata !434, i32 60, metadata !436, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i64 (i8*, i32)* @updcrc, null, null, metadata !11, i32 63} ; [ DW_TAG_subprogram ]
!436 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !437, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!437 = metadata !{metadata !438, metadata !439, metadata !19}
!438 = metadata !{i32 786454, null, metadata !"ulg", metadata !434, i32 46, i64 0, i64 0, i64 0, i32 0, metadata !55} ; [ DW_TAG_typedef ]
!439 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !440} ; [ DW_TAG_pointer_type ]
!440 = metadata !{i32 786454, null, metadata !"uch", metadata !434, i32 44, i64 0, i64 0, i64 0, i32 0, metadata !156} ; [ DW_TAG_typedef ]
!441 = metadata !{i32 786478, i32 0, metadata !434, metadata !"clear_bufs", metadata !"clear_bufs", metadata !"", metadata !434, i32 83, metadata !21, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @clear_bufs, null, null, metadata !11, i32 84} ; [ DW_TAG_subprogram ]
!442 = metadata !{i32 786478, i32 0, metadata !434, metadata !"fill_inbuf", metadata !"fill_inbuf", metadata !"", metadata !434, i32 93, metadata !421, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i32)* @fill_inbuf, null, null, metadata !11, i32 95} ; [ DW_TAG_subprogram ]
!443 = metadata !{i32 786478, i32 0, metadata !434, metadata !"flush_outbuf", metadata !"flush_outbuf", metadata !"", metadata !434, i32 120, metadata !21, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @flush_outbuf, null, null, metadata !11, i32 121} ; [ DW_TAG_subprogram ]
!444 = metadata !{i32 786478, i32 0, metadata !434, metadata !"flush_window", metadata !"flush_window", metadata !"", metadata !434, i32 133, metadata !21, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @flush_window, null, null, metadata !11, i32 134} ; [ DW_TAG_subprogram ]
!445 = metadata !{i32 786478, i32 0, metadata !434, metadata !"write_buf", metadata !"write_buf", metadata !"", metadata !434, i32 149, metadata !446, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, void (i32, i8*, i32)* @write_buf, null, null, metadata !11, i32 153} ; [ DW_TAG_subprogram ]
!446 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !447, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!447 = metadata !{null, metadata !10, metadata !448, metadata !19}
!448 = metadata !{i32 786454, null, metadata !"voidp", metadata !434, i32 14, i64 0, i64 0, i64 0, i32 0, metadata !449} ; [ DW_TAG_typedef ]
!449 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!450 = metadata !{i32 786478, i32 0, metadata !434, metadata !"strlwr", metadata !"strlwr", metadata !"", metadata !434, i32 168, metadata !451, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i8* (i8*)* @strlwr, null, null, metadata !11, i32 170} ; [ DW_TAG_subprogram ]
!451 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !452, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!452 = metadata !{metadata !26, metadata !26}
!453 = metadata !{i32 786478, i32 0, metadata !434, metadata !"basename", metadata !"basename", metadata !"", metadata !434, i32 181, metadata !451, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i8* (i8*)* @basename, null, null, metadata !11, i32 183} ; [ DW_TAG_subprogram ]
!454 = metadata !{i32 786478, i32 0, metadata !434, metadata !"make_simple_name", metadata !"make_simple_name", metadata !"", metadata !434, i32 208, metadata !455, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, void (i8*)* @make_simple_name, null, null, metadata !11, i32 210} ; [ DW_TAG_subprogram ]
!455 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !456, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!456 = metadata !{null, metadata !26}
!457 = metadata !{i32 786478, i32 0, metadata !434, metadata !"add_envopt", metadata !"add_envopt", metadata !"", metadata !434, i32 279, metadata !458, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i8* (i32*, i8***, i8*)* @add_envopt, null, null, metadata !11, i32 283} ; [ DW_TAG_subprogram ]
!458 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !459, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!459 = metadata !{metadata !26, metadata !112, metadata !460, metadata !26}
!460 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !129} ; [ DW_TAG_pointer_type ]
!461 = metadata !{i32 786478, i32 0, metadata !434, metadata !"error", metadata !"error", metadata !"", metadata !434, i32 336, metadata !455, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, void (i8*)* @error, null, null, metadata !11, i32 338} ; [ DW_TAG_subprogram ]
!462 = metadata !{i32 786478, i32 0, metadata !434, metadata !"warn", metadata !"warn", metadata !"", metadata !434, i32 343, metadata !463, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, void (i8*, i8*)* @warn, null, null, metadata !11, i32 345} ; [ DW_TAG_subprogram ]
!463 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !464, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!464 = metadata !{null, metadata !26, metadata !26}
!465 = metadata !{i32 786478, i32 0, metadata !434, metadata !"read_error", metadata !"read_error", metadata !"", metadata !434, i32 349, metadata !21, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @read_error, null, null, metadata !11, i32 350} ; [ DW_TAG_subprogram ]
!466 = metadata !{i32 786478, i32 0, metadata !434, metadata !"write_error", metadata !"write_error", metadata !"", metadata !434, i32 360, metadata !21, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @write_error, null, null, metadata !11, i32 361} ; [ DW_TAG_subprogram ]
!467 = metadata !{i32 786478, i32 0, metadata !434, metadata !"display_ratio", metadata !"display_ratio", metadata !"", metadata !434, i32 370, metadata !468, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, void (i64, i64, %struct.__sFILE*)* @display_ratio, null, null, metadata !11, i32 374} ; [ DW_TAG_subprogram ]
!468 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !469, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!469 = metadata !{null, metadata !63, metadata !63, metadata !470}
!470 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !471} ; [ DW_TAG_pointer_type ]
!471 = metadata !{i32 786454, null, metadata !"FILE", metadata !434, i32 147, i64 0, i64 0, i64 0, i32 0, metadata !472} ; [ DW_TAG_typedef ]
!472 = metadata !{i32 786451, null, metadata !"__sFILE", metadata !473, i32 110, i64 2432, i64 64, i32 0, i32 0, null, metadata !474, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!473 = metadata !{i32 786473, metadata !"/usr/include/stdio.h", metadata !"/home/capsicum/wvd/gzip-1.2.4", null} ; [ DW_TAG_file_type ]
!474 = metadata !{metadata !475, metadata !477, metadata !478, metadata !479, metadata !481, metadata !482, metadata !487, metadata !488, metadata !489, metadata !493, metadata !497, metadata !504, metadata !508, metadata !509, metadata !510, metadata !511, metadata !515, metadata !519, metadata !520, metadata !521, metadata !522, metadata !526, metadata !529, metadata !530, metadata !531}
!475 = metadata !{i32 786445, metadata !472, metadata !"_p", metadata !473, i32 111, i64 64, i64 64, i64 0, i32 0, metadata !476} ; [ DW_TAG_member ]
!476 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !156} ; [ DW_TAG_pointer_type ]
!477 = metadata !{i32 786445, metadata !472, metadata !"_r", metadata !473, i32 112, i64 32, i64 32, i64 64, i32 0, metadata !10} ; [ DW_TAG_member ]
!478 = metadata !{i32 786445, metadata !472, metadata !"_w", metadata !473, i32 113, i64 32, i64 32, i64 96, i32 0, metadata !10} ; [ DW_TAG_member ]
!479 = metadata !{i32 786445, metadata !472, metadata !"_flags", metadata !473, i32 114, i64 16, i64 16, i64 128, i32 0, metadata !480} ; [ DW_TAG_member ]
!480 = metadata !{i32 786468, null, metadata !"short", null, i32 0, i64 16, i64 16, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!481 = metadata !{i32 786445, metadata !472, metadata !"_file", metadata !473, i32 115, i64 16, i64 16, i64 144, i32 0, metadata !480} ; [ DW_TAG_member ]
!482 = metadata !{i32 786445, metadata !472, metadata !"_bf", metadata !473, i32 116, i64 128, i64 64, i64 192, i32 0, metadata !483} ; [ DW_TAG_member ]
!483 = metadata !{i32 786451, null, metadata !"__sbuf", metadata !473, i32 77, i64 128, i64 64, i32 0, i32 0, null, metadata !484, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!484 = metadata !{metadata !485, metadata !486}
!485 = metadata !{i32 786445, metadata !483, metadata !"_base", metadata !473, i32 78, i64 64, i64 64, i64 0, i32 0, metadata !476} ; [ DW_TAG_member ]
!486 = metadata !{i32 786445, metadata !483, metadata !"_size", metadata !473, i32 79, i64 32, i64 32, i64 64, i32 0, metadata !10} ; [ DW_TAG_member ]
!487 = metadata !{i32 786445, metadata !472, metadata !"_lbfsize", metadata !473, i32 117, i64 32, i64 32, i64 320, i32 0, metadata !10} ; [ DW_TAG_member ]
!488 = metadata !{i32 786445, metadata !472, metadata !"_cookie", metadata !473, i32 120, i64 64, i64 64, i64 384, i32 0, metadata !449} ; [ DW_TAG_member ]
!489 = metadata !{i32 786445, metadata !472, metadata !"_close", metadata !473, i32 121, i64 64, i64 64, i64 448, i32 0, metadata !490} ; [ DW_TAG_member ]
!490 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !491} ; [ DW_TAG_pointer_type ]
!491 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !492, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!492 = metadata !{metadata !10, metadata !449}
!493 = metadata !{i32 786445, metadata !472, metadata !"_read", metadata !473, i32 122, i64 64, i64 64, i64 512, i32 0, metadata !494} ; [ DW_TAG_member ]
!494 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !495} ; [ DW_TAG_pointer_type ]
!495 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !496, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!496 = metadata !{metadata !10, metadata !449, metadata !26, metadata !10}
!497 = metadata !{i32 786445, metadata !472, metadata !"_seek", metadata !473, i32 123, i64 64, i64 64, i64 576, i32 0, metadata !498} ; [ DW_TAG_member ]
!498 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !499} ; [ DW_TAG_pointer_type ]
!499 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !500, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!500 = metadata !{metadata !501, metadata !449, metadata !501, metadata !10}
!501 = metadata !{i32 786454, null, metadata !"fpos_t", metadata !473, i32 43, i64 0, i64 0, i64 0, i32 0, metadata !502} ; [ DW_TAG_typedef ]
!502 = metadata !{i32 786454, null, metadata !"__off_t", metadata !473, i32 54, i64 0, i64 0, i64 0, i32 0, metadata !503} ; [ DW_TAG_typedef ]
!503 = metadata !{i32 786454, null, metadata !"__int64_t", metadata !473, i32 57, i64 0, i64 0, i64 0, i32 0, metadata !63} ; [ DW_TAG_typedef ]
!504 = metadata !{i32 786445, metadata !472, metadata !"_write", metadata !473, i32 124, i64 64, i64 64, i64 640, i32 0, metadata !505} ; [ DW_TAG_member ]
!505 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !506} ; [ DW_TAG_pointer_type ]
!506 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !507, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!507 = metadata !{metadata !10, metadata !449, metadata !102, metadata !10}
!508 = metadata !{i32 786445, metadata !472, metadata !"_ub", metadata !473, i32 127, i64 128, i64 64, i64 704, i32 0, metadata !483} ; [ DW_TAG_member ]
!509 = metadata !{i32 786445, metadata !472, metadata !"_up", metadata !473, i32 128, i64 64, i64 64, i64 832, i32 0, metadata !476} ; [ DW_TAG_member ]
!510 = metadata !{i32 786445, metadata !472, metadata !"_ur", metadata !473, i32 129, i64 32, i64 32, i64 896, i32 0, metadata !10} ; [ DW_TAG_member ]
!511 = metadata !{i32 786445, metadata !472, metadata !"_ubuf", metadata !473, i32 132, i64 24, i64 8, i64 928, i32 0, metadata !512} ; [ DW_TAG_member ]
!512 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 24, i64 8, i32 0, i32 0, metadata !156, metadata !513, i32 0, i32 0} ; [ DW_TAG_array_type ]
!513 = metadata !{metadata !514}
!514 = metadata !{i32 786465, i64 0, i64 2}       ; [ DW_TAG_subrange_type ]
!515 = metadata !{i32 786445, metadata !472, metadata !"_nbuf", metadata !473, i32 133, i64 8, i64 8, i64 952, i32 0, metadata !516} ; [ DW_TAG_member ]
!516 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 8, i64 8, i32 0, i32 0, metadata !156, metadata !517, i32 0, i32 0} ; [ DW_TAG_array_type ]
!517 = metadata !{metadata !518}
!518 = metadata !{i32 786465, i64 0, i64 0}       ; [ DW_TAG_subrange_type ]
!519 = metadata !{i32 786445, metadata !472, metadata !"_lb", metadata !473, i32 136, i64 128, i64 64, i64 960, i32 0, metadata !483} ; [ DW_TAG_member ]
!520 = metadata !{i32 786445, metadata !472, metadata !"_blksize", metadata !473, i32 139, i64 32, i64 32, i64 1088, i32 0, metadata !10} ; [ DW_TAG_member ]
!521 = metadata !{i32 786445, metadata !472, metadata !"_offset", metadata !473, i32 140, i64 64, i64 64, i64 1152, i32 0, metadata !501} ; [ DW_TAG_member ]
!522 = metadata !{i32 786445, metadata !472, metadata !"_fl_mutex", metadata !473, i32 142, i64 64, i64 64, i64 1216, i32 0, metadata !523} ; [ DW_TAG_member ]
!523 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !524} ; [ DW_TAG_pointer_type ]
!524 = metadata !{i32 786451, null, metadata !"pthread_mutex", metadata !525, i32 48, i32 0, i32 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ]
!525 = metadata !{i32 786473, metadata !"/usr/include/sys/_pthreadtypes.h", metadata !"/home/capsicum/wvd/gzip-1.2.4", null} ; [ DW_TAG_file_type ]
!526 = metadata !{i32 786445, metadata !472, metadata !"_fl_owner", metadata !473, i32 143, i64 64, i64 64, i64 1280, i32 0, metadata !527} ; [ DW_TAG_member ]
!527 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !528} ; [ DW_TAG_pointer_type ]
!528 = metadata !{i32 786451, null, metadata !"pthread", metadata !525, i32 44, i32 0, i32 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ]
!529 = metadata !{i32 786445, metadata !472, metadata !"_fl_count", metadata !473, i32 144, i64 32, i64 32, i64 1344, i32 0, metadata !10} ; [ DW_TAG_member ]
!530 = metadata !{i32 786445, metadata !472, metadata !"_orientation", metadata !473, i32 145, i64 32, i64 32, i64 1376, i32 0, metadata !10} ; [ DW_TAG_member ]
!531 = metadata !{i32 786445, metadata !472, metadata !"_mbstate", metadata !473, i32 146, i64 1024, i64 64, i64 1408, i32 0, metadata !532} ; [ DW_TAG_member ]
!532 = metadata !{i32 786454, null, metadata !"__mbstate_t", metadata !473, i32 104, i64 0, i64 0, i64 0, i32 0, metadata !533} ; [ DW_TAG_typedef ]
!533 = metadata !{i32 786455, null, metadata !"", metadata !534, i32 101, i64 1024, i64 64, i64 0, i32 0, null, metadata !535, i32 0, i32 0} ; [ DW_TAG_union_type ]
!534 = metadata !{i32 786473, metadata !"/usr/include/sys/_types.h", metadata !"/home/capsicum/wvd/gzip-1.2.4", null} ; [ DW_TAG_file_type ]
!535 = metadata !{metadata !536, metadata !540}
!536 = metadata !{i32 786445, metadata !533, metadata !"__mbstate8", metadata !534, i32 102, i64 1024, i64 8, i64 0, i32 0, metadata !537} ; [ DW_TAG_member ]
!537 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 1024, i64 8, i32 0, i32 0, metadata !27, metadata !538, i32 0, i32 0} ; [ DW_TAG_array_type ]
!538 = metadata !{metadata !539}
!539 = metadata !{i32 786465, i64 0, i64 127}     ; [ DW_TAG_subrange_type ]
!540 = metadata !{i32 786445, metadata !533, metadata !"_mbstateL", metadata !534, i32 103, i64 64, i64 64, i64 0, i32 0, metadata !503} ; [ DW_TAG_member ]
!541 = metadata !{i32 786478, i32 0, metadata !434, metadata !"xmalloc", metadata !"xmalloc", metadata !"", metadata !434, i32 397, metadata !542, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i8* (i32)* @xmalloc, null, null, metadata !11, i32 399} ; [ DW_TAG_subprogram ]
!542 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !543, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!543 = metadata !{metadata !448, metadata !19}
!544 = metadata !{i32 786478, i32 0, metadata !473, metadata !"__sputc", metadata !"__sputc", metadata !"", metadata !473, i32 452, metadata !545, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, %struct.__sFILE*)* @__sputc, null, null, metadata !11, i32 452} ; [ DW_TAG_subprogram ]
!545 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !546, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!546 = metadata !{metadata !10, metadata !10, metadata !470}
!547 = metadata !{i32 786478, i32 0, metadata !548, metadata !"__sbistype", metadata !"__sbistype", metadata !"", metadata !548, i32 117, metadata !549, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i64)* @__sbistype, null, null, metadata !11, i32 118} ; [ DW_TAG_subprogram ]
!548 = metadata !{i32 786473, metadata !"/usr/include/_ctype.h", metadata !"/home/capsicum/wvd/gzip-1.2.4", null} ; [ DW_TAG_file_type ]
!549 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !550, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!550 = metadata !{metadata !10, metadata !551, metadata !55}
!551 = metadata !{i32 786454, null, metadata !"__ct_rune_t", metadata !548, i32 88, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_typedef ]
!552 = metadata !{i32 786478, i32 0, metadata !548, metadata !"__sbmaskrune", metadata !"__sbmaskrune", metadata !"", metadata !548, i32 104, metadata !549, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i64)* @__sbmaskrune, null, null, metadata !11, i32 105} ; [ DW_TAG_subprogram ]
!553 = metadata !{metadata !554}
!554 = metadata !{metadata !555, metadata !556}
!555 = metadata !{i32 786484, i32 0, metadata !435, metadata !"crc", metadata !"crc", metadata !"", metadata !434, i32 66, metadata !438, i32 1, i32 1, i64* @updcrc.crc} ; [ DW_TAG_variable ]
!556 = metadata !{i32 786484, i32 0, null, metadata !"crc_32_tab", metadata !"crc_32_tab", metadata !"", metadata !434, i32 409, metadata !557, i32 0, i32 1, [256 x i64]* @crc_32_tab} ; [ DW_TAG_variable ]
!557 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 16384, i64 64, i32 0, i32 0, metadata !438, metadata !295, i32 0, i32 0} ; [ DW_TAG_array_type ]
!558 = metadata !{i32 786689, metadata !5, metadata !"zipfile", metadata !6, i32 16777314, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!559 = metadata !{i32 98, i32 12, metadata !5, null}
!560 = metadata !{i32 100, i32 5, metadata !561, null}
!561 = metadata !{i32 786443, metadata !5, i32 99, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ]
!562 = metadata !{i32 101, i32 5, metadata !561, null}
!563 = metadata !{i32 102, i32 5, metadata !561, null}
!564 = metadata !{i32 110, i32 5, metadata !561, null}
!565 = metadata !{i32 111, i32 2, metadata !566, null}
!566 = metadata !{i32 786443, metadata !561, i32 110, i32 27, metadata !6, i32 1} ; [ DW_TAG_lexical_block ]
!567 = metadata !{i32 112, i32 5, metadata !566, null}
!568 = metadata !{i32 113, i32 1, metadata !561, null}
!569 = metadata !{i32 786689, metadata !13, metadata !"value", metadata !6, i32 16777336, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!570 = metadata !{i32 120, i32 9, metadata !13, null}
!571 = metadata !{i32 786689, metadata !13, metadata !"length", metadata !6, i32 33554553, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!572 = metadata !{i32 121, i32 9, metadata !13, null}
!573 = metadata !{i32 132, i32 5, metadata !574, null}
!574 = metadata !{i32 786443, metadata !13, i32 122, i32 1, metadata !6, i32 2} ; [ DW_TAG_lexical_block ]
!575 = metadata !{i32 133, i32 9, metadata !576, null}
!576 = metadata !{i32 786443, metadata !574, i32 132, i32 44, metadata !6, i32 3} ; [ DW_TAG_lexical_block ]
!577 = metadata !{i32 134, i32 9, metadata !578, null}
!578 = metadata !{i32 786443, metadata !576, i32 134, i32 9, metadata !6, i32 4} ; [ DW_TAG_lexical_block ]
!579 = metadata !{i32 134, i32 9, metadata !580, null}
!580 = metadata !{i32 786443, metadata !578, i32 134, i32 9, metadata !6, i32 5} ; [ DW_TAG_lexical_block ]
!581 = metadata !{i32 134, i32 9, metadata !582, null}
!582 = metadata !{i32 786443, metadata !583, i32 134, i32 9, metadata !6, i32 7} ; [ DW_TAG_lexical_block ]
!583 = metadata !{i32 786443, metadata !578, i32 134, i32 9, metadata !6, i32 6} ; [ DW_TAG_lexical_block ]
!584 = metadata !{i32 134, i32 9, metadata !585, null}
!585 = metadata !{i32 786443, metadata !583, i32 134, i32 9, metadata !6, i32 8} ; [ DW_TAG_lexical_block ]
!586 = metadata !{i32 135, i32 9, metadata !576, null}
!587 = metadata !{i32 136, i32 9, metadata !576, null}
!588 = metadata !{i32 137, i32 5, metadata !576, null}
!589 = metadata !{i32 138, i32 9, metadata !590, null}
!590 = metadata !{i32 786443, metadata !574, i32 137, i32 12, metadata !6, i32 9} ; [ DW_TAG_lexical_block ]
!591 = metadata !{i32 139, i32 9, metadata !590, null}
!592 = metadata !{i32 141, i32 1, metadata !574, null}
!593 = metadata !{i32 786689, metadata !16, metadata !"code", metadata !6, i32 16777365, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!594 = metadata !{i32 149, i32 14, metadata !16, null}
!595 = metadata !{i32 786689, metadata !16, metadata !"len", metadata !6, i32 33554582, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!596 = metadata !{i32 150, i32 9, metadata !16, null}
!597 = metadata !{i32 786688, metadata !598, metadata !"res", metadata !6, i32 152, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!598 = metadata !{i32 786443, metadata !16, i32 151, i32 1, metadata !6, i32 10} ; [ DW_TAG_lexical_block ]
!599 = metadata !{i32 152, i32 23, metadata !598, null}
!600 = metadata !{i32 152, i32 30, metadata !598, null}
!601 = metadata !{i32 153, i32 5, metadata !598, null}
!602 = metadata !{i32 154, i32 9, metadata !603, null}
!603 = metadata !{i32 786443, metadata !598, i32 153, i32 8, metadata !6, i32 11} ; [ DW_TAG_lexical_block ]
!604 = metadata !{i32 155, i32 9, metadata !603, null}
!605 = metadata !{i32 156, i32 5, metadata !603, null}
!606 = metadata !{i32 157, i32 5, metadata !598, null}
!607 = metadata !{i32 165, i32 5, metadata !608, null}
!608 = metadata !{i32 786443, metadata !20, i32 164, i32 1, metadata !6, i32 12} ; [ DW_TAG_lexical_block ]
!609 = metadata !{i32 166, i32 9, metadata !610, null}
!610 = metadata !{i32 786443, metadata !611, i32 166, i32 9, metadata !6, i32 14} ; [ DW_TAG_lexical_block ]
!611 = metadata !{i32 786443, metadata !608, i32 165, i32 23, metadata !6, i32 13} ; [ DW_TAG_lexical_block ]
!612 = metadata !{i32 166, i32 9, metadata !613, null}
!613 = metadata !{i32 786443, metadata !610, i32 166, i32 9, metadata !6, i32 15} ; [ DW_TAG_lexical_block ]
!614 = metadata !{i32 166, i32 9, metadata !615, null}
!615 = metadata !{i32 786443, metadata !616, i32 166, i32 9, metadata !6, i32 17} ; [ DW_TAG_lexical_block ]
!616 = metadata !{i32 786443, metadata !610, i32 166, i32 9, metadata !6, i32 16} ; [ DW_TAG_lexical_block ]
!617 = metadata !{i32 166, i32 9, metadata !618, null}
!618 = metadata !{i32 786443, metadata !616, i32 166, i32 9, metadata !6, i32 18} ; [ DW_TAG_lexical_block ]
!619 = metadata !{i32 167, i32 5, metadata !611, null}
!620 = metadata !{i32 167, i32 12, metadata !608, null}
!621 = metadata !{i32 168, i32 9, metadata !622, null}
!622 = metadata !{i32 786443, metadata !623, i32 168, i32 9, metadata !6, i32 20} ; [ DW_TAG_lexical_block ]
!623 = metadata !{i32 786443, metadata !608, i32 167, i32 30, metadata !6, i32 19} ; [ DW_TAG_lexical_block ]
!624 = metadata !{i32 169, i32 5, metadata !623, null}
!625 = metadata !{i32 170, i32 5, metadata !608, null}
!626 = metadata !{i32 171, i32 5, metadata !608, null}
!627 = metadata !{i32 175, i32 1, metadata !608, null}
!628 = metadata !{i32 786689, metadata !23, metadata !"buf", metadata !6, i32 16777398, metadata !26, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!629 = metadata !{i32 182, i32 15, metadata !23, null}
!630 = metadata !{i32 786689, metadata !23, metadata !"len", metadata !6, i32 33554615, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!631 = metadata !{i32 183, i32 14, metadata !23, null}
!632 = metadata !{i32 786689, metadata !23, metadata !"header", metadata !6, i32 50331832, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!633 = metadata !{i32 184, i32 14, metadata !23, null}
!634 = metadata !{i32 186, i32 5, metadata !635, null}
!635 = metadata !{i32 786443, metadata !23, i32 185, i32 1, metadata !6, i32 21} ; [ DW_TAG_lexical_block ]
!636 = metadata !{i32 188, i32 5, metadata !635, null}
!637 = metadata !{i32 189, i32 9, metadata !638, null}
!638 = metadata !{i32 786443, metadata !639, i32 189, i32 9, metadata !6, i32 23} ; [ DW_TAG_lexical_block ]
!639 = metadata !{i32 786443, metadata !635, i32 188, i32 17, metadata !6, i32 22} ; [ DW_TAG_lexical_block ]
!640 = metadata !{i32 189, i32 9, metadata !641, null}
!641 = metadata !{i32 786443, metadata !638, i32 189, i32 9, metadata !6, i32 24} ; [ DW_TAG_lexical_block ]
!642 = metadata !{i32 189, i32 9, metadata !643, null}
!643 = metadata !{i32 786443, metadata !644, i32 189, i32 9, metadata !6, i32 26} ; [ DW_TAG_lexical_block ]
!644 = metadata !{i32 786443, metadata !638, i32 189, i32 9, metadata !6, i32 25} ; [ DW_TAG_lexical_block ]
!645 = metadata !{i32 189, i32 9, metadata !646, null}
!646 = metadata !{i32 786443, metadata !644, i32 189, i32 9, metadata !6, i32 27} ; [ DW_TAG_lexical_block ]
!647 = metadata !{i32 190, i32 9, metadata !648, null}
!648 = metadata !{i32 786443, metadata !639, i32 190, i32 9, metadata !6, i32 28} ; [ DW_TAG_lexical_block ]
!649 = metadata !{i32 190, i32 9, metadata !650, null}
!650 = metadata !{i32 786443, metadata !648, i32 190, i32 9, metadata !6, i32 29} ; [ DW_TAG_lexical_block ]
!651 = metadata !{i32 190, i32 9, metadata !652, null}
!652 = metadata !{i32 786443, metadata !653, i32 190, i32 9, metadata !6, i32 31} ; [ DW_TAG_lexical_block ]
!653 = metadata !{i32 786443, metadata !648, i32 190, i32 9, metadata !6, i32 30} ; [ DW_TAG_lexical_block ]
!654 = metadata !{i32 190, i32 9, metadata !655, null}
!655 = metadata !{i32 786443, metadata !653, i32 190, i32 9, metadata !6, i32 32} ; [ DW_TAG_lexical_block ]
!656 = metadata !{i32 194, i32 5, metadata !639, null}
!657 = metadata !{i32 198, i32 5, metadata !635, null}
!658 = metadata !{i32 203, i32 2, metadata !659, null}
!659 = metadata !{i32 786443, metadata !660, i32 203, i32 2, metadata !6, i32 34} ; [ DW_TAG_lexical_block ]
!660 = metadata !{i32 786443, metadata !635, i32 198, i32 19, metadata !6, i32 33} ; [ DW_TAG_lexical_block ]
!661 = metadata !{i32 204, i32 5, metadata !660, null}
!662 = metadata !{i32 205, i32 1, metadata !635, null}
!663 = metadata !{i32 786689, metadata !42, metadata !"pack_level", metadata !43, i32 16777503, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!664 = metadata !{i32 287, i32 9, metadata !42, null}
!665 = metadata !{i32 786689, metadata !42, metadata !"flags", metadata !43, i32 33554720, metadata !46, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!666 = metadata !{i32 288, i32 10, metadata !42, null}
!667 = metadata !{i32 786688, metadata !668, metadata !"j", metadata !43, i32 290, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!668 = metadata !{i32 786443, metadata !42, i32 289, i32 1, metadata !43, i32 0} ; [ DW_TAG_lexical_block ]
!669 = metadata !{i32 290, i32 23, metadata !668, null}
!670 = metadata !{i32 292, i32 5, metadata !668, null}
!671 = metadata !{i32 292, i32 43, metadata !668, null}
!672 = metadata !{i32 293, i32 5, metadata !668, null}
!673 = metadata !{i32 299, i32 5, metadata !668, null}
!674 = metadata !{i32 305, i32 5, metadata !668, null}
!675 = metadata !{i32 306, i32 5, metadata !668, null}
!676 = metadata !{i32 308, i32 5, metadata !668, null}
!677 = metadata !{i32 310, i32 5, metadata !668, null}
!678 = metadata !{i32 311, i32 5, metadata !668, null}
!679 = metadata !{i32 312, i32 8, metadata !680, null}
!680 = metadata !{i32 786443, metadata !668, i32 311, i32 26, metadata !43, i32 1} ; [ DW_TAG_lexical_block ]
!681 = metadata !{i32 313, i32 5, metadata !680, null}
!682 = metadata !{i32 313, i32 12, metadata !668, null}
!683 = metadata !{i32 314, i32 8, metadata !684, null}
!684 = metadata !{i32 786443, metadata !668, i32 313, i32 33, metadata !43, i32 2} ; [ DW_TAG_lexical_block ]
!685 = metadata !{i32 315, i32 5, metadata !684, null}
!686 = metadata !{i32 318, i32 5, metadata !668, null}
!687 = metadata !{i32 319, i32 5, metadata !668, null}
!688 = metadata !{i32 324, i32 17, metadata !668, null}
!689 = metadata !{i32 327, i32 5, metadata !668, null}
!690 = metadata !{i32 328, i32 8, metadata !691, null}
!691 = metadata !{i32 786443, metadata !668, i32 327, i32 55, metadata !43, i32 3} ; [ DW_TAG_lexical_block ]
!692 = metadata !{i32 329, i32 8, metadata !691, null}
!693 = metadata !{i32 331, i32 5, metadata !668, null}
!694 = metadata !{i32 335, i32 5, metadata !668, null}
!695 = metadata !{i32 335, i32 50, metadata !668, null}
!696 = metadata !{i32 337, i32 5, metadata !668, null}
!697 = metadata !{i32 338, i32 10, metadata !698, null}
!698 = metadata !{i32 786443, metadata !668, i32 338, i32 5, metadata !43, i32 4} ; [ DW_TAG_lexical_block ]
!699 = metadata !{i32 338, i32 35, metadata !698, null}
!700 = metadata !{i32 338, i32 30, metadata !698, null}
!701 = metadata !{i32 342, i32 1, metadata !668, null}
!702 = metadata !{i32 786688, metadata !703, metadata !"n", metadata !43, i32 518, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!703 = metadata !{i32 786443, metadata !57, i32 517, i32 1, metadata !43, i32 27} ; [ DW_TAG_lexical_block ]
!704 = metadata !{i32 518, i32 23, metadata !703, null}
!705 = metadata !{i32 786688, metadata !703, metadata !"m", metadata !43, i32 518, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!706 = metadata !{i32 518, i32 26, metadata !703, null}
!707 = metadata !{i32 786688, metadata !703, metadata !"more", metadata !43, i32 519, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!708 = metadata !{i32 519, i32 14, metadata !703, null}
!709 = metadata !{i32 519, i32 77, metadata !703, null}
!710 = metadata !{i32 525, i32 5, metadata !703, null}
!711 = metadata !{i32 529, i32 9, metadata !712, null}
!712 = metadata !{i32 786443, metadata !703, i32 525, i32 32, metadata !43, i32 28} ; [ DW_TAG_lexical_block ]
!713 = metadata !{i32 530, i32 5, metadata !712, null}
!714 = metadata !{i32 530, i32 12, metadata !703, null}
!715 = metadata !{i32 536, i32 9, metadata !716, null}
!716 = metadata !{i32 786443, metadata !703, i32 530, i32 44, metadata !43, i32 29} ; [ DW_TAG_lexical_block ]
!717 = metadata !{i32 537, i32 9, metadata !716, null}
!718 = metadata !{i32 538, i32 9, metadata !716, null}
!719 = metadata !{i32 540, i32 9, metadata !716, null}
!720 = metadata !{i32 542, i32 14, metadata !721, null}
!721 = metadata !{i32 786443, metadata !716, i32 542, i32 9, metadata !43, i32 30} ; [ DW_TAG_lexical_block ]
!722 = metadata !{i32 543, i32 13, metadata !723, null}
!723 = metadata !{i32 786443, metadata !721, i32 542, i32 41, metadata !43, i32 31} ; [ DW_TAG_lexical_block ]
!724 = metadata !{i32 544, i32 13, metadata !723, null}
!725 = metadata !{i32 545, i32 9, metadata !723, null}
!726 = metadata !{i32 542, i32 36, metadata !721, null}
!727 = metadata !{i32 546, i32 14, metadata !728, null}
!728 = metadata !{i32 786443, metadata !716, i32 546, i32 9, metadata !43, i32 32} ; [ DW_TAG_lexical_block ]
!729 = metadata !{i32 547, i32 13, metadata !730, null}
!730 = metadata !{i32 786443, metadata !728, i32 546, i32 37, metadata !43, i32 33} ; [ DW_TAG_lexical_block ]
!731 = metadata !{i32 548, i32 13, metadata !730, null}
!732 = metadata !{i32 552, i32 9, metadata !730, null}
!733 = metadata !{i32 546, i32 32, metadata !728, null}
!734 = metadata !{i32 553, i32 9, metadata !716, null}
!735 = metadata !{i32 554, i32 5, metadata !716, null}
!736 = metadata !{i32 556, i32 5, metadata !703, null}
!737 = metadata !{i32 557, i32 13, metadata !738, null}
!738 = metadata !{i32 786443, metadata !703, i32 556, i32 18, metadata !43, i32 34} ; [ DW_TAG_lexical_block ]
!739 = metadata !{i32 558, i32 9, metadata !738, null}
!740 = metadata !{i32 559, i32 13, metadata !741, null}
!741 = metadata !{i32 786443, metadata !738, i32 558, i32 43, metadata !43, i32 35} ; [ DW_TAG_lexical_block ]
!742 = metadata !{i32 560, i32 9, metadata !741, null}
!743 = metadata !{i32 561, i32 13, metadata !744, null}
!744 = metadata !{i32 786443, metadata !738, i32 560, i32 16, metadata !43, i32 36} ; [ DW_TAG_lexical_block ]
!745 = metadata !{i32 563, i32 5, metadata !738, null}
!746 = metadata !{i32 564, i32 1, metadata !703, null}
!747 = metadata !{i32 786689, metadata !48, metadata !"cur_match", metadata !43, i32 16777574, metadata !51, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!748 = metadata !{i32 358, i32 10, metadata !48, null}
!749 = metadata !{i32 786688, metadata !750, metadata !"chain_length", metadata !43, i32 360, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!750 = metadata !{i32 786443, metadata !48, i32 359, i32 1, metadata !43, i32 5} ; [ DW_TAG_lexical_block ]
!751 = metadata !{i32 360, i32 14, metadata !750, null}
!752 = metadata !{i32 360, i32 45, metadata !750, null}
!753 = metadata !{i32 786688, metadata !750, metadata !"scan", metadata !43, i32 361, metadata !754, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!754 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !755} ; [ DW_TAG_pointer_type ]
!755 = metadata !{i32 786454, null, metadata !"uch", metadata !43, i32 44, i64 0, i64 0, i64 0, i32 0, metadata !156} ; [ DW_TAG_typedef ]
!756 = metadata !{i32 361, i32 19, metadata !750, null}
!757 = metadata !{i32 361, i32 43, metadata !750, null}
!758 = metadata !{i32 786688, metadata !750, metadata !"match", metadata !43, i32 362, metadata !754, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!759 = metadata !{i32 362, i32 19, metadata !750, null}
!760 = metadata !{i32 786688, metadata !750, metadata !"len", metadata !43, i32 363, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!761 = metadata !{i32 363, i32 18, metadata !750, null}
!762 = metadata !{i32 786688, metadata !750, metadata !"best_len", metadata !43, i32 364, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!763 = metadata !{i32 364, i32 9, metadata !750, null}
!764 = metadata !{i32 364, i32 31, metadata !750, null}
!765 = metadata !{i32 786688, metadata !750, metadata !"limit", metadata !43, i32 365, metadata !51, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!766 = metadata !{i32 365, i32 10, metadata !750, null}
!767 = metadata !{i32 365, i32 77, metadata !750, null}
!768 = metadata !{i32 786688, metadata !750, metadata !"strend", metadata !43, i32 385, metadata !754, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!769 = metadata !{i32 385, i32 19, metadata !750, null}
!770 = metadata !{i32 385, i32 57, metadata !750, null}
!771 = metadata !{i32 786688, metadata !750, metadata !"scan_end1", metadata !43, i32 386, metadata !755, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!772 = metadata !{i32 386, i32 18, metadata !750, null}
!773 = metadata !{i32 386, i32 47, metadata !750, null}
!774 = metadata !{i32 786688, metadata !750, metadata !"scan_end", metadata !43, i32 387, metadata !755, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!775 = metadata !{i32 387, i32 18, metadata !750, null}
!776 = metadata !{i32 387, i32 45, metadata !750, null}
!777 = metadata !{i32 391, i32 5, metadata !750, null}
!778 = metadata !{i32 392, i32 9, metadata !779, null}
!779 = metadata !{i32 786443, metadata !750, i32 391, i32 36, metadata !43, i32 6} ; [ DW_TAG_lexical_block ]
!780 = metadata !{i32 393, i32 5, metadata !779, null}
!781 = metadata !{i32 396, i32 5, metadata !750, null}
!782 = metadata !{i32 398, i32 9, metadata !783, null}
!783 = metadata !{i32 786443, metadata !750, i32 396, i32 8, metadata !43, i32 7} ; [ DW_TAG_lexical_block ]
!784 = metadata !{i32 437, i32 9, metadata !783, null}
!785 = metadata !{i32 440, i32 48, metadata !783, null}
!786 = metadata !{i32 448, i32 9, metadata !783, null}
!787 = metadata !{i32 453, i32 9, metadata !783, null}
!788 = metadata !{i32 454, i32 9, metadata !789, null}
!789 = metadata !{i32 786443, metadata !783, i32 453, i32 12, metadata !43, i32 8} ; [ DW_TAG_lexical_block ]
!790 = metadata !{i32 460, i32 9, metadata !783, null}
!791 = metadata !{i32 461, i32 9, metadata !783, null}
!792 = metadata !{i32 465, i32 9, metadata !783, null}
!793 = metadata !{i32 466, i32 13, metadata !794, null}
!794 = metadata !{i32 786443, metadata !783, i32 465, i32 29, metadata !43, i32 9} ; [ DW_TAG_lexical_block ]
!795 = metadata !{i32 467, i32 13, metadata !794, null}
!796 = metadata !{i32 468, i32 13, metadata !794, null}
!797 = metadata !{i32 468, i32 36, metadata !794, null}
!798 = metadata !{i32 472, i32 13, metadata !794, null}
!799 = metadata !{i32 473, i32 13, metadata !794, null}
!800 = metadata !{i32 475, i32 9, metadata !794, null}
!801 = metadata !{i32 476, i32 5, metadata !783, null}
!802 = metadata !{i32 479, i32 5, metadata !750, null}
!803 = metadata !{i32 786688, metadata !804, metadata !"hash_head", metadata !43, i32 663, metadata !51, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!804 = metadata !{i32 786443, metadata !52, i32 662, i32 1, metadata !43, i32 10} ; [ DW_TAG_lexical_block ]
!805 = metadata !{i32 663, i32 10, metadata !804, null}
!806 = metadata !{i32 786688, metadata !804, metadata !"prev_match", metadata !43, i32 664, metadata !51, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!807 = metadata !{i32 664, i32 10, metadata !804, null}
!808 = metadata !{i32 786688, metadata !804, metadata !"flush", metadata !43, i32 665, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!809 = metadata !{i32 665, i32 9, metadata !804, null}
!810 = metadata !{i32 786688, metadata !804, metadata !"match_available", metadata !43, i32 666, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!811 = metadata !{i32 666, i32 9, metadata !804, null}
!812 = metadata !{i32 666, i32 28, metadata !804, null}
!813 = metadata !{i32 786688, metadata !804, metadata !"match_length", metadata !43, i32 667, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!814 = metadata !{i32 667, i32 23, metadata !804, null}
!815 = metadata !{i32 667, i32 49, metadata !804, null}
!816 = metadata !{i32 672, i32 5, metadata !804, null}
!817 = metadata !{i32 672, i32 34, metadata !804, null}
!818 = metadata !{i32 675, i32 5, metadata !804, null}
!819 = metadata !{i32 679, i32 9, metadata !820, null}
!820 = metadata !{i32 786443, metadata !804, i32 675, i32 28, metadata !43, i32 11} ; [ DW_TAG_lexical_block ]
!821 = metadata !{i32 683, i32 9, metadata !820, null}
!822 = metadata !{i32 684, i32 9, metadata !820, null}
!823 = metadata !{i32 686, i32 9, metadata !820, null}
!824 = metadata !{i32 692, i32 28, metadata !825, null}
!825 = metadata !{i32 786443, metadata !820, i32 687, i32 47, metadata !43, i32 12} ; [ DW_TAG_lexical_block ]
!826 = metadata !{i32 694, i32 13, metadata !825, null}
!827 = metadata !{i32 694, i32 43, metadata !825, null}
!828 = metadata !{i32 697, i32 13, metadata !825, null}
!829 = metadata !{i32 701, i32 17, metadata !830, null}
!830 = metadata !{i32 786443, metadata !825, i32 697, i32 77, metadata !43, i32 13} ; [ DW_TAG_lexical_block ]
!831 = metadata !{i32 702, i32 13, metadata !830, null}
!832 = metadata !{i32 703, i32 9, metadata !825, null}
!833 = metadata !{i32 707, i32 9, metadata !820, null}
!834 = metadata !{i32 711, i32 21, metadata !835, null}
!835 = metadata !{i32 786443, metadata !820, i32 707, i32 70, metadata !43, i32 14} ; [ DW_TAG_lexical_block ]
!836 = metadata !{i32 716, i32 13, metadata !835, null}
!837 = metadata !{i32 717, i32 13, metadata !835, null}
!838 = metadata !{i32 718, i32 13, metadata !835, null}
!839 = metadata !{i32 719, i32 17, metadata !840, null}
!840 = metadata !{i32 786443, metadata !835, i32 718, i32 16, metadata !43, i32 15} ; [ DW_TAG_lexical_block ]
!841 = metadata !{i32 720, i32 17, metadata !840, null}
!842 = metadata !{i32 726, i32 13, metadata !840, null}
!843 = metadata !{i32 727, i32 13, metadata !835, null}
!844 = metadata !{i32 728, i32 13, metadata !835, null}
!845 = metadata !{i32 729, i32 13, metadata !835, null}
!846 = metadata !{i32 730, i32 13, metadata !835, null}
!847 = metadata !{i32 730, i32 24, metadata !835, null}
!848 = metadata !{i32 732, i32 9, metadata !835, null}
!849 = metadata !{i32 732, i32 16, metadata !820, null}
!850 = metadata !{i32 738, i32 17, metadata !851, null}
!851 = metadata !{i32 786443, metadata !820, i32 732, i32 37, metadata !43, i32 16} ; [ DW_TAG_lexical_block ]
!852 = metadata !{i32 739, i32 17, metadata !853, null}
!853 = metadata !{i32 786443, metadata !851, i32 738, i32 51, metadata !43, i32 17} ; [ DW_TAG_lexical_block ]
!854 = metadata !{i32 740, i32 13, metadata !853, null}
!855 = metadata !{i32 741, i32 13, metadata !851, null}
!856 = metadata !{i32 742, i32 13, metadata !851, null}
!857 = metadata !{i32 743, i32 9, metadata !851, null}
!858 = metadata !{i32 747, i32 13, metadata !859, null}
!859 = metadata !{i32 786443, metadata !820, i32 743, i32 16, metadata !43, i32 18} ; [ DW_TAG_lexical_block ]
!860 = metadata !{i32 748, i32 13, metadata !859, null}
!861 = metadata !{i32 749, i32 13, metadata !859, null}
!862 = metadata !{i32 758, i32 9, metadata !820, null}
!863 = metadata !{i32 758, i32 54, metadata !820, null}
!864 = metadata !{i32 759, i32 5, metadata !820, null}
!865 = metadata !{i32 760, i32 5, metadata !804, null}
!866 = metadata !{i32 760, i32 26, metadata !804, null}
!867 = metadata !{i32 762, i32 12, metadata !804, null}
!868 = metadata !{i32 763, i32 1, metadata !804, null}
!869 = metadata !{i32 786688, metadata !870, metadata !"hash_head", metadata !43, i32 582, metadata !51, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!870 = metadata !{i32 786443, metadata !56, i32 581, i32 1, metadata !43, i32 19} ; [ DW_TAG_lexical_block ]
!871 = metadata !{i32 582, i32 10, metadata !870, null}
!872 = metadata !{i32 786688, metadata !870, metadata !"flush", metadata !43, i32 583, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!873 = metadata !{i32 583, i32 9, metadata !870, null}
!874 = metadata !{i32 786688, metadata !870, metadata !"match_length", metadata !43, i32 584, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!875 = metadata !{i32 584, i32 14, metadata !870, null}
!876 = metadata !{i32 584, i32 30, metadata !870, null}
!877 = metadata !{i32 586, i32 5, metadata !870, null}
!878 = metadata !{i32 587, i32 5, metadata !870, null}
!879 = metadata !{i32 591, i32 9, metadata !880, null}
!880 = metadata !{i32 786443, metadata !870, i32 587, i32 28, metadata !43, i32 20} ; [ DW_TAG_lexical_block ]
!881 = metadata !{i32 596, i32 9, metadata !880, null}
!882 = metadata !{i32 601, i32 28, metadata !883, null}
!883 = metadata !{i32 786443, metadata !880, i32 596, i32 67, metadata !43, i32 21} ; [ DW_TAG_lexical_block ]
!884 = metadata !{i32 603, i32 13, metadata !883, null}
!885 = metadata !{i32 603, i32 43, metadata !883, null}
!886 = metadata !{i32 604, i32 9, metadata !883, null}
!887 = metadata !{i32 605, i32 9, metadata !880, null}
!888 = metadata !{i32 608, i32 21, metadata !889, null}
!889 = metadata !{i32 786443, metadata !880, i32 605, i32 40, metadata !43, i32 22} ; [ DW_TAG_lexical_block ]
!890 = metadata !{i32 610, i32 13, metadata !889, null}
!891 = metadata !{i32 615, i32 13, metadata !889, null}
!892 = metadata !{i32 616, i32 17, metadata !893, null}
!893 = metadata !{i32 786443, metadata !889, i32 615, i32 52, metadata !43, i32 23} ; [ DW_TAG_lexical_block ]
!894 = metadata !{i32 617, i32 17, metadata !893, null}
!895 = metadata !{i32 618, i32 21, metadata !896, null}
!896 = metadata !{i32 786443, metadata !893, i32 617, i32 20, metadata !43, i32 24} ; [ DW_TAG_lexical_block ]
!897 = metadata !{i32 619, i32 21, metadata !896, null}
!898 = metadata !{i32 625, i32 17, metadata !896, null}
!899 = metadata !{i32 626, i32 10, metadata !893, null}
!900 = metadata !{i32 627, i32 13, metadata !893, null}
!901 = metadata !{i32 628, i32 10, metadata !902, null}
!902 = metadata !{i32 786443, metadata !889, i32 627, i32 20, metadata !43, i32 25} ; [ DW_TAG_lexical_block ]
!903 = metadata !{i32 629, i32 10, metadata !902, null}
!904 = metadata !{i32 630, i32 10, metadata !902, null}
!905 = metadata !{i32 631, i32 10, metadata !902, null}
!906 = metadata !{i32 636, i32 9, metadata !889, null}
!907 = metadata !{i32 639, i32 21, metadata !908, null}
!908 = metadata !{i32 786443, metadata !880, i32 636, i32 16, metadata !43, i32 26} ; [ DW_TAG_lexical_block ]
!909 = metadata !{i32 640, i32 13, metadata !908, null}
!910 = metadata !{i32 641, i32 6, metadata !908, null}
!911 = metadata !{i32 643, i32 9, metadata !880, null}
!912 = metadata !{i32 643, i32 20, metadata !880, null}
!913 = metadata !{i32 650, i32 9, metadata !880, null}
!914 = metadata !{i32 650, i32 54, metadata !880, null}
!915 = metadata !{i32 652, i32 5, metadata !880, null}
!916 = metadata !{i32 653, i32 12, metadata !870, null}
!917 = metadata !{i32 786689, metadata !97, metadata !"argc", metadata !90, i32 16777544, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!918 = metadata !{i32 328, i32 10, metadata !97, null}
!919 = metadata !{i32 786689, metadata !97, metadata !"argv", metadata !90, i32 33554761, metadata !100, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!920 = metadata !{i32 329, i32 19, metadata !97, null}
!921 = metadata !{i32 786689, metadata !97, metadata !"optstring", metadata !90, i32 50331978, metadata !102, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!922 = metadata !{i32 330, i32 18, metadata !97, null}
!923 = metadata !{i32 786689, metadata !97, metadata !"longopts", metadata !90, i32 67109195, metadata !104, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!924 = metadata !{i32 331, i32 27, metadata !97, null}
!925 = metadata !{i32 786689, metadata !97, metadata !"longind", metadata !90, i32 83886412, metadata !112, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!926 = metadata !{i32 332, i32 11, metadata !97, null}
!927 = metadata !{i32 786689, metadata !97, metadata !"long_only", metadata !90, i32 100663629, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!928 = metadata !{i32 333, i32 10, metadata !97, null}
!929 = metadata !{i32 786688, metadata !930, metadata !"option_index", metadata !90, i32 335, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!930 = metadata !{i32 786443, metadata !97, i32 334, i32 1, metadata !90, i32 0} ; [ DW_TAG_lexical_block ]
!931 = metadata !{i32 335, i32 7, metadata !930, null}
!932 = metadata !{i32 337, i32 3, metadata !930, null}
!933 = metadata !{i32 344, i32 3, metadata !930, null}
!934 = metadata !{i32 346, i32 7, metadata !935, null}
!935 = metadata !{i32 786443, metadata !930, i32 345, i32 5, metadata !90, i32 1} ; [ DW_TAG_lexical_block ]
!936 = metadata !{i32 348, i32 7, metadata !935, null}
!937 = metadata !{i32 352, i32 7, metadata !935, null}
!938 = metadata !{i32 354, i32 4, metadata !939, null}
!939 = metadata !{i32 786443, metadata !935, i32 353, i32 2, metadata !90, i32 2} ; [ DW_TAG_lexical_block ]
!940 = metadata !{i32 355, i32 4, metadata !939, null}
!941 = metadata !{i32 356, i32 2, metadata !939, null}
!942 = metadata !{i32 357, i32 12, metadata !935, null}
!943 = metadata !{i32 359, i32 4, metadata !944, null}
!944 = metadata !{i32 786443, metadata !935, i32 358, i32 2, metadata !90, i32 3} ; [ DW_TAG_lexical_block ]
!945 = metadata !{i32 360, i32 4, metadata !944, null}
!946 = metadata !{i32 361, i32 2, metadata !944, null}
!947 = metadata !{i32 362, i32 16, metadata !935, null}
!948 = metadata !{i32 363, i32 2, metadata !935, null}
!949 = metadata !{i32 365, i32 2, metadata !935, null}
!950 = metadata !{i32 366, i32 5, metadata !935, null}
!951 = metadata !{i32 368, i32 3, metadata !930, null}
!952 = metadata !{i32 370, i32 7, metadata !953, null}
!953 = metadata !{i32 786443, metadata !930, i32 369, i32 5, metadata !90, i32 4} ; [ DW_TAG_lexical_block ]
!954 = metadata !{i32 375, i32 4, metadata !955, null}
!955 = metadata !{i32 786443, metadata !953, i32 371, i32 2, metadata !90, i32 5} ; [ DW_TAG_lexical_block ]
!956 = metadata !{i32 376, i32 6, metadata !955, null}
!957 = metadata !{i32 377, i32 9, metadata !955, null}
!958 = metadata !{i32 378, i32 6, metadata !955, null}
!959 = metadata !{i32 383, i32 4, metadata !955, null}
!960 = metadata !{i32 390, i32 6, metadata !955, null}
!961 = metadata !{i32 391, i32 4, metadata !955, null}
!962 = metadata !{i32 392, i32 2, metadata !955, null}
!963 = metadata !{i32 399, i32 7, metadata !953, null}
!964 = metadata !{i32 399, i32 30, metadata !953, null}
!965 = metadata !{i32 401, i32 4, metadata !966, null}
!966 = metadata !{i32 786443, metadata !953, i32 400, i32 2, metadata !90, i32 6} ; [ DW_TAG_lexical_block ]
!967 = metadata !{i32 403, i32 4, metadata !966, null}
!968 = metadata !{i32 404, i32 6, metadata !966, null}
!969 = metadata !{i32 405, i32 9, metadata !966, null}
!970 = metadata !{i32 406, i32 6, metadata !966, null}
!971 = metadata !{i32 407, i32 4, metadata !966, null}
!972 = metadata !{i32 409, i32 4, metadata !966, null}
!973 = metadata !{i32 410, i32 2, metadata !966, null}
!974 = metadata !{i32 415, i32 7, metadata !953, null}
!975 = metadata !{i32 419, i32 4, metadata !976, null}
!976 = metadata !{i32 786443, metadata !953, i32 416, i32 2, metadata !90, i32 7} ; [ DW_TAG_lexical_block ]
!977 = metadata !{i32 420, i32 6, metadata !976, null}
!978 = metadata !{i32 421, i32 4, metadata !976, null}
!979 = metadata !{i32 427, i32 7, metadata !953, null}
!980 = metadata !{i32 434, i32 4, metadata !981, null}
!981 = metadata !{i32 786443, metadata !953, i32 433, i32 2, metadata !90, i32 8} ; [ DW_TAG_lexical_block ]
!982 = metadata !{i32 435, i32 6, metadata !981, null}
!983 = metadata !{i32 436, i32 4, metadata !981, null}
!984 = metadata !{i32 437, i32 4, metadata !981, null}
!985 = metadata !{i32 443, i32 7, metadata !953, null}
!986 = metadata !{i32 445, i32 5, metadata !953, null}
!987 = metadata !{i32 447, i32 3, metadata !930, null}
!988 = metadata !{i32 786688, metadata !989, metadata !"p", metadata !90, i32 455, metadata !104, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!989 = metadata !{i32 786443, metadata !930, i32 454, i32 5, metadata !90, i32 9} ; [ DW_TAG_lexical_block ]
!990 = metadata !{i32 455, i32 28, metadata !989, null}
!991 = metadata !{i32 786688, metadata !989, metadata !"s", metadata !90, i32 456, metadata !26, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!992 = metadata !{i32 456, i32 13, metadata !989, null}
!993 = metadata !{i32 456, i32 25, metadata !989, null}
!994 = metadata !{i32 786688, metadata !989, metadata !"exact", metadata !90, i32 457, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!995 = metadata !{i32 457, i32 11, metadata !989, null}
!996 = metadata !{i32 457, i32 20, metadata !989, null}
!997 = metadata !{i32 786688, metadata !989, metadata !"ambig", metadata !90, i32 458, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!998 = metadata !{i32 458, i32 11, metadata !989, null}
!999 = metadata !{i32 458, i32 20, metadata !989, null}
!1000 = metadata !{i32 786688, metadata !989, metadata !"pfound", metadata !90, i32 459, metadata !104, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1001 = metadata !{i32 459, i32 28, metadata !989, null}
!1002 = metadata !{i32 459, i32 41, metadata !989, null}
!1003 = metadata !{i32 786688, metadata !989, metadata !"indfound", metadata !90, i32 460, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1004 = metadata !{i32 460, i32 11, metadata !989, null}
!1005 = metadata !{i32 460, i32 23, metadata !989, null}
!1006 = metadata !{i32 462, i32 7, metadata !989, null}
!1007 = metadata !{i32 463, i32 2, metadata !989, null}
!1008 = metadata !{i32 466, i32 12, metadata !1009, null}
!1009 = metadata !{i32 786443, metadata !989, i32 466, i32 7, metadata !90, i32 10} ; [ DW_TAG_lexical_block ]
!1010 = metadata !{i32 468, i32 7, metadata !1009, null}
!1011 = metadata !{i32 470, i32 6, metadata !1012, null}
!1012 = metadata !{i32 786443, metadata !1009, i32 469, i32 4, metadata !90, i32 11} ; [ DW_TAG_lexical_block ]
!1013 = metadata !{i32 470, i32 26, metadata !1012, null}
!1014 = metadata !{i32 473, i32 3, metadata !1015, null}
!1015 = metadata !{i32 786443, metadata !1012, i32 471, i32 8, metadata !90, i32 12} ; [ DW_TAG_lexical_block ]
!1016 = metadata !{i32 474, i32 3, metadata !1015, null}
!1017 = metadata !{i32 475, i32 3, metadata !1015, null}
!1018 = metadata !{i32 476, i32 3, metadata !1015, null}
!1019 = metadata !{i32 478, i32 11, metadata !1012, null}
!1020 = metadata !{i32 481, i32 3, metadata !1021, null}
!1021 = metadata !{i32 786443, metadata !1012, i32 479, i32 8, metadata !90, i32 13} ; [ DW_TAG_lexical_block ]
!1022 = metadata !{i32 482, i32 3, metadata !1021, null}
!1023 = metadata !{i32 483, i32 8, metadata !1021, null}
!1024 = metadata !{i32 486, i32 8, metadata !1012, null}
!1025 = metadata !{i32 487, i32 4, metadata !1012, null}
!1026 = metadata !{i32 467, i32 5, metadata !1009, null}
!1027 = metadata !{i32 489, i32 7, metadata !989, null}
!1028 = metadata !{i32 491, i32 4, metadata !1029, null}
!1029 = metadata !{i32 786443, metadata !989, i32 490, i32 2, metadata !90, i32 14} ; [ DW_TAG_lexical_block ]
!1030 = metadata !{i32 492, i32 6, metadata !1029, null}
!1031 = metadata !{i32 494, i32 16, metadata !1029, null}
!1032 = metadata !{i32 495, i32 4, metadata !1029, null}
!1033 = metadata !{i32 496, i32 4, metadata !1029, null}
!1034 = metadata !{i32 499, i32 7, metadata !989, null}
!1035 = metadata !{i32 501, i32 4, metadata !1036, null}
!1036 = metadata !{i32 786443, metadata !989, i32 500, i32 2, metadata !90, i32 15} ; [ DW_TAG_lexical_block ]
!1037 = metadata !{i32 502, i32 4, metadata !1036, null}
!1038 = metadata !{i32 503, i32 4, metadata !1036, null}
!1039 = metadata !{i32 507, i32 8, metadata !1040, null}
!1040 = metadata !{i32 786443, metadata !1036, i32 504, i32 6, metadata !90, i32 16} ; [ DW_TAG_lexical_block ]
!1041 = metadata !{i32 508, i32 3, metadata !1040, null}
!1042 = metadata !{i32 511, i32 5, metadata !1043, null}
!1043 = metadata !{i32 786443, metadata !1040, i32 510, i32 3, metadata !90, i32 17} ; [ DW_TAG_lexical_block ]
!1044 = metadata !{i32 513, i32 9, metadata !1045, null}
!1045 = metadata !{i32 786443, metadata !1043, i32 512, i32 7, metadata !90, i32 18} ; [ DW_TAG_lexical_block ]
!1046 = metadata !{i32 515, i32 4, metadata !1045, null}
!1047 = metadata !{i32 520, i32 4, metadata !1045, null}
!1048 = metadata !{i32 523, i32 7, metadata !1045, null}
!1049 = metadata !{i32 524, i32 17, metadata !1043, null}
!1050 = metadata !{i32 525, i32 5, metadata !1043, null}
!1051 = metadata !{i32 527, i32 6, metadata !1040, null}
!1052 = metadata !{i32 528, i32 9, metadata !1036, null}
!1053 = metadata !{i32 530, i32 8, metadata !1054, null}
!1054 = metadata !{i32 786443, metadata !1036, i32 529, i32 6, metadata !90, i32 19} ; [ DW_TAG_lexical_block ]
!1055 = metadata !{i32 531, i32 3, metadata !1054, null}
!1056 = metadata !{i32 534, i32 5, metadata !1057, null}
!1057 = metadata !{i32 786443, metadata !1054, i32 533, i32 3, metadata !90, i32 20} ; [ DW_TAG_lexical_block ]
!1058 = metadata !{i32 535, i32 7, metadata !1057, null}
!1059 = metadata !{i32 537, i32 17, metadata !1057, null}
!1060 = metadata !{i32 538, i32 5, metadata !1057, null}
!1061 = metadata !{i32 540, i32 6, metadata !1054, null}
!1062 = metadata !{i32 541, i32 16, metadata !1036, null}
!1063 = metadata !{i32 542, i32 4, metadata !1036, null}
!1064 = metadata !{i32 543, i32 6, metadata !1036, null}
!1065 = metadata !{i32 544, i32 4, metadata !1036, null}
!1066 = metadata !{i32 546, i32 8, metadata !1067, null}
!1067 = metadata !{i32 786443, metadata !1036, i32 545, i32 6, metadata !90, i32 21} ; [ DW_TAG_lexical_block ]
!1068 = metadata !{i32 547, i32 8, metadata !1067, null}
!1069 = metadata !{i32 549, i32 4, metadata !1036, null}
!1070 = metadata !{i32 555, i32 7, metadata !989, null}
!1071 = metadata !{i32 559, i32 7, metadata !989, null}
!1072 = metadata !{i32 561, i32 4, metadata !1073, null}
!1073 = metadata !{i32 786443, metadata !989, i32 560, i32 2, metadata !90, i32 22} ; [ DW_TAG_lexical_block ]
!1074 = metadata !{i32 563, i32 8, metadata !1075, null}
!1075 = metadata !{i32 786443, metadata !1073, i32 562, i32 6, metadata !90, i32 23} ; [ DW_TAG_lexical_block ]
!1076 = metadata !{i32 565, i32 3, metadata !1075, null}
!1077 = metadata !{i32 569, i32 3, metadata !1075, null}
!1078 = metadata !{i32 571, i32 6, metadata !1075, null}
!1079 = metadata !{i32 572, i32 4, metadata !1073, null}
!1080 = metadata !{i32 573, i32 4, metadata !1073, null}
!1081 = metadata !{i32 574, i32 4, metadata !1073, null}
!1082 = metadata !{i32 576, i32 5, metadata !989, null}
!1083 = metadata !{i32 786688, metadata !1084, metadata !"c", metadata !90, i32 581, metadata !27, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1084 = metadata !{i32 786443, metadata !930, i32 580, i32 3, metadata !90, i32 24} ; [ DW_TAG_lexical_block ]
!1085 = metadata !{i32 581, i32 10, metadata !1084, null}
!1086 = metadata !{i32 581, i32 25, metadata !1084, null}
!1087 = metadata !{i32 786688, metadata !1084, metadata !"temp", metadata !90, i32 582, metadata !26, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1088 = metadata !{i32 582, i32 11, metadata !1084, null}
!1089 = metadata !{i32 582, i32 18, metadata !1084, null}
!1090 = metadata !{i32 585, i32 5, metadata !1084, null}
!1091 = metadata !{i32 586, i32 7, metadata !1084, null}
!1092 = metadata !{i32 588, i32 5, metadata !1084, null}
!1093 = metadata !{i32 590, i32 2, metadata !1094, null}
!1094 = metadata !{i32 786443, metadata !1084, i32 589, i32 7, metadata !90, i32 25} ; [ DW_TAG_lexical_block ]
!1095 = metadata !{i32 600, i32 6, metadata !1096, null}
!1096 = metadata !{i32 786443, metadata !1094, i32 591, i32 4, metadata !90, i32 26} ; [ DW_TAG_lexical_block ]
!1097 = metadata !{i32 602, i32 4, metadata !1096, null}
!1098 = metadata !{i32 603, i32 2, metadata !1094, null}
!1099 = metadata !{i32 604, i32 2, metadata !1094, null}
!1100 = metadata !{i32 606, i32 5, metadata !1084, null}
!1101 = metadata !{i32 608, i32 2, metadata !1102, null}
!1102 = metadata !{i32 786443, metadata !1084, i32 607, i32 7, metadata !90, i32 27} ; [ DW_TAG_lexical_block ]
!1103 = metadata !{i32 611, i32 6, metadata !1104, null}
!1104 = metadata !{i32 786443, metadata !1102, i32 609, i32 4, metadata !90, i32 28} ; [ DW_TAG_lexical_block ]
!1105 = metadata !{i32 613, i32 3, metadata !1106, null}
!1106 = metadata !{i32 786443, metadata !1104, i32 612, i32 8, metadata !90, i32 29} ; [ DW_TAG_lexical_block ]
!1107 = metadata !{i32 614, i32 3, metadata !1106, null}
!1108 = metadata !{i32 615, i32 8, metadata !1106, null}
!1109 = metadata !{i32 617, i32 8, metadata !1104, null}
!1110 = metadata !{i32 618, i32 6, metadata !1104, null}
!1111 = metadata !{i32 619, i32 4, metadata !1104, null}
!1112 = metadata !{i32 623, i32 6, metadata !1113, null}
!1113 = metadata !{i32 786443, metadata !1102, i32 621, i32 4, metadata !90, i32 30} ; [ DW_TAG_lexical_block ]
!1114 = metadata !{i32 625, i32 3, metadata !1115, null}
!1115 = metadata !{i32 786443, metadata !1113, i32 624, i32 8, metadata !90, i32 31} ; [ DW_TAG_lexical_block ]
!1116 = metadata !{i32 628, i32 3, metadata !1115, null}
!1117 = metadata !{i32 629, i32 8, metadata !1115, null}
!1118 = metadata !{i32 630, i32 11, metadata !1113, null}
!1119 = metadata !{i32 632, i32 3, metadata !1120, null}
!1120 = metadata !{i32 786443, metadata !1113, i32 631, i32 8, metadata !90, i32 32} ; [ DW_TAG_lexical_block ]
!1121 = metadata !{i32 639, i32 7, metadata !1122, null}
!1122 = metadata !{i32 786443, metadata !1120, i32 633, i32 5, metadata !90, i32 33} ; [ DW_TAG_lexical_block ]
!1123 = metadata !{i32 642, i32 5, metadata !1122, null}
!1124 = metadata !{i32 643, i32 3, metadata !1120, null}
!1125 = metadata !{i32 644, i32 3, metadata !1120, null}
!1126 = metadata !{i32 645, i32 5, metadata !1120, null}
!1127 = metadata !{i32 647, i32 5, metadata !1120, null}
!1128 = metadata !{i32 648, i32 8, metadata !1120, null}
!1129 = metadata !{i32 652, i32 8, metadata !1113, null}
!1130 = metadata !{i32 653, i32 6, metadata !1113, null}
!1131 = metadata !{i32 655, i32 7, metadata !1102, null}
!1132 = metadata !{i32 656, i32 5, metadata !1084, null}
!1133 = metadata !{i32 658, i32 1, metadata !930, null}
!1134 = metadata !{i32 786689, metadata !126, metadata !"argv", metadata !90, i32 16777459, metadata !129, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1135 = metadata !{i32 243, i32 13, metadata !126, null}
!1136 = metadata !{i32 786688, metadata !1137, metadata !"temp", metadata !90, i32 245, metadata !26, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1137 = metadata !{i32 786443, metadata !126, i32 244, i32 1, metadata !90, i32 39} ; [ DW_TAG_lexical_block ]
!1138 = metadata !{i32 245, i32 9, metadata !1137, null}
!1139 = metadata !{i32 786688, metadata !1137, metadata !"first", metadata !90, i32 245, metadata !129, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1140 = metadata !{i32 245, i32 17, metadata !1137, null}
!1141 = metadata !{i32 786688, metadata !1137, metadata !"last", metadata !90, i32 245, metadata !129, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1142 = metadata !{i32 245, i32 26, metadata !1137, null}
!1143 = metadata !{i32 248, i32 3, metadata !1137, null}
!1144 = metadata !{i32 249, i32 3, metadata !1137, null}
!1145 = metadata !{i32 250, i32 3, metadata !1137, null}
!1146 = metadata !{i32 251, i32 5, metadata !1147, null}
!1147 = metadata !{i32 786443, metadata !1137, i32 250, i32 24, metadata !90, i32 40} ; [ DW_TAG_lexical_block ]
!1148 = metadata !{i32 251, i32 20, metadata !1147, null}
!1149 = metadata !{i32 251, i32 36, metadata !1147, null}
!1150 = metadata !{i32 251, i32 50, metadata !1147, null}
!1151 = metadata !{i32 251, i32 59, metadata !1147, null}
!1152 = metadata !{i32 252, i32 3, metadata !1147, null}
!1153 = metadata !{i32 254, i32 3, metadata !1137, null}
!1154 = metadata !{i32 255, i32 3, metadata !1137, null}
!1155 = metadata !{i32 256, i32 3, metadata !1137, null}
!1156 = metadata !{i32 257, i32 3, metadata !1137, null}
!1157 = metadata !{i32 258, i32 5, metadata !1158, null}
!1158 = metadata !{i32 786443, metadata !1137, i32 257, i32 24, metadata !90, i32 41} ; [ DW_TAG_lexical_block ]
!1159 = metadata !{i32 258, i32 20, metadata !1158, null}
!1160 = metadata !{i32 258, i32 36, metadata !1158, null}
!1161 = metadata !{i32 258, i32 50, metadata !1158, null}
!1162 = metadata !{i32 258, i32 59, metadata !1158, null}
!1163 = metadata !{i32 259, i32 3, metadata !1158, null}
!1164 = metadata !{i32 262, i32 3, metadata !1137, null}
!1165 = metadata !{i32 263, i32 3, metadata !1137, null}
!1166 = metadata !{i32 264, i32 3, metadata !1137, null}
!1167 = metadata !{i32 265, i32 3, metadata !1137, null}
!1168 = metadata !{i32 266, i32 5, metadata !1169, null}
!1169 = metadata !{i32 786443, metadata !1137, i32 265, i32 24, metadata !90, i32 42} ; [ DW_TAG_lexical_block ]
!1170 = metadata !{i32 266, i32 20, metadata !1169, null}
!1171 = metadata !{i32 266, i32 36, metadata !1169, null}
!1172 = metadata !{i32 266, i32 50, metadata !1169, null}
!1173 = metadata !{i32 266, i32 59, metadata !1169, null}
!1174 = metadata !{i32 267, i32 3, metadata !1169, null}
!1175 = metadata !{i32 268, i32 1, metadata !1137, null}
!1176 = metadata !{i32 786689, metadata !123, metadata !"str", metadata !90, i32 16777401, metadata !102, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1177 = metadata !{i32 185, i32 18, metadata !123, null}
!1178 = metadata !{i32 786688, metadata !1179, metadata !"n", metadata !90, i32 187, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1179 = metadata !{i32 786443, metadata !123, i32 186, i32 1, metadata !90, i32 38} ; [ DW_TAG_lexical_block ]
!1180 = metadata !{i32 187, i32 7, metadata !1179, null}
!1181 = metadata !{i32 187, i32 12, metadata !1179, null}
!1182 = metadata !{i32 188, i32 3, metadata !1179, null}
!1183 = metadata !{i32 189, i32 5, metadata !1179, null}
!1184 = metadata !{i32 190, i32 3, metadata !1179, null}
!1185 = metadata !{i32 786689, metadata !120, metadata !"str", metadata !90, i32 16777411, metadata !102, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1186 = metadata !{i32 195, i32 18, metadata !120, null}
!1187 = metadata !{i32 786689, metadata !120, metadata !"chr", metadata !90, i32 33554628, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1188 = metadata !{i32 196, i32 10, metadata !120, null}
!1189 = metadata !{i32 198, i32 3, metadata !1190, null}
!1190 = metadata !{i32 786443, metadata !120, i32 197, i32 1, metadata !90, i32 36} ; [ DW_TAG_lexical_block ]
!1191 = metadata !{i32 200, i32 7, metadata !1192, null}
!1192 = metadata !{i32 786443, metadata !1190, i32 199, i32 5, metadata !90, i32 37} ; [ DW_TAG_lexical_block ]
!1193 = metadata !{i32 201, i32 2, metadata !1192, null}
!1194 = metadata !{i32 202, i32 7, metadata !1192, null}
!1195 = metadata !{i32 203, i32 5, metadata !1192, null}
!1196 = metadata !{i32 204, i32 3, metadata !1190, null}
!1197 = metadata !{i32 205, i32 1, metadata !1190, null}
!1198 = metadata !{i32 786689, metadata !114, metadata !"argc", metadata !90, i32 16777878, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1199 = metadata !{i32 662, i32 10, metadata !114, null}
!1200 = metadata !{i32 786689, metadata !114, metadata !"argv", metadata !90, i32 33555095, metadata !100, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1201 = metadata !{i32 663, i32 19, metadata !114, null}
!1202 = metadata !{i32 786689, metadata !114, metadata !"optstring", metadata !90, i32 50332312, metadata !102, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1203 = metadata !{i32 664, i32 18, metadata !114, null}
!1204 = metadata !{i32 666, i32 10, metadata !1205, null}
!1205 = metadata !{i32 786443, metadata !114, i32 665, i32 1, metadata !90, i32 34} ; [ DW_TAG_lexical_block ]
!1206 = metadata !{i32 786689, metadata !117, metadata !"argc", metadata !90, i32 16777890, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1207 = metadata !{i32 674, i32 10, metadata !117, null}
!1208 = metadata !{i32 786689, metadata !117, metadata !"argv", metadata !90, i32 33555107, metadata !100, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1209 = metadata !{i32 675, i32 19, metadata !117, null}
!1210 = metadata !{i32 786689, metadata !117, metadata !"options", metadata !90, i32 50332324, metadata !102, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1211 = metadata !{i32 676, i32 18, metadata !117, null}
!1212 = metadata !{i32 786689, metadata !117, metadata !"long_options", metadata !90, i32 67109541, metadata !104, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1213 = metadata !{i32 677, i32 27, metadata !117, null}
!1214 = metadata !{i32 786689, metadata !117, metadata !"opt_index", metadata !90, i32 83886758, metadata !112, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1215 = metadata !{i32 678, i32 11, metadata !117, null}
!1216 = metadata !{i32 680, i32 10, metadata !1217, null}
!1217 = metadata !{i32 786443, metadata !117, i32 679, i32 1, metadata !90, i32 35} ; [ DW_TAG_lexical_block ]
!1218 = metadata !{i32 786689, metadata !143, metadata !"b", metadata !144, i32 16777488, metadata !147, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1219 = metadata !{i32 272, i32 11, metadata !143, null}
!1220 = metadata !{i32 786689, metadata !143, metadata !"n", metadata !144, i32 33554705, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1221 = metadata !{i32 273, i32 10, metadata !143, null}
!1222 = metadata !{i32 786689, metadata !143, metadata !"s", metadata !144, i32 50331922, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1223 = metadata !{i32 274, i32 10, metadata !143, null}
!1224 = metadata !{i32 786689, metadata !143, metadata !"d", metadata !144, i32 67109139, metadata !148, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1225 = metadata !{i32 275, i32 6, metadata !143, null}
!1226 = metadata !{i32 786689, metadata !143, metadata !"e", metadata !144, i32 83886356, metadata !148, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1227 = metadata !{i32 276, i32 6, metadata !143, null}
!1228 = metadata !{i32 786689, metadata !143, metadata !"t", metadata !144, i32 100663573, metadata !150, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1229 = metadata !{i32 277, i32 15, metadata !143, null}
!1230 = metadata !{i32 786689, metadata !143, metadata !"m", metadata !144, i32 117440790, metadata !112, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1231 = metadata !{i32 278, i32 6, metadata !143, null}
!1232 = metadata !{i32 786688, metadata !1233, metadata !"a", metadata !144, i32 285, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1233 = metadata !{i32 786443, metadata !143, i32 284, i32 1, metadata !144, i32 0} ; [ DW_TAG_lexical_block ]
!1234 = metadata !{i32 285, i32 12, metadata !1233, null}
!1235 = metadata !{i32 786688, metadata !1233, metadata !"c", metadata !144, i32 286, metadata !1236, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1236 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 544, i64 32, i32 0, i32 0, metadata !19, metadata !182, i32 0, i32 0} ; [ DW_TAG_array_type ]
!1237 = metadata !{i32 286, i32 12, metadata !1233, null}
!1238 = metadata !{i32 786688, metadata !1233, metadata !"f", metadata !144, i32 287, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1239 = metadata !{i32 287, i32 12, metadata !1233, null}
!1240 = metadata !{i32 786688, metadata !1233, metadata !"g", metadata !144, i32 288, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1241 = metadata !{i32 288, i32 7, metadata !1233, null}
!1242 = metadata !{i32 786688, metadata !1233, metadata !"h", metadata !144, i32 289, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1243 = metadata !{i32 289, i32 7, metadata !1233, null}
!1244 = metadata !{i32 786688, metadata !1233, metadata !"i", metadata !144, i32 290, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1245 = metadata !{i32 290, i32 21, metadata !1233, null}
!1246 = metadata !{i32 786688, metadata !1233, metadata !"j", metadata !144, i32 291, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1247 = metadata !{i32 291, i32 21, metadata !1233, null}
!1248 = metadata !{i32 786688, metadata !1233, metadata !"k", metadata !144, i32 292, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1249 = metadata !{i32 292, i32 16, metadata !1233, null}
!1250 = metadata !{i32 786688, metadata !1233, metadata !"l", metadata !144, i32 293, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1251 = metadata !{i32 293, i32 7, metadata !1233, null}
!1252 = metadata !{i32 786688, metadata !1233, metadata !"p", metadata !144, i32 294, metadata !147, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1253 = metadata !{i32 294, i32 22, metadata !1233, null}
!1254 = metadata !{i32 786688, metadata !1233, metadata !"q", metadata !144, i32 295, metadata !151, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1255 = metadata !{i32 295, i32 25, metadata !1233, null}
!1256 = metadata !{i32 786688, metadata !1233, metadata !"r", metadata !144, i32 296, metadata !152, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1257 = metadata !{i32 296, i32 15, metadata !1233, null}
!1258 = metadata !{i32 786688, metadata !1233, metadata !"u", metadata !144, i32 297, metadata !1259, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1259 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 1024, i64 64, i32 0, i32 0, metadata !151, metadata !290, i32 0, i32 0} ; [ DW_TAG_array_type ]
!1260 = metadata !{i32 297, i32 16, metadata !1233, null}
!1261 = metadata !{i32 786688, metadata !1233, metadata !"v", metadata !144, i32 298, metadata !1262, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1262 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 9216, i64 32, i32 0, i32 0, metadata !19, metadata !284, i32 0, i32 0} ; [ DW_TAG_array_type ]
!1263 = metadata !{i32 298, i32 12, metadata !1233, null}
!1264 = metadata !{i32 786688, metadata !1233, metadata !"w", metadata !144, i32 299, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1265 = metadata !{i32 299, i32 16, metadata !1233, null}
!1266 = metadata !{i32 786688, metadata !1233, metadata !"x", metadata !144, i32 300, metadata !1236, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1267 = metadata !{i32 300, i32 12, metadata !1233, null}
!1268 = metadata !{i32 786688, metadata !1233, metadata !"xp", metadata !144, i32 301, metadata !147, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1269 = metadata !{i32 301, i32 13, metadata !1233, null}
!1270 = metadata !{i32 786688, metadata !1233, metadata !"y", metadata !144, i32 302, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1271 = metadata !{i32 302, i32 7, metadata !1233, null}
!1272 = metadata !{i32 786688, metadata !1233, metadata !"z", metadata !144, i32 303, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1273 = metadata !{i32 303, i32 12, metadata !1233, null}
!1274 = metadata !{i32 307, i32 3, metadata !1233, null}
!1275 = metadata !{i32 308, i32 3, metadata !1233, null}
!1276 = metadata !{i32 308, i32 11, metadata !1233, null}
!1277 = metadata !{i32 309, i32 3, metadata !1233, null}
!1278 = metadata !{i32 312, i32 5, metadata !1279, null}
!1279 = metadata !{i32 786443, metadata !1233, i32 309, i32 6, metadata !144, i32 1} ; [ DW_TAG_lexical_block ]
!1280 = metadata !{i32 313, i32 5, metadata !1279, null}
!1281 = metadata !{i32 314, i32 3, metadata !1279, null}
!1282 = metadata !{i32 315, i32 3, metadata !1233, null}
!1283 = metadata !{i32 317, i32 5, metadata !1284, null}
!1284 = metadata !{i32 786443, metadata !1233, i32 316, i32 3, metadata !144, i32 2} ; [ DW_TAG_lexical_block ]
!1285 = metadata !{i32 318, i32 5, metadata !1284, null}
!1286 = metadata !{i32 319, i32 5, metadata !1284, null}
!1287 = metadata !{i32 324, i32 3, metadata !1233, null}
!1288 = metadata !{i32 325, i32 8, metadata !1289, null}
!1289 = metadata !{i32 786443, metadata !1233, i32 325, i32 3, metadata !144, i32 3} ; [ DW_TAG_lexical_block ]
!1290 = metadata !{i32 326, i32 5, metadata !1289, null}
!1291 = metadata !{i32 327, i32 7, metadata !1289, null}
!1292 = metadata !{i32 325, i32 26, metadata !1289, null}
!1293 = metadata !{i32 328, i32 3, metadata !1233, null}
!1294 = metadata !{i32 329, i32 3, metadata !1233, null}
!1295 = metadata !{i32 330, i32 5, metadata !1233, null}
!1296 = metadata !{i32 331, i32 8, metadata !1297, null}
!1297 = metadata !{i32 786443, metadata !1233, i32 331, i32 3, metadata !144, i32 4} ; [ DW_TAG_lexical_block ]
!1298 = metadata !{i32 332, i32 5, metadata !1297, null}
!1299 = metadata !{i32 333, i32 7, metadata !1297, null}
!1300 = metadata !{i32 331, i32 21, metadata !1297, null}
!1301 = metadata !{i32 334, i32 3, metadata !1233, null}
!1302 = metadata !{i32 335, i32 3, metadata !1233, null}
!1303 = metadata !{i32 336, i32 5, metadata !1233, null}
!1304 = metadata !{i32 337, i32 3, metadata !1233, null}
!1305 = metadata !{i32 341, i32 8, metadata !1306, null}
!1306 = metadata !{i32 786443, metadata !1233, i32 341, i32 3, metadata !144, i32 5} ; [ DW_TAG_lexical_block ]
!1307 = metadata !{i32 342, i32 5, metadata !1306, null}
!1308 = metadata !{i32 343, i32 7, metadata !1306, null}
!1309 = metadata !{i32 341, i32 27, metadata !1306, null}
!1310 = metadata !{i32 344, i32 3, metadata !1233, null}
!1311 = metadata !{i32 345, i32 5, metadata !1233, null}
!1312 = metadata !{i32 346, i32 3, metadata !1233, null}
!1313 = metadata !{i32 350, i32 3, metadata !1233, null}
!1314 = metadata !{i32 351, i32 3, metadata !1233, null}
!1315 = metadata !{i32 351, i32 15, metadata !1233, null}
!1316 = metadata !{i32 352, i32 3, metadata !1233, null}
!1317 = metadata !{i32 353, i32 5, metadata !1318, null}
!1318 = metadata !{i32 786443, metadata !1233, i32 352, i32 15, metadata !144, i32 6} ; [ DW_TAG_lexical_block ]
!1319 = metadata !{i32 354, i32 3, metadata !1318, null}
!1320 = metadata !{i32 358, i32 3, metadata !1233, null}
!1321 = metadata !{i32 358, i32 11, metadata !1233, null}
!1322 = metadata !{i32 359, i32 3, metadata !1233, null}
!1323 = metadata !{i32 360, i32 5, metadata !1324, null}
!1324 = metadata !{i32 786443, metadata !1233, i32 359, i32 6, metadata !144, i32 7} ; [ DW_TAG_lexical_block ]
!1325 = metadata !{i32 361, i32 7, metadata !1324, null}
!1326 = metadata !{i32 362, i32 3, metadata !1324, null}
!1327 = metadata !{i32 366, i32 3, metadata !1233, null}
!1328 = metadata !{i32 367, i32 3, metadata !1233, null}
!1329 = metadata !{i32 368, i32 3, metadata !1233, null}
!1330 = metadata !{i32 369, i32 3, metadata !1233, null}
!1331 = metadata !{i32 370, i32 3, metadata !1233, null}
!1332 = metadata !{i32 371, i32 3, metadata !1233, null}
!1333 = metadata !{i32 372, i32 3, metadata !1233, null}
!1334 = metadata !{i32 375, i32 3, metadata !1335, null}
!1335 = metadata !{i32 786443, metadata !1233, i32 375, i32 3, metadata !144, i32 8} ; [ DW_TAG_lexical_block ]
!1336 = metadata !{i32 377, i32 5, metadata !1337, null}
!1337 = metadata !{i32 786443, metadata !1335, i32 376, i32 3, metadata !144, i32 9} ; [ DW_TAG_lexical_block ]
!1338 = metadata !{i32 378, i32 5, metadata !1337, null}
!1339 = metadata !{i32 382, i32 7, metadata !1340, null}
!1340 = metadata !{i32 786443, metadata !1337, i32 379, i32 5, metadata !144, i32 10} ; [ DW_TAG_lexical_block ]
!1341 = metadata !{i32 384, i32 9, metadata !1342, null}
!1342 = metadata !{i32 786443, metadata !1340, i32 383, i32 7, metadata !144, i32 11} ; [ DW_TAG_lexical_block ]
!1343 = metadata !{i32 385, i32 9, metadata !1342, null}
!1344 = metadata !{i32 388, i32 9, metadata !1342, null}
!1345 = metadata !{i32 389, i32 9, metadata !1342, null}
!1346 = metadata !{i32 391, i32 11, metadata !1347, null}
!1347 = metadata !{i32 786443, metadata !1342, i32 390, i32 9, metadata !144, i32 12} ; [ DW_TAG_lexical_block ]
!1348 = metadata !{i32 392, i32 11, metadata !1347, null}
!1349 = metadata !{i32 393, i32 11, metadata !1347, null}
!1350 = metadata !{i32 395, i32 13, metadata !1351, null}
!1351 = metadata !{i32 786443, metadata !1347, i32 394, i32 11, metadata !144, i32 13} ; [ DW_TAG_lexical_block ]
!1352 = metadata !{i32 396, i32 15, metadata !1351, null}
!1353 = metadata !{i32 397, i32 13, metadata !1351, null}
!1354 = metadata !{i32 398, i32 11, metadata !1351, null}
!1355 = metadata !{i32 399, i32 9, metadata !1347, null}
!1356 = metadata !{i32 400, i32 9, metadata !1342, null}
!1357 = metadata !{i32 403, i32 33, metadata !1342, null}
!1358 = metadata !{i32 406, i32 11, metadata !1359, null}
!1359 = metadata !{i32 786443, metadata !1342, i32 405, i32 9, metadata !144, i32 14} ; [ DW_TAG_lexical_block ]
!1360 = metadata !{i32 407, i32 13, metadata !1359, null}
!1361 = metadata !{i32 408, i32 11, metadata !1359, null}
!1362 = metadata !{i32 410, i32 9, metadata !1342, null}
!1363 = metadata !{i32 411, i32 9, metadata !1342, null}
!1364 = metadata !{i32 412, i32 9, metadata !1342, null}
!1365 = metadata !{i32 413, i32 9, metadata !1342, null}
!1366 = metadata !{i32 416, i32 9, metadata !1342, null}
!1367 = metadata !{i32 418, i32 11, metadata !1368, null}
!1368 = metadata !{i32 786443, metadata !1342, i32 417, i32 9, metadata !144, i32 15} ; [ DW_TAG_lexical_block ]
!1369 = metadata !{i32 419, i32 11, metadata !1368, null}
!1370 = metadata !{i32 420, i32 11, metadata !1368, null}
!1371 = metadata !{i32 421, i32 11, metadata !1368, null}
!1372 = metadata !{i32 422, i32 11, metadata !1368, null}
!1373 = metadata !{i32 423, i32 11, metadata !1368, null}
!1374 = metadata !{i32 424, i32 9, metadata !1368, null}
!1375 = metadata !{i32 425, i32 7, metadata !1342, null}
!1376 = metadata !{i32 428, i32 7, metadata !1340, null}
!1377 = metadata !{i32 429, i32 7, metadata !1340, null}
!1378 = metadata !{i32 430, i32 9, metadata !1340, null}
!1379 = metadata !{i32 431, i32 12, metadata !1340, null}
!1380 = metadata !{i32 433, i32 9, metadata !1381, null}
!1381 = metadata !{i32 786443, metadata !1340, i32 432, i32 7, metadata !144, i32 16} ; [ DW_TAG_lexical_block ]
!1382 = metadata !{i32 434, i32 9, metadata !1381, null}
!1383 = metadata !{i32 435, i32 2, metadata !1381, null}
!1384 = metadata !{i32 436, i32 7, metadata !1381, null}
!1385 = metadata !{i32 439, i32 9, metadata !1386, null}
!1386 = metadata !{i32 786443, metadata !1340, i32 438, i32 7, metadata !144, i32 17} ; [ DW_TAG_lexical_block ]
!1387 = metadata !{i32 440, i32 9, metadata !1386, null}
!1388 = metadata !{i32 444, i32 7, metadata !1340, null}
!1389 = metadata !{i32 445, i32 12, metadata !1390, null}
!1390 = metadata !{i32 786443, metadata !1340, i32 445, i32 7, metadata !144, i32 18} ; [ DW_TAG_lexical_block ]
!1391 = metadata !{i32 446, i32 9, metadata !1390, null}
!1392 = metadata !{i32 445, i32 31, metadata !1390, null}
!1393 = metadata !{i32 449, i32 12, metadata !1394, null}
!1394 = metadata !{i32 786443, metadata !1340, i32 449, i32 7, metadata !144, i32 19} ; [ DW_TAG_lexical_block ]
!1395 = metadata !{i32 450, i32 9, metadata !1394, null}
!1396 = metadata !{i32 449, i32 37, metadata !1394, null}
!1397 = metadata !{i32 451, i32 7, metadata !1340, null}
!1398 = metadata !{i32 454, i32 7, metadata !1340, null}
!1399 = metadata !{i32 456, i32 9, metadata !1400, null}
!1400 = metadata !{i32 786443, metadata !1340, i32 455, i32 7, metadata !144, i32 20} ; [ DW_TAG_lexical_block ]
!1401 = metadata !{i32 457, i32 9, metadata !1400, null}
!1402 = metadata !{i32 458, i32 7, metadata !1400, null}
!1403 = metadata !{i32 459, i32 5, metadata !1340, null}
!1404 = metadata !{i32 460, i32 3, metadata !1337, null}
!1405 = metadata !{i32 375, i32 18, metadata !1335, null}
!1406 = metadata !{i32 464, i32 3, metadata !1233, null}
!1407 = metadata !{i32 465, i32 1, metadata !1233, null}
!1408 = metadata !{i32 786689, metadata !163, metadata !"t", metadata !144, i32 16777686, metadata !151, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1409 = metadata !{i32 470, i32 14, metadata !163, null}
!1410 = metadata !{i32 786688, metadata !1411, metadata !"p", metadata !144, i32 475, metadata !151, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1411 = metadata !{i32 786443, metadata !163, i32 474, i32 1, metadata !144, i32 21} ; [ DW_TAG_lexical_block ]
!1412 = metadata !{i32 475, i32 25, metadata !1411, null}
!1413 = metadata !{i32 786688, metadata !1411, metadata !"q", metadata !144, i32 475, metadata !151, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1414 = metadata !{i32 475, i32 29, metadata !1411, null}
!1415 = metadata !{i32 479, i32 3, metadata !1411, null}
!1416 = metadata !{i32 480, i32 3, metadata !1411, null}
!1417 = metadata !{i32 482, i32 5, metadata !1418, null}
!1418 = metadata !{i32 786443, metadata !1411, i32 481, i32 3, metadata !144, i32 22} ; [ DW_TAG_lexical_block ]
!1419 = metadata !{i32 483, i32 5, metadata !1418, null}
!1420 = metadata !{i32 484, i32 5, metadata !1418, null}
!1421 = metadata !{i32 485, i32 3, metadata !1418, null}
!1422 = metadata !{i32 486, i32 3, metadata !1411, null}
!1423 = metadata !{i32 786689, metadata !166, metadata !"tl", metadata !144, i32 16777707, metadata !151, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1424 = metadata !{i32 491, i32 14, metadata !166, null}
!1425 = metadata !{i32 786689, metadata !166, metadata !"td", metadata !144, i32 33554923, metadata !151, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1426 = metadata !{i32 491, i32 19, metadata !166, null}
!1427 = metadata !{i32 786689, metadata !166, metadata !"bl", metadata !144, i32 50332140, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1428 = metadata !{i32 492, i32 5, metadata !166, null}
!1429 = metadata !{i32 786689, metadata !166, metadata !"bd", metadata !144, i32 67109356, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1430 = metadata !{i32 492, i32 9, metadata !166, null}
!1431 = metadata !{i32 786688, metadata !1432, metadata !"e", metadata !144, i32 496, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1432 = metadata !{i32 786443, metadata !166, i32 495, i32 1, metadata !144, i32 23} ; [ DW_TAG_lexical_block ]
!1433 = metadata !{i32 496, i32 21, metadata !1432, null}
!1434 = metadata !{i32 786688, metadata !1432, metadata !"n", metadata !144, i32 497, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1435 = metadata !{i32 497, i32 12, metadata !1432, null}
!1436 = metadata !{i32 786688, metadata !1432, metadata !"d", metadata !144, i32 497, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1437 = metadata !{i32 497, i32 15, metadata !1432, null}
!1438 = metadata !{i32 786688, metadata !1432, metadata !"w", metadata !144, i32 498, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1439 = metadata !{i32 498, i32 12, metadata !1432, null}
!1440 = metadata !{i32 786688, metadata !1432, metadata !"t", metadata !144, i32 499, metadata !151, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1441 = metadata !{i32 499, i32 16, metadata !1432, null}
!1442 = metadata !{i32 786688, metadata !1432, metadata !"ml", metadata !144, i32 500, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1443 = metadata !{i32 500, i32 12, metadata !1432, null}
!1444 = metadata !{i32 786688, metadata !1432, metadata !"md", metadata !144, i32 500, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1445 = metadata !{i32 500, i32 16, metadata !1432, null}
!1446 = metadata !{i32 786688, metadata !1432, metadata !"b", metadata !144, i32 501, metadata !187, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1447 = metadata !{i32 501, i32 16, metadata !1432, null}
!1448 = metadata !{i32 786688, metadata !1432, metadata !"k", metadata !144, i32 502, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1449 = metadata !{i32 502, i32 21, metadata !1432, null}
!1450 = metadata !{i32 506, i32 3, metadata !1432, null}
!1451 = metadata !{i32 507, i32 3, metadata !1432, null}
!1452 = metadata !{i32 508, i32 3, metadata !1432, null}
!1453 = metadata !{i32 511, i32 3, metadata !1432, null}
!1454 = metadata !{i32 512, i32 3, metadata !1432, null}
!1455 = metadata !{i32 513, i32 3, metadata !1456, null}
!1456 = metadata !{i32 786443, metadata !1432, i32 513, i32 3, metadata !144, i32 24} ; [ DW_TAG_lexical_block ]
!1457 = metadata !{i32 515, i32 5, metadata !1458, null}
!1458 = metadata !{i32 786443, metadata !1459, i32 515, i32 5, metadata !144, i32 26} ; [ DW_TAG_lexical_block ]
!1459 = metadata !{i32 786443, metadata !1456, i32 514, i32 3, metadata !144, i32 25} ; [ DW_TAG_lexical_block ]
!1460 = metadata !{i32 515, i32 5, metadata !1461, null}
!1461 = metadata !{i32 786443, metadata !1458, i32 515, i32 5, metadata !144, i32 27} ; [ DW_TAG_lexical_block ]
!1462 = metadata !{i32 516, i32 5, metadata !1459, null}
!1463 = metadata !{i32 517, i32 7, metadata !1459, null}
!1464 = metadata !{i32 518, i32 9, metadata !1465, null}
!1465 = metadata !{i32 786443, metadata !1459, i32 517, i32 10, metadata !144, i32 28} ; [ DW_TAG_lexical_block ]
!1466 = metadata !{i32 519, i32 11, metadata !1465, null}
!1467 = metadata !{i32 520, i32 9, metadata !1468, null}
!1468 = metadata !{i32 786443, metadata !1465, i32 520, i32 9, metadata !144, i32 29} ; [ DW_TAG_lexical_block ]
!1469 = metadata !{i32 521, i32 9, metadata !1465, null}
!1470 = metadata !{i32 522, i32 9, metadata !1471, null}
!1471 = metadata !{i32 786443, metadata !1465, i32 522, i32 9, metadata !144, i32 30} ; [ DW_TAG_lexical_block ]
!1472 = metadata !{i32 522, i32 9, metadata !1473, null}
!1473 = metadata !{i32 786443, metadata !1471, i32 522, i32 9, metadata !144, i32 31} ; [ DW_TAG_lexical_block ]
!1474 = metadata !{i32 523, i32 7, metadata !1465, null}
!1475 = metadata !{i32 524, i32 5, metadata !1476, null}
!1476 = metadata !{i32 786443, metadata !1459, i32 524, i32 5, metadata !144, i32 32} ; [ DW_TAG_lexical_block ]
!1477 = metadata !{i32 525, i32 5, metadata !1459, null}
!1478 = metadata !{i32 527, i32 7, metadata !1479, null}
!1479 = metadata !{i32 786443, metadata !1459, i32 526, i32 5, metadata !144, i32 33} ; [ DW_TAG_lexical_block ]
!1480 = metadata !{i32 529, i32 7, metadata !1479, null}
!1481 = metadata !{i32 531, i32 9, metadata !1482, null}
!1482 = metadata !{i32 786443, metadata !1479, i32 530, i32 7, metadata !144, i32 34} ; [ DW_TAG_lexical_block ]
!1483 = metadata !{i32 532, i32 9, metadata !1482, null}
!1484 = metadata !{i32 533, i32 7, metadata !1482, null}
!1485 = metadata !{i32 534, i32 5, metadata !1479, null}
!1486 = metadata !{i32 538, i32 7, metadata !1487, null}
!1487 = metadata !{i32 786443, metadata !1459, i32 536, i32 5, metadata !144, i32 35} ; [ DW_TAG_lexical_block ]
!1488 = metadata !{i32 539, i32 9, metadata !1487, null}
!1489 = metadata !{i32 542, i32 7, metadata !1490, null}
!1490 = metadata !{i32 786443, metadata !1487, i32 542, i32 7, metadata !144, i32 36} ; [ DW_TAG_lexical_block ]
!1491 = metadata !{i32 542, i32 7, metadata !1492, null}
!1492 = metadata !{i32 786443, metadata !1490, i32 542, i32 7, metadata !144, i32 37} ; [ DW_TAG_lexical_block ]
!1493 = metadata !{i32 543, i32 7, metadata !1487, null}
!1494 = metadata !{i32 544, i32 7, metadata !1495, null}
!1495 = metadata !{i32 786443, metadata !1487, i32 544, i32 7, metadata !144, i32 38} ; [ DW_TAG_lexical_block ]
!1496 = metadata !{i32 547, i32 7, metadata !1497, null}
!1497 = metadata !{i32 786443, metadata !1487, i32 547, i32 7, metadata !144, i32 39} ; [ DW_TAG_lexical_block ]
!1498 = metadata !{i32 547, i32 7, metadata !1499, null}
!1499 = metadata !{i32 786443, metadata !1497, i32 547, i32 7, metadata !144, i32 40} ; [ DW_TAG_lexical_block ]
!1500 = metadata !{i32 548, i32 7, metadata !1487, null}
!1501 = metadata !{i32 549, i32 9, metadata !1487, null}
!1502 = metadata !{i32 550, i32 11, metadata !1503, null}
!1503 = metadata !{i32 786443, metadata !1487, i32 549, i32 12, metadata !144, i32 41} ; [ DW_TAG_lexical_block ]
!1504 = metadata !{i32 551, i32 13, metadata !1503, null}
!1505 = metadata !{i32 552, i32 11, metadata !1506, null}
!1506 = metadata !{i32 786443, metadata !1503, i32 552, i32 11, metadata !144, i32 42} ; [ DW_TAG_lexical_block ]
!1507 = metadata !{i32 553, i32 11, metadata !1503, null}
!1508 = metadata !{i32 554, i32 11, metadata !1509, null}
!1509 = metadata !{i32 786443, metadata !1503, i32 554, i32 11, metadata !144, i32 43} ; [ DW_TAG_lexical_block ]
!1510 = metadata !{i32 554, i32 11, metadata !1511, null}
!1511 = metadata !{i32 786443, metadata !1509, i32 554, i32 11, metadata !144, i32 44} ; [ DW_TAG_lexical_block ]
!1512 = metadata !{i32 555, i32 9, metadata !1503, null}
!1513 = metadata !{i32 556, i32 7, metadata !1514, null}
!1514 = metadata !{i32 786443, metadata !1487, i32 556, i32 7, metadata !144, i32 45} ; [ DW_TAG_lexical_block ]
!1515 = metadata !{i32 557, i32 7, metadata !1516, null}
!1516 = metadata !{i32 786443, metadata !1487, i32 557, i32 7, metadata !144, i32 46} ; [ DW_TAG_lexical_block ]
!1517 = metadata !{i32 557, i32 7, metadata !1518, null}
!1518 = metadata !{i32 786443, metadata !1516, i32 557, i32 7, metadata !144, i32 47} ; [ DW_TAG_lexical_block ]
!1519 = metadata !{i32 558, i32 7, metadata !1487, null}
!1520 = metadata !{i32 559, i32 7, metadata !1521, null}
!1521 = metadata !{i32 786443, metadata !1487, i32 559, i32 7, metadata !144, i32 48} ; [ DW_TAG_lexical_block ]
!1522 = metadata !{i32 563, i32 7, metadata !1487, null}
!1523 = metadata !{i32 564, i32 9, metadata !1524, null}
!1524 = metadata !{i32 786443, metadata !1487, i32 563, i32 10, metadata !144, i32 49} ; [ DW_TAG_lexical_block ]
!1525 = metadata !{i32 566, i32 9, metadata !1524, null}
!1526 = metadata !{i32 568, i32 11, metadata !1527, null}
!1527 = metadata !{i32 786443, metadata !1524, i32 567, i32 9, metadata !144, i32 50} ; [ DW_TAG_lexical_block ]
!1528 = metadata !{i32 569, i32 11, metadata !1527, null}
!1529 = metadata !{i32 570, i32 11, metadata !1527, null}
!1530 = metadata !{i32 571, i32 9, metadata !1527, null}
!1531 = metadata !{i32 574, i32 11, metadata !1524, null}
!1532 = metadata !{i32 575, i32 13, metadata !1533, null}
!1533 = metadata !{i32 786443, metadata !1524, i32 574, i32 14, metadata !144, i32 51} ; [ DW_TAG_lexical_block ]
!1534 = metadata !{i32 577, i32 11, metadata !1533, null}
!1535 = metadata !{i32 578, i32 9, metadata !1524, null}
!1536 = metadata !{i32 580, i32 11, metadata !1537, null}
!1537 = metadata !{i32 786443, metadata !1524, i32 579, i32 9, metadata !144, i32 52} ; [ DW_TAG_lexical_block ]
!1538 = metadata !{i32 581, i32 11, metadata !1537, null}
!1539 = metadata !{i32 582, i32 9, metadata !1537, null}
!1540 = metadata !{i32 583, i32 7, metadata !1524, null}
!1541 = metadata !{i32 585, i32 3, metadata !1459, null}
!1542 = metadata !{i32 589, i32 3, metadata !1432, null}
!1543 = metadata !{i32 590, i32 3, metadata !1432, null}
!1544 = metadata !{i32 591, i32 3, metadata !1432, null}
!1545 = metadata !{i32 594, i32 3, metadata !1432, null}
!1546 = metadata !{i32 595, i32 1, metadata !1432, null}
!1547 = metadata !{i32 786688, metadata !1548, metadata !"n", metadata !144, i32 602, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1548 = metadata !{i32 786443, metadata !169, i32 601, i32 1, metadata !144, i32 53} ; [ DW_TAG_lexical_block ]
!1549 = metadata !{i32 602, i32 12, metadata !1548, null}
!1550 = metadata !{i32 786688, metadata !1548, metadata !"w", metadata !144, i32 603, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1551 = metadata !{i32 603, i32 12, metadata !1548, null}
!1552 = metadata !{i32 786688, metadata !1548, metadata !"b", metadata !144, i32 604, metadata !187, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1553 = metadata !{i32 604, i32 16, metadata !1548, null}
!1554 = metadata !{i32 786688, metadata !1548, metadata !"k", metadata !144, i32 605, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1555 = metadata !{i32 605, i32 21, metadata !1548, null}
!1556 = metadata !{i32 609, i32 3, metadata !1548, null}
!1557 = metadata !{i32 610, i32 3, metadata !1548, null}
!1558 = metadata !{i32 611, i32 3, metadata !1548, null}
!1559 = metadata !{i32 615, i32 3, metadata !1548, null}
!1560 = metadata !{i32 616, i32 3, metadata !1561, null}
!1561 = metadata !{i32 786443, metadata !1548, i32 616, i32 3, metadata !144, i32 54} ; [ DW_TAG_lexical_block ]
!1562 = metadata !{i32 620, i32 3, metadata !1563, null}
!1563 = metadata !{i32 786443, metadata !1548, i32 620, i32 3, metadata !144, i32 55} ; [ DW_TAG_lexical_block ]
!1564 = metadata !{i32 620, i32 3, metadata !1565, null}
!1565 = metadata !{i32 786443, metadata !1563, i32 620, i32 3, metadata !144, i32 56} ; [ DW_TAG_lexical_block ]
!1566 = metadata !{i32 621, i32 3, metadata !1548, null}
!1567 = metadata !{i32 622, i32 3, metadata !1568, null}
!1568 = metadata !{i32 786443, metadata !1548, i32 622, i32 3, metadata !144, i32 57} ; [ DW_TAG_lexical_block ]
!1569 = metadata !{i32 623, i32 3, metadata !1570, null}
!1570 = metadata !{i32 786443, metadata !1548, i32 623, i32 3, metadata !144, i32 58} ; [ DW_TAG_lexical_block ]
!1571 = metadata !{i32 623, i32 3, metadata !1572, null}
!1572 = metadata !{i32 786443, metadata !1570, i32 623, i32 3, metadata !144, i32 59} ; [ DW_TAG_lexical_block ]
!1573 = metadata !{i32 624, i32 3, metadata !1548, null}
!1574 = metadata !{i32 625, i32 5, metadata !1548, null}
!1575 = metadata !{i32 626, i32 3, metadata !1576, null}
!1576 = metadata !{i32 786443, metadata !1548, i32 626, i32 3, metadata !144, i32 60} ; [ DW_TAG_lexical_block ]
!1577 = metadata !{i32 630, i32 3, metadata !1548, null}
!1578 = metadata !{i32 632, i32 5, metadata !1579, null}
!1579 = metadata !{i32 786443, metadata !1580, i32 632, i32 5, metadata !144, i32 62} ; [ DW_TAG_lexical_block ]
!1580 = metadata !{i32 786443, metadata !1548, i32 631, i32 3, metadata !144, i32 61} ; [ DW_TAG_lexical_block ]
!1581 = metadata !{i32 632, i32 5, metadata !1582, null}
!1582 = metadata !{i32 786443, metadata !1579, i32 632, i32 5, metadata !144, i32 63} ; [ DW_TAG_lexical_block ]
!1583 = metadata !{i32 633, i32 5, metadata !1580, null}
!1584 = metadata !{i32 634, i32 5, metadata !1580, null}
!1585 = metadata !{i32 636, i32 7, metadata !1586, null}
!1586 = metadata !{i32 786443, metadata !1580, i32 635, i32 5, metadata !144, i32 64} ; [ DW_TAG_lexical_block ]
!1587 = metadata !{i32 637, i32 7, metadata !1586, null}
!1588 = metadata !{i32 638, i32 5, metadata !1586, null}
!1589 = metadata !{i32 639, i32 5, metadata !1590, null}
!1590 = metadata !{i32 786443, metadata !1580, i32 639, i32 5, metadata !144, i32 65} ; [ DW_TAG_lexical_block ]
!1591 = metadata !{i32 640, i32 3, metadata !1580, null}
!1592 = metadata !{i32 644, i32 3, metadata !1548, null}
!1593 = metadata !{i32 645, i32 3, metadata !1548, null}
!1594 = metadata !{i32 646, i32 3, metadata !1548, null}
!1595 = metadata !{i32 647, i32 3, metadata !1548, null}
!1596 = metadata !{i32 648, i32 1, metadata !1548, null}
!1597 = metadata !{i32 786688, metadata !1598, metadata !"i", metadata !144, i32 657, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1598 = metadata !{i32 786443, metadata !172, i32 656, i32 1, metadata !144, i32 66} ; [ DW_TAG_lexical_block ]
!1599 = metadata !{i32 657, i32 7, metadata !1598, null}
!1600 = metadata !{i32 786688, metadata !1598, metadata !"tl", metadata !144, i32 658, metadata !151, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1601 = metadata !{i32 658, i32 16, metadata !1598, null}
!1602 = metadata !{i32 786688, metadata !1598, metadata !"td", metadata !144, i32 659, metadata !151, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1603 = metadata !{i32 659, i32 16, metadata !1598, null}
!1604 = metadata !{i32 786688, metadata !1598, metadata !"bl", metadata !144, i32 660, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1605 = metadata !{i32 660, i32 7, metadata !1598, null}
!1606 = metadata !{i32 786688, metadata !1598, metadata !"bd", metadata !144, i32 661, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1607 = metadata !{i32 661, i32 7, metadata !1598, null}
!1608 = metadata !{i32 786688, metadata !1598, metadata !"l", metadata !144, i32 662, metadata !1262, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1609 = metadata !{i32 662, i32 12, metadata !1598, null}
!1610 = metadata !{i32 666, i32 8, metadata !1611, null}
!1611 = metadata !{i32 786443, metadata !1598, i32 666, i32 3, metadata !144, i32 67} ; [ DW_TAG_lexical_block ]
!1612 = metadata !{i32 667, i32 5, metadata !1611, null}
!1613 = metadata !{i32 666, i32 24, metadata !1611, null}
!1614 = metadata !{i32 668, i32 3, metadata !1615, null}
!1615 = metadata !{i32 786443, metadata !1598, i32 668, i32 3, metadata !144, i32 68} ; [ DW_TAG_lexical_block ]
!1616 = metadata !{i32 669, i32 5, metadata !1615, null}
!1617 = metadata !{i32 668, i32 19, metadata !1615, null}
!1618 = metadata !{i32 670, i32 3, metadata !1619, null}
!1619 = metadata !{i32 786443, metadata !1598, i32 670, i32 3, metadata !144, i32 69} ; [ DW_TAG_lexical_block ]
!1620 = metadata !{i32 671, i32 5, metadata !1619, null}
!1621 = metadata !{i32 670, i32 19, metadata !1619, null}
!1622 = metadata !{i32 672, i32 3, metadata !1623, null}
!1623 = metadata !{i32 786443, metadata !1598, i32 672, i32 3, metadata !144, i32 70} ; [ DW_TAG_lexical_block ]
!1624 = metadata !{i32 673, i32 5, metadata !1623, null}
!1625 = metadata !{i32 672, i32 19, metadata !1623, null}
!1626 = metadata !{i32 674, i32 3, metadata !1598, null}
!1627 = metadata !{i32 675, i32 12, metadata !1598, null}
!1628 = metadata !{i32 676, i32 5, metadata !1598, null}
!1629 = metadata !{i32 680, i32 8, metadata !1630, null}
!1630 = metadata !{i32 786443, metadata !1598, i32 680, i32 3, metadata !144, i32 71} ; [ DW_TAG_lexical_block ]
!1631 = metadata !{i32 681, i32 5, metadata !1630, null}
!1632 = metadata !{i32 680, i32 23, metadata !1630, null}
!1633 = metadata !{i32 682, i32 3, metadata !1598, null}
!1634 = metadata !{i32 683, i32 12, metadata !1598, null}
!1635 = metadata !{i32 685, i32 5, metadata !1636, null}
!1636 = metadata !{i32 786443, metadata !1598, i32 684, i32 3, metadata !144, i32 72} ; [ DW_TAG_lexical_block ]
!1637 = metadata !{i32 686, i32 5, metadata !1636, null}
!1638 = metadata !{i32 691, i32 7, metadata !1598, null}
!1639 = metadata !{i32 692, i32 5, metadata !1598, null}
!1640 = metadata !{i32 696, i32 3, metadata !1598, null}
!1641 = metadata !{i32 697, i32 3, metadata !1598, null}
!1642 = metadata !{i32 698, i32 3, metadata !1598, null}
!1643 = metadata !{i32 699, i32 1, metadata !1598, null}
!1644 = metadata !{i32 786688, metadata !1645, metadata !"i", metadata !144, i32 706, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1645 = metadata !{i32 786443, metadata !173, i32 705, i32 1, metadata !144, i32 73} ; [ DW_TAG_lexical_block ]
!1646 = metadata !{i32 706, i32 7, metadata !1645, null}
!1647 = metadata !{i32 786688, metadata !1645, metadata !"j", metadata !144, i32 707, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1648 = metadata !{i32 707, i32 12, metadata !1645, null}
!1649 = metadata !{i32 786688, metadata !1645, metadata !"l", metadata !144, i32 708, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1650 = metadata !{i32 708, i32 12, metadata !1645, null}
!1651 = metadata !{i32 786688, metadata !1645, metadata !"m", metadata !144, i32 709, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1652 = metadata !{i32 709, i32 12, metadata !1645, null}
!1653 = metadata !{i32 786688, metadata !1645, metadata !"n", metadata !144, i32 710, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1654 = metadata !{i32 710, i32 12, metadata !1645, null}
!1655 = metadata !{i32 786688, metadata !1645, metadata !"tl", metadata !144, i32 711, metadata !151, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1656 = metadata !{i32 711, i32 16, metadata !1645, null}
!1657 = metadata !{i32 786688, metadata !1645, metadata !"td", metadata !144, i32 712, metadata !151, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1658 = metadata !{i32 712, i32 16, metadata !1645, null}
!1659 = metadata !{i32 786688, metadata !1645, metadata !"bl", metadata !144, i32 713, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1660 = metadata !{i32 713, i32 7, metadata !1645, null}
!1661 = metadata !{i32 786688, metadata !1645, metadata !"bd", metadata !144, i32 714, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1662 = metadata !{i32 714, i32 7, metadata !1645, null}
!1663 = metadata !{i32 786688, metadata !1645, metadata !"nb", metadata !144, i32 715, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1664 = metadata !{i32 715, i32 12, metadata !1645, null}
!1665 = metadata !{i32 786688, metadata !1645, metadata !"nl", metadata !144, i32 716, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1666 = metadata !{i32 716, i32 12, metadata !1645, null}
!1667 = metadata !{i32 786688, metadata !1645, metadata !"nd", metadata !144, i32 717, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1668 = metadata !{i32 717, i32 12, metadata !1645, null}
!1669 = metadata !{i32 786688, metadata !1645, metadata !"ll", metadata !144, i32 721, metadata !1670, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1670 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 10112, i64 32, i32 0, i32 0, metadata !19, metadata !1671, i32 0, i32 0} ; [ DW_TAG_array_type ]
!1671 = metadata !{metadata !1672}
!1672 = metadata !{i32 786465, i64 0, i64 315}    ; [ DW_TAG_subrange_type ]
!1673 = metadata !{i32 721, i32 12, metadata !1645, null}
!1674 = metadata !{i32 786688, metadata !1645, metadata !"b", metadata !144, i32 723, metadata !187, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1675 = metadata !{i32 723, i32 16, metadata !1645, null}
!1676 = metadata !{i32 786688, metadata !1645, metadata !"k", metadata !144, i32 724, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1677 = metadata !{i32 724, i32 21, metadata !1645, null}
!1678 = metadata !{i32 728, i32 3, metadata !1645, null}
!1679 = metadata !{i32 729, i32 3, metadata !1645, null}
!1680 = metadata !{i32 733, i32 3, metadata !1681, null}
!1681 = metadata !{i32 786443, metadata !1645, i32 733, i32 3, metadata !144, i32 74} ; [ DW_TAG_lexical_block ]
!1682 = metadata !{i32 733, i32 3, metadata !1683, null}
!1683 = metadata !{i32 786443, metadata !1681, i32 733, i32 3, metadata !144, i32 75} ; [ DW_TAG_lexical_block ]
!1684 = metadata !{i32 734, i32 3, metadata !1645, null}
!1685 = metadata !{i32 735, i32 3, metadata !1686, null}
!1686 = metadata !{i32 786443, metadata !1645, i32 735, i32 3, metadata !144, i32 76} ; [ DW_TAG_lexical_block ]
!1687 = metadata !{i32 736, i32 3, metadata !1688, null}
!1688 = metadata !{i32 786443, metadata !1645, i32 736, i32 3, metadata !144, i32 77} ; [ DW_TAG_lexical_block ]
!1689 = metadata !{i32 736, i32 3, metadata !1690, null}
!1690 = metadata !{i32 786443, metadata !1688, i32 736, i32 3, metadata !144, i32 78} ; [ DW_TAG_lexical_block ]
!1691 = metadata !{i32 737, i32 3, metadata !1645, null}
!1692 = metadata !{i32 738, i32 3, metadata !1693, null}
!1693 = metadata !{i32 786443, metadata !1645, i32 738, i32 3, metadata !144, i32 79} ; [ DW_TAG_lexical_block ]
!1694 = metadata !{i32 739, i32 3, metadata !1695, null}
!1695 = metadata !{i32 786443, metadata !1645, i32 739, i32 3, metadata !144, i32 80} ; [ DW_TAG_lexical_block ]
!1696 = metadata !{i32 739, i32 3, metadata !1697, null}
!1697 = metadata !{i32 786443, metadata !1695, i32 739, i32 3, metadata !144, i32 81} ; [ DW_TAG_lexical_block ]
!1698 = metadata !{i32 740, i32 3, metadata !1645, null}
!1699 = metadata !{i32 741, i32 3, metadata !1700, null}
!1700 = metadata !{i32 786443, metadata !1645, i32 741, i32 3, metadata !144, i32 82} ; [ DW_TAG_lexical_block ]
!1701 = metadata !{i32 745, i32 3, metadata !1645, null}
!1702 = metadata !{i32 747, i32 5, metadata !1645, null}
!1703 = metadata !{i32 751, i32 8, metadata !1704, null}
!1704 = metadata !{i32 786443, metadata !1645, i32 751, i32 3, metadata !144, i32 83} ; [ DW_TAG_lexical_block ]
!1705 = metadata !{i32 753, i32 5, metadata !1706, null}
!1706 = metadata !{i32 786443, metadata !1707, i32 753, i32 5, metadata !144, i32 85} ; [ DW_TAG_lexical_block ]
!1707 = metadata !{i32 786443, metadata !1704, i32 752, i32 3, metadata !144, i32 84} ; [ DW_TAG_lexical_block ]
!1708 = metadata !{i32 753, i32 5, metadata !1709, null}
!1709 = metadata !{i32 786443, metadata !1706, i32 753, i32 5, metadata !144, i32 86} ; [ DW_TAG_lexical_block ]
!1710 = metadata !{i32 754, i32 5, metadata !1707, null}
!1711 = metadata !{i32 755, i32 5, metadata !1712, null}
!1712 = metadata !{i32 786443, metadata !1707, i32 755, i32 5, metadata !144, i32 87} ; [ DW_TAG_lexical_block ]
!1713 = metadata !{i32 756, i32 3, metadata !1707, null}
!1714 = metadata !{i32 751, i32 23, metadata !1704, null}
!1715 = metadata !{i32 757, i32 3, metadata !1716, null}
!1716 = metadata !{i32 786443, metadata !1645, i32 757, i32 3, metadata !144, i32 88} ; [ DW_TAG_lexical_block ]
!1717 = metadata !{i32 758, i32 5, metadata !1716, null}
!1718 = metadata !{i32 757, i32 18, metadata !1716, null}
!1719 = metadata !{i32 762, i32 3, metadata !1645, null}
!1720 = metadata !{i32 763, i32 12, metadata !1645, null}
!1721 = metadata !{i32 765, i32 5, metadata !1722, null}
!1722 = metadata !{i32 786443, metadata !1645, i32 764, i32 3, metadata !144, i32 89} ; [ DW_TAG_lexical_block ]
!1723 = metadata !{i32 766, i32 7, metadata !1722, null}
!1724 = metadata !{i32 767, i32 5, metadata !1722, null}
!1725 = metadata !{i32 772, i32 3, metadata !1645, null}
!1726 = metadata !{i32 773, i32 3, metadata !1645, null}
!1727 = metadata !{i32 774, i32 3, metadata !1645, null}
!1728 = metadata !{i32 775, i32 3, metadata !1645, null}
!1729 = metadata !{i32 777, i32 5, metadata !1730, null}
!1730 = metadata !{i32 786443, metadata !1731, i32 777, i32 5, metadata !144, i32 91} ; [ DW_TAG_lexical_block ]
!1731 = metadata !{i32 786443, metadata !1645, i32 776, i32 3, metadata !144, i32 90} ; [ DW_TAG_lexical_block ]
!1732 = metadata !{i32 777, i32 5, metadata !1733, null}
!1733 = metadata !{i32 786443, metadata !1730, i32 777, i32 5, metadata !144, i32 92} ; [ DW_TAG_lexical_block ]
!1734 = metadata !{i32 778, i32 5, metadata !1731, null}
!1735 = metadata !{i32 779, i32 5, metadata !1736, null}
!1736 = metadata !{i32 786443, metadata !1731, i32 779, i32 5, metadata !144, i32 93} ; [ DW_TAG_lexical_block ]
!1737 = metadata !{i32 780, i32 5, metadata !1731, null}
!1738 = metadata !{i32 781, i32 5, metadata !1731, null}
!1739 = metadata !{i32 782, i32 7, metadata !1731, null}
!1740 = metadata !{i32 783, i32 10, metadata !1731, null}
!1741 = metadata !{i32 785, i32 7, metadata !1742, null}
!1742 = metadata !{i32 786443, metadata !1743, i32 785, i32 7, metadata !144, i32 95} ; [ DW_TAG_lexical_block ]
!1743 = metadata !{i32 786443, metadata !1731, i32 784, i32 5, metadata !144, i32 94} ; [ DW_TAG_lexical_block ]
!1744 = metadata !{i32 785, i32 7, metadata !1745, null}
!1745 = metadata !{i32 786443, metadata !1742, i32 785, i32 7, metadata !144, i32 96} ; [ DW_TAG_lexical_block ]
!1746 = metadata !{i32 786, i32 7, metadata !1743, null}
!1747 = metadata !{i32 787, i32 7, metadata !1748, null}
!1748 = metadata !{i32 786443, metadata !1743, i32 787, i32 7, metadata !144, i32 97} ; [ DW_TAG_lexical_block ]
!1749 = metadata !{i32 788, i32 7, metadata !1743, null}
!1750 = metadata !{i32 789, i32 9, metadata !1743, null}
!1751 = metadata !{i32 790, i32 7, metadata !1743, null}
!1752 = metadata !{i32 791, i32 9, metadata !1743, null}
!1753 = metadata !{i32 792, i32 5, metadata !1743, null}
!1754 = metadata !{i32 793, i32 10, metadata !1731, null}
!1755 = metadata !{i32 795, i32 7, metadata !1756, null}
!1756 = metadata !{i32 786443, metadata !1757, i32 795, i32 7, metadata !144, i32 99} ; [ DW_TAG_lexical_block ]
!1757 = metadata !{i32 786443, metadata !1731, i32 794, i32 5, metadata !144, i32 98} ; [ DW_TAG_lexical_block ]
!1758 = metadata !{i32 795, i32 7, metadata !1759, null}
!1759 = metadata !{i32 786443, metadata !1756, i32 795, i32 7, metadata !144, i32 100} ; [ DW_TAG_lexical_block ]
!1760 = metadata !{i32 796, i32 7, metadata !1757, null}
!1761 = metadata !{i32 797, i32 7, metadata !1762, null}
!1762 = metadata !{i32 786443, metadata !1757, i32 797, i32 7, metadata !144, i32 101} ; [ DW_TAG_lexical_block ]
!1763 = metadata !{i32 798, i32 7, metadata !1757, null}
!1764 = metadata !{i32 799, i32 9, metadata !1757, null}
!1765 = metadata !{i32 800, i32 7, metadata !1757, null}
!1766 = metadata !{i32 801, i32 9, metadata !1757, null}
!1767 = metadata !{i32 802, i32 7, metadata !1757, null}
!1768 = metadata !{i32 803, i32 5, metadata !1757, null}
!1769 = metadata !{i32 806, i32 7, metadata !1770, null}
!1770 = metadata !{i32 786443, metadata !1771, i32 806, i32 7, metadata !144, i32 103} ; [ DW_TAG_lexical_block ]
!1771 = metadata !{i32 786443, metadata !1731, i32 805, i32 5, metadata !144, i32 102} ; [ DW_TAG_lexical_block ]
!1772 = metadata !{i32 806, i32 7, metadata !1773, null}
!1773 = metadata !{i32 786443, metadata !1770, i32 806, i32 7, metadata !144, i32 104} ; [ DW_TAG_lexical_block ]
!1774 = metadata !{i32 807, i32 7, metadata !1771, null}
!1775 = metadata !{i32 808, i32 7, metadata !1776, null}
!1776 = metadata !{i32 786443, metadata !1771, i32 808, i32 7, metadata !144, i32 105} ; [ DW_TAG_lexical_block ]
!1777 = metadata !{i32 809, i32 7, metadata !1771, null}
!1778 = metadata !{i32 810, i32 9, metadata !1771, null}
!1779 = metadata !{i32 811, i32 7, metadata !1771, null}
!1780 = metadata !{i32 812, i32 9, metadata !1771, null}
!1781 = metadata !{i32 813, i32 7, metadata !1771, null}
!1782 = metadata !{i32 815, i32 3, metadata !1731, null}
!1783 = metadata !{i32 819, i32 3, metadata !1645, null}
!1784 = metadata !{i32 823, i32 3, metadata !1645, null}
!1785 = metadata !{i32 824, i32 3, metadata !1645, null}
!1786 = metadata !{i32 828, i32 3, metadata !1645, null}
!1787 = metadata !{i32 829, i32 12, metadata !1645, null}
!1788 = metadata !{i32 831, i32 5, metadata !1789, null}
!1789 = metadata !{i32 786443, metadata !1645, i32 830, i32 3, metadata !144, i32 106} ; [ DW_TAG_lexical_block ]
!1790 = metadata !{i32 832, i32 7, metadata !1791, null}
!1791 = metadata !{i32 786443, metadata !1789, i32 831, i32 17, metadata !144, i32 107} ; [ DW_TAG_lexical_block ]
!1792 = metadata !{i32 833, i32 7, metadata !1791, null}
!1793 = metadata !{i32 834, i32 5, metadata !1791, null}
!1794 = metadata !{i32 835, i32 5, metadata !1789, null}
!1795 = metadata !{i32 837, i32 3, metadata !1645, null}
!1796 = metadata !{i32 838, i32 12, metadata !1645, null}
!1797 = metadata !{i32 840, i32 5, metadata !1798, null}
!1798 = metadata !{i32 786443, metadata !1645, i32 839, i32 3, metadata !144, i32 108} ; [ DW_TAG_lexical_block ]
!1799 = metadata !{i32 841, i32 7, metadata !1800, null}
!1800 = metadata !{i32 786443, metadata !1798, i32 840, i32 17, metadata !144, i32 109} ; [ DW_TAG_lexical_block ]
!1801 = metadata !{i32 846, i32 7, metadata !1800, null}
!1802 = metadata !{i32 847, i32 5, metadata !1800, null}
!1803 = metadata !{i32 848, i32 5, metadata !1798, null}
!1804 = metadata !{i32 849, i32 5, metadata !1798, null}
!1805 = metadata !{i32 855, i32 7, metadata !1645, null}
!1806 = metadata !{i32 856, i32 5, metadata !1645, null}
!1807 = metadata !{i32 860, i32 3, metadata !1645, null}
!1808 = metadata !{i32 861, i32 3, metadata !1645, null}
!1809 = metadata !{i32 862, i32 3, metadata !1645, null}
!1810 = metadata !{i32 863, i32 1, metadata !1645, null}
!1811 = metadata !{i32 786689, metadata !174, metadata !"e", metadata !144, i32 16778084, metadata !112, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1812 = metadata !{i32 868, i32 6, metadata !174, null}
!1813 = metadata !{i32 786688, metadata !1814, metadata !"t", metadata !144, i32 871, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1814 = metadata !{i32 786443, metadata !174, i32 870, i32 1, metadata !144, i32 110} ; [ DW_TAG_lexical_block ]
!1815 = metadata !{i32 871, i32 12, metadata !1814, null}
!1816 = metadata !{i32 786688, metadata !1814, metadata !"b", metadata !144, i32 872, metadata !187, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1817 = metadata !{i32 872, i32 16, metadata !1814, null}
!1818 = metadata !{i32 786688, metadata !1814, metadata !"k", metadata !144, i32 873, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1819 = metadata !{i32 873, i32 21, metadata !1814, null}
!1820 = metadata !{i32 877, i32 3, metadata !1814, null}
!1821 = metadata !{i32 878, i32 3, metadata !1814, null}
!1822 = metadata !{i32 882, i32 3, metadata !1823, null}
!1823 = metadata !{i32 786443, metadata !1814, i32 882, i32 3, metadata !144, i32 111} ; [ DW_TAG_lexical_block ]
!1824 = metadata !{i32 882, i32 3, metadata !1825, null}
!1825 = metadata !{i32 786443, metadata !1823, i32 882, i32 3, metadata !144, i32 112} ; [ DW_TAG_lexical_block ]
!1826 = metadata !{i32 883, i32 3, metadata !1814, null}
!1827 = metadata !{i32 884, i32 3, metadata !1828, null}
!1828 = metadata !{i32 786443, metadata !1814, i32 884, i32 3, metadata !144, i32 113} ; [ DW_TAG_lexical_block ]
!1829 = metadata !{i32 888, i32 3, metadata !1830, null}
!1830 = metadata !{i32 786443, metadata !1814, i32 888, i32 3, metadata !144, i32 114} ; [ DW_TAG_lexical_block ]
!1831 = metadata !{i32 888, i32 3, metadata !1832, null}
!1832 = metadata !{i32 786443, metadata !1830, i32 888, i32 3, metadata !144, i32 115} ; [ DW_TAG_lexical_block ]
!1833 = metadata !{i32 889, i32 3, metadata !1814, null}
!1834 = metadata !{i32 890, i32 3, metadata !1835, null}
!1835 = metadata !{i32 786443, metadata !1814, i32 890, i32 3, metadata !144, i32 116} ; [ DW_TAG_lexical_block ]
!1836 = metadata !{i32 894, i32 3, metadata !1814, null}
!1837 = metadata !{i32 895, i32 3, metadata !1814, null}
!1838 = metadata !{i32 899, i32 3, metadata !1814, null}
!1839 = metadata !{i32 900, i32 12, metadata !1814, null}
!1840 = metadata !{i32 901, i32 3, metadata !1814, null}
!1841 = metadata !{i32 902, i32 12, metadata !1814, null}
!1842 = metadata !{i32 903, i32 3, metadata !1814, null}
!1843 = metadata !{i32 904, i32 12, metadata !1814, null}
!1844 = metadata !{i32 908, i32 3, metadata !1814, null}
!1845 = metadata !{i32 909, i32 1, metadata !1814, null}
!1846 = metadata !{i32 786688, metadata !1847, metadata !"e", metadata !144, i32 916, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1847 = metadata !{i32 786443, metadata !177, i32 915, i32 1, metadata !144, i32 117} ; [ DW_TAG_lexical_block ]
!1848 = metadata !{i32 916, i32 7, metadata !1847, null}
!1849 = metadata !{i32 786688, metadata !1847, metadata !"r", metadata !144, i32 917, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1850 = metadata !{i32 917, i32 7, metadata !1847, null}
!1851 = metadata !{i32 786688, metadata !1847, metadata !"h", metadata !144, i32 918, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1852 = metadata !{i32 918, i32 12, metadata !1847, null}
!1853 = metadata !{i32 922, i32 3, metadata !1847, null}
!1854 = metadata !{i32 923, i32 3, metadata !1847, null}
!1855 = metadata !{i32 924, i32 3, metadata !1847, null}
!1856 = metadata !{i32 928, i32 3, metadata !1847, null}
!1857 = metadata !{i32 929, i32 3, metadata !1847, null}
!1858 = metadata !{i32 930, i32 5, metadata !1859, null}
!1859 = metadata !{i32 786443, metadata !1847, i32 929, i32 6, metadata !144, i32 118} ; [ DW_TAG_lexical_block ]
!1860 = metadata !{i32 931, i32 14, metadata !1859, null}
!1861 = metadata !{i32 932, i32 7, metadata !1859, null}
!1862 = metadata !{i32 933, i32 5, metadata !1859, null}
!1863 = metadata !{i32 934, i32 7, metadata !1859, null}
!1864 = metadata !{i32 935, i32 3, metadata !1859, null}
!1865 = metadata !{i32 940, i32 3, metadata !1847, null}
!1866 = metadata !{i32 941, i32 5, metadata !1867, null}
!1867 = metadata !{i32 786443, metadata !1847, i32 940, i32 19, metadata !144, i32 119} ; [ DW_TAG_lexical_block ]
!1868 = metadata !{i32 942, i32 5, metadata !1867, null}
!1869 = metadata !{i32 943, i32 3, metadata !1867, null}
!1870 = metadata !{i32 946, i32 3, metadata !1847, null}
!1871 = metadata !{i32 953, i32 3, metadata !1847, null}
!1872 = metadata !{i32 954, i32 1, metadata !1847, null}
!1873 = metadata !{i32 786689, metadata !207, metadata !"in", metadata !208, i32 16777233, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1874 = metadata !{i32 17, i32 9, metadata !207, null}
!1875 = metadata !{i32 786689, metadata !207, metadata !"out", metadata !208, i32 33554449, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1876 = metadata !{i32 17, i32 13, metadata !207, null}
!1877 = metadata !{i32 19, i32 5, metadata !1878, null}
!1878 = metadata !{i32 786443, metadata !207, i32 18, i32 1, metadata !208, i32 0} ; [ DW_TAG_lexical_block ]
!1879 = metadata !{i32 19, i32 19, metadata !1878, null}
!1880 = metadata !{i32 20, i32 5, metadata !1878, null}
!1881 = metadata !{i32 21, i32 5, metadata !1878, null}
!1882 = metadata !{i32 22, i32 5, metadata !1878, null}
!1883 = metadata !{i32 23, i32 9, metadata !1884, null}
!1884 = metadata !{i32 786443, metadata !1878, i32 22, i32 20, metadata !208, i32 1} ; [ DW_TAG_lexical_block ]
!1885 = metadata !{i32 24, i32 5, metadata !1884, null}
!1886 = metadata !{i32 25, i32 5, metadata !1878, null}
!1887 = metadata !{i32 26, i32 1, metadata !1878, null}
!1888 = metadata !{i32 786689, metadata !217, metadata !"attr", metadata !218, i32 16777549, metadata !221, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1889 = metadata !{i32 333, i32 11, metadata !217, null}
!1890 = metadata !{i32 786689, metadata !217, metadata !"methodp", metadata !218, i32 33554766, metadata !112, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1891 = metadata !{i32 334, i32 11, metadata !217, null}
!1892 = metadata !{i32 786688, metadata !1893, metadata !"n", metadata !218, i32 336, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1893 = metadata !{i32 786443, metadata !217, i32 335, i32 1, metadata !218, i32 0} ; [ DW_TAG_lexical_block ]
!1894 = metadata !{i32 336, i32 9, metadata !1893, null}
!1895 = metadata !{i32 786688, metadata !1893, metadata !"bits", metadata !218, i32 337, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1896 = metadata !{i32 337, i32 9, metadata !1893, null}
!1897 = metadata !{i32 786688, metadata !1893, metadata !"length", metadata !218, i32 338, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1898 = metadata !{i32 338, i32 9, metadata !1893, null}
!1899 = metadata !{i32 786688, metadata !1893, metadata !"code", metadata !218, i32 339, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1900 = metadata !{i32 339, i32 9, metadata !1893, null}
!1901 = metadata !{i32 786688, metadata !1893, metadata !"dist", metadata !218, i32 340, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1902 = metadata !{i32 340, i32 9, metadata !1893, null}
!1903 = metadata !{i32 342, i32 5, metadata !1893, null}
!1904 = metadata !{i32 343, i32 5, metadata !1893, null}
!1905 = metadata !{i32 344, i32 5, metadata !1893, null}
!1906 = metadata !{i32 346, i32 5, metadata !1893, null}
!1907 = metadata !{i32 346, i32 35, metadata !1893, null}
!1908 = metadata !{i32 349, i32 5, metadata !1893, null}
!1909 = metadata !{i32 350, i32 10, metadata !1910, null}
!1910 = metadata !{i32 786443, metadata !1893, i32 350, i32 5, metadata !218, i32 1} ; [ DW_TAG_lexical_block ]
!1911 = metadata !{i32 351, i32 9, metadata !1912, null}
!1912 = metadata !{i32 786443, metadata !1910, i32 350, i32 51, metadata !218, i32 2} ; [ DW_TAG_lexical_block ]
!1913 = metadata !{i32 352, i32 14, metadata !1914, null}
!1914 = metadata !{i32 786443, metadata !1912, i32 352, i32 9, metadata !218, i32 3} ; [ DW_TAG_lexical_block ]
!1915 = metadata !{i32 353, i32 13, metadata !1916, null}
!1916 = metadata !{i32 786443, metadata !1914, i32 352, i32 54, metadata !218, i32 4} ; [ DW_TAG_lexical_block ]
!1917 = metadata !{i32 354, i32 9, metadata !1916, null}
!1918 = metadata !{i32 352, i32 49, metadata !1914, null}
!1919 = metadata !{i32 355, i32 5, metadata !1912, null}
!1920 = metadata !{i32 350, i32 43, metadata !1910, null}
!1921 = metadata !{i32 361, i32 5, metadata !1893, null}
!1922 = metadata !{i32 364, i32 5, metadata !1893, null}
!1923 = metadata !{i32 365, i32 10, metadata !1924, null}
!1924 = metadata !{i32 786443, metadata !1893, i32 365, i32 5, metadata !218, i32 5} ; [ DW_TAG_lexical_block ]
!1925 = metadata !{i32 366, i32 9, metadata !1926, null}
!1926 = metadata !{i32 786443, metadata !1924, i32 365, i32 40, metadata !218, i32 6} ; [ DW_TAG_lexical_block ]
!1927 = metadata !{i32 367, i32 14, metadata !1928, null}
!1928 = metadata !{i32 786443, metadata !1926, i32 367, i32 9, metadata !218, i32 7} ; [ DW_TAG_lexical_block ]
!1929 = metadata !{i32 368, i32 13, metadata !1930, null}
!1930 = metadata !{i32 786443, metadata !1928, i32 367, i32 54, metadata !218, i32 8} ; [ DW_TAG_lexical_block ]
!1931 = metadata !{i32 369, i32 9, metadata !1930, null}
!1932 = metadata !{i32 367, i32 49, metadata !1928, null}
!1933 = metadata !{i32 370, i32 5, metadata !1926, null}
!1934 = metadata !{i32 365, i32 32, metadata !1924, null}
!1935 = metadata !{i32 372, i32 5, metadata !1893, null}
!1936 = metadata !{i32 373, i32 5, metadata !1937, null}
!1937 = metadata !{i32 786443, metadata !1893, i32 373, i32 5, metadata !218, i32 9} ; [ DW_TAG_lexical_block ]
!1938 = metadata !{i32 374, i32 9, metadata !1939, null}
!1939 = metadata !{i32 786443, metadata !1937, i32 373, i32 37, metadata !218, i32 10} ; [ DW_TAG_lexical_block ]
!1940 = metadata !{i32 375, i32 14, metadata !1941, null}
!1941 = metadata !{i32 786443, metadata !1939, i32 375, i32 9, metadata !218, i32 11} ; [ DW_TAG_lexical_block ]
!1942 = metadata !{i32 376, i32 13, metadata !1943, null}
!1943 = metadata !{i32 786443, metadata !1941, i32 375, i32 58, metadata !218, i32 12} ; [ DW_TAG_lexical_block ]
!1944 = metadata !{i32 377, i32 9, metadata !1943, null}
!1945 = metadata !{i32 375, i32 53, metadata !1941, null}
!1946 = metadata !{i32 378, i32 5, metadata !1939, null}
!1947 = metadata !{i32 373, i32 29, metadata !1937, null}
!1948 = metadata !{i32 382, i32 10, metadata !1949, null}
!1949 = metadata !{i32 786443, metadata !1893, i32 382, i32 5, metadata !218, i32 13} ; [ DW_TAG_lexical_block ]
!1950 = metadata !{i32 382, i32 46, metadata !1949, null}
!1951 = metadata !{i32 382, i32 38, metadata !1949, null}
!1952 = metadata !{i32 383, i32 5, metadata !1893, null}
!1953 = metadata !{i32 384, i32 5, metadata !1893, null}
!1954 = metadata !{i32 384, i32 22, metadata !1893, null}
!1955 = metadata !{i32 385, i32 5, metadata !1893, null}
!1956 = metadata !{i32 385, i32 22, metadata !1893, null}
!1957 = metadata !{i32 386, i32 5, metadata !1893, null}
!1958 = metadata !{i32 386, i32 22, metadata !1893, null}
!1959 = metadata !{i32 387, i32 5, metadata !1893, null}
!1960 = metadata !{i32 387, i32 22, metadata !1893, null}
!1961 = metadata !{i32 392, i32 5, metadata !1893, null}
!1962 = metadata !{i32 395, i32 10, metadata !1963, null}
!1963 = metadata !{i32 786443, metadata !1893, i32 395, i32 5, metadata !218, i32 14} ; [ DW_TAG_lexical_block ]
!1964 = metadata !{i32 396, i32 9, metadata !1965, null}
!1965 = metadata !{i32 786443, metadata !1963, i32 395, i32 35, metadata !218, i32 15} ; [ DW_TAG_lexical_block ]
!1966 = metadata !{i32 397, i32 32, metadata !1965, null}
!1967 = metadata !{i32 398, i32 5, metadata !1965, null}
!1968 = metadata !{i32 395, i32 30, metadata !1963, null}
!1969 = metadata !{i32 401, i32 5, metadata !1893, null}
!1970 = metadata !{i32 402, i32 1, metadata !1893, null}
!1971 = metadata !{i32 786689, metadata !270, metadata !"tree", metadata !218, i32 16777785, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1972 = metadata !{i32 569, i32 19, metadata !270, null}
!1973 = metadata !{i32 786689, metadata !270, metadata !"max_code", metadata !218, i32 33555002, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1974 = metadata !{i32 570, i32 9, metadata !270, null}
!1975 = metadata !{i32 786688, metadata !1976, metadata !"next_code", metadata !218, i32 572, metadata !289, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1976 = metadata !{i32 786443, metadata !270, i32 571, i32 1, metadata !218, i32 87} ; [ DW_TAG_lexical_block ]
!1977 = metadata !{i32 572, i32 9, metadata !1976, null}
!1978 = metadata !{i32 786688, metadata !1976, metadata !"code", metadata !218, i32 573, metadata !222, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1979 = metadata !{i32 573, i32 9, metadata !1976, null}
!1980 = metadata !{i32 573, i32 17, metadata !1976, null}
!1981 = metadata !{i32 786688, metadata !1976, metadata !"bits", metadata !218, i32 574, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1982 = metadata !{i32 574, i32 9, metadata !1976, null}
!1983 = metadata !{i32 786688, metadata !1976, metadata !"n", metadata !218, i32 575, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1984 = metadata !{i32 575, i32 9, metadata !1976, null}
!1985 = metadata !{i32 580, i32 10, metadata !1986, null}
!1986 = metadata !{i32 786443, metadata !1976, i32 580, i32 5, metadata !218, i32 88} ; [ DW_TAG_lexical_block ]
!1987 = metadata !{i32 581, i32 9, metadata !1988, null}
!1988 = metadata !{i32 786443, metadata !1986, i32 580, i32 46, metadata !218, i32 89} ; [ DW_TAG_lexical_block ]
!1989 = metadata !{i32 582, i32 5, metadata !1988, null}
!1990 = metadata !{i32 580, i32 38, metadata !1986, null}
!1991 = metadata !{i32 590, i32 10, metadata !1992, null}
!1992 = metadata !{i32 786443, metadata !1976, i32 590, i32 5, metadata !218, i32 90} ; [ DW_TAG_lexical_block ]
!1993 = metadata !{i32 786688, metadata !1994, metadata !"len", metadata !218, i32 591, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1994 = metadata !{i32 786443, metadata !1992, i32 590, i32 38, metadata !218, i32 91} ; [ DW_TAG_lexical_block ]
!1995 = metadata !{i32 591, i32 13, metadata !1994, null}
!1996 = metadata !{i32 591, i32 30, metadata !1994, null}
!1997 = metadata !{i32 592, i32 9, metadata !1994, null}
!1998 = metadata !{i32 592, i32 23, metadata !1994, null}
!1999 = metadata !{i32 594, i32 24, metadata !1994, null}
!2000 = metadata !{i32 598, i32 5, metadata !1994, null}
!2001 = metadata !{i32 590, i32 33, metadata !1992, null}
!2002 = metadata !{i32 599, i32 1, metadata !1976, null}
!2003 = metadata !{i32 786688, metadata !2004, metadata !"n", metadata !218, i32 409, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2004 = metadata !{i32 786443, metadata !271, i32 408, i32 1, metadata !218, i32 92} ; [ DW_TAG_lexical_block ]
!2005 = metadata !{i32 409, i32 9, metadata !2004, null}
!2006 = metadata !{i32 412, i32 10, metadata !2007, null}
!2007 = metadata !{i32 786443, metadata !2004, i32 412, i32 5, metadata !218, i32 93} ; [ DW_TAG_lexical_block ]
!2008 = metadata !{i32 412, i32 36, metadata !2007, null}
!2009 = metadata !{i32 412, i32 31, metadata !2007, null}
!2010 = metadata !{i32 413, i32 10, metadata !2011, null}
!2011 = metadata !{i32 786443, metadata !2004, i32 413, i32 5, metadata !218, i32 94} ; [ DW_TAG_lexical_block ]
!2012 = metadata !{i32 413, i32 36, metadata !2011, null}
!2013 = metadata !{i32 413, i32 31, metadata !2011, null}
!2014 = metadata !{i32 414, i32 10, metadata !2015, null}
!2015 = metadata !{i32 786443, metadata !2004, i32 414, i32 5, metadata !218, i32 95} ; [ DW_TAG_lexical_block ]
!2016 = metadata !{i32 414, i32 36, metadata !2015, null}
!2017 = metadata !{i32 414, i32 31, metadata !2015, null}
!2018 = metadata !{i32 416, i32 5, metadata !2004, null}
!2019 = metadata !{i32 417, i32 5, metadata !2004, null}
!2020 = metadata !{i32 418, i32 5, metadata !2004, null}
!2021 = metadata !{i32 419, i32 5, metadata !2004, null}
!2022 = metadata !{i32 419, i32 16, metadata !2004, null}
!2023 = metadata !{i32 420, i32 1, metadata !2004, null}
!2024 = metadata !{i32 786689, metadata !223, metadata !"buf", metadata !218, i32 16778070, metadata !26, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!2025 = metadata !{i32 854, i32 11, metadata !223, null}
!2026 = metadata !{i32 786689, metadata !223, metadata !"stored_len", metadata !218, i32 33555287, metadata !226, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!2027 = metadata !{i32 855, i32 9, metadata !223, null}
!2028 = metadata !{i32 786689, metadata !223, metadata !"eof", metadata !218, i32 50332504, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!2029 = metadata !{i32 856, i32 9, metadata !223, null}
!2030 = metadata !{i32 786688, metadata !2031, metadata !"opt_lenb", metadata !218, i32 858, metadata !226, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2031 = metadata !{i32 786443, metadata !223, i32 857, i32 1, metadata !218, i32 16} ; [ DW_TAG_lexical_block ]
!2032 = metadata !{i32 858, i32 9, metadata !2031, null}
!2033 = metadata !{i32 786688, metadata !2031, metadata !"static_lenb", metadata !218, i32 858, metadata !226, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2034 = metadata !{i32 858, i32 19, metadata !2031, null}
!2035 = metadata !{i32 786688, metadata !2031, metadata !"max_blindex", metadata !218, i32 859, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2036 = metadata !{i32 859, i32 9, metadata !2031, null}
!2037 = metadata !{i32 861, i32 5, metadata !2031, null}
!2038 = metadata !{i32 864, i32 5, metadata !2031, null}
!2039 = metadata !{i32 864, i32 37, metadata !2031, null}
!2040 = metadata !{i32 867, i32 5, metadata !2031, null}
!2041 = metadata !{i32 870, i32 5, metadata !2031, null}
!2042 = metadata !{i32 879, i32 19, metadata !2031, null}
!2043 = metadata !{i32 882, i32 5, metadata !2031, null}
!2044 = metadata !{i32 883, i32 5, metadata !2031, null}
!2045 = metadata !{i32 884, i32 5, metadata !2031, null}
!2046 = metadata !{i32 890, i32 5, metadata !2031, null}
!2047 = metadata !{i32 890, i32 34, metadata !2031, null}
!2048 = metadata !{i32 899, i32 5, metadata !2031, null}
!2049 = metadata !{i32 902, i32 9, metadata !2050, null}
!2050 = metadata !{i32 786443, metadata !2031, i32 899, i32 78, metadata !218, i32 17} ; [ DW_TAG_lexical_block ]
!2051 = metadata !{i32 902, i32 30, metadata !2050, null}
!2052 = metadata !{i32 904, i32 9, metadata !2050, null}
!2053 = metadata !{i32 905, i32 9, metadata !2050, null}
!2054 = metadata !{i32 906, i32 9, metadata !2050, null}
!2055 = metadata !{i32 911, i32 5, metadata !2050, null}
!2056 = metadata !{i32 911, i32 12, metadata !2031, null}
!2057 = metadata !{i32 920, i32 9, metadata !2058, null}
!2058 = metadata !{i32 786443, metadata !2031, i32 911, i32 61, metadata !218, i32 18} ; [ DW_TAG_lexical_block ]
!2059 = metadata !{i32 921, i32 9, metadata !2058, null}
!2060 = metadata !{i32 922, i32 9, metadata !2058, null}
!2061 = metadata !{i32 924, i32 9, metadata !2058, null}
!2062 = metadata !{i32 929, i32 5, metadata !2058, null}
!2063 = metadata !{i32 929, i32 12, metadata !2031, null}
!2064 = metadata !{i32 931, i32 9, metadata !2065, null}
!2065 = metadata !{i32 786443, metadata !2031, i32 929, i32 41, metadata !218, i32 19} ; [ DW_TAG_lexical_block ]
!2066 = metadata !{i32 932, i32 9, metadata !2065, null}
!2067 = metadata !{i32 933, i32 9, metadata !2065, null}
!2068 = metadata !{i32 934, i32 5, metadata !2065, null}
!2069 = metadata !{i32 935, i32 9, metadata !2070, null}
!2070 = metadata !{i32 786443, metadata !2031, i32 934, i32 12, metadata !218, i32 20} ; [ DW_TAG_lexical_block ]
!2071 = metadata !{i32 936, i32 9, metadata !2070, null}
!2072 = metadata !{i32 937, i32 9, metadata !2070, null}
!2073 = metadata !{i32 938, i32 9, metadata !2070, null}
!2074 = metadata !{i32 941, i32 5, metadata !2031, null}
!2075 = metadata !{i32 943, i32 5, metadata !2031, null}
!2076 = metadata !{i32 945, i32 9, metadata !2077, null}
!2077 = metadata !{i32 786443, metadata !2031, i32 943, i32 14, metadata !218, i32 21} ; [ DW_TAG_lexical_block ]
!2078 = metadata !{i32 946, i32 9, metadata !2077, null}
!2079 = metadata !{i32 947, i32 5, metadata !2077, null}
!2080 = metadata !{i32 951, i32 5, metadata !2031, null}
!2081 = metadata !{i32 786688, metadata !2082, metadata !"n", metadata !218, i32 1065, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2082 = metadata !{i32 786443, metadata !228, i32 1064, i32 1, metadata !218, i32 29} ; [ DW_TAG_lexical_block ]
!2083 = metadata !{i32 1065, i32 9, metadata !2082, null}
!2084 = metadata !{i32 1065, i32 14, metadata !2082, null}
!2085 = metadata !{i32 786688, metadata !2082, metadata !"ascii_freq", metadata !218, i32 1066, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2086 = metadata !{i32 1066, i32 14, metadata !2082, null}
!2087 = metadata !{i32 1066, i32 28, metadata !2082, null}
!2088 = metadata !{i32 786688, metadata !2082, metadata !"bin_freq", metadata !218, i32 1067, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2089 = metadata !{i32 1067, i32 14, metadata !2082, null}
!2090 = metadata !{i32 1067, i32 26, metadata !2082, null}
!2091 = metadata !{i32 1068, i32 5, metadata !2082, null}
!2092 = metadata !{i32 1068, i32 26, metadata !2082, null}
!2093 = metadata !{i32 1069, i32 5, metadata !2082, null}
!2094 = metadata !{i32 1069, i32 24, metadata !2082, null}
!2095 = metadata !{i32 1070, i32 5, metadata !2082, null}
!2096 = metadata !{i32 1070, i32 26, metadata !2082, null}
!2097 = metadata !{i32 1071, i32 5, metadata !2082, null}
!2098 = metadata !{i32 1072, i32 5, metadata !2082, null}
!2099 = metadata !{i32 1073, i32 9, metadata !2100, null}
!2100 = metadata !{i32 786443, metadata !2082, i32 1072, i32 48, metadata !218, i32 30} ; [ DW_TAG_lexical_block ]
!2101 = metadata !{i32 1074, i32 5, metadata !2100, null}
!2102 = metadata !{i32 1075, i32 1, metadata !2082, null}
!2103 = metadata !{i32 786689, metadata !254, metadata !"desc", metadata !218, i32 16777826, metadata !257, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!2104 = metadata !{i32 610, i32 21, metadata !254, null}
!2105 = metadata !{i32 786688, metadata !2106, metadata !"tree", metadata !218, i32 612, metadata !232, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2106 = metadata !{i32 786443, metadata !254, i32 611, i32 1, metadata !218, i32 67} ; [ DW_TAG_lexical_block ]
!2107 = metadata !{i32 612, i32 19, metadata !2106, null}
!2108 = metadata !{i32 612, i32 42, metadata !2106, null}
!2109 = metadata !{i32 786688, metadata !2106, metadata !"stree", metadata !218, i32 613, metadata !232, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2110 = metadata !{i32 613, i32 19, metadata !2106, null}
!2111 = metadata !{i32 613, i32 45, metadata !2106, null}
!2112 = metadata !{i32 786688, metadata !2106, metadata !"elems", metadata !218, i32 614, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2113 = metadata !{i32 614, i32 9, metadata !2106, null}
!2114 = metadata !{i32 614, i32 39, metadata !2106, null}
!2115 = metadata !{i32 786688, metadata !2106, metadata !"n", metadata !218, i32 615, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2116 = metadata !{i32 615, i32 9, metadata !2106, null}
!2117 = metadata !{i32 786688, metadata !2106, metadata !"m", metadata !218, i32 615, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2118 = metadata !{i32 615, i32 12, metadata !2106, null}
!2119 = metadata !{i32 786688, metadata !2106, metadata !"max_code", metadata !218, i32 616, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2120 = metadata !{i32 616, i32 9, metadata !2106, null}
!2121 = metadata !{i32 616, i32 22, metadata !2106, null}
!2122 = metadata !{i32 786688, metadata !2106, metadata !"node", metadata !218, i32 617, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2123 = metadata !{i32 617, i32 9, metadata !2106, null}
!2124 = metadata !{i32 617, i32 21, metadata !2106, null}
!2125 = metadata !{i32 623, i32 5, metadata !2106, null}
!2126 = metadata !{i32 625, i32 10, metadata !2127, null}
!2127 = metadata !{i32 786443, metadata !2106, i32 625, i32 5, metadata !218, i32 68} ; [ DW_TAG_lexical_block ]
!2128 = metadata !{i32 626, i32 9, metadata !2129, null}
!2129 = metadata !{i32 786443, metadata !2127, i32 625, i32 33, metadata !218, i32 69} ; [ DW_TAG_lexical_block ]
!2130 = metadata !{i32 627, i32 13, metadata !2131, null}
!2131 = metadata !{i32 786443, metadata !2129, i32 626, i32 32, metadata !218, i32 70} ; [ DW_TAG_lexical_block ]
!2132 = metadata !{i32 628, i32 13, metadata !2131, null}
!2133 = metadata !{i32 629, i32 9, metadata !2131, null}
!2134 = metadata !{i32 630, i32 13, metadata !2135, null}
!2135 = metadata !{i32 786443, metadata !2129, i32 629, i32 16, metadata !218, i32 71} ; [ DW_TAG_lexical_block ]
!2136 = metadata !{i32 632, i32 5, metadata !2129, null}
!2137 = metadata !{i32 625, i32 28, metadata !2127, null}
!2138 = metadata !{i32 639, i32 5, metadata !2106, null}
!2139 = metadata !{i32 786688, metadata !2140, metadata !"new", metadata !218, i32 640, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2140 = metadata !{i32 786443, metadata !2106, i32 639, i32 26, metadata !218, i32 72} ; [ DW_TAG_lexical_block ]
!2141 = metadata !{i32 640, i32 13, metadata !2140, null}
!2142 = metadata !{i32 640, i32 69, metadata !2140, null}
!2143 = metadata !{i32 641, i32 9, metadata !2140, null}
!2144 = metadata !{i32 642, i32 9, metadata !2140, null}
!2145 = metadata !{i32 643, i32 9, metadata !2140, null}
!2146 = metadata !{i32 643, i32 20, metadata !2140, null}
!2147 = metadata !{i32 643, i32 31, metadata !2140, null}
!2148 = metadata !{i32 645, i32 5, metadata !2140, null}
!2149 = metadata !{i32 646, i32 5, metadata !2106, null}
!2150 = metadata !{i32 651, i32 10, metadata !2151, null}
!2151 = metadata !{i32 786443, metadata !2106, i32 651, i32 5, metadata !218, i32 73} ; [ DW_TAG_lexical_block ]
!2152 = metadata !{i32 651, i32 39, metadata !2151, null}
!2153 = metadata !{i32 651, i32 34, metadata !2151, null}
!2154 = metadata !{i32 656, i32 5, metadata !2106, null}
!2155 = metadata !{i32 657, i32 9, metadata !2156, null}
!2156 = metadata !{i32 786443, metadata !2157, i32 657, i32 9, metadata !218, i32 75} ; [ DW_TAG_lexical_block ]
!2157 = metadata !{i32 786443, metadata !2106, i32 656, i32 8, metadata !218, i32 74} ; [ DW_TAG_lexical_block ]
!2158 = metadata !{i32 658, i32 9, metadata !2157, null}
!2159 = metadata !{i32 660, i32 9, metadata !2157, null}
!2160 = metadata !{i32 661, i32 9, metadata !2157, null}
!2161 = metadata !{i32 664, i32 9, metadata !2157, null}
!2162 = metadata !{i32 665, i32 9, metadata !2157, null}
!2163 = metadata !{i32 666, i32 9, metadata !2157, null}
!2164 = metadata !{i32 674, i32 9, metadata !2157, null}
!2165 = metadata !{i32 675, i32 9, metadata !2157, null}
!2166 = metadata !{i32 677, i32 5, metadata !2157, null}
!2167 = metadata !{i32 679, i32 5, metadata !2106, null}
!2168 = metadata !{i32 684, i32 5, metadata !2106, null}
!2169 = metadata !{i32 687, i32 5, metadata !2106, null}
!2170 = metadata !{i32 688, i32 1, metadata !2106, null}
!2171 = metadata !{i32 786688, metadata !2172, metadata !"max_blindex", metadata !218, i32 792, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2172 = metadata !{i32 786443, metadata !252, i32 791, i32 1, metadata !218, i32 53} ; [ DW_TAG_lexical_block ]
!2173 = metadata !{i32 792, i32 9, metadata !2172, null}
!2174 = metadata !{i32 795, i32 5, metadata !2172, null}
!2175 = metadata !{i32 796, i32 5, metadata !2172, null}
!2176 = metadata !{i32 799, i32 5, metadata !2172, null}
!2177 = metadata !{i32 808, i32 10, metadata !2178, null}
!2178 = metadata !{i32 786443, metadata !2172, i32 808, i32 5, metadata !218, i32 54} ; [ DW_TAG_lexical_block ]
!2179 = metadata !{i32 809, i32 9, metadata !2180, null}
!2180 = metadata !{i32 786443, metadata !2178, i32 808, i32 69, metadata !218, i32 55} ; [ DW_TAG_lexical_block ]
!2181 = metadata !{i32 809, i32 54, metadata !2180, null}
!2182 = metadata !{i32 810, i32 5, metadata !2180, null}
!2183 = metadata !{i32 808, i32 54, metadata !2178, null}
!2184 = metadata !{i32 812, i32 5, metadata !2172, null}
!2185 = metadata !{i32 815, i32 5, metadata !2172, null}
!2186 = metadata !{i32 786689, metadata !229, metadata !"ltree", metadata !218, i32 16778228, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!2187 = metadata !{i32 1012, i32 19, metadata !229, null}
!2188 = metadata !{i32 786689, metadata !229, metadata !"dtree", metadata !218, i32 33555445, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!2189 = metadata !{i32 1013, i32 19, metadata !229, null}
!2190 = metadata !{i32 786688, metadata !2191, metadata !"dist", metadata !218, i32 1015, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2191 = metadata !{i32 786443, metadata !229, i32 1014, i32 1, metadata !218, i32 31} ; [ DW_TAG_lexical_block ]
!2192 = metadata !{i32 1015, i32 14, metadata !2191, null}
!2193 = metadata !{i32 786688, metadata !2191, metadata !"lc", metadata !218, i32 1016, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2194 = metadata !{i32 1016, i32 9, metadata !2191, null}
!2195 = metadata !{i32 786688, metadata !2191, metadata !"lx", metadata !218, i32 1017, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2196 = metadata !{i32 1017, i32 14, metadata !2191, null}
!2197 = metadata !{i32 1017, i32 20, metadata !2191, null}
!2198 = metadata !{i32 786688, metadata !2191, metadata !"dx", metadata !218, i32 1018, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2199 = metadata !{i32 1018, i32 14, metadata !2191, null}
!2200 = metadata !{i32 1018, i32 20, metadata !2191, null}
!2201 = metadata !{i32 786688, metadata !2191, metadata !"fx", metadata !218, i32 1019, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2202 = metadata !{i32 1019, i32 14, metadata !2191, null}
!2203 = metadata !{i32 1019, i32 20, metadata !2191, null}
!2204 = metadata !{i32 786688, metadata !2191, metadata !"flag", metadata !218, i32 1020, metadata !294, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2205 = metadata !{i32 1020, i32 9, metadata !2191, null}
!2206 = metadata !{i32 1020, i32 17, metadata !2191, null}
!2207 = metadata !{i32 786688, metadata !2191, metadata !"code", metadata !218, i32 1021, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2208 = metadata !{i32 1021, i32 14, metadata !2191, null}
!2209 = metadata !{i32 786688, metadata !2191, metadata !"extra", metadata !218, i32 1022, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2210 = metadata !{i32 1022, i32 9, metadata !2191, null}
!2211 = metadata !{i32 1024, i32 5, metadata !2191, null}
!2212 = metadata !{i32 1024, i32 24, metadata !2191, null}
!2213 = metadata !{i32 1025, i32 9, metadata !2214, null}
!2214 = metadata !{i32 786443, metadata !2191, i32 1024, i32 27, metadata !218, i32 32} ; [ DW_TAG_lexical_block ]
!2215 = metadata !{i32 1025, i32 28, metadata !2214, null}
!2216 = metadata !{i32 1026, i32 9, metadata !2214, null}
!2217 = metadata !{i32 1027, i32 9, metadata !2214, null}
!2218 = metadata !{i32 1028, i32 13, metadata !2219, null}
!2219 = metadata !{i32 786443, metadata !2214, i32 1027, i32 30, metadata !218, i32 33} ; [ DW_TAG_lexical_block ]
!2220 = metadata !{i32 1030, i32 9, metadata !2219, null}
!2221 = metadata !{i32 1032, i32 13, metadata !2222, null}
!2222 = metadata !{i32 786443, metadata !2214, i32 1030, i32 16, metadata !218, i32 34} ; [ DW_TAG_lexical_block ]
!2223 = metadata !{i32 1033, i32 13, metadata !2222, null}
!2224 = metadata !{i32 1034, i32 13, metadata !2222, null}
!2225 = metadata !{i32 1035, i32 13, metadata !2222, null}
!2226 = metadata !{i32 1036, i32 17, metadata !2227, null}
!2227 = metadata !{i32 786443, metadata !2222, i32 1035, i32 29, metadata !218, i32 35} ; [ DW_TAG_lexical_block ]
!2228 = metadata !{i32 1037, i32 17, metadata !2227, null}
!2229 = metadata !{i32 1038, i32 13, metadata !2227, null}
!2230 = metadata !{i32 1039, i32 13, metadata !2222, null}
!2231 = metadata !{i32 1041, i32 13, metadata !2222, null}
!2232 = metadata !{i32 1044, i32 13, metadata !2222, null}
!2233 = metadata !{i32 1045, i32 13, metadata !2222, null}
!2234 = metadata !{i32 1046, i32 13, metadata !2222, null}
!2235 = metadata !{i32 1047, i32 17, metadata !2236, null}
!2236 = metadata !{i32 786443, metadata !2222, i32 1046, i32 29, metadata !218, i32 36} ; [ DW_TAG_lexical_block ]
!2237 = metadata !{i32 1048, i32 17, metadata !2236, null}
!2238 = metadata !{i32 1049, i32 13, metadata !2236, null}
!2239 = metadata !{i32 1051, i32 9, metadata !2214, null}
!2240 = metadata !{i32 1052, i32 5, metadata !2214, null}
!2241 = metadata !{i32 1054, i32 5, metadata !2191, null}
!2242 = metadata !{i32 1055, i32 1, metadata !2191, null}
!2243 = metadata !{i32 786689, metadata !246, metadata !"lcodes", metadata !218, i32 16778040, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!2244 = metadata !{i32 824, i32 9, metadata !246, null}
!2245 = metadata !{i32 786689, metadata !246, metadata !"dcodes", metadata !218, i32 33555256, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!2246 = metadata !{i32 824, i32 17, metadata !246, null}
!2247 = metadata !{i32 786689, metadata !246, metadata !"blcodes", metadata !218, i32 50332472, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!2248 = metadata !{i32 824, i32 25, metadata !246, null}
!2249 = metadata !{i32 786688, metadata !2250, metadata !"rank", metadata !218, i32 826, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2250 = metadata !{i32 786443, metadata !246, i32 825, i32 1, metadata !218, i32 37} ; [ DW_TAG_lexical_block ]
!2251 = metadata !{i32 826, i32 9, metadata !2250, null}
!2252 = metadata !{i32 832, i32 5, metadata !2250, null}
!2253 = metadata !{i32 833, i32 5, metadata !2250, null}
!2254 = metadata !{i32 834, i32 5, metadata !2250, null}
!2255 = metadata !{i32 835, i32 10, metadata !2256, null}
!2256 = metadata !{i32 786443, metadata !2250, i32 835, i32 5, metadata !218, i32 38} ; [ DW_TAG_lexical_block ]
!2257 = metadata !{i32 837, i32 9, metadata !2258, null}
!2258 = metadata !{i32 786443, metadata !2256, i32 835, i32 44, metadata !218, i32 39} ; [ DW_TAG_lexical_block ]
!2259 = metadata !{i32 838, i32 5, metadata !2258, null}
!2260 = metadata !{i32 835, i32 36, metadata !2256, null}
!2261 = metadata !{i32 841, i32 5, metadata !2250, null}
!2262 = metadata !{i32 844, i32 5, metadata !2250, null}
!2263 = metadata !{i32 846, i32 1, metadata !2250, null}
!2264 = metadata !{i32 786689, metadata !227, metadata !"dist", metadata !218, i32 16778175, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!2265 = metadata !{i32 959, i32 9, metadata !227, null}
!2266 = metadata !{i32 786689, metadata !227, metadata !"lc", metadata !218, i32 33555392, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!2267 = metadata !{i32 960, i32 9, metadata !227, null}
!2268 = metadata !{i32 962, i32 5, metadata !2269, null}
!2269 = metadata !{i32 786443, metadata !227, i32 961, i32 1, metadata !218, i32 22} ; [ DW_TAG_lexical_block ]
!2270 = metadata !{i32 963, i32 5, metadata !2269, null}
!2271 = metadata !{i32 965, i32 9, metadata !2272, null}
!2272 = metadata !{i32 786443, metadata !2269, i32 963, i32 20, metadata !218, i32 23} ; [ DW_TAG_lexical_block ]
!2273 = metadata !{i32 966, i32 5, metadata !2272, null}
!2274 = metadata !{i32 968, i32 9, metadata !2275, null}
!2275 = metadata !{i32 786443, metadata !2269, i32 966, i32 12, metadata !218, i32 24} ; [ DW_TAG_lexical_block ]
!2276 = metadata !{i32 973, i32 9, metadata !2275, null}
!2277 = metadata !{i32 974, i32 9, metadata !2275, null}
!2278 = metadata !{i32 976, i32 9, metadata !2275, null}
!2279 = metadata !{i32 977, i32 9, metadata !2275, null}
!2280 = metadata !{i32 979, i32 5, metadata !2269, null}
!2281 = metadata !{i32 982, i32 5, metadata !2269, null}
!2282 = metadata !{i32 983, i32 9, metadata !2283, null}
!2283 = metadata !{i32 786443, metadata !2269, i32 982, i32 30, metadata !218, i32 25} ; [ DW_TAG_lexical_block ]
!2284 = metadata !{i32 984, i32 9, metadata !2283, null}
!2285 = metadata !{i32 985, i32 5, metadata !2283, null}
!2286 = metadata !{i32 987, i32 5, metadata !2269, null}
!2287 = metadata !{i32 786688, metadata !2288, metadata !"out_length", metadata !218, i32 989, metadata !226, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2288 = metadata !{i32 786443, metadata !2269, i32 987, i32 47, metadata !218, i32 26} ; [ DW_TAG_lexical_block ]
!2289 = metadata !{i32 989, i32 13, metadata !2288, null}
!2290 = metadata !{i32 989, i32 42, metadata !2288, null}
!2291 = metadata !{i32 786688, metadata !2288, metadata !"in_length", metadata !218, i32 990, metadata !226, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2292 = metadata !{i32 990, i32 13, metadata !2288, null}
!2293 = metadata !{i32 990, i32 50, metadata !2288, null}
!2294 = metadata !{i32 786688, metadata !2288, metadata !"dcode", metadata !218, i32 991, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2295 = metadata !{i32 991, i32 13, metadata !2288, null}
!2296 = metadata !{i32 992, i32 14, metadata !2297, null}
!2297 = metadata !{i32 786443, metadata !2288, i32 992, i32 9, metadata !218, i32 27} ; [ DW_TAG_lexical_block ]
!2298 = metadata !{i32 993, i32 13, metadata !2299, null}
!2299 = metadata !{i32 786443, metadata !2297, i32 992, i32 51, metadata !218, i32 28} ; [ DW_TAG_lexical_block ]
!2300 = metadata !{i32 994, i32 9, metadata !2299, null}
!2301 = metadata !{i32 992, i32 42, metadata !2297, null}
!2302 = metadata !{i32 995, i32 9, metadata !2288, null}
!2303 = metadata !{i32 999, i32 9, metadata !2288, null}
!2304 = metadata !{i32 999, i32 65, metadata !2288, null}
!2305 = metadata !{i32 1000, i32 5, metadata !2288, null}
!2306 = metadata !{i32 1001, i32 5, metadata !2269, null}
!2307 = metadata !{i32 1006, i32 1, metadata !2269, null}
!2308 = metadata !{i32 786689, metadata !249, metadata !"tree", metadata !218, i32 16777957, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!2309 = metadata !{i32 741, i32 19, metadata !249, null}
!2310 = metadata !{i32 786689, metadata !249, metadata !"max_code", metadata !218, i32 33555174, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!2311 = metadata !{i32 742, i32 9, metadata !249, null}
!2312 = metadata !{i32 786688, metadata !2313, metadata !"n", metadata !218, i32 744, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2313 = metadata !{i32 786443, metadata !249, i32 743, i32 1, metadata !218, i32 40} ; [ DW_TAG_lexical_block ]
!2314 = metadata !{i32 744, i32 9, metadata !2313, null}
!2315 = metadata !{i32 786688, metadata !2313, metadata !"prevlen", metadata !218, i32 745, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2316 = metadata !{i32 745, i32 9, metadata !2313, null}
!2317 = metadata !{i32 745, i32 21, metadata !2313, null}
!2318 = metadata !{i32 786688, metadata !2313, metadata !"curlen", metadata !218, i32 746, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2319 = metadata !{i32 746, i32 9, metadata !2313, null}
!2320 = metadata !{i32 786688, metadata !2313, metadata !"nextlen", metadata !218, i32 747, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2321 = metadata !{i32 747, i32 9, metadata !2313, null}
!2322 = metadata !{i32 747, i32 30, metadata !2313, null}
!2323 = metadata !{i32 786688, metadata !2313, metadata !"count", metadata !218, i32 748, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2324 = metadata !{i32 748, i32 9, metadata !2313, null}
!2325 = metadata !{i32 748, i32 18, metadata !2313, null}
!2326 = metadata !{i32 786688, metadata !2313, metadata !"max_count", metadata !218, i32 749, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2327 = metadata !{i32 749, i32 9, metadata !2313, null}
!2328 = metadata !{i32 749, i32 22, metadata !2313, null}
!2329 = metadata !{i32 786688, metadata !2313, metadata !"min_count", metadata !218, i32 750, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2330 = metadata !{i32 750, i32 9, metadata !2313, null}
!2331 = metadata !{i32 750, i32 22, metadata !2313, null}
!2332 = metadata !{i32 753, i32 5, metadata !2313, null}
!2333 = metadata !{i32 753, i32 23, metadata !2313, null}
!2334 = metadata !{i32 755, i32 10, metadata !2335, null}
!2335 = metadata !{i32 786443, metadata !2313, i32 755, i32 5, metadata !218, i32 41} ; [ DW_TAG_lexical_block ]
!2336 = metadata !{i32 756, i32 9, metadata !2337, null}
!2337 = metadata !{i32 786443, metadata !2335, i32 755, i32 37, metadata !218, i32 42} ; [ DW_TAG_lexical_block ]
!2338 = metadata !{i32 756, i32 27, metadata !2337, null}
!2339 = metadata !{i32 757, i32 9, metadata !2337, null}
!2340 = metadata !{i32 758, i32 13, metadata !2341, null}
!2341 = metadata !{i32 786443, metadata !2337, i32 757, i32 55, metadata !218, i32 43} ; [ DW_TAG_lexical_block ]
!2342 = metadata !{i32 759, i32 16, metadata !2337, null}
!2343 = metadata !{i32 760, i32 13, metadata !2344, null}
!2344 = metadata !{i32 786443, metadata !2337, i32 759, i32 39, metadata !218, i32 44} ; [ DW_TAG_lexical_block ]
!2345 = metadata !{i32 760, i32 18, metadata !2346, null}
!2346 = metadata !{i32 786443, metadata !2344, i32 760, i32 16, metadata !218, i32 45} ; [ DW_TAG_lexical_block ]
!2347 = metadata !{i32 760, i32 46, metadata !2346, null}
!2348 = metadata !{i32 762, i32 9, metadata !2344, null}
!2349 = metadata !{i32 762, i32 16, metadata !2337, null}
!2350 = metadata !{i32 763, i32 13, metadata !2351, null}
!2351 = metadata !{i32 786443, metadata !2337, i32 762, i32 33, metadata !218, i32 46} ; [ DW_TAG_lexical_block ]
!2352 = metadata !{i32 764, i32 17, metadata !2353, null}
!2353 = metadata !{i32 786443, metadata !2351, i32 763, i32 36, metadata !218, i32 47} ; [ DW_TAG_lexical_block ]
!2354 = metadata !{i32 764, i32 45, metadata !2353, null}
!2355 = metadata !{i32 765, i32 13, metadata !2353, null}
!2356 = metadata !{i32 767, i32 13, metadata !2351, null}
!2357 = metadata !{i32 767, i32 42, metadata !2351, null}
!2358 = metadata !{i32 769, i32 9, metadata !2351, null}
!2359 = metadata !{i32 769, i32 16, metadata !2337, null}
!2360 = metadata !{i32 770, i32 13, metadata !2361, null}
!2361 = metadata !{i32 786443, metadata !2337, i32 769, i32 33, metadata !218, i32 48} ; [ DW_TAG_lexical_block ]
!2362 = metadata !{i32 770, i32 44, metadata !2361, null}
!2363 = metadata !{i32 772, i32 9, metadata !2361, null}
!2364 = metadata !{i32 773, i32 13, metadata !2365, null}
!2365 = metadata !{i32 786443, metadata !2337, i32 772, i32 16, metadata !218, i32 49} ; [ DW_TAG_lexical_block ]
!2366 = metadata !{i32 773, i32 46, metadata !2365, null}
!2367 = metadata !{i32 775, i32 9, metadata !2337, null}
!2368 = metadata !{i32 775, i32 20, metadata !2337, null}
!2369 = metadata !{i32 776, i32 9, metadata !2337, null}
!2370 = metadata !{i32 777, i32 13, metadata !2371, null}
!2371 = metadata !{i32 786443, metadata !2337, i32 776, i32 27, metadata !218, i32 50} ; [ DW_TAG_lexical_block ]
!2372 = metadata !{i32 778, i32 9, metadata !2371, null}
!2373 = metadata !{i32 778, i32 16, metadata !2337, null}
!2374 = metadata !{i32 779, i32 13, metadata !2375, null}
!2375 = metadata !{i32 786443, metadata !2337, i32 778, i32 39, metadata !218, i32 51} ; [ DW_TAG_lexical_block ]
!2376 = metadata !{i32 780, i32 9, metadata !2375, null}
!2377 = metadata !{i32 781, i32 13, metadata !2378, null}
!2378 = metadata !{i32 786443, metadata !2337, i32 780, i32 16, metadata !218, i32 52} ; [ DW_TAG_lexical_block ]
!2379 = metadata !{i32 783, i32 5, metadata !2337, null}
!2380 = metadata !{i32 755, i32 32, metadata !2335, null}
!2381 = metadata !{i32 784, i32 1, metadata !2313, null}
!2382 = metadata !{i32 786689, metadata !253, metadata !"tree", metadata !218, i32 16777913, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!2383 = metadata !{i32 697, i32 19, metadata !253, null}
!2384 = metadata !{i32 786689, metadata !253, metadata !"max_code", metadata !218, i32 33555130, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!2385 = metadata !{i32 698, i32 9, metadata !253, null}
!2386 = metadata !{i32 786688, metadata !2387, metadata !"n", metadata !218, i32 700, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2387 = metadata !{i32 786443, metadata !253, i32 699, i32 1, metadata !218, i32 56} ; [ DW_TAG_lexical_block ]
!2388 = metadata !{i32 700, i32 9, metadata !2387, null}
!2389 = metadata !{i32 786688, metadata !2387, metadata !"prevlen", metadata !218, i32 701, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2390 = metadata !{i32 701, i32 9, metadata !2387, null}
!2391 = metadata !{i32 701, i32 21, metadata !2387, null}
!2392 = metadata !{i32 786688, metadata !2387, metadata !"curlen", metadata !218, i32 702, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2393 = metadata !{i32 702, i32 9, metadata !2387, null}
!2394 = metadata !{i32 786688, metadata !2387, metadata !"nextlen", metadata !218, i32 703, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2395 = metadata !{i32 703, i32 9, metadata !2387, null}
!2396 = metadata !{i32 703, i32 30, metadata !2387, null}
!2397 = metadata !{i32 786688, metadata !2387, metadata !"count", metadata !218, i32 704, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2398 = metadata !{i32 704, i32 9, metadata !2387, null}
!2399 = metadata !{i32 704, i32 18, metadata !2387, null}
!2400 = metadata !{i32 786688, metadata !2387, metadata !"max_count", metadata !218, i32 705, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2401 = metadata !{i32 705, i32 9, metadata !2387, null}
!2402 = metadata !{i32 705, i32 22, metadata !2387, null}
!2403 = metadata !{i32 786688, metadata !2387, metadata !"min_count", metadata !218, i32 706, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2404 = metadata !{i32 706, i32 9, metadata !2387, null}
!2405 = metadata !{i32 706, i32 22, metadata !2387, null}
!2406 = metadata !{i32 708, i32 5, metadata !2387, null}
!2407 = metadata !{i32 708, i32 23, metadata !2387, null}
!2408 = metadata !{i32 709, i32 5, metadata !2387, null}
!2409 = metadata !{i32 711, i32 10, metadata !2410, null}
!2410 = metadata !{i32 786443, metadata !2387, i32 711, i32 5, metadata !218, i32 57} ; [ DW_TAG_lexical_block ]
!2411 = metadata !{i32 712, i32 9, metadata !2412, null}
!2412 = metadata !{i32 786443, metadata !2410, i32 711, i32 37, metadata !218, i32 58} ; [ DW_TAG_lexical_block ]
!2413 = metadata !{i32 712, i32 27, metadata !2412, null}
!2414 = metadata !{i32 713, i32 9, metadata !2412, null}
!2415 = metadata !{i32 714, i32 13, metadata !2416, null}
!2416 = metadata !{i32 786443, metadata !2412, i32 713, i32 55, metadata !218, i32 59} ; [ DW_TAG_lexical_block ]
!2417 = metadata !{i32 715, i32 16, metadata !2412, null}
!2418 = metadata !{i32 716, i32 13, metadata !2419, null}
!2419 = metadata !{i32 786443, metadata !2412, i32 715, i32 39, metadata !218, i32 60} ; [ DW_TAG_lexical_block ]
!2420 = metadata !{i32 717, i32 9, metadata !2419, null}
!2421 = metadata !{i32 717, i32 16, metadata !2412, null}
!2422 = metadata !{i32 718, i32 13, metadata !2423, null}
!2423 = metadata !{i32 786443, metadata !2412, i32 717, i32 33, metadata !218, i32 61} ; [ DW_TAG_lexical_block ]
!2424 = metadata !{i32 718, i32 36, metadata !2423, null}
!2425 = metadata !{i32 719, i32 13, metadata !2423, null}
!2426 = metadata !{i32 720, i32 9, metadata !2423, null}
!2427 = metadata !{i32 720, i32 16, metadata !2412, null}
!2428 = metadata !{i32 721, i32 13, metadata !2429, null}
!2429 = metadata !{i32 786443, metadata !2412, i32 720, i32 33, metadata !218, i32 62} ; [ DW_TAG_lexical_block ]
!2430 = metadata !{i32 722, i32 9, metadata !2429, null}
!2431 = metadata !{i32 723, i32 13, metadata !2432, null}
!2432 = metadata !{i32 786443, metadata !2412, i32 722, i32 16, metadata !218, i32 63} ; [ DW_TAG_lexical_block ]
!2433 = metadata !{i32 725, i32 9, metadata !2412, null}
!2434 = metadata !{i32 725, i32 20, metadata !2412, null}
!2435 = metadata !{i32 726, i32 9, metadata !2412, null}
!2436 = metadata !{i32 727, i32 13, metadata !2437, null}
!2437 = metadata !{i32 786443, metadata !2412, i32 726, i32 27, metadata !218, i32 64} ; [ DW_TAG_lexical_block ]
!2438 = metadata !{i32 728, i32 9, metadata !2437, null}
!2439 = metadata !{i32 728, i32 16, metadata !2412, null}
!2440 = metadata !{i32 729, i32 13, metadata !2441, null}
!2441 = metadata !{i32 786443, metadata !2412, i32 728, i32 39, metadata !218, i32 65} ; [ DW_TAG_lexical_block ]
!2442 = metadata !{i32 730, i32 9, metadata !2441, null}
!2443 = metadata !{i32 731, i32 13, metadata !2444, null}
!2444 = metadata !{i32 786443, metadata !2412, i32 730, i32 16, metadata !218, i32 66} ; [ DW_TAG_lexical_block ]
!2445 = metadata !{i32 733, i32 5, metadata !2412, null}
!2446 = metadata !{i32 711, i32 32, metadata !2410, null}
!2447 = metadata !{i32 734, i32 1, metadata !2387, null}
!2448 = metadata !{i32 786689, metadata !269, metadata !"tree", metadata !218, i32 16777668, metadata !232, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!2449 = metadata !{i32 452, i32 19, metadata !269, null}
!2450 = metadata !{i32 786689, metadata !269, metadata !"k", metadata !218, i32 33554885, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!2451 = metadata !{i32 453, i32 9, metadata !269, null}
!2452 = metadata !{i32 786688, metadata !2453, metadata !"v", metadata !218, i32 455, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2453 = metadata !{i32 786443, metadata !269, i32 454, i32 1, metadata !218, i32 85} ; [ DW_TAG_lexical_block ]
!2454 = metadata !{i32 455, i32 9, metadata !2453, null}
!2455 = metadata !{i32 455, i32 20, metadata !2453, null}
!2456 = metadata !{i32 786688, metadata !2453, metadata !"j", metadata !218, i32 456, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2457 = metadata !{i32 456, i32 9, metadata !2453, null}
!2458 = metadata !{i32 456, i32 19, metadata !2453, null}
!2459 = metadata !{i32 457, i32 5, metadata !2453, null}
!2460 = metadata !{i32 459, i32 9, metadata !2461, null}
!2461 = metadata !{i32 786443, metadata !2453, i32 457, i32 27, metadata !218, i32 86} ; [ DW_TAG_lexical_block ]
!2462 = metadata !{i32 459, i32 64, metadata !2461, null}
!2463 = metadata !{i32 462, i32 9, metadata !2461, null}
!2464 = metadata !{i32 462, i32 40, metadata !2461, null}
!2465 = metadata !{i32 465, i32 9, metadata !2461, null}
!2466 = metadata !{i32 465, i32 29, metadata !2461, null}
!2467 = metadata !{i32 468, i32 9, metadata !2461, null}
!2468 = metadata !{i32 469, i32 5, metadata !2461, null}
!2469 = metadata !{i32 470, i32 5, metadata !2453, null}
!2470 = metadata !{i32 471, i32 1, metadata !2453, null}
!2471 = metadata !{i32 786689, metadata !268, metadata !"desc", metadata !218, i32 16777700, metadata !257, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!2472 = metadata !{i32 484, i32 21, metadata !268, null}
!2473 = metadata !{i32 786688, metadata !2474, metadata !"tree", metadata !218, i32 486, metadata !232, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2474 = metadata !{i32 786443, metadata !268, i32 485, i32 1, metadata !218, i32 76} ; [ DW_TAG_lexical_block ]
!2475 = metadata !{i32 486, i32 19, metadata !2474, null}
!2476 = metadata !{i32 486, i32 41, metadata !2474, null}
!2477 = metadata !{i32 786688, metadata !2474, metadata !"extra", metadata !218, i32 487, metadata !112, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2478 = metadata !{i32 487, i32 15, metadata !2474, null}
!2479 = metadata !{i32 487, i32 43, metadata !2474, null}
!2480 = metadata !{i32 786688, metadata !2474, metadata !"base", metadata !218, i32 488, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2481 = metadata !{i32 488, i32 9, metadata !2474, null}
!2482 = metadata !{i32 488, i32 43, metadata !2474, null}
!2483 = metadata !{i32 786688, metadata !2474, metadata !"max_code", metadata !218, i32 489, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2484 = metadata !{i32 489, i32 9, metadata !2474, null}
!2485 = metadata !{i32 489, i32 41, metadata !2474, null}
!2486 = metadata !{i32 786688, metadata !2474, metadata !"max_length", metadata !218, i32 490, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2487 = metadata !{i32 490, i32 9, metadata !2474, null}
!2488 = metadata !{i32 490, i32 43, metadata !2474, null}
!2489 = metadata !{i32 786688, metadata !2474, metadata !"stree", metadata !218, i32 491, metadata !232, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2490 = metadata !{i32 491, i32 19, metadata !2474, null}
!2491 = metadata !{i32 491, i32 44, metadata !2474, null}
!2492 = metadata !{i32 786688, metadata !2474, metadata !"h", metadata !218, i32 492, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2493 = metadata !{i32 492, i32 9, metadata !2474, null}
!2494 = metadata !{i32 786688, metadata !2474, metadata !"n", metadata !218, i32 493, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2495 = metadata !{i32 493, i32 9, metadata !2474, null}
!2496 = metadata !{i32 786688, metadata !2474, metadata !"m", metadata !218, i32 493, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2497 = metadata !{i32 493, i32 12, metadata !2474, null}
!2498 = metadata !{i32 786688, metadata !2474, metadata !"bits", metadata !218, i32 494, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2499 = metadata !{i32 494, i32 9, metadata !2474, null}
!2500 = metadata !{i32 786688, metadata !2474, metadata !"xbits", metadata !218, i32 495, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2501 = metadata !{i32 495, i32 9, metadata !2474, null}
!2502 = metadata !{i32 786688, metadata !2474, metadata !"f", metadata !218, i32 496, metadata !222, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2503 = metadata !{i32 496, i32 9, metadata !2474, null}
!2504 = metadata !{i32 786688, metadata !2474, metadata !"overflow", metadata !218, i32 497, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2505 = metadata !{i32 497, i32 9, metadata !2474, null}
!2506 = metadata !{i32 497, i32 21, metadata !2474, null}
!2507 = metadata !{i32 499, i32 10, metadata !2508, null}
!2508 = metadata !{i32 786443, metadata !2474, i32 499, i32 5, metadata !218, i32 77} ; [ DW_TAG_lexical_block ]
!2509 = metadata !{i32 499, i32 46, metadata !2508, null}
!2510 = metadata !{i32 499, i32 38, metadata !2508, null}
!2511 = metadata !{i32 504, i32 5, metadata !2474, null}
!2512 = metadata !{i32 506, i32 10, metadata !2513, null}
!2513 = metadata !{i32 786443, metadata !2474, i32 506, i32 5, metadata !218, i32 78} ; [ DW_TAG_lexical_block ]
!2514 = metadata !{i32 507, i32 9, metadata !2515, null}
!2515 = metadata !{i32 786443, metadata !2513, i32 506, i32 46, metadata !218, i32 79} ; [ DW_TAG_lexical_block ]
!2516 = metadata !{i32 508, i32 9, metadata !2515, null}
!2517 = metadata !{i32 509, i32 9, metadata !2515, null}
!2518 = metadata !{i32 509, i32 32, metadata !2515, null}
!2519 = metadata !{i32 510, i32 9, metadata !2515, null}
!2520 = metadata !{i32 513, i32 9, metadata !2515, null}
!2521 = metadata !{i32 513, i32 27, metadata !2515, null}
!2522 = metadata !{i32 515, i32 9, metadata !2515, null}
!2523 = metadata !{i32 516, i32 9, metadata !2515, null}
!2524 = metadata !{i32 517, i32 9, metadata !2515, null}
!2525 = metadata !{i32 517, i32 24, metadata !2515, null}
!2526 = metadata !{i32 518, i32 9, metadata !2515, null}
!2527 = metadata !{i32 519, i32 9, metadata !2515, null}
!2528 = metadata !{i32 520, i32 9, metadata !2515, null}
!2529 = metadata !{i32 520, i32 20, metadata !2515, null}
!2530 = metadata !{i32 521, i32 5, metadata !2515, null}
!2531 = metadata !{i32 506, i32 41, metadata !2513, null}
!2532 = metadata !{i32 522, i32 5, metadata !2474, null}
!2533 = metadata !{i32 522, i32 24, metadata !2474, null}
!2534 = metadata !{i32 528, i32 5, metadata !2474, null}
!2535 = metadata !{i32 529, i32 9, metadata !2536, null}
!2536 = metadata !{i32 786443, metadata !2474, i32 528, i32 8, metadata !218, i32 80} ; [ DW_TAG_lexical_block ]
!2537 = metadata !{i32 530, i32 9, metadata !2536, null}
!2538 = metadata !{i32 530, i32 37, metadata !2536, null}
!2539 = metadata !{i32 531, i32 9, metadata !2536, null}
!2540 = metadata !{i32 532, i32 9, metadata !2536, null}
!2541 = metadata !{i32 533, i32 9, metadata !2536, null}
!2542 = metadata !{i32 537, i32 9, metadata !2536, null}
!2543 = metadata !{i32 538, i32 5, metadata !2536, null}
!2544 = metadata !{i32 545, i32 10, metadata !2545, null}
!2545 = metadata !{i32 786443, metadata !2474, i32 545, i32 5, metadata !218, i32 81} ; [ DW_TAG_lexical_block ]
!2546 = metadata !{i32 546, i32 9, metadata !2547, null}
!2547 = metadata !{i32 786443, metadata !2545, i32 545, i32 48, metadata !218, i32 82} ; [ DW_TAG_lexical_block ]
!2548 = metadata !{i32 547, i32 9, metadata !2547, null}
!2549 = metadata !{i32 548, i32 13, metadata !2550, null}
!2550 = metadata !{i32 786443, metadata !2547, i32 547, i32 24, metadata !218, i32 83} ; [ DW_TAG_lexical_block ]
!2551 = metadata !{i32 549, i32 13, metadata !2550, null}
!2552 = metadata !{i32 549, i32 31, metadata !2550, null}
!2553 = metadata !{i32 550, i32 13, metadata !2550, null}
!2554 = metadata !{i32 552, i32 17, metadata !2555, null}
!2555 = metadata !{i32 786443, metadata !2550, i32 550, i32 49, metadata !218, i32 84} ; [ DW_TAG_lexical_block ]
!2556 = metadata !{i32 553, i32 17, metadata !2555, null}
!2557 = metadata !{i32 554, i32 13, metadata !2555, null}
!2558 = metadata !{i32 555, i32 13, metadata !2550, null}
!2559 = metadata !{i32 556, i32 9, metadata !2550, null}
!2560 = metadata !{i32 557, i32 5, metadata !2547, null}
!2561 = metadata !{i32 545, i32 40, metadata !2545, null}
!2562 = metadata !{i32 558, i32 1, metadata !2474, null}
!2563 = metadata !{i32 786689, metadata !344, metadata !"in", metadata !345, i32 16777602, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!2564 = metadata !{i32 386, i32 9, metadata !344, null}
!2565 = metadata !{i32 786689, metadata !344, metadata !"out", metadata !345, i32 33554819, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!2566 = metadata !{i32 387, i32 9, metadata !344, null}
!2567 = metadata !{i32 786688, metadata !2568, metadata !"n", metadata !345, i32 389, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2568 = metadata !{i32 786443, metadata !344, i32 388, i32 1, metadata !345, i32 0} ; [ DW_TAG_lexical_block ]
!2569 = metadata !{i32 389, i32 14, metadata !2568, null}
!2570 = metadata !{i32 390, i32 5, metadata !2568, null}
!2571 = metadata !{i32 391, i32 5, metadata !2568, null}
!2572 = metadata !{i32 393, i32 5, metadata !2568, null}
!2573 = metadata !{i32 394, i32 5, metadata !2568, null}
!2574 = metadata !{i32 395, i32 6, metadata !2575, null}
!2575 = metadata !{i32 786443, metadata !2568, i32 394, i32 19, metadata !345, i32 1} ; [ DW_TAG_lexical_block ]
!2576 = metadata !{i32 396, i32 2, metadata !2575, null}
!2577 = metadata !{i32 397, i32 6, metadata !2578, null}
!2578 = metadata !{i32 786443, metadata !2575, i32 396, i32 22, metadata !345, i32 2} ; [ DW_TAG_lexical_block ]
!2579 = metadata !{i32 398, i32 2, metadata !2578, null}
!2580 = metadata !{i32 399, i32 5, metadata !2575, null}
!2581 = metadata !{i32 400, i32 5, metadata !2568, null}
!2582 = metadata !{i32 332, i32 5, metadata !2583, null}
!2583 = metadata !{i32 786443, metadata !368, i32 331, i32 1, metadata !345, i32 55} ; [ DW_TAG_lexical_block ]
!2584 = metadata !{i32 333, i32 5, metadata !2583, null}
!2585 = metadata !{i32 334, i32 5, metadata !2583, null}
!2586 = metadata !{i32 335, i32 1, metadata !2583, null}
!2587 = metadata !{i32 786689, metadata !346, metadata !"count", metadata !345, i32 16777556, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!2588 = metadata !{i32 340, i32 14, metadata !346, null}
!2589 = metadata !{i32 786689, metadata !346, metadata !"buffer", metadata !345, i32 33554773, metadata !349, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!2590 = metadata !{i32 341, i32 9, metadata !346, null}
!2591 = metadata !{i32 786688, metadata !2592, metadata !"r", metadata !345, i32 352, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2592 = metadata !{i32 786443, metadata !346, i32 350, i32 1, metadata !345, i32 3} ; [ DW_TAG_lexical_block ]
!2593 = metadata !{i32 352, i32 14, metadata !2592, null}
!2594 = metadata !{i32 786688, metadata !2592, metadata !"c", metadata !345, i32 352, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2595 = metadata !{i32 352, i32 17, metadata !2592, null}
!2596 = metadata !{i32 354, i32 5, metadata !2592, null}
!2597 = metadata !{i32 355, i32 5, metadata !2592, null}
!2598 = metadata !{i32 356, i32 2, metadata !2599, null}
!2599 = metadata !{i32 786443, metadata !2592, i32 355, i32 22, metadata !345, i32 4} ; [ DW_TAG_lexical_block ]
!2600 = metadata !{i32 357, i32 2, metadata !2599, null}
!2601 = metadata !{i32 358, i32 2, metadata !2599, null}
!2602 = metadata !{i32 358, i32 20, metadata !2599, null}
!2603 = metadata !{i32 359, i32 5, metadata !2599, null}
!2604 = metadata !{i32 360, i32 5, metadata !2605, null}
!2605 = metadata !{i32 786443, metadata !2592, i32 360, i32 5, metadata !345, i32 5} ; [ DW_TAG_lexical_block ]
!2606 = metadata !{i32 361, i32 6, metadata !2607, null}
!2607 = metadata !{i32 786443, metadata !2605, i32 360, i32 17, metadata !345, i32 6} ; [ DW_TAG_lexical_block ]
!2608 = metadata !{i32 362, i32 2, metadata !2607, null}
!2609 = metadata !{i32 363, i32 6, metadata !2610, null}
!2610 = metadata !{i32 786443, metadata !2607, i32 362, i32 15, metadata !345, i32 7} ; [ DW_TAG_lexical_block ]
!2611 = metadata !{i32 364, i32 6, metadata !2610, null}
!2612 = metadata !{i32 366, i32 2, metadata !2607, null}
!2613 = metadata !{i32 367, i32 6, metadata !2614, null}
!2614 = metadata !{i32 786443, metadata !2607, i32 366, i32 22, metadata !345, i32 8} ; [ DW_TAG_lexical_block ]
!2615 = metadata !{i32 368, i32 6, metadata !2614, null}
!2616 = metadata !{i32 368, i32 24, metadata !2614, null}
!2617 = metadata !{i32 369, i32 2, metadata !2614, null}
!2618 = metadata !{i32 370, i32 6, metadata !2619, null}
!2619 = metadata !{i32 786443, metadata !2607, i32 369, i32 9, metadata !345, i32 9} ; [ DW_TAG_lexical_block ]
!2620 = metadata !{i32 371, i32 6, metadata !2619, null}
!2621 = metadata !{i32 371, i32 15, metadata !2619, null}
!2622 = metadata !{i32 372, i32 6, metadata !2619, null}
!2623 = metadata !{i32 373, i32 3, metadata !2624, null}
!2624 = metadata !{i32 786443, metadata !2619, i32 372, i32 23, metadata !345, i32 10} ; [ DW_TAG_lexical_block ]
!2625 = metadata !{i32 374, i32 3, metadata !2624, null}
!2626 = metadata !{i32 375, i32 3, metadata !2624, null}
!2627 = metadata !{i32 375, i32 21, metadata !2624, null}
!2628 = metadata !{i32 376, i32 6, metadata !2624, null}
!2629 = metadata !{i32 378, i32 5, metadata !2607, null}
!2630 = metadata !{i32 379, i32 1, metadata !2592, null}
!2631 = metadata !{i32 786688, metadata !2632, metadata !"j", metadata !345, i32 275, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2632 = metadata !{i32 786443, metadata !360, i32 274, i32 1, metadata !345, i32 17} ; [ DW_TAG_lexical_block ]
!2633 = metadata !{i32 275, i32 14, metadata !2632, null}
!2634 = metadata !{i32 786688, metadata !2632, metadata !"mask", metadata !345, i32 275, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2635 = metadata !{i32 275, i32 17, metadata !2632, null}
!2636 = metadata !{i32 277, i32 5, metadata !2632, null}
!2637 = metadata !{i32 278, i32 14, metadata !2638, null}
!2638 = metadata !{i32 786443, metadata !2632, i32 277, i32 25, metadata !345, i32 18} ; [ DW_TAG_lexical_block ]
!2639 = metadata !{i32 279, i32 2, metadata !2638, null}
!2640 = metadata !{i32 280, i32 6, metadata !2641, null}
!2641 = metadata !{i32 786443, metadata !2638, i32 279, i32 22, metadata !345, i32 19} ; [ DW_TAG_lexical_block ]
!2642 = metadata !{i32 282, i32 2, metadata !2638, null}
!2643 = metadata !{i32 283, i32 2, metadata !2638, null}
!2644 = metadata !{i32 284, i32 2, metadata !2638, null}
!2645 = metadata !{i32 285, i32 5, metadata !2638, null}
!2646 = metadata !{i32 286, i32 5, metadata !2632, null}
!2647 = metadata !{i32 287, i32 5, metadata !2632, null}
!2648 = metadata !{i32 288, i32 5, metadata !2632, null}
!2649 = metadata !{i32 289, i32 2, metadata !2650, null}
!2650 = metadata !{i32 786443, metadata !2632, i32 288, i32 18, metadata !345, i32 20} ; [ DW_TAG_lexical_block ]
!2651 = metadata !{i32 290, i32 2, metadata !2650, null}
!2652 = metadata !{i32 291, i32 6, metadata !2653, null}
!2653 = metadata !{i32 786443, metadata !2650, i32 290, i32 5, metadata !345, i32 21} ; [ DW_TAG_lexical_block ]
!2654 = metadata !{i32 291, i32 25, metadata !2653, null}
!2655 = metadata !{i32 292, i32 25, metadata !2653, null}
!2656 = metadata !{i32 293, i32 6, metadata !2653, null}
!2657 = metadata !{i32 294, i32 2, metadata !2653, null}
!2658 = metadata !{i32 295, i32 5, metadata !2650, null}
!2659 = metadata !{i32 296, i32 5, metadata !2632, null}
!2660 = metadata !{i32 297, i32 5, metadata !2632, null}
!2661 = metadata !{i32 298, i32 1, metadata !2632, null}
!2662 = metadata !{i32 786688, metadata !2663, metadata !"j", metadata !345, i32 302, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2663 = metadata !{i32 786443, metadata !351, i32 301, i32 1, metadata !345, i32 11} ; [ DW_TAG_lexical_block ]
!2664 = metadata !{i32 302, i32 14, metadata !2663, null}
!2665 = metadata !{i32 786688, metadata !2663, metadata !"mask", metadata !345, i32 302, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2666 = metadata !{i32 302, i32 17, metadata !2663, null}
!2667 = metadata !{i32 304, i32 5, metadata !2663, null}
!2668 = metadata !{i32 305, i32 5, metadata !2663, null}
!2669 = metadata !{i32 306, i32 2, metadata !2670, null}
!2670 = metadata !{i32 786443, metadata !2663, i32 305, i32 18, metadata !345, i32 12} ; [ DW_TAG_lexical_block ]
!2671 = metadata !{i32 307, i32 2, metadata !2670, null}
!2672 = metadata !{i32 308, i32 6, metadata !2673, null}
!2673 = metadata !{i32 786443, metadata !2670, i32 307, i32 5, metadata !345, i32 13} ; [ DW_TAG_lexical_block ]
!2674 = metadata !{i32 308, i32 25, metadata !2673, null}
!2675 = metadata !{i32 309, i32 25, metadata !2673, null}
!2676 = metadata !{i32 310, i32 6, metadata !2673, null}
!2677 = metadata !{i32 311, i32 2, metadata !2673, null}
!2678 = metadata !{i32 312, i32 5, metadata !2670, null}
!2679 = metadata !{i32 313, i32 5, metadata !2663, null}
!2680 = metadata !{i32 314, i32 5, metadata !2663, null}
!2681 = metadata !{i32 314, i32 17, metadata !2663, null}
!2682 = metadata !{i32 314, i32 49, metadata !2663, null}
!2683 = metadata !{i32 315, i32 5, metadata !2663, null}
!2684 = metadata !{i32 786689, metadata !357, metadata !"n", metadata !345, i32 16777326, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!2685 = metadata !{i32 110, i32 9, metadata !357, null}
!2686 = metadata !{i32 112, i32 5, metadata !2687, null}
!2687 = metadata !{i32 786443, metadata !357, i32 111, i32 1, metadata !345, i32 15} ; [ DW_TAG_lexical_block ]
!2688 = metadata !{i32 113, i32 5, metadata !2687, null}
!2689 = metadata !{i32 114, i32 2, metadata !2690, null}
!2690 = metadata !{i32 786443, metadata !2687, i32 113, i32 26, metadata !345, i32 16} ; [ DW_TAG_lexical_block ]
!2691 = metadata !{i32 115, i32 2, metadata !2690, null}
!2692 = metadata !{i32 115, i32 24, metadata !2690, null}
!2693 = metadata !{i32 116, i32 2, metadata !2690, null}
!2694 = metadata !{i32 116, i32 29, metadata !2690, null}
!2695 = metadata !{i32 117, i32 2, metadata !2690, null}
!2696 = metadata !{i32 118, i32 5, metadata !2690, null}
!2697 = metadata !{i32 119, i32 5, metadata !2687, null}
!2698 = metadata !{i32 120, i32 1, metadata !2687, null}
!2699 = metadata !{i32 786689, metadata !354, metadata !"n", metadata !345, i32 16777339, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!2700 = metadata !{i32 123, i32 9, metadata !354, null}
!2701 = metadata !{i32 786688, metadata !2702, metadata !"x", metadata !345, i32 125, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2702 = metadata !{i32 786443, metadata !354, i32 124, i32 1, metadata !345, i32 14} ; [ DW_TAG_lexical_block ]
!2703 = metadata !{i32 125, i32 14, metadata !2702, null}
!2704 = metadata !{i32 127, i32 5, metadata !2702, null}
!2705 = metadata !{i32 127, i32 37, metadata !2702, null}
!2706 = metadata !{i32 128, i32 5, metadata !2702, null}
!2707 = metadata !{i32 786689, metadata !367, metadata !"nn", metadata !345, i32 16777422, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!2708 = metadata !{i32 206, i32 9, metadata !367, null}
!2709 = metadata !{i32 786689, metadata !367, metadata !"nbit", metadata !345, i32 33554639, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!2710 = metadata !{i32 207, i32 9, metadata !367, null}
!2711 = metadata !{i32 786689, metadata !367, metadata !"i_special", metadata !345, i32 50331856, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!2712 = metadata !{i32 208, i32 9, metadata !367, null}
!2713 = metadata !{i32 786688, metadata !2714, metadata !"i", metadata !345, i32 210, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2714 = metadata !{i32 786443, metadata !367, i32 209, i32 1, metadata !345, i32 46} ; [ DW_TAG_lexical_block ]
!2715 = metadata !{i32 210, i32 9, metadata !2714, null}
!2716 = metadata !{i32 786688, metadata !2714, metadata !"c", metadata !345, i32 210, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2717 = metadata !{i32 210, i32 12, metadata !2714, null}
!2718 = metadata !{i32 786688, metadata !2714, metadata !"n", metadata !345, i32 210, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2719 = metadata !{i32 210, i32 15, metadata !2714, null}
!2720 = metadata !{i32 786688, metadata !2714, metadata !"mask", metadata !345, i32 211, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2721 = metadata !{i32 211, i32 14, metadata !2714, null}
!2722 = metadata !{i32 213, i32 9, metadata !2714, null}
!2723 = metadata !{i32 214, i32 5, metadata !2714, null}
!2724 = metadata !{i32 215, i32 6, metadata !2725, null}
!2725 = metadata !{i32 786443, metadata !2714, i32 214, i32 17, metadata !345, i32 47} ; [ DW_TAG_lexical_block ]
!2726 = metadata !{i32 216, i32 7, metadata !2727, null}
!2727 = metadata !{i32 786443, metadata !2725, i32 216, i32 2, metadata !345, i32 48} ; [ DW_TAG_lexical_block ]
!2728 = metadata !{i32 216, i32 27, metadata !2727, null}
!2729 = metadata !{i32 216, i32 22, metadata !2727, null}
!2730 = metadata !{i32 217, i32 7, metadata !2731, null}
!2731 = metadata !{i32 786443, metadata !2725, i32 217, i32 2, metadata !345, i32 49} ; [ DW_TAG_lexical_block ]
!2732 = metadata !{i32 217, i32 28, metadata !2731, null}
!2733 = metadata !{i32 217, i32 23, metadata !2731, null}
!2734 = metadata !{i32 218, i32 5, metadata !2725, null}
!2735 = metadata !{i32 219, i32 2, metadata !2736, null}
!2736 = metadata !{i32 786443, metadata !2714, i32 218, i32 12, metadata !345, i32 50} ; [ DW_TAG_lexical_block ]
!2737 = metadata !{i32 220, i32 2, metadata !2736, null}
!2738 = metadata !{i32 221, i32 6, metadata !2739, null}
!2739 = metadata !{i32 786443, metadata !2736, i32 220, i32 16, metadata !345, i32 51} ; [ DW_TAG_lexical_block ]
!2740 = metadata !{i32 222, i32 6, metadata !2739, null}
!2741 = metadata !{i32 223, i32 3, metadata !2742, null}
!2742 = metadata !{i32 786443, metadata !2739, i32 222, i32 18, metadata !345, i32 52} ; [ DW_TAG_lexical_block ]
!2743 = metadata !{i32 224, i32 3, metadata !2742, null}
!2744 = metadata !{i32 224, i32 28, metadata !2745, null}
!2745 = metadata !{i32 786443, metadata !2742, i32 224, i32 25, metadata !345, i32 53} ; [ DW_TAG_lexical_block ]
!2746 = metadata !{i32 224, i32 41, metadata !2745, null}
!2747 = metadata !{i32 224, i32 47, metadata !2745, null}
!2748 = metadata !{i32 225, i32 6, metadata !2742, null}
!2749 = metadata !{i32 226, i32 6, metadata !2739, null}
!2750 = metadata !{i32 227, i32 6, metadata !2739, null}
!2751 = metadata !{i32 228, i32 6, metadata !2739, null}
!2752 = metadata !{i32 229, i32 7, metadata !2753, null}
!2753 = metadata !{i32 786443, metadata !2739, i32 228, i32 26, metadata !345, i32 54} ; [ DW_TAG_lexical_block ]
!2754 = metadata !{i32 230, i32 3, metadata !2753, null}
!2755 = metadata !{i32 230, i32 20, metadata !2753, null}
!2756 = metadata !{i32 231, i32 6, metadata !2753, null}
!2757 = metadata !{i32 232, i32 2, metadata !2739, null}
!2758 = metadata !{i32 233, i32 2, metadata !2736, null}
!2759 = metadata !{i32 233, i32 17, metadata !2736, null}
!2760 = metadata !{i32 234, i32 2, metadata !2736, null}
!2761 = metadata !{i32 236, i32 1, metadata !2714, null}
!2762 = metadata !{i32 786688, metadata !2763, metadata !"i", metadata !345, i32 240, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2763 = metadata !{i32 786443, metadata !361, i32 239, i32 1, metadata !345, i32 22} ; [ DW_TAG_lexical_block ]
!2764 = metadata !{i32 240, i32 9, metadata !2763, null}
!2765 = metadata !{i32 786688, metadata !2763, metadata !"c", metadata !345, i32 240, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2766 = metadata !{i32 240, i32 12, metadata !2763, null}
!2767 = metadata !{i32 786688, metadata !2763, metadata !"n", metadata !345, i32 240, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2768 = metadata !{i32 240, i32 15, metadata !2763, null}
!2769 = metadata !{i32 786688, metadata !2763, metadata !"mask", metadata !345, i32 241, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2770 = metadata !{i32 241, i32 14, metadata !2763, null}
!2771 = metadata !{i32 243, i32 9, metadata !2763, null}
!2772 = metadata !{i32 244, i32 5, metadata !2763, null}
!2773 = metadata !{i32 245, i32 6, metadata !2774, null}
!2774 = metadata !{i32 786443, metadata !2763, i32 244, i32 17, metadata !345, i32 23} ; [ DW_TAG_lexical_block ]
!2775 = metadata !{i32 246, i32 7, metadata !2776, null}
!2776 = metadata !{i32 786443, metadata !2774, i32 246, i32 2, metadata !345, i32 24} ; [ DW_TAG_lexical_block ]
!2777 = metadata !{i32 246, i32 27, metadata !2776, null}
!2778 = metadata !{i32 246, i32 22, metadata !2776, null}
!2779 = metadata !{i32 247, i32 7, metadata !2780, null}
!2780 = metadata !{i32 786443, metadata !2774, i32 247, i32 2, metadata !345, i32 25} ; [ DW_TAG_lexical_block ]
!2781 = metadata !{i32 247, i32 29, metadata !2780, null}
!2782 = metadata !{i32 247, i32 24, metadata !2780, null}
!2783 = metadata !{i32 248, i32 5, metadata !2774, null}
!2784 = metadata !{i32 249, i32 2, metadata !2785, null}
!2785 = metadata !{i32 786443, metadata !2763, i32 248, i32 12, metadata !345, i32 26} ; [ DW_TAG_lexical_block ]
!2786 = metadata !{i32 250, i32 2, metadata !2785, null}
!2787 = metadata !{i32 251, i32 6, metadata !2788, null}
!2788 = metadata !{i32 786443, metadata !2785, i32 250, i32 16, metadata !345, i32 27} ; [ DW_TAG_lexical_block ]
!2789 = metadata !{i32 252, i32 6, metadata !2788, null}
!2790 = metadata !{i32 253, i32 3, metadata !2791, null}
!2791 = metadata !{i32 786443, metadata !2788, i32 252, i32 19, metadata !345, i32 28} ; [ DW_TAG_lexical_block ]
!2792 = metadata !{i32 254, i32 3, metadata !2791, null}
!2793 = metadata !{i32 255, i32 7, metadata !2794, null}
!2794 = metadata !{i32 786443, metadata !2791, i32 254, i32 6, metadata !345, i32 29} ; [ DW_TAG_lexical_block ]
!2795 = metadata !{i32 255, i32 26, metadata !2794, null}
!2796 = metadata !{i32 256, i32 26, metadata !2794, null}
!2797 = metadata !{i32 257, i32 7, metadata !2794, null}
!2798 = metadata !{i32 258, i32 3, metadata !2794, null}
!2799 = metadata !{i32 259, i32 6, metadata !2791, null}
!2800 = metadata !{i32 260, i32 6, metadata !2788, null}
!2801 = metadata !{i32 261, i32 6, metadata !2788, null}
!2802 = metadata !{i32 262, i32 3, metadata !2803, null}
!2803 = metadata !{i32 786443, metadata !2788, i32 261, i32 18, metadata !345, i32 30} ; [ DW_TAG_lexical_block ]
!2804 = metadata !{i32 262, i32 20, metadata !2803, null}
!2805 = metadata !{i32 263, i32 8, metadata !2803, null}
!2806 = metadata !{i32 263, i32 24, metadata !2803, null}
!2807 = metadata !{i32 264, i32 24, metadata !2803, null}
!2808 = metadata !{i32 265, i32 3, metadata !2803, null}
!2809 = metadata !{i32 265, i32 20, metadata !2803, null}
!2810 = metadata !{i32 266, i32 6, metadata !2803, null}
!2811 = metadata !{i32 266, i32 13, metadata !2788, null}
!2812 = metadata !{i32 267, i32 2, metadata !2788, null}
!2813 = metadata !{i32 268, i32 2, metadata !2785, null}
!2814 = metadata !{i32 268, i32 17, metadata !2785, null}
!2815 = metadata !{i32 269, i32 2, metadata !2785, null}
!2816 = metadata !{i32 271, i32 1, metadata !2763, null}
!2817 = metadata !{i32 786689, metadata !362, metadata !"nchar", metadata !345, i32 16777358, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!2818 = metadata !{i32 142, i32 9, metadata !362, null}
!2819 = metadata !{i32 786689, metadata !362, metadata !"bitlen", metadata !345, i32 33554575, metadata !349, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!2820 = metadata !{i32 143, i32 9, metadata !362, null}
!2821 = metadata !{i32 786689, metadata !362, metadata !"tablebits", metadata !345, i32 50331792, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!2822 = metadata !{i32 144, i32 9, metadata !362, null}
!2823 = metadata !{i32 786689, metadata !362, metadata !"table", metadata !345, i32 67109009, metadata !365, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!2824 = metadata !{i32 145, i32 9, metadata !362, null}
!2825 = metadata !{i32 786688, metadata !2826, metadata !"count", metadata !345, i32 147, metadata !2827, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2826 = metadata !{i32 786443, metadata !362, i32 146, i32 1, metadata !345, i32 31} ; [ DW_TAG_lexical_block ]
!2827 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 272, i64 16, i32 0, i32 0, metadata !366, metadata !182, i32 0, i32 0} ; [ DW_TAG_array_type ]
!2828 = metadata !{i32 147, i32 9, metadata !2826, null}
!2829 = metadata !{i32 786688, metadata !2826, metadata !"weight", metadata !345, i32 147, metadata !2827, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2830 = metadata !{i32 147, i32 20, metadata !2826, null}
!2831 = metadata !{i32 786688, metadata !2826, metadata !"start", metadata !345, i32 147, metadata !2832, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2832 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 288, i64 16, i32 0, i32 0, metadata !366, metadata !2833, i32 0, i32 0} ; [ DW_TAG_array_type ]
!2833 = metadata !{metadata !2834}
!2834 = metadata !{i32 786465, i64 0, i64 17}     ; [ DW_TAG_subrange_type ]
!2835 = metadata !{i32 147, i32 32, metadata !2826, null}
!2836 = metadata !{i32 786688, metadata !2826, metadata !"p", metadata !345, i32 147, metadata !365, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2837 = metadata !{i32 147, i32 44, metadata !2826, null}
!2838 = metadata !{i32 786688, metadata !2826, metadata !"i", metadata !345, i32 148, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2839 = metadata !{i32 148, i32 14, metadata !2826, null}
!2840 = metadata !{i32 786688, metadata !2826, metadata !"k", metadata !345, i32 148, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2841 = metadata !{i32 148, i32 17, metadata !2826, null}
!2842 = metadata !{i32 786688, metadata !2826, metadata !"len", metadata !345, i32 148, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2843 = metadata !{i32 148, i32 20, metadata !2826, null}
!2844 = metadata !{i32 786688, metadata !2826, metadata !"ch", metadata !345, i32 148, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2845 = metadata !{i32 148, i32 25, metadata !2826, null}
!2846 = metadata !{i32 786688, metadata !2826, metadata !"jutbits", metadata !345, i32 148, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2847 = metadata !{i32 148, i32 29, metadata !2826, null}
!2848 = metadata !{i32 786688, metadata !2826, metadata !"avail", metadata !345, i32 148, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2849 = metadata !{i32 148, i32 38, metadata !2826, null}
!2850 = metadata !{i32 786688, metadata !2826, metadata !"nextcode", metadata !345, i32 148, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2851 = metadata !{i32 148, i32 45, metadata !2826, null}
!2852 = metadata !{i32 786688, metadata !2826, metadata !"mask", metadata !345, i32 148, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2853 = metadata !{i32 148, i32 55, metadata !2826, null}
!2854 = metadata !{i32 150, i32 10, metadata !2855, null}
!2855 = metadata !{i32 786443, metadata !2826, i32 150, i32 5, metadata !345, i32 32} ; [ DW_TAG_lexical_block ]
!2856 = metadata !{i32 150, i32 31, metadata !2855, null}
!2857 = metadata !{i32 150, i32 26, metadata !2855, null}
!2858 = metadata !{i32 151, i32 10, metadata !2859, null}
!2859 = metadata !{i32 786443, metadata !2826, i32 151, i32 5, metadata !345, i32 33} ; [ DW_TAG_lexical_block ]
!2860 = metadata !{i32 151, i32 43, metadata !2859, null}
!2861 = metadata !{i32 151, i32 38, metadata !2859, null}
!2862 = metadata !{i32 153, i32 5, metadata !2826, null}
!2863 = metadata !{i32 154, i32 10, metadata !2864, null}
!2864 = metadata !{i32 786443, metadata !2826, i32 154, i32 5, metadata !345, i32 34} ; [ DW_TAG_lexical_block ]
!2865 = metadata !{i32 155, i32 2, metadata !2864, null}
!2866 = metadata !{i32 154, i32 26, metadata !2864, null}
!2867 = metadata !{i32 156, i32 5, metadata !2826, null}
!2868 = metadata !{i32 157, i32 2, metadata !2826, null}
!2869 = metadata !{i32 159, i32 5, metadata !2826, null}
!2870 = metadata !{i32 160, i32 10, metadata !2871, null}
!2871 = metadata !{i32 786443, metadata !2826, i32 160, i32 5, metadata !345, i32 35} ; [ DW_TAG_lexical_block ]
!2872 = metadata !{i32 161, i32 2, metadata !2873, null}
!2873 = metadata !{i32 786443, metadata !2871, i32 160, i32 48, metadata !345, i32 36} ; [ DW_TAG_lexical_block ]
!2874 = metadata !{i32 162, i32 2, metadata !2873, null}
!2875 = metadata !{i32 163, i32 5, metadata !2873, null}
!2876 = metadata !{i32 160, i32 43, metadata !2871, null}
!2877 = metadata !{i32 164, i32 5, metadata !2826, null}
!2878 = metadata !{i32 165, i32 2, metadata !2879, null}
!2879 = metadata !{i32 786443, metadata !2826, i32 164, i32 21, metadata !345, i32 37} ; [ DW_TAG_lexical_block ]
!2880 = metadata !{i32 166, i32 2, metadata !2879, null}
!2881 = metadata !{i32 167, i32 5, metadata !2879, null}
!2882 = metadata !{i32 169, i32 5, metadata !2826, null}
!2883 = metadata !{i32 170, i32 5, metadata !2826, null}
!2884 = metadata !{i32 171, i32 2, metadata !2885, null}
!2885 = metadata !{i32 786443, metadata !2826, i32 170, i32 17, metadata !345, i32 38} ; [ DW_TAG_lexical_block ]
!2886 = metadata !{i32 172, i32 2, metadata !2885, null}
!2887 = metadata !{i32 172, i32 17, metadata !2885, null}
!2888 = metadata !{i32 173, i32 5, metadata !2885, null}
!2889 = metadata !{i32 175, i32 5, metadata !2826, null}
!2890 = metadata !{i32 176, i32 5, metadata !2826, null}
!2891 = metadata !{i32 177, i32 10, metadata !2892, null}
!2892 = metadata !{i32 786443, metadata !2826, i32 177, i32 5, metadata !345, i32 39} ; [ DW_TAG_lexical_block ]
!2893 = metadata !{i32 178, i32 2, metadata !2894, null}
!2894 = metadata !{i32 786443, metadata !2892, i32 177, i32 46, metadata !345, i32 40} ; [ DW_TAG_lexical_block ]
!2895 = metadata !{i32 178, i32 31, metadata !2894, null}
!2896 = metadata !{i32 179, i32 2, metadata !2894, null}
!2897 = metadata !{i32 180, i32 2, metadata !2894, null}
!2898 = metadata !{i32 181, i32 11, metadata !2899, null}
!2899 = metadata !{i32 786443, metadata !2900, i32 181, i32 6, metadata !345, i32 42} ; [ DW_TAG_lexical_block ]
!2900 = metadata !{i32 786443, metadata !2894, i32 180, i32 34, metadata !345, i32 41} ; [ DW_TAG_lexical_block ]
!2901 = metadata !{i32 181, i32 46, metadata !2899, null}
!2902 = metadata !{i32 181, i32 41, metadata !2899, null}
!2903 = metadata !{i32 182, i32 2, metadata !2900, null}
!2904 = metadata !{i32 183, i32 6, metadata !2905, null}
!2905 = metadata !{i32 786443, metadata !2894, i32 182, i32 9, metadata !345, i32 43} ; [ DW_TAG_lexical_block ]
!2906 = metadata !{i32 184, i32 6, metadata !2905, null}
!2907 = metadata !{i32 185, i32 6, metadata !2905, null}
!2908 = metadata !{i32 186, i32 6, metadata !2905, null}
!2909 = metadata !{i32 187, i32 3, metadata !2910, null}
!2910 = metadata !{i32 786443, metadata !2905, i32 186, i32 21, metadata !345, i32 44} ; [ DW_TAG_lexical_block ]
!2911 = metadata !{i32 188, i32 7, metadata !2912, null}
!2912 = metadata !{i32 786443, metadata !2910, i32 187, i32 16, metadata !345, i32 45} ; [ DW_TAG_lexical_block ]
!2913 = metadata !{i32 189, i32 7, metadata !2912, null}
!2914 = metadata !{i32 190, i32 3, metadata !2912, null}
!2915 = metadata !{i32 191, i32 3, metadata !2910, null}
!2916 = metadata !{i32 191, i32 17, metadata !2910, null}
!2917 = metadata !{i32 192, i32 17, metadata !2910, null}
!2918 = metadata !{i32 193, i32 3, metadata !2910, null}
!2919 = metadata !{i32 193, i32 13, metadata !2910, null}
!2920 = metadata !{i32 194, i32 6, metadata !2910, null}
!2921 = metadata !{i32 195, i32 6, metadata !2905, null}
!2922 = metadata !{i32 197, i32 2, metadata !2894, null}
!2923 = metadata !{i32 198, i32 5, metadata !2894, null}
!2924 = metadata !{i32 177, i32 40, metadata !2892, null}
!2925 = metadata !{i32 199, i32 1, metadata !2826, null}
!2926 = metadata !{i32 320, i32 5, metadata !2927, null}
!2927 = metadata !{i32 786443, metadata !369, i32 319, i32 1, metadata !345, i32 56} ; [ DW_TAG_lexical_block ]
!2928 = metadata !{i32 320, i32 22, metadata !2927, null}
!2929 = metadata !{i32 321, i32 1, metadata !2927, null}
!2930 = metadata !{i32 133, i32 5, metadata !2931, null}
!2931 = metadata !{i32 786443, metadata !370, i32 132, i32 1, metadata !345, i32 57} ; [ DW_TAG_lexical_block ]
!2932 = metadata !{i32 133, i32 18, metadata !2931, null}
!2933 = metadata !{i32 133, i32 34, metadata !2931, null}
!2934 = metadata !{i32 134, i32 5, metadata !2931, null}
!2935 = metadata !{i32 135, i32 1, metadata !2931, null}
!2936 = metadata !{i32 786689, metadata !387, metadata !"in", metadata !388, i32 16777409, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!2937 = metadata !{i32 193, i32 9, metadata !387, null}
!2938 = metadata !{i32 786689, metadata !387, metadata !"out", metadata !388, i32 33554625, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!2939 = metadata !{i32 193, i32 13, metadata !387, null}
!2940 = metadata !{i32 786688, metadata !2941, metadata !"stackp", metadata !388, i32 195, metadata !2942, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2941 = metadata !{i32 786443, metadata !387, i32 194, i32 1, metadata !388, i32 0} ; [ DW_TAG_lexical_block ]
!2942 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !2943} ; [ DW_TAG_pointer_type ]
!2943 = metadata !{i32 786454, null, metadata !"char_type", metadata !388, i32 28, i64 0, i64 0, i64 0, i32 0, metadata !156} ; [ DW_TAG_typedef ]
!2944 = metadata !{i32 195, i32 24, metadata !2941, null}
!2945 = metadata !{i32 786688, metadata !2941, metadata !"code", metadata !388, i32 196, metadata !2946, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2946 = metadata !{i32 786454, null, metadata !"code_int", metadata !388, i32 29, i64 0, i64 0, i64 0, i32 0, metadata !63} ; [ DW_TAG_typedef ]
!2947 = metadata !{i32 196, i32 23, metadata !2941, null}
!2948 = metadata !{i32 786688, metadata !2941, metadata !"finchar", metadata !388, i32 197, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2949 = metadata !{i32 197, i32 23, metadata !2941, null}
!2950 = metadata !{i32 786688, metadata !2941, metadata !"oldcode", metadata !388, i32 198, metadata !2946, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2951 = metadata !{i32 198, i32 23, metadata !2941, null}
!2952 = metadata !{i32 786688, metadata !2941, metadata !"incode", metadata !388, i32 199, metadata !2946, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2953 = metadata !{i32 199, i32 23, metadata !2941, null}
!2954 = metadata !{i32 786688, metadata !2941, metadata !"inbits", metadata !388, i32 200, metadata !63, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2955 = metadata !{i32 200, i32 23, metadata !2941, null}
!2956 = metadata !{i32 786688, metadata !2941, metadata !"posbits", metadata !388, i32 201, metadata !63, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2957 = metadata !{i32 201, i32 23, metadata !2941, null}
!2958 = metadata !{i32 786688, metadata !2941, metadata !"outpos", metadata !388, i32 202, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2959 = metadata !{i32 202, i32 23, metadata !2941, null}
!2960 = metadata !{i32 786688, metadata !2941, metadata !"bitmask", metadata !388, i32 204, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2961 = metadata !{i32 204, i32 23, metadata !2941, null}
!2962 = metadata !{i32 786688, metadata !2941, metadata !"free_ent", metadata !388, i32 205, metadata !2946, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2963 = metadata !{i32 205, i32 23, metadata !2941, null}
!2964 = metadata !{i32 786688, metadata !2941, metadata !"maxcode", metadata !388, i32 206, metadata !2946, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2965 = metadata !{i32 206, i32 23, metadata !2941, null}
!2966 = metadata !{i32 786688, metadata !2941, metadata !"maxmaxcode", metadata !388, i32 207, metadata !2946, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2967 = metadata !{i32 207, i32 23, metadata !2941, null}
!2968 = metadata !{i32 786688, metadata !2941, metadata !"n_bits", metadata !388, i32 208, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2969 = metadata !{i32 208, i32 23, metadata !2941, null}
!2970 = metadata !{i32 786688, metadata !2941, metadata !"rsize", metadata !388, i32 209, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!2971 = metadata !{i32 209, i32 23, metadata !2941, null}
!2972 = metadata !{i32 215, i32 5, metadata !2941, null}
!2973 = metadata !{i32 215, i32 15, metadata !2941, null}
!2974 = metadata !{i32 216, i32 5, metadata !2941, null}
!2975 = metadata !{i32 217, i32 5, metadata !2941, null}
!2976 = metadata !{i32 218, i32 2, metadata !2977, null}
!2977 = metadata !{i32 786443, metadata !2978, i32 218, i32 2, metadata !388, i32 2} ; [ DW_TAG_lexical_block ]
!2978 = metadata !{i32 786443, metadata !2941, i32 217, i32 40, metadata !388, i32 1} ; [ DW_TAG_lexical_block ]
!2979 = metadata !{i32 220, i32 5, metadata !2978, null}
!2980 = metadata !{i32 221, i32 5, metadata !2941, null}
!2981 = metadata !{i32 222, i32 5, metadata !2941, null}
!2982 = metadata !{i32 224, i32 5, metadata !2941, null}
!2983 = metadata !{i32 225, i32 2, metadata !2984, null}
!2984 = metadata !{i32 786443, metadata !2941, i32 224, i32 25, metadata !388, i32 3} ; [ DW_TAG_lexical_block ]
!2985 = metadata !{i32 228, i32 2, metadata !2984, null}
!2986 = metadata !{i32 229, i32 2, metadata !2984, null}
!2987 = metadata !{i32 231, i32 5, metadata !2941, null}
!2988 = metadata !{i32 232, i32 5, metadata !2941, null}
!2989 = metadata !{i32 233, i32 5, metadata !2941, null}
!2990 = metadata !{i32 234, i32 5, metadata !2941, null}
!2991 = metadata !{i32 235, i32 5, metadata !2941, null}
!2992 = metadata !{i32 236, i32 5, metadata !2941, null}
!2993 = metadata !{i32 237, i32 5, metadata !2941, null}
!2994 = metadata !{i32 239, i32 5, metadata !2941, null}
!2995 = metadata !{i32 241, i32 5, metadata !2941, null}
!2996 = metadata !{i32 243, i32 10, metadata !2997, null}
!2997 = metadata !{i32 786443, metadata !2941, i32 243, i32 5, metadata !388, i32 4} ; [ DW_TAG_lexical_block ]
!2998 = metadata !{i32 244, i32 2, metadata !2999, null}
!2999 = metadata !{i32 786443, metadata !2997, i32 243, i32 43, metadata !388, i32 5} ; [ DW_TAG_lexical_block ]
!3000 = metadata !{i32 245, i32 5, metadata !2999, null}
!3001 = metadata !{i32 243, i32 35, metadata !2997, null}
!3002 = metadata !{i32 246, i32 5, metadata !2941, null}
!3003 = metadata !{i32 786688, metadata !3004, metadata !"i", metadata !388, i32 247, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!3004 = metadata !{i32 786443, metadata !2941, i32 246, i32 8, metadata !388, i32 6} ; [ DW_TAG_lexical_block ]
!3005 = metadata !{i32 247, i32 11, metadata !3004, null}
!3006 = metadata !{i32 786688, metadata !3004, metadata !"e", metadata !388, i32 248, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!3007 = metadata !{i32 248, i32 7, metadata !3004, null}
!3008 = metadata !{i32 786688, metadata !3004, metadata !"o", metadata !388, i32 249, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!3009 = metadata !{i32 249, i32 7, metadata !3004, null}
!3010 = metadata !{i32 249, i32 8, metadata !3004, null}
!3011 = metadata !{i32 252, i32 2, metadata !3004, null}
!3012 = metadata !{i32 254, i32 7, metadata !3013, null}
!3013 = metadata !{i32 786443, metadata !3004, i32 254, i32 2, metadata !388, i32 7} ; [ DW_TAG_lexical_block ]
!3014 = metadata !{i32 255, i32 6, metadata !3015, null}
!3015 = metadata !{i32 786443, metadata !3013, i32 254, i32 28, metadata !388, i32 8} ; [ DW_TAG_lexical_block ]
!3016 = metadata !{i32 256, i32 2, metadata !3015, null}
!3017 = metadata !{i32 254, i32 23, metadata !3013, null}
!3018 = metadata !{i32 257, i32 2, metadata !3004, null}
!3019 = metadata !{i32 258, i32 2, metadata !3004, null}
!3020 = metadata !{i32 260, i32 2, metadata !3004, null}
!3021 = metadata !{i32 261, i32 19, metadata !3022, null}
!3022 = metadata !{i32 786443, metadata !3004, i32 260, i32 28, metadata !388, i32 9} ; [ DW_TAG_lexical_block ]
!3023 = metadata !{i32 262, i32 3, metadata !3024, null}
!3024 = metadata !{i32 786443, metadata !3022, i32 261, i32 68, metadata !388, i32 10} ; [ DW_TAG_lexical_block ]
!3025 = metadata !{i32 263, i32 6, metadata !3024, null}
!3026 = metadata !{i32 264, i32 6, metadata !3022, null}
!3027 = metadata !{i32 265, i32 6, metadata !3022, null}
!3028 = metadata !{i32 266, i32 2, metadata !3022, null}
!3029 = metadata !{i32 267, i32 2, metadata !3004, null}
!3030 = metadata !{i32 270, i32 2, metadata !3004, null}
!3031 = metadata !{i32 271, i32 6, metadata !3032, null}
!3032 = metadata !{i32 786443, metadata !3004, i32 270, i32 27, metadata !388, i32 11} ; [ DW_TAG_lexical_block ]
!3033 = metadata !{i32 272, i32 3, metadata !3034, null}
!3034 = metadata !{i32 786443, metadata !3032, i32 271, i32 30, metadata !388, i32 12} ; [ DW_TAG_lexical_block ]
!3035 = metadata !{i32 274, i32 3, metadata !3034, null}
!3036 = metadata !{i32 275, i32 3, metadata !3034, null}
!3037 = metadata !{i32 276, i32 7, metadata !3038, null}
!3038 = metadata !{i32 786443, metadata !3034, i32 275, i32 26, metadata !388, i32 13} ; [ DW_TAG_lexical_block ]
!3039 = metadata !{i32 277, i32 3, metadata !3038, null}
!3040 = metadata !{i32 278, i32 7, metadata !3041, null}
!3041 = metadata !{i32 786443, metadata !3034, i32 277, i32 10, metadata !388, i32 14} ; [ DW_TAG_lexical_block ]
!3042 = metadata !{i32 280, i32 3, metadata !3034, null}
!3043 = metadata !{i32 281, i32 3, metadata !3034, null}
!3044 = metadata !{i32 786688, metadata !3045, metadata !"p", metadata !388, i32 283, metadata !2942, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!3045 = metadata !{i32 786443, metadata !3032, i32 283, i32 6, metadata !388, i32 15} ; [ DW_TAG_lexical_block ]
!3046 = metadata !{i32 283, i32 6, metadata !3045, null}
!3047 = metadata !{i32 286, i32 6, metadata !3032, null}
!3048 = metadata !{i32 287, i32 3, metadata !3049, null}
!3049 = metadata !{i32 786443, metadata !3032, i32 286, i32 25, metadata !388, i32 16} ; [ DW_TAG_lexical_block ]
!3050 = metadata !{i32 287, i32 20, metadata !3049, null}
!3051 = metadata !{i32 288, i32 3, metadata !3049, null}
!3052 = metadata !{i32 289, i32 3, metadata !3049, null}
!3053 = metadata !{i32 291, i32 6, metadata !3032, null}
!3054 = metadata !{i32 292, i32 3, metadata !3055, null}
!3055 = metadata !{i32 786443, metadata !3032, i32 291, i32 39, metadata !388, i32 17} ; [ DW_TAG_lexical_block ]
!3056 = metadata !{i32 293, i32 3, metadata !3055, null}
!3057 = metadata !{i32 294, i32 3, metadata !3055, null}
!3058 = metadata !{i32 296, i32 3, metadata !3055, null}
!3059 = metadata !{i32 297, i32 3, metadata !3055, null}
!3060 = metadata !{i32 298, i32 3, metadata !3055, null}
!3061 = metadata !{i32 300, i32 6, metadata !3032, null}
!3062 = metadata !{i32 301, i32 6, metadata !3032, null}
!3063 = metadata !{i32 303, i32 6, metadata !3032, null}
!3064 = metadata !{i32 304, i32 3, metadata !3065, null}
!3065 = metadata !{i32 786443, metadata !3032, i32 303, i32 28, metadata !388, i32 18} ; [ DW_TAG_lexical_block ]
!3066 = metadata !{i32 317, i32 7, metadata !3067, null}
!3067 = metadata !{i32 786443, metadata !3065, i32 304, i32 24, metadata !388, i32 19} ; [ DW_TAG_lexical_block ]
!3068 = metadata !{i32 318, i32 4, metadata !3069, null}
!3069 = metadata !{i32 786443, metadata !3067, i32 317, i32 32, metadata !388, i32 20} ; [ DW_TAG_lexical_block ]
!3070 = metadata !{i32 319, i32 4, metadata !3069, null}
!3071 = metadata !{i32 320, i32 7, metadata !3069, null}
!3072 = metadata !{i32 321, i32 7, metadata !3067, null}
!3073 = metadata !{i32 323, i32 3, metadata !3067, null}
!3074 = metadata !{i32 324, i32 3, metadata !3065, null}
!3075 = metadata !{i32 325, i32 3, metadata !3065, null}
!3076 = metadata !{i32 326, i32 6, metadata !3065, null}
!3077 = metadata !{i32 328, i32 6, metadata !3032, null}
!3078 = metadata !{i32 330, i32 3, metadata !3079, null}
!3079 = metadata !{i32 786443, metadata !3032, i32 328, i32 54, metadata !388, i32 21} ; [ DW_TAG_lexical_block ]
!3080 = metadata !{i32 331, i32 3, metadata !3079, null}
!3081 = metadata !{i32 332, i32 6, metadata !3079, null}
!3082 = metadata !{i32 333, i32 6, metadata !3032, null}
!3083 = metadata !{i32 786688, metadata !3084, metadata !"i", metadata !388, i32 337, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!3084 = metadata !{i32 786443, metadata !3032, i32 336, i32 6, metadata !388, i32 22} ; [ DW_TAG_lexical_block ]
!3085 = metadata !{i32 337, i32 12, metadata !3084, null}
!3086 = metadata !{i32 339, i32 3, metadata !3084, null}
!3087 = metadata !{i32 340, i32 7, metadata !3088, null}
!3088 = metadata !{i32 786443, metadata !3084, i32 339, i32 52, metadata !388, i32 23} ; [ DW_TAG_lexical_block ]
!3089 = metadata !{i32 341, i32 4, metadata !3090, null}
!3090 = metadata !{i32 786443, metadata !3088, i32 340, i32 10, metadata !388, i32 24} ; [ DW_TAG_lexical_block ]
!3091 = metadata !{i32 341, i32 30, metadata !3090, null}
!3092 = metadata !{i32 343, i32 4, metadata !3090, null}
!3093 = metadata !{i32 344, i32 8, metadata !3094, null}
!3094 = metadata !{i32 786443, metadata !3090, i32 343, i32 15, metadata !388, i32 25} ; [ DW_TAG_lexical_block ]
!3095 = metadata !{i32 345, i32 8, metadata !3094, null}
!3096 = metadata !{i32 346, i32 4, metadata !3094, null}
!3097 = metadata !{i32 347, i32 4, metadata !3090, null}
!3098 = metadata !{i32 348, i32 8, metadata !3099, null}
!3099 = metadata !{i32 786443, metadata !3090, i32 347, i32 29, metadata !388, i32 26} ; [ DW_TAG_lexical_block ]
!3100 = metadata !{i32 349, i32 5, metadata !3101, null}
!3101 = metadata !{i32 786443, metadata !3099, i32 348, i32 19, metadata !388, i32 27} ; [ DW_TAG_lexical_block ]
!3102 = metadata !{i32 350, i32 5, metadata !3101, null}
!3103 = metadata !{i32 351, i32 8, metadata !3101, null}
!3104 = metadata !{i32 352, i32 8, metadata !3099, null}
!3105 = metadata !{i32 353, i32 4, metadata !3099, null}
!3106 = metadata !{i32 354, i32 4, metadata !3090, null}
!3107 = metadata !{i32 355, i32 7, metadata !3090, null}
!3108 = metadata !{i32 356, i32 3, metadata !3088, null}
!3109 = metadata !{i32 357, i32 7, metadata !3110, null}
!3110 = metadata !{i32 786443, metadata !3084, i32 356, i32 10, metadata !388, i32 28} ; [ DW_TAG_lexical_block ]
!3111 = metadata !{i32 358, i32 7, metadata !3110, null}
!3112 = metadata !{i32 362, i32 6, metadata !3032, null}
!3113 = metadata !{i32 364, i32 3, metadata !3114, null}
!3114 = metadata !{i32 786443, metadata !3032, i32 362, i32 42, metadata !388, i32 29} ; [ DW_TAG_lexical_block ]
!3115 = metadata !{i32 365, i32 3, metadata !3114, null}
!3116 = metadata !{i32 366, i32 3, metadata !3114, null}
!3117 = metadata !{i32 367, i32 6, metadata !3114, null}
!3118 = metadata !{i32 368, i32 6, metadata !3032, null}
!3119 = metadata !{i32 369, i32 2, metadata !3032, null}
!3120 = metadata !{i32 370, i32 5, metadata !3004, null}
!3121 = metadata !{i32 372, i32 5, metadata !2941, null}
!3122 = metadata !{i32 373, i32 2, metadata !3123, null}
!3123 = metadata !{i32 786443, metadata !2941, i32 372, i32 30, metadata !388, i32 30} ; [ DW_TAG_lexical_block ]
!3124 = metadata !{i32 374, i32 2, metadata !3123, null}
!3125 = metadata !{i32 375, i32 5, metadata !3123, null}
!3126 = metadata !{i32 376, i32 5, metadata !2941, null}
!3127 = metadata !{i32 377, i32 1, metadata !2941, null}
!3128 = metadata !{i32 786689, metadata !395, metadata !"in", metadata !396, i32 16777402, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!3129 = metadata !{i32 186, i32 9, metadata !395, null}
!3130 = metadata !{i32 786689, metadata !395, metadata !"out", metadata !396, i32 33554618, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!3131 = metadata !{i32 186, i32 13, metadata !395, null}
!3132 = metadata !{i32 786688, metadata !3133, metadata !"len", metadata !396, i32 188, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!3133 = metadata !{i32 786443, metadata !395, i32 187, i32 1, metadata !396, i32 0} ; [ DW_TAG_lexical_block ]
!3134 = metadata !{i32 188, i32 9, metadata !3133, null}
!3135 = metadata !{i32 786688, metadata !3133, metadata !"eob", metadata !396, i32 189, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!3136 = metadata !{i32 189, i32 14, metadata !3133, null}
!3137 = metadata !{i32 786688, metadata !3133, metadata !"peek", metadata !396, i32 190, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!3138 = metadata !{i32 190, i32 23, metadata !3133, null}
!3139 = metadata !{i32 786688, metadata !3133, metadata !"peek_mask", metadata !396, i32 191, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!3140 = metadata !{i32 191, i32 14, metadata !3133, null}
!3141 = metadata !{i32 193, i32 5, metadata !3133, null}
!3142 = metadata !{i32 194, i32 5, metadata !3133, null}
!3143 = metadata !{i32 196, i32 5, metadata !3133, null}
!3144 = metadata !{i32 197, i32 5, metadata !3133, null}
!3145 = metadata !{i32 198, i32 5, metadata !3133, null}
!3146 = metadata !{i32 199, i32 5, metadata !3133, null}
!3147 = metadata !{i32 202, i32 5, metadata !3133, null}
!3148 = metadata !{i32 206, i32 5, metadata !3149, null}
!3149 = metadata !{i32 786443, metadata !3133, i32 206, i32 5, metadata !396, i32 1} ; [ DW_TAG_lexical_block ]
!3150 = metadata !{i32 211, i32 2, metadata !3151, null}
!3151 = metadata !{i32 786443, metadata !3152, i32 211, i32 2, metadata !396, i32 3} ; [ DW_TAG_lexical_block ]
!3152 = metadata !{i32 786443, metadata !3149, i32 206, i32 14, metadata !396, i32 2} ; [ DW_TAG_lexical_block ]
!3153 = metadata !{i32 212, i32 2, metadata !3152, null}
!3154 = metadata !{i32 213, i32 2, metadata !3152, null}
!3155 = metadata !{i32 214, i32 6, metadata !3156, null}
!3156 = metadata !{i32 786443, metadata !3152, i32 213, i32 15, metadata !396, i32 4} ; [ DW_TAG_lexical_block ]
!3157 = metadata !{i32 215, i32 2, metadata !3156, null}
!3158 = metadata !{i32 786688, metadata !3159, metadata !"mask", metadata !396, i32 217, metadata !402, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!3159 = metadata !{i32 786443, metadata !3152, i32 215, i32 9, metadata !396, i32 5} ; [ DW_TAG_lexical_block ]
!3160 = metadata !{i32 217, i32 10, metadata !3159, null}
!3161 = metadata !{i32 217, i32 26, metadata !3159, null}
!3162 = metadata !{i32 218, i32 6, metadata !3159, null}
!3163 = metadata !{i32 219, i32 6, metadata !3159, null}
!3164 = metadata !{i32 220, i32 17, metadata !3165, null}
!3165 = metadata !{i32 786443, metadata !3159, i32 219, i32 9, metadata !396, i32 6} ; [ DW_TAG_lexical_block ]
!3166 = metadata !{i32 221, i32 3, metadata !3167, null}
!3167 = metadata !{i32 786443, metadata !3165, i32 221, i32 3, metadata !396, i32 7} ; [ DW_TAG_lexical_block ]
!3168 = metadata !{i32 222, i32 6, metadata !3165, null}
!3169 = metadata !{i32 226, i32 2, metadata !3152, null}
!3170 = metadata !{i32 226, i32 37, metadata !3152, null}
!3171 = metadata !{i32 227, i32 2, metadata !3172, null}
!3172 = metadata !{i32 786443, metadata !3152, i32 227, i32 2, metadata !396, i32 8} ; [ DW_TAG_lexical_block ]
!3173 = metadata !{i32 230, i32 2, metadata !3152, null}
!3174 = metadata !{i32 231, i32 5, metadata !3152, null}
!3175 = metadata !{i32 233, i32 5, metadata !3133, null}
!3176 = metadata !{i32 235, i32 5, metadata !3133, null}
!3177 = metadata !{i32 236, i32 2, metadata !3178, null}
!3178 = metadata !{i32 786443, metadata !3133, i32 235, i32 37, metadata !396, i32 9} ; [ DW_TAG_lexical_block ]
!3179 = metadata !{i32 237, i32 5, metadata !3178, null}
!3180 = metadata !{i32 238, i32 5, metadata !3133, null}
!3181 = metadata !{i32 786688, metadata !3182, metadata !"len", metadata !396, i32 96, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!3182 = metadata !{i32 786443, metadata !398, i32 95, i32 1, metadata !396, i32 15} ; [ DW_TAG_lexical_block ]
!3183 = metadata !{i32 96, i32 9, metadata !3182, null}
!3184 = metadata !{i32 786688, metadata !3182, metadata !"base", metadata !396, i32 97, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!3185 = metadata !{i32 97, i32 9, metadata !3182, null}
!3186 = metadata !{i32 786688, metadata !3182, metadata !"n", metadata !396, i32 98, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!3187 = metadata !{i32 98, i32 9, metadata !3182, null}
!3188 = metadata !{i32 101, i32 5, metadata !3182, null}
!3189 = metadata !{i32 102, i32 10, metadata !3190, null}
!3190 = metadata !{i32 786443, metadata !3182, i32 102, i32 5, metadata !396, i32 16} ; [ DW_TAG_lexical_block ]
!3191 = metadata !{i32 102, i32 30, metadata !3190, null}
!3192 = metadata !{i32 102, i32 64, metadata !3190, null}
!3193 = metadata !{i32 102, i32 25, metadata !3190, null}
!3194 = metadata !{i32 104, i32 5, metadata !3182, null}
!3195 = metadata !{i32 104, i32 20, metadata !3182, null}
!3196 = metadata !{i32 105, i32 5, metadata !3182, null}
!3197 = metadata !{i32 106, i32 2, metadata !3198, null}
!3198 = metadata !{i32 786443, metadata !3182, i32 105, i32 31, metadata !396, i32 17} ; [ DW_TAG_lexical_block ]
!3199 = metadata !{i32 107, i32 5, metadata !3198, null}
!3200 = metadata !{i32 110, i32 5, metadata !3182, null}
!3201 = metadata !{i32 111, i32 10, metadata !3202, null}
!3202 = metadata !{i32 786443, metadata !3182, i32 111, i32 5, metadata !396, i32 18} ; [ DW_TAG_lexical_block ]
!3203 = metadata !{i32 112, i32 2, metadata !3204, null}
!3204 = metadata !{i32 786443, metadata !3202, i32 111, i32 42, metadata !396, i32 19} ; [ DW_TAG_lexical_block ]
!3205 = metadata !{i32 112, i32 21, metadata !3204, null}
!3206 = metadata !{i32 113, i32 2, metadata !3204, null}
!3207 = metadata !{i32 114, i32 5, metadata !3204, null}
!3208 = metadata !{i32 111, i32 35, metadata !3202, null}
!3209 = metadata !{i32 115, i32 5, metadata !3182, null}
!3210 = metadata !{i32 116, i32 2, metadata !3211, null}
!3211 = metadata !{i32 786443, metadata !3182, i32 115, i32 23, metadata !396, i32 20} ; [ DW_TAG_lexical_block ]
!3212 = metadata !{i32 117, i32 5, metadata !3211, null}
!3213 = metadata !{i32 127, i32 5, metadata !3182, null}
!3214 = metadata !{i32 130, i32 5, metadata !3182, null}
!3215 = metadata !{i32 131, i32 10, metadata !3216, null}
!3216 = metadata !{i32 786443, metadata !3182, i32 131, i32 5, metadata !396, i32 21} ; [ DW_TAG_lexical_block ]
!3217 = metadata !{i32 133, i32 2, metadata !3218, null}
!3218 = metadata !{i32 786443, metadata !3216, i32 131, i32 42, metadata !396, i32 22} ; [ DW_TAG_lexical_block ]
!3219 = metadata !{i32 135, i32 7, metadata !3220, null}
!3220 = metadata !{i32 786443, metadata !3218, i32 135, i32 2, metadata !396, i32 23} ; [ DW_TAG_lexical_block ]
!3221 = metadata !{i32 136, i32 6, metadata !3222, null}
!3222 = metadata !{i32 786443, metadata !3220, i32 135, i32 36, metadata !396, i32 24} ; [ DW_TAG_lexical_block ]
!3223 = metadata !{i32 136, i32 29, metadata !3222, null}
!3224 = metadata !{i32 137, i32 2, metadata !3222, null}
!3225 = metadata !{i32 135, i32 31, metadata !3220, null}
!3226 = metadata !{i32 138, i32 5, metadata !3218, null}
!3227 = metadata !{i32 131, i32 35, metadata !3216, null}
!3228 = metadata !{i32 139, i32 5, metadata !3182, null}
!3229 = metadata !{i32 140, i32 1, metadata !3182, null}
!3230 = metadata !{i32 786688, metadata !3231, metadata !"nodes", metadata !396, i32 147, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!3231 = metadata !{i32 786443, metadata !397, i32 146, i32 1, metadata !396, i32 10} ; [ DW_TAG_lexical_block ]
!3232 = metadata !{i32 147, i32 9, metadata !3231, null}
!3233 = metadata !{i32 147, i32 18, metadata !3231, null}
!3234 = metadata !{i32 786688, metadata !3231, metadata !"len", metadata !396, i32 148, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!3235 = metadata !{i32 148, i32 9, metadata !3231, null}
!3236 = metadata !{i32 786688, metadata !3231, metadata !"prefixp", metadata !396, i32 149, metadata !3237, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!3237 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !406} ; [ DW_TAG_pointer_type ]
!3238 = metadata !{i32 149, i32 10, metadata !3231, null}
!3239 = metadata !{i32 151, i32 10, metadata !3240, null}
!3240 = metadata !{i32 786443, metadata !3231, i32 151, i32 5, metadata !396, i32 11} ; [ DW_TAG_lexical_block ]
!3241 = metadata !{i32 155, i32 2, metadata !3242, null}
!3242 = metadata !{i32 786443, metadata !3240, i32 151, i32 42, metadata !396, i32 12} ; [ DW_TAG_lexical_block ]
!3243 = metadata !{i32 156, i32 2, metadata !3242, null}
!3244 = metadata !{i32 160, i32 2, metadata !3242, null}
!3245 = metadata !{i32 162, i32 2, metadata !3242, null}
!3246 = metadata !{i32 163, i32 5, metadata !3242, null}
!3247 = metadata !{i32 151, i32 35, metadata !3240, null}
!3248 = metadata !{i32 167, i32 5, metadata !3231, null}
!3249 = metadata !{i32 168, i32 5, metadata !3231, null}
!3250 = metadata !{i32 169, i32 10, metadata !3251, null}
!3251 = metadata !{i32 786443, metadata !3231, i32 169, i32 5, metadata !396, i32 13} ; [ DW_TAG_lexical_block ]
!3252 = metadata !{i32 786688, metadata !3253, metadata !"prefixes", metadata !396, i32 170, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!3253 = metadata !{i32 786443, metadata !3251, i32 169, i32 44, metadata !396, i32 14} ; [ DW_TAG_lexical_block ]
!3254 = metadata !{i32 170, i32 6, metadata !3253, null}
!3255 = metadata !{i32 170, i32 47, metadata !3253, null}
!3256 = metadata !{i32 171, i32 2, metadata !3253, null}
!3257 = metadata !{i32 171, i32 21, metadata !3253, null}
!3258 = metadata !{i32 172, i32 5, metadata !3253, null}
!3259 = metadata !{i32 169, i32 37, metadata !3251, null}
!3260 = metadata !{i32 174, i32 5, metadata !3231, null}
!3261 = metadata !{i32 174, i32 34, metadata !3231, null}
!3262 = metadata !{i32 175, i32 1, metadata !3231, null}
!3263 = metadata !{i32 786689, metadata !419, metadata !"in", metadata !420, i32 16777268, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!3264 = metadata !{i32 52, i32 9, metadata !419, null}
!3265 = metadata !{i32 786688, metadata !3266, metadata !"h", metadata !420, i32 54, metadata !3267, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!3266 = metadata !{i32 786443, metadata !419, i32 53, i32 1, metadata !420, i32 0} ; [ DW_TAG_lexical_block ]
!3267 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !3268} ; [ DW_TAG_pointer_type ]
!3268 = metadata !{i32 786454, null, metadata !"uch", metadata !420, i32 44, i64 0, i64 0, i64 0, i32 0, metadata !156} ; [ DW_TAG_typedef ]
!3269 = metadata !{i32 54, i32 10, metadata !3266, null}
!3270 = metadata !{i32 54, i32 27, metadata !3266, null}
!3271 = metadata !{i32 56, i32 5, metadata !3266, null}
!3272 = metadata !{i32 59, i32 5, metadata !3266, null}
!3273 = metadata !{i32 61, i32 5, metadata !3266, null}
!3274 = metadata !{i32 62, i32 2, metadata !3275, null}
!3275 = metadata !{i32 786443, metadata !3266, i32 61, i32 44, metadata !420, i32 1} ; [ DW_TAG_lexical_block ]
!3276 = metadata !{i32 64, i32 2, metadata !3275, null}
!3277 = metadata !{i32 65, i32 2, metadata !3275, null}
!3278 = metadata !{i32 67, i32 5, metadata !3266, null}
!3279 = metadata !{i32 68, i32 5, metadata !3266, null}
!3280 = metadata !{i32 69, i32 2, metadata !3281, null}
!3281 = metadata !{i32 786443, metadata !3266, i32 68, i32 49, metadata !420, i32 2} ; [ DW_TAG_lexical_block ]
!3282 = metadata !{i32 72, i32 2, metadata !3281, null}
!3283 = metadata !{i32 73, i32 2, metadata !3281, null}
!3284 = metadata !{i32 77, i32 5, metadata !3266, null}
!3285 = metadata !{i32 78, i32 2, metadata !3286, null}
!3286 = metadata !{i32 786443, metadata !3266, i32 77, i32 46, metadata !420, i32 3} ; [ DW_TAG_lexical_block ]
!3287 = metadata !{i32 80, i32 2, metadata !3286, null}
!3288 = metadata !{i32 81, i32 2, metadata !3286, null}
!3289 = metadata !{i32 85, i32 5, metadata !3266, null}
!3290 = metadata !{i32 86, i32 5, metadata !3266, null}
!3291 = metadata !{i32 89, i32 5, metadata !3266, null}
!3292 = metadata !{i32 90, i32 1, metadata !3266, null}
!3293 = metadata !{i32 786689, metadata !423, metadata !"in", metadata !420, i32 16777316, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!3294 = metadata !{i32 100, i32 9, metadata !423, null}
!3295 = metadata !{i32 786689, metadata !423, metadata !"out", metadata !420, i32 33554532, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!3296 = metadata !{i32 100, i32 13, metadata !423, null}
!3297 = metadata !{i32 786688, metadata !3298, metadata !"orig_crc", metadata !420, i32 102, metadata !3299, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!3298 = metadata !{i32 786443, metadata !423, i32 101, i32 1, metadata !420, i32 4} ; [ DW_TAG_lexical_block ]
!3299 = metadata !{i32 786454, null, metadata !"ulg", metadata !420, i32 46, i64 0, i64 0, i64 0, i32 0, metadata !55} ; [ DW_TAG_typedef ]
!3300 = metadata !{i32 102, i32 9, metadata !3298, null}
!3301 = metadata !{i32 102, i32 21, metadata !3298, null}
!3302 = metadata !{i32 786688, metadata !3298, metadata !"orig_len", metadata !420, i32 103, metadata !3299, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!3303 = metadata !{i32 103, i32 9, metadata !3298, null}
!3304 = metadata !{i32 103, i32 21, metadata !3298, null}
!3305 = metadata !{i32 786688, metadata !3298, metadata !"n", metadata !420, i32 104, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!3306 = metadata !{i32 104, i32 9, metadata !3298, null}
!3307 = metadata !{i32 786688, metadata !3298, metadata !"buf", metadata !420, i32 105, metadata !3308, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!3308 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 128, i64 8, i32 0, i32 0, metadata !3268, metadata !290, i32 0, i32 0} ; [ DW_TAG_array_type ]
!3309 = metadata !{i32 105, i32 9, metadata !3298, null}
!3310 = metadata !{i32 107, i32 5, metadata !3298, null}
!3311 = metadata !{i32 108, i32 5, metadata !3298, null}
!3312 = metadata !{i32 110, i32 5, metadata !3298, null}
!3313 = metadata !{i32 112, i32 5, metadata !3298, null}
!3314 = metadata !{i32 113, i32 2, metadata !3315, null}
!3315 = metadata !{i32 786443, metadata !3298, i32 112, i32 31, metadata !420, i32 5} ; [ DW_TAG_lexical_block ]
!3316 = metadata !{i32 114, i32 2, metadata !3315, null}
!3317 = metadata !{i32 115, i32 5, metadata !3315, null}
!3318 = metadata !{i32 118, i32 5, metadata !3298, null}
!3319 = metadata !{i32 786688, metadata !3320, metadata !"res", metadata !420, i32 120, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!3320 = metadata !{i32 786443, metadata !3298, i32 118, i32 30, metadata !420, i32 6} ; [ DW_TAG_lexical_block ]
!3321 = metadata !{i32 120, i32 6, metadata !3320, null}
!3322 = metadata !{i32 120, i32 12, metadata !3320, null}
!3323 = metadata !{i32 122, i32 2, metadata !3320, null}
!3324 = metadata !{i32 123, i32 6, metadata !3325, null}
!3325 = metadata !{i32 786443, metadata !3320, i32 122, i32 16, metadata !420, i32 7} ; [ DW_TAG_lexical_block ]
!3326 = metadata !{i32 124, i32 2, metadata !3325, null}
!3327 = metadata !{i32 124, i32 9, metadata !3320, null}
!3328 = metadata !{i32 125, i32 6, metadata !3329, null}
!3329 = metadata !{i32 786443, metadata !3320, i32 124, i32 23, metadata !420, i32 8} ; [ DW_TAG_lexical_block ]
!3330 = metadata !{i32 126, i32 2, metadata !3329, null}
!3331 = metadata !{i32 128, i32 5, metadata !3320, null}
!3332 = metadata !{i32 128, i32 12, metadata !3298, null}
!3333 = metadata !{i32 786688, metadata !3334, metadata !"n", metadata !420, i32 130, metadata !3299, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!3334 = metadata !{i32 786443, metadata !3298, i32 128, i32 43, metadata !420, i32 9} ; [ DW_TAG_lexical_block ]
!3335 = metadata !{i32 130, i32 15, metadata !3334, null}
!3336 = metadata !{i32 130, i32 37, metadata !3334, null}
!3337 = metadata !{i32 132, i32 2, metadata !3334, null}
!3338 = metadata !{i32 134, i32 6, metadata !3339, null}
!3339 = metadata !{i32 786443, metadata !3334, i32 132, i32 63, metadata !420, i32 10} ; [ DW_TAG_lexical_block ]
!3340 = metadata !{i32 135, i32 6, metadata !3339, null}
!3341 = metadata !{i32 136, i32 2, metadata !3339, null}
!3342 = metadata !{i32 137, i32 2, metadata !3334, null}
!3343 = metadata !{i32 786688, metadata !3344, metadata !"c", metadata !420, i32 138, metadata !3268, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!3344 = metadata !{i32 786443, metadata !3334, i32 137, i32 14, metadata !420, i32 11} ; [ DW_TAG_lexical_block ]
!3345 = metadata !{i32 138, i32 10, metadata !3344, null}
!3346 = metadata !{i32 138, i32 29, metadata !3344, null}
!3347 = metadata !{i32 138, i32 19, metadata !3344, null}
!3348 = metadata !{i32 142, i32 6, metadata !3349, null}
!3349 = metadata !{i32 786443, metadata !3344, i32 142, i32 6, metadata !420, i32 12} ; [ DW_TAG_lexical_block ]
!3350 = metadata !{i32 143, i32 2, metadata !3344, null}
!3351 = metadata !{i32 144, i32 2, metadata !3334, null}
!3352 = metadata !{i32 145, i32 5, metadata !3334, null}
!3353 = metadata !{i32 146, i32 2, metadata !3354, null}
!3354 = metadata !{i32 786443, metadata !3298, i32 145, i32 12, metadata !420, i32 13} ; [ DW_TAG_lexical_block ]
!3355 = metadata !{i32 150, i32 5, metadata !3298, null}
!3356 = metadata !{i32 154, i32 7, metadata !3357, null}
!3357 = metadata !{i32 786443, metadata !3358, i32 154, i32 2, metadata !420, i32 15} ; [ DW_TAG_lexical_block ]
!3358 = metadata !{i32 786443, metadata !3298, i32 150, i32 17, metadata !420, i32 14} ; [ DW_TAG_lexical_block ]
!3359 = metadata !{i32 155, i32 6, metadata !3360, null}
!3360 = metadata !{i32 786443, metadata !3357, i32 154, i32 26, metadata !420, i32 16} ; [ DW_TAG_lexical_block ]
!3361 = metadata !{i32 155, i32 20, metadata !3360, null}
!3362 = metadata !{i32 156, i32 2, metadata !3360, null}
!3363 = metadata !{i32 154, i32 21, metadata !3357, null}
!3364 = metadata !{i32 157, i32 2, metadata !3358, null}
!3365 = metadata !{i32 158, i32 2, metadata !3358, null}
!3366 = metadata !{i32 160, i32 5, metadata !3358, null}
!3367 = metadata !{i32 160, i32 12, metadata !3298, null}
!3368 = metadata !{i32 166, i32 7, metadata !3369, null}
!3369 = metadata !{i32 786443, metadata !3370, i32 166, i32 2, metadata !420, i32 18} ; [ DW_TAG_lexical_block ]
!3370 = metadata !{i32 786443, metadata !3298, i32 160, i32 28, metadata !420, i32 17} ; [ DW_TAG_lexical_block ]
!3371 = metadata !{i32 167, i32 6, metadata !3372, null}
!3372 = metadata !{i32 786443, metadata !3369, i32 166, i32 31, metadata !420, i32 19} ; [ DW_TAG_lexical_block ]
!3373 = metadata !{i32 167, i32 20, metadata !3372, null}
!3374 = metadata !{i32 168, i32 2, metadata !3372, null}
!3375 = metadata !{i32 166, i32 26, metadata !3369, null}
!3376 = metadata !{i32 169, i32 2, metadata !3370, null}
!3377 = metadata !{i32 170, i32 2, metadata !3370, null}
!3378 = metadata !{i32 171, i32 5, metadata !3370, null}
!3379 = metadata !{i32 174, i32 5, metadata !3298, null}
!3380 = metadata !{i32 174, i32 21, metadata !3298, null}
!3381 = metadata !{i32 175, i32 2, metadata !3382, null}
!3382 = metadata !{i32 786443, metadata !3298, i32 174, i32 40, metadata !420, i32 20} ; [ DW_TAG_lexical_block ]
!3383 = metadata !{i32 176, i32 5, metadata !3382, null}
!3384 = metadata !{i32 177, i32 5, metadata !3298, null}
!3385 = metadata !{i32 178, i32 2, metadata !3386, null}
!3386 = metadata !{i32 786443, metadata !3298, i32 177, i32 37, metadata !420, i32 21} ; [ DW_TAG_lexical_block ]
!3387 = metadata !{i32 179, i32 5, metadata !3386, null}
!3388 = metadata !{i32 182, i32 5, metadata !3298, null}
!3389 = metadata !{i32 183, i32 2, metadata !3390, null}
!3390 = metadata !{i32 786443, metadata !3298, i32 182, i32 67, metadata !420, i32 22} ; [ DW_TAG_lexical_block ]
!3391 = metadata !{i32 184, i32 6, metadata !3392, null}
!3392 = metadata !{i32 786443, metadata !3393, i32 184, i32 6, metadata !420, i32 24} ; [ DW_TAG_lexical_block ]
!3393 = metadata !{i32 786443, metadata !3390, i32 183, i32 17, metadata !420, i32 23} ; [ DW_TAG_lexical_block ]
!3394 = metadata !{i32 187, i32 2, metadata !3393, null}
!3395 = metadata !{i32 189, i32 6, metadata !3396, null}
!3396 = metadata !{i32 786443, metadata !3390, i32 187, i32 9, metadata !420, i32 25} ; [ DW_TAG_lexical_block ]
!3397 = metadata !{i32 192, i32 6, metadata !3396, null}
!3398 = metadata !{i32 193, i32 6, metadata !3396, null}
!3399 = metadata !{i32 194, i32 6, metadata !3396, null}
!3400 = metadata !{i32 196, i32 5, metadata !3390, null}
!3401 = metadata !{i32 197, i32 5, metadata !3298, null}
!3402 = metadata !{i32 198, i32 5, metadata !3298, null}
!3403 = metadata !{i32 199, i32 1, metadata !3298, null}
!3404 = metadata !{i32 786689, metadata !433, metadata !"in", metadata !434, i32 16777256, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!3405 = metadata !{i32 40, i32 9, metadata !433, null}
!3406 = metadata !{i32 786689, metadata !433, metadata !"out", metadata !434, i32 33554472, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!3407 = metadata !{i32 40, i32 13, metadata !433, null}
!3408 = metadata !{i32 42, i32 5, metadata !3409, null}
!3409 = metadata !{i32 786443, metadata !433, i32 41, i32 1, metadata !434, i32 0} ; [ DW_TAG_lexical_block ]
!3410 = metadata !{i32 43, i32 5, metadata !3409, null}
!3411 = metadata !{i32 44, i32 2, metadata !3412, null}
!3412 = metadata !{i32 786443, metadata !3409, i32 43, i32 47, metadata !434, i32 1} ; [ DW_TAG_lexical_block ]
!3413 = metadata !{i32 45, i32 2, metadata !3412, null}
!3414 = metadata !{i32 46, i32 11, metadata !3412, null}
!3415 = metadata !{i32 47, i32 5, metadata !3412, null}
!3416 = metadata !{i32 48, i32 5, metadata !3409, null}
!3417 = metadata !{i32 48, i32 31, metadata !3409, null}
!3418 = metadata !{i32 49, i32 2, metadata !3419, null}
!3419 = metadata !{i32 786443, metadata !3409, i32 48, i32 43, metadata !434, i32 2} ; [ DW_TAG_lexical_block ]
!3420 = metadata !{i32 50, i32 5, metadata !3419, null}
!3421 = metadata !{i32 51, i32 5, metadata !3409, null}
!3422 = metadata !{i32 52, i32 5, metadata !3409, null}
!3423 = metadata !{i32 786689, metadata !445, metadata !"fd", metadata !434, i32 16777366, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!3424 = metadata !{i32 150, i32 15, metadata !445, null}
!3425 = metadata !{i32 786689, metadata !445, metadata !"buf", metadata !434, i32 33554583, metadata !448, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!3426 = metadata !{i32 151, i32 15, metadata !445, null}
!3427 = metadata !{i32 786689, metadata !445, metadata !"cnt", metadata !434, i32 50331800, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!3428 = metadata !{i32 152, i32 15, metadata !445, null}
!3429 = metadata !{i32 786688, metadata !3430, metadata !"n", metadata !434, i32 154, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!3430 = metadata !{i32 786443, metadata !445, i32 153, i32 1, metadata !434, i32 14} ; [ DW_TAG_lexical_block ]
!3431 = metadata !{i32 154, i32 15, metadata !3430, null}
!3432 = metadata !{i32 156, i32 5, metadata !3430, null}
!3433 = metadata !{i32 156, i32 17, metadata !3430, null}
!3434 = metadata !{i32 157, i32 2, metadata !3435, null}
!3435 = metadata !{i32 786443, metadata !3430, i32 156, i32 46, metadata !434, i32 15} ; [ DW_TAG_lexical_block ]
!3436 = metadata !{i32 158, i32 6, metadata !3437, null}
!3437 = metadata !{i32 786443, metadata !3435, i32 157, i32 27, metadata !434, i32 16} ; [ DW_TAG_lexical_block ]
!3438 = metadata !{i32 159, i32 2, metadata !3437, null}
!3439 = metadata !{i32 160, i32 2, metadata !3435, null}
!3440 = metadata !{i32 161, i32 2, metadata !3435, null}
!3441 = metadata !{i32 162, i32 5, metadata !3435, null}
!3442 = metadata !{i32 163, i32 1, metadata !3430, null}
!3443 = metadata !{i32 351, i32 5, metadata !3444, null}
!3444 = metadata !{i32 786443, metadata !465, i32 350, i32 1, metadata !434, i32 31} ; [ DW_TAG_lexical_block ]
!3445 = metadata !{i32 352, i32 9, metadata !3444, null}
!3446 = metadata !{i32 353, i32 2, metadata !3447, null}
!3447 = metadata !{i32 786443, metadata !3444, i32 352, i32 21, metadata !434, i32 32} ; [ DW_TAG_lexical_block ]
!3448 = metadata !{i32 354, i32 5, metadata !3447, null}
!3449 = metadata !{i32 355, i32 2, metadata !3450, null}
!3450 = metadata !{i32 786443, metadata !3444, i32 354, i32 12, metadata !434, i32 33} ; [ DW_TAG_lexical_block ]
!3451 = metadata !{i32 357, i32 5, metadata !3444, null}
!3452 = metadata !{i32 358, i32 1, metadata !3444, null}
!3453 = metadata !{i32 786689, metadata !435, metadata !"s", metadata !434, i32 16777277, metadata !439, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!3454 = metadata !{i32 61, i32 10, metadata !435, null}
!3455 = metadata !{i32 786689, metadata !435, metadata !"n", metadata !434, i32 33554494, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!3456 = metadata !{i32 62, i32 14, metadata !435, null}
!3457 = metadata !{i32 786688, metadata !3458, metadata !"c", metadata !434, i32 64, metadata !438, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!3458 = metadata !{i32 786443, metadata !435, i32 63, i32 1, metadata !434, i32 3} ; [ DW_TAG_lexical_block ]
!3459 = metadata !{i32 64, i32 18, metadata !3458, null}
!3460 = metadata !{i32 68, i32 5, metadata !3458, null}
!3461 = metadata !{i32 69, i32 2, metadata !3462, null}
!3462 = metadata !{i32 786443, metadata !3458, i32 68, i32 20, metadata !434, i32 4} ; [ DW_TAG_lexical_block ]
!3463 = metadata !{i32 70, i32 5, metadata !3462, null}
!3464 = metadata !{i32 71, i32 2, metadata !3465, null}
!3465 = metadata !{i32 786443, metadata !3458, i32 70, i32 12, metadata !434, i32 5} ; [ DW_TAG_lexical_block ]
!3466 = metadata !{i32 72, i32 9, metadata !3465, null}
!3467 = metadata !{i32 72, i32 16, metadata !3465, null}
!3468 = metadata !{i32 73, i32 13, metadata !3469, null}
!3469 = metadata !{i32 786443, metadata !3465, i32 72, i32 19, metadata !434, i32 6} ; [ DW_TAG_lexical_block ]
!3470 = metadata !{i32 74, i32 9, metadata !3469, null}
!3471 = metadata !{i32 76, i32 5, metadata !3458, null}
!3472 = metadata !{i32 77, i32 5, metadata !3458, null}
!3473 = metadata !{i32 85, i32 5, metadata !3474, null}
!3474 = metadata !{i32 786443, metadata !441, i32 84, i32 1, metadata !434, i32 7} ; [ DW_TAG_lexical_block ]
!3475 = metadata !{i32 86, i32 5, metadata !3474, null}
!3476 = metadata !{i32 87, i32 5, metadata !3474, null}
!3477 = metadata !{i32 88, i32 1, metadata !3474, null}
!3478 = metadata !{i32 786689, metadata !442, metadata !"eof_ok", metadata !434, i32 16777310, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!3479 = metadata !{i32 94, i32 9, metadata !442, null}
!3480 = metadata !{i32 786688, metadata !3481, metadata !"len", metadata !434, i32 96, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!3481 = metadata !{i32 786443, metadata !442, i32 95, i32 1, metadata !434, i32 8} ; [ DW_TAG_lexical_block ]
!3482 = metadata !{i32 96, i32 9, metadata !3481, null}
!3483 = metadata !{i32 99, i32 5, metadata !3481, null}
!3484 = metadata !{i32 100, i32 5, metadata !3481, null}
!3485 = metadata !{i32 101, i32 5, metadata !3481, null}
!3486 = metadata !{i32 102, i32 8, metadata !3487, null}
!3487 = metadata !{i32 786443, metadata !3481, i32 101, i32 8, metadata !434, i32 9} ; [ DW_TAG_lexical_block ]
!3488 = metadata !{i32 103, i32 9, metadata !3487, null}
!3489 = metadata !{i32 103, i32 37, metadata !3487, null}
!3490 = metadata !{i32 104, i32 2, metadata !3487, null}
!3491 = metadata !{i32 105, i32 5, metadata !3487, null}
!3492 = metadata !{i32 107, i32 5, metadata !3481, null}
!3493 = metadata !{i32 108, i32 2, metadata !3494, null}
!3494 = metadata !{i32 786443, metadata !3481, i32 107, i32 22, metadata !434, i32 10} ; [ DW_TAG_lexical_block ]
!3495 = metadata !{i32 108, i32 14, metadata !3494, null}
!3496 = metadata !{i32 109, i32 2, metadata !3494, null}
!3497 = metadata !{i32 110, i32 5, metadata !3494, null}
!3498 = metadata !{i32 111, i32 5, metadata !3481, null}
!3499 = metadata !{i32 112, i32 5, metadata !3481, null}
!3500 = metadata !{i32 113, i32 5, metadata !3481, null}
!3501 = metadata !{i32 114, i32 1, metadata !3481, null}
!3502 = metadata !{i32 122, i32 5, metadata !3503, null}
!3503 = metadata !{i32 786443, metadata !443, i32 121, i32 1, metadata !434, i32 11} ; [ DW_TAG_lexical_block ]
!3504 = metadata !{i32 122, i32 22, metadata !3503, null}
!3505 = metadata !{i32 124, i32 5, metadata !3503, null}
!3506 = metadata !{i32 125, i32 5, metadata !3503, null}
!3507 = metadata !{i32 126, i32 5, metadata !3503, null}
!3508 = metadata !{i32 127, i32 1, metadata !3503, null}
!3509 = metadata !{i32 135, i32 5, metadata !3510, null}
!3510 = metadata !{i32 786443, metadata !444, i32 134, i32 1, metadata !434, i32 12} ; [ DW_TAG_lexical_block ]
!3511 = metadata !{i32 135, i32 22, metadata !3510, null}
!3512 = metadata !{i32 136, i32 5, metadata !3510, null}
!3513 = metadata !{i32 138, i32 5, metadata !3510, null}
!3514 = metadata !{i32 139, i32 2, metadata !3515, null}
!3515 = metadata !{i32 786443, metadata !3510, i32 138, i32 16, metadata !434, i32 13} ; [ DW_TAG_lexical_block ]
!3516 = metadata !{i32 140, i32 5, metadata !3515, null}
!3517 = metadata !{i32 141, i32 5, metadata !3510, null}
!3518 = metadata !{i32 142, i32 5, metadata !3510, null}
!3519 = metadata !{i32 143, i32 1, metadata !3510, null}
!3520 = metadata !{i32 362, i32 5, metadata !3521, null}
!3521 = metadata !{i32 786443, metadata !466, i32 361, i32 1, metadata !434, i32 34} ; [ DW_TAG_lexical_block ]
!3522 = metadata !{i32 363, i32 5, metadata !3521, null}
!3523 = metadata !{i32 364, i32 5, metadata !3521, null}
!3524 = metadata !{i32 365, i32 1, metadata !3521, null}
!3525 = metadata !{i32 786689, metadata !450, metadata !"s", metadata !434, i32 16777385, metadata !26, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!3526 = metadata !{i32 169, i32 11, metadata !450, null}
!3527 = metadata !{i32 786688, metadata !3528, metadata !"t", metadata !434, i32 171, metadata !26, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!3528 = metadata !{i32 786443, metadata !450, i32 170, i32 1, metadata !434, i32 17} ; [ DW_TAG_lexical_block ]
!3529 = metadata !{i32 171, i32 11, metadata !3528, null}
!3530 = metadata !{i32 172, i32 10, metadata !3531, null}
!3531 = metadata !{i32 786443, metadata !3528, i32 172, i32 5, metadata !434, i32 18} ; [ DW_TAG_lexical_block ]
!3532 = metadata !{i32 172, i32 31, metadata !3531, null}
!3533 = metadata !{i32 172, i32 21, metadata !3531, null}
!3534 = metadata !{i32 173, i32 5, metadata !3528, null}
!3535 = metadata !{i32 786689, metadata !547, metadata !"_c", metadata !548, i32 16777333, metadata !551, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!3536 = metadata !{i32 117, i32 24, metadata !547, null}
!3537 = metadata !{i32 786689, metadata !547, metadata !"_f", metadata !548, i32 33554549, metadata !55, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!3538 = metadata !{i32 117, i32 42, metadata !547, null}
!3539 = metadata !{i32 119, i32 12, metadata !3540, null}
!3540 = metadata !{i32 786443, metadata !547, i32 118, i32 1, metadata !548, i32 43} ; [ DW_TAG_lexical_block ]
!3541 = metadata !{i32 786689, metadata !453, metadata !"fname", metadata !434, i32 16777398, metadata !26, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!3542 = metadata !{i32 182, i32 11, metadata !453, null}
!3543 = metadata !{i32 786688, metadata !3544, metadata !"p", metadata !434, i32 184, metadata !26, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!3544 = metadata !{i32 786443, metadata !453, i32 183, i32 1, metadata !434, i32 19} ; [ DW_TAG_lexical_block ]
!3545 = metadata !{i32 184, i32 11, metadata !3544, null}
!3546 = metadata !{i32 186, i32 14, metadata !3544, null}
!3547 = metadata !{i32 186, i32 50, metadata !3544, null}
!3548 = metadata !{i32 197, i32 5, metadata !3544, null}
!3549 = metadata !{i32 786689, metadata !454, metadata !"name", metadata !434, i32 16777425, metadata !26, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!3550 = metadata !{i32 209, i32 11, metadata !454, null}
!3551 = metadata !{i32 786688, metadata !3552, metadata !"p", metadata !434, i32 211, metadata !26, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!3552 = metadata !{i32 786443, metadata !454, i32 210, i32 1, metadata !434, i32 20} ; [ DW_TAG_lexical_block ]
!3553 = metadata !{i32 211, i32 11, metadata !3552, null}
!3554 = metadata !{i32 211, i32 15, metadata !3552, null}
!3555 = metadata !{i32 212, i32 5, metadata !3552, null}
!3556 = metadata !{i32 212, i32 20, metadata !3552, null}
!3557 = metadata !{i32 213, i32 5, metadata !3552, null}
!3558 = metadata !{i32 213, i32 20, metadata !3552, null}
!3559 = metadata !{i32 214, i32 5, metadata !3552, null}
!3560 = metadata !{i32 215, i32 9, metadata !3561, null}
!3561 = metadata !{i32 786443, metadata !3552, i32 214, i32 8, metadata !434, i32 21} ; [ DW_TAG_lexical_block ]
!3562 = metadata !{i32 215, i32 26, metadata !3561, null}
!3563 = metadata !{i32 216, i32 5, metadata !3561, null}
!3564 = metadata !{i32 217, i32 1, metadata !3552, null}
!3565 = metadata !{i32 786689, metadata !457, metadata !"argcp", metadata !434, i32 16777496, metadata !112, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!3566 = metadata !{i32 280, i32 10, metadata !457, null}
!3567 = metadata !{i32 786689, metadata !457, metadata !"argvp", metadata !434, i32 33554713, metadata !460, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!3568 = metadata !{i32 281, i32 13, metadata !457, null}
!3569 = metadata !{i32 786689, metadata !457, metadata !"env", metadata !434, i32 50331930, metadata !26, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!3570 = metadata !{i32 282, i32 11, metadata !457, null}
!3571 = metadata !{i32 786688, metadata !3572, metadata !"p", metadata !434, i32 284, metadata !26, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!3572 = metadata !{i32 786443, metadata !457, i32 283, i32 1, metadata !434, i32 22} ; [ DW_TAG_lexical_block ]
!3573 = metadata !{i32 284, i32 11, metadata !3572, null}
!3574 = metadata !{i32 786688, metadata !3572, metadata !"oargv", metadata !434, i32 285, metadata !129, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!3575 = metadata !{i32 285, i32 12, metadata !3572, null}
!3576 = metadata !{i32 786688, metadata !3572, metadata !"nargv", metadata !434, i32 286, metadata !129, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!3577 = metadata !{i32 286, i32 12, metadata !3572, null}
!3578 = metadata !{i32 786688, metadata !3572, metadata !"oargc", metadata !434, i32 287, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!3579 = metadata !{i32 287, i32 10, metadata !3572, null}
!3580 = metadata !{i32 287, i32 24, metadata !3572, null}
!3581 = metadata !{i32 786688, metadata !3572, metadata !"nargc", metadata !434, i32 288, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!3582 = metadata !{i32 288, i32 10, metadata !3572, null}
!3583 = metadata !{i32 288, i32 19, metadata !3572, null}
!3584 = metadata !{i32 290, i32 18, metadata !3572, null}
!3585 = metadata !{i32 291, i32 5, metadata !3572, null}
!3586 = metadata !{i32 291, i32 22, metadata !3572, null}
!3587 = metadata !{i32 293, i32 24, metadata !3572, null}
!3588 = metadata !{i32 294, i32 11, metadata !3572, null}
!3589 = metadata !{i32 296, i32 10, metadata !3590, null}
!3590 = metadata !{i32 786443, metadata !3572, i32 296, i32 5, metadata !434, i32 23} ; [ DW_TAG_lexical_block ]
!3591 = metadata !{i32 297, i32 7, metadata !3592, null}
!3592 = metadata !{i32 786443, metadata !3590, i32 296, i32 33, metadata !434, i32 24} ; [ DW_TAG_lexical_block ]
!3593 = metadata !{i32 298, i32 2, metadata !3592, null}
!3594 = metadata !{i32 298, i32 18, metadata !3592, null}
!3595 = metadata !{i32 300, i32 7, metadata !3592, null}
!3596 = metadata !{i32 301, i32 2, metadata !3592, null}
!3597 = metadata !{i32 301, i32 10, metadata !3592, null}
!3598 = metadata !{i32 302, i32 5, metadata !3592, null}
!3599 = metadata !{i32 296, i32 23, metadata !3590, null}
!3600 = metadata !{i32 303, i32 5, metadata !3572, null}
!3601 = metadata !{i32 304, i32 2, metadata !3602, null}
!3602 = metadata !{i32 786443, metadata !3572, i32 303, i32 21, metadata !434, i32 25} ; [ DW_TAG_lexical_block ]
!3603 = metadata !{i32 305, i32 2, metadata !3602, null}
!3604 = metadata !{i32 307, i32 5, metadata !3572, null}
!3605 = metadata !{i32 311, i32 21, metadata !3572, null}
!3606 = metadata !{i32 312, i32 5, metadata !3572, null}
!3607 = metadata !{i32 312, i32 24, metadata !3572, null}
!3608 = metadata !{i32 313, i32 5, metadata !3572, null}
!3609 = metadata !{i32 314, i32 5, metadata !3572, null}
!3610 = metadata !{i32 317, i32 5, metadata !3572, null}
!3611 = metadata !{i32 317, i32 22, metadata !3572, null}
!3612 = metadata !{i32 318, i32 5, metadata !3572, null}
!3613 = metadata !{i32 321, i32 10, metadata !3614, null}
!3614 = metadata !{i32 786443, metadata !3572, i32 321, i32 5, metadata !434, i32 26} ; [ DW_TAG_lexical_block ]
!3615 = metadata !{i32 322, i32 7, metadata !3616, null}
!3616 = metadata !{i32 786443, metadata !3614, i32 321, i32 39, metadata !434, i32 27} ; [ DW_TAG_lexical_block ]
!3617 = metadata !{i32 323, i32 2, metadata !3616, null}
!3618 = metadata !{i32 324, i32 2, metadata !3616, null}
!3619 = metadata !{i32 325, i32 5, metadata !3616, null}
!3620 = metadata !{i32 321, i32 30, metadata !3614, null}
!3621 = metadata !{i32 328, i32 5, metadata !3572, null}
!3622 = metadata !{i32 328, i32 21, metadata !3572, null}
!3623 = metadata !{i32 329, i32 5, metadata !3572, null}
!3624 = metadata !{i32 330, i32 5, metadata !3572, null}
!3625 = metadata !{i32 331, i32 1, metadata !3572, null}
!3626 = metadata !{i32 786689, metadata !541, metadata !"size", metadata !434, i32 16777614, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!3627 = metadata !{i32 398, i32 14, metadata !541, null}
!3628 = metadata !{i32 786688, metadata !3629, metadata !"cp", metadata !434, i32 400, metadata !448, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!3629 = metadata !{i32 786443, metadata !541, i32 399, i32 1, metadata !434, i32 41} ; [ DW_TAG_lexical_block ]
!3630 = metadata !{i32 400, i32 11, metadata !3629, null}
!3631 = metadata !{i32 400, i32 23, metadata !3629, null}
!3632 = metadata !{i32 402, i32 5, metadata !3629, null}
!3633 = metadata !{i32 402, i32 21, metadata !3629, null}
!3634 = metadata !{i32 403, i32 5, metadata !3629, null}
!3635 = metadata !{i32 786689, metadata !461, metadata !"m", metadata !434, i32 16777553, metadata !26, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!3636 = metadata !{i32 337, i32 11, metadata !461, null}
!3637 = metadata !{i32 339, i32 5, metadata !3638, null}
!3638 = metadata !{i32 786443, metadata !461, i32 338, i32 1, metadata !434, i32 28} ; [ DW_TAG_lexical_block ]
!3639 = metadata !{i32 340, i32 5, metadata !3638, null}
!3640 = metadata !{i32 341, i32 1, metadata !3638, null}
!3641 = metadata !{i32 786689, metadata !462, metadata !"a", metadata !434, i32 16777560, metadata !26, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!3642 = metadata !{i32 344, i32 11, metadata !462, null}
!3643 = metadata !{i32 786689, metadata !462, metadata !"b", metadata !434, i32 33554776, metadata !26, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!3644 = metadata !{i32 344, i32 15, metadata !462, null}
!3645 = metadata !{i32 346, i32 5, metadata !3646, null}
!3646 = metadata !{i32 786443, metadata !3647, i32 346, i32 5, metadata !434, i32 30} ; [ DW_TAG_lexical_block ]
!3647 = metadata !{i32 786443, metadata !462, i32 345, i32 1, metadata !434, i32 29} ; [ DW_TAG_lexical_block ]
!3648 = metadata !{i32 347, i32 1, metadata !3647, null}
!3649 = metadata !{i32 786689, metadata !467, metadata !"num", metadata !434, i32 16777587, metadata !63, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!3650 = metadata !{i32 371, i32 10, metadata !467, null}
!3651 = metadata !{i32 786689, metadata !467, metadata !"den", metadata !434, i32 33554804, metadata !63, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!3652 = metadata !{i32 372, i32 10, metadata !467, null}
!3653 = metadata !{i32 786689, metadata !467, metadata !"file", metadata !434, i32 50332021, metadata !470, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!3654 = metadata !{i32 373, i32 11, metadata !467, null}
!3655 = metadata !{i32 786688, metadata !3656, metadata !"ratio", metadata !434, i32 375, metadata !63, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!3656 = metadata !{i32 786443, metadata !467, i32 374, i32 1, metadata !434, i32 35} ; [ DW_TAG_lexical_block ]
!3657 = metadata !{i32 375, i32 10, metadata !3656, null}
!3658 = metadata !{i32 377, i32 5, metadata !3656, null}
!3659 = metadata !{i32 378, i32 2, metadata !3660, null}
!3660 = metadata !{i32 786443, metadata !3656, i32 377, i32 19, metadata !434, i32 36} ; [ DW_TAG_lexical_block ]
!3661 = metadata !{i32 379, i32 5, metadata !3660, null}
!3662 = metadata !{i32 379, i32 12, metadata !3656, null}
!3663 = metadata !{i32 380, i32 2, metadata !3664, null}
!3664 = metadata !{i32 786443, metadata !3656, i32 379, i32 32, metadata !434, i32 37} ; [ DW_TAG_lexical_block ]
!3665 = metadata !{i32 381, i32 5, metadata !3664, null}
!3666 = metadata !{i32 382, i32 2, metadata !3667, null}
!3667 = metadata !{i32 786443, metadata !3656, i32 381, i32 12, metadata !434, i32 38} ; [ DW_TAG_lexical_block ]
!3668 = metadata !{i32 384, i32 5, metadata !3656, null}
!3669 = metadata !{i32 385, i32 2, metadata !3670, null}
!3670 = metadata !{i32 786443, metadata !3656, i32 384, i32 20, metadata !434, i32 39} ; [ DW_TAG_lexical_block ]
!3671 = metadata !{i32 386, i32 2, metadata !3670, null}
!3672 = metadata !{i32 387, i32 5, metadata !3670, null}
!3673 = metadata !{i32 388, i32 2, metadata !3674, null}
!3674 = metadata !{i32 786443, metadata !3656, i32 387, i32 12, metadata !434, i32 40} ; [ DW_TAG_lexical_block ]
!3675 = metadata !{i32 390, i32 5, metadata !3656, null}
!3676 = metadata !{i32 391, i32 1, metadata !3656, null}
!3677 = metadata !{i32 786689, metadata !544, metadata !"_c", metadata !473, i32 16777668, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!3678 = metadata !{i32 452, i32 33, metadata !544, null}
!3679 = metadata !{i32 786689, metadata !544, metadata !"_p", metadata !473, i32 33554884, metadata !470, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!3680 = metadata !{i32 452, i32 43, metadata !544, null}
!3681 = metadata !{i32 453, i32 2, metadata !3682, null}
!3682 = metadata !{i32 786443, metadata !544, i32 452, i32 47, metadata !473, i32 42} ; [ DW_TAG_lexical_block ]
!3683 = metadata !{i32 454, i32 3, metadata !3682, null}
!3684 = metadata !{i32 456, i32 11, metadata !3682, null}
!3685 = metadata !{i32 457, i32 1, metadata !3682, null}
!3686 = metadata !{i32 786689, metadata !552, metadata !"_c", metadata !548, i32 16777320, metadata !551, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!3687 = metadata !{i32 104, i32 26, metadata !552, null}
!3688 = metadata !{i32 786689, metadata !552, metadata !"_f", metadata !548, i32 33554536, metadata !55, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!3689 = metadata !{i32 104, i32 44, metadata !552, null}
!3690 = metadata !{i32 106, i32 2, metadata !3691, null}
!3691 = metadata !{i32 786443, metadata !552, i32 105, i32 1, metadata !548, i32 44} ; [ DW_TAG_lexical_block ]

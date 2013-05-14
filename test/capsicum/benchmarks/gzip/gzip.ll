; ModuleID = 'gzip.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-freebsd9.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, i8*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64, %struct.pthread_mutex*, %struct.pthread*, i32, i32, %union.__mbstate_t }
%struct.__sbuf = type { i8*, i32 }
%struct.pthread_mutex = type opaque
%struct.pthread = type opaque
%union.__mbstate_t = type { i64, [120 x i8] }
%struct.stat = type <{ i32, i32, i16, i16, i32, i32, i32, %struct.timespec, %struct.timespec, %struct.timespec, i64, i64, i32, i32, i32, i32, %struct.timespec }>
%struct.timespec = type { i64, i64 }
%struct._RuneLocale = type { [8 x i8], [32 x i8], i32 (i8*, i64, i8**)*, i32 (i32, i8*, i64, i8**)*, i32, [256 x i64], [256 x i32], [256 x i32], %struct._RuneRange, %struct._RuneRange, %struct._RuneRange, i8*, i32 }
%struct._RuneRange = type { i32, %struct._RuneEntry* }
%struct._RuneEntry = type { i32, i32, i32, i64* }
%struct.option = type { i8*, i32, i32*, i32 }
%struct.utimbuf = type { i64, i64 }

@ascii = global i32 0, align 4
@to_stdout = global i32 0, align 4
@decompress = global i32 0, align 4
@force = global i32 0, align 4
@no_name = global i32 -1, align 4
@no_time = global i32 -1, align 4
@recursive = global i32 0, align 4
@list = global i32 0, align 4
@verbose = global i32 0, align 4
@quiet = global i32 0, align 4
@do_lzw = global i32 0, align 4
@test = global i32 0, align 4
@maxbits = global i32 16, align 4
@method = global i32 8, align 4
@level = global i32 6, align 4
@exit_code = global i32 0, align 4
@args = global i8** null, align 8
@total_in = global i64 0, align 8
@total_out = global i64 0, align 8
@remove_ofname = global i32 0, align 4
@.str = private unnamed_addr constant [6 x i8] c"ascii\00", align 1
@.str1 = private unnamed_addr constant [10 x i8] c"to-stdout\00", align 1
@.str2 = private unnamed_addr constant [7 x i8] c"stdout\00", align 1
@.str3 = private unnamed_addr constant [11 x i8] c"decompress\00", align 1
@.str4 = private unnamed_addr constant [11 x i8] c"uncompress\00", align 1
@.str5 = private unnamed_addr constant [6 x i8] c"force\00", align 1
@.str6 = private unnamed_addr constant [5 x i8] c"help\00", align 1
@.str7 = private unnamed_addr constant [5 x i8] c"list\00", align 1
@.str8 = private unnamed_addr constant [8 x i8] c"license\00", align 1
@.str9 = private unnamed_addr constant [8 x i8] c"no-name\00", align 1
@.str10 = private unnamed_addr constant [5 x i8] c"name\00", align 1
@.str11 = private unnamed_addr constant [6 x i8] c"quiet\00", align 1
@.str12 = private unnamed_addr constant [7 x i8] c"silent\00", align 1
@.str13 = private unnamed_addr constant [10 x i8] c"recursive\00", align 1
@.str14 = private unnamed_addr constant [7 x i8] c"suffix\00", align 1
@.str15 = private unnamed_addr constant [5 x i8] c"test\00", align 1
@.str16 = private unnamed_addr constant [8 x i8] c"no-time\00", align 1
@.str17 = private unnamed_addr constant [8 x i8] c"verbose\00", align 1
@.str18 = private unnamed_addr constant [8 x i8] c"version\00", align 1
@.str19 = private unnamed_addr constant [5 x i8] c"fast\00", align 1
@.str20 = private unnamed_addr constant [5 x i8] c"best\00", align 1
@.str21 = private unnamed_addr constant [4 x i8] c"lzw\00", align 1
@.str22 = private unnamed_addr constant [5 x i8] c"bits\00", align 1
@longopts = global <{ { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] } }> <{ { i8*, i32, i32*, i32, [4 x i8] } { i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 0, i32* null, i32 97, [4 x i8] undef }, { i8*, i32, i32*, i32, [4 x i8] } { i8* getelementptr inbounds ([10 x i8]* @.str1, i32 0, i32 0), i32 0, i32* null, i32 99, [4 x i8] undef }, { i8*, i32, i32*, i32, [4 x i8] } { i8* getelementptr inbounds ([7 x i8]* @.str2, i32 0, i32 0), i32 0, i32* null, i32 99, [4 x i8] undef }, { i8*, i32, i32*, i32, [4 x i8] } { i8* getelementptr inbounds ([11 x i8]* @.str3, i32 0, i32 0), i32 0, i32* null, i32 100, [4 x i8] undef }, { i8*, i32, i32*, i32, [4 x i8] } { i8* getelementptr inbounds ([11 x i8]* @.str4, i32 0, i32 0), i32 0, i32* null, i32 100, [4 x i8] undef }, { i8*, i32, i32*, i32, [4 x i8] } { i8* getelementptr inbounds ([6 x i8]* @.str5, i32 0, i32 0), i32 0, i32* null, i32 102, [4 x i8] undef }, { i8*, i32, i32*, i32, [4 x i8] } { i8* getelementptr inbounds ([5 x i8]* @.str6, i32 0, i32 0), i32 0, i32* null, i32 104, [4 x i8] undef }, { i8*, i32, i32*, i32, [4 x i8] } { i8* getelementptr inbounds ([5 x i8]* @.str7, i32 0, i32 0), i32 0, i32* null, i32 108, [4 x i8] undef }, { i8*, i32, i32*, i32, [4 x i8] } { i8* getelementptr inbounds ([8 x i8]* @.str8, i32 0, i32 0), i32 0, i32* null, i32 76, [4 x i8] undef }, { i8*, i32, i32*, i32, [4 x i8] } { i8* getelementptr inbounds ([8 x i8]* @.str9, i32 0, i32 0), i32 0, i32* null, i32 110, [4 x i8] undef }, { i8*, i32, i32*, i32, [4 x i8] } { i8* getelementptr inbounds ([5 x i8]* @.str10, i32 0, i32 0), i32 0, i32* null, i32 78, [4 x i8] undef }, { i8*, i32, i32*, i32, [4 x i8] } { i8* getelementptr inbounds ([6 x i8]* @.str11, i32 0, i32 0), i32 0, i32* null, i32 113, [4 x i8] undef }, { i8*, i32, i32*, i32, [4 x i8] } { i8* getelementptr inbounds ([7 x i8]* @.str12, i32 0, i32 0), i32 0, i32* null, i32 113, [4 x i8] undef }, { i8*, i32, i32*, i32, [4 x i8] } { i8* getelementptr inbounds ([10 x i8]* @.str13, i32 0, i32 0), i32 0, i32* null, i32 114, [4 x i8] undef }, { i8*, i32, i32*, i32, [4 x i8] } { i8* getelementptr inbounds ([7 x i8]* @.str14, i32 0, i32 0), i32 1, i32* null, i32 83, [4 x i8] undef }, { i8*, i32, i32*, i32, [4 x i8] } { i8* getelementptr inbounds ([5 x i8]* @.str15, i32 0, i32 0), i32 0, i32* null, i32 116, [4 x i8] undef }, { i8*, i32, i32*, i32, [4 x i8] } { i8* getelementptr inbounds ([8 x i8]* @.str16, i32 0, i32 0), i32 0, i32* null, i32 84, [4 x i8] undef }, { i8*, i32, i32*, i32, [4 x i8] } { i8* getelementptr inbounds ([8 x i8]* @.str17, i32 0, i32 0), i32 0, i32* null, i32 118, [4 x i8] undef }, { i8*, i32, i32*, i32, [4 x i8] } { i8* getelementptr inbounds ([8 x i8]* @.str18, i32 0, i32 0), i32 0, i32* null, i32 86, [4 x i8] undef }, { i8*, i32, i32*, i32, [4 x i8] } { i8* getelementptr inbounds ([5 x i8]* @.str19, i32 0, i32 0), i32 0, i32* null, i32 49, [4 x i8] undef }, { i8*, i32, i32*, i32, [4 x i8] } { i8* getelementptr inbounds ([5 x i8]* @.str20, i32 0, i32 0), i32 0, i32* null, i32 57, [4 x i8] undef }, { i8*, i32, i32*, i32, [4 x i8] } { i8* getelementptr inbounds ([4 x i8]* @.str21, i32 0, i32 0), i32 0, i32* null, i32 90, [4 x i8] undef }, { i8*, i32, i32*, i32, [4 x i8] } { i8* getelementptr inbounds ([5 x i8]* @.str22, i32 0, i32 0), i32 1, i32* null, i32 98, [4 x i8] undef }, { i8*, i32, i32*, i32, [4 x i8] } { i8* null, i32 0, i32* null, i32 0, [4 x i8] undef } }>, align 16
@work = global i32 (i32, i32)* @zip, align 8
@progname = common global i8* null, align 8
@.str23 = private unnamed_addr constant [5 x i8] c".exe\00", align 1
@.str24 = private unnamed_addr constant [5 x i8] c"GZIP\00", align 1
@env = common global i8* null, align 8
@foreground = common global i32 0, align 4
@.str25 = private unnamed_addr constant [3 x i8] c"un\00", align 1
@.str26 = private unnamed_addr constant [4 x i8] c"gun\00", align 1
@.str27 = private unnamed_addr constant [4 x i8] c"cat\00", align 1
@.str28 = private unnamed_addr constant [6 x i8] c"gzcat\00", align 1
@z_suffix = common global [31 x i8] zeroinitializer, align 16
@.str29 = private unnamed_addr constant [4 x i8] c".gz\00", align 1
@z_len = common global i32 0, align 4
@.str30 = private unnamed_addr constant [33 x i8] c"ab:cdfhH?lLmMnNqrS:tvVZ123456789\00", align 1
@optarg = external global i8*
@__stderrp = external global %struct.__sFILE*
@.str31 = private unnamed_addr constant [37 x i8] c"%s: -r not supported on this system\0A\00", align 1
@.str32 = private unnamed_addr constant [38 x i8] c"%s: -Z not supported in this version\0A\00", align 1
@optind = external global i32
@.str33 = private unnamed_addr constant [43 x i8] c"%s: option --ascii ignored on this system\0A\00", align 1
@.str34 = private unnamed_addr constant [27 x i8] c"%s: incorrect suffix '%s'\0A\00", align 1
@.str35 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@istat = common global %struct.stat zeroinitializer, align 8
@.str36 = private unnamed_addr constant [34 x i8] c"%s: %s is a directory -- ignored\0A\00", align 1
@ifname = common global [1024 x i8] zeroinitializer, align 16
@.str37 = private unnamed_addr constant [55 x i8] c"%s: %s is not a directory or a regular file - ignored\0A\00", align 1
@.str38 = private unnamed_addr constant [41 x i8] c"%s: %s has %d other link%c -- unchanged\0A\00", align 1
@ifile_size = common global i64 0, align 8
@time_stamp = common global i64 0, align 8
@ofname = common global [1024 x i8] zeroinitializer, align 16
@ifd = common global i32 0, align 4
@.str39 = private unnamed_addr constant [5 x i8] c"%s: \00", align 1
@part_nb = common global i32 0, align 4
@__isthreaded = external global i32
@__stdoutp = external global %struct.__sFILE*
@ofd = common global i32 0, align 4
@save_orig_name = common global i32 0, align 4
@.str40 = private unnamed_addr constant [25 x i8] c"%s: %s compressed to %s\0A\00", align 1
@.str41 = private unnamed_addr constant [7 x i8] c"%s:\09%s\00", align 1
@.str42 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str43 = private unnamed_addr constant [2 x i8] c"\09\00", align 1
@.str44 = private unnamed_addr constant [3 x i8] c"\09\09\00", align 1
@last_member = common global i32 0, align 4
@inptr = common global i32 0, align 4
@insize = common global i32 0, align 4
@bytes_out = common global i64 0, align 8
@.str45 = private unnamed_addr constant [4 x i8] c" OK\00", align 1
@bytes_in = common global i64 0, align 8
@.str46 = private unnamed_addr constant [21 x i8] c" -- replaced with %s\00", align 1
@.str47 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@inbuf = common global [32832 x i8] zeroinitializer, align 16
@outbuf = common global [18432 x i8] zeroinitializer, align 16
@d_buf = common global [32768 x i16] zeroinitializer, align 16
@window = common global [65536 x i8] zeroinitializer, align 16
@prev = common global [65536 x i16] zeroinitializer, align 16
@outcnt = common global i32 0, align 4
@do_exit.in_exit = internal global i32 0, align 4
@.str48 = private unnamed_addr constant [25 x i8] c"%s: time stamp restored\0A\00", align 1
@do_list.first_time = internal global i32 1, align 4
@do_list.methods = internal global [9 x i8*] [i8* getelementptr inbounds ([6 x i8]* @.str49, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8]* @.str50, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8]* @.str51, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8]* @.str52, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str42, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str42, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str42, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str42, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8]* @.str53, i32 0, i32 0)], align 16
@.str49 = private unnamed_addr constant [6 x i8] c"store\00", align 1
@.str50 = private unnamed_addr constant [6 x i8] c"compr\00", align 1
@.str51 = private unnamed_addr constant [6 x i8] c"pack \00", align 1
@.str52 = private unnamed_addr constant [6 x i8] c"lzh  \00", align 1
@.str53 = private unnamed_addr constant [6 x i8] c"defla\00", align 1
@.str54 = private unnamed_addr constant [29 x i8] c"method  crc     date  time  \00", align 1
@.str55 = private unnamed_addr constant [46 x i8] c"compressed  uncompr. ratio uncompressed_name\0A\00", align 1
@.str56 = private unnamed_addr constant [39 x i8] c"                            %9lu %9lu \00", align 1
@.str57 = private unnamed_addr constant [11 x i8] c"%9ld %9ld \00", align 1
@.str58 = private unnamed_addr constant [11 x i8] c" (totals)\0A\00", align 1
@.str59 = private unnamed_addr constant [16 x i8] c"%5s %08lx %11s \00", align 1
@.str60 = private unnamed_addr constant [5 x i8] c" %s\0A\00", align 1
@.str61 = private unnamed_addr constant [3 x i8] c"\1F\8B\00", align 1
@.str62 = private unnamed_addr constant [3 x i8] c"\1F\9E\00", align 1
@.str63 = private unnamed_addr constant [56 x i8] c"%s: %s: unknown method %d -- get newer version of gzip\0A\00", align 1
@.str64 = private unnamed_addr constant [50 x i8] c"%s: %s is encrypted -- get newer version of gzip\0A\00", align 1
@.str65 = private unnamed_addr constant [65 x i8] c"%s: %s is a a multi-part gzip file -- get newer version of gzip\0A\00", align 1
@.str66 = private unnamed_addr constant [52 x i8] c"%s: %s has flags 0x%x -- get newer version of gzip\0A\00", align 1
@.str67 = private unnamed_addr constant [24 x i8] c"%s: %s: part number %u\0A\00", align 1
@.str68 = private unnamed_addr constant [41 x i8] c"%s: %s: extra field of %u bytes ignored\0A\00", align 1
@.str69 = private unnamed_addr constant [39 x i8] c"corrupted input -- file name too large\00", align 1
@.str70 = private unnamed_addr constant [5 x i8] c"PK\03\04\00", align 1
@.str71 = private unnamed_addr constant [3 x i8] c"\1F\1E\00", align 1
@.str72 = private unnamed_addr constant [3 x i8] c"\1F\9D\00", align 1
@.str73 = private unnamed_addr constant [3 x i8] c"\1F\A0\00", align 1
@.str74 = private unnamed_addr constant [29 x i8] c"\0A%s: %s: not in gzip format\0A\00", align 1
@.str75 = private unnamed_addr constant [53 x i8] c"\0A%s: %s: decompression OK, trailing garbage ignored\0A\00", align 1
@.str76 = private unnamed_addr constant [35 x i8] c"%s: %s: unknown suffix -- ignored\0A\00", align 1
@.str77 = private unnamed_addr constant [5 x i8] c".tgz\00", align 1
@.str78 = private unnamed_addr constant [5 x i8] c".taz\00", align 1
@.str79 = private unnamed_addr constant [5 x i8] c".tar\00", align 1
@.str80 = private unnamed_addr constant [43 x i8] c"%s: %s already has %s suffix -- unchanged\0A\00", align 1
@get_suffix.known_suffixes = internal global [9 x i8*] [i8* getelementptr inbounds ([31 x i8]* @z_suffix, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str29, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str81, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str78, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str77, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str82, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str83, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str84, i32 0, i32 0), i8* null], align 16
@.str81 = private unnamed_addr constant [3 x i8] c".z\00", align 1
@.str82 = private unnamed_addr constant [4 x i8] c"-gz\00", align 1
@.str83 = private unnamed_addr constant [3 x i8] c"-z\00", align 1
@.str84 = private unnamed_addr constant [3 x i8] c"_z\00", align 1
@.str85 = private unnamed_addr constant [2 x i8] c"z\00", align 1
@get_istat.suffixes = internal global [6 x i8*] [i8* getelementptr inbounds ([31 x i8]* @z_suffix, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str29, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str81, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str83, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str86, i32 0, i32 0), i8* null], align 16
@.str86 = private unnamed_addr constant [3 x i8] c".Z\00", align 1
@.str87 = private unnamed_addr constant [33 x i8] c"%s: %s: warning, name truncated\0A\00", align 1
@.str88 = private unnamed_addr constant [15 x i8] c"name too short\00", align 1
@.str89 = private unnamed_addr constant [22 x i8] c"can't recover suffix\0A\00", align 1
@.str90 = private unnamed_addr constant [2 x i8] c".\00", align 1
@.str91 = private unnamed_addr constant [31 x i8] c"internal error in shorten_name\00", align 1
@.str92 = private unnamed_addr constant [39 x i8] c"%s: %s: cannot %scompress onto itself\0A\00", align 1
@.str93 = private unnamed_addr constant [3 x i8] c"de\00", align 1
@.str94 = private unnamed_addr constant [33 x i8] c"%s: %s and %s are the same file\0A\00", align 1
@.str95 = private unnamed_addr constant [2 x i8] c"n\00", align 1
@.str96 = private unnamed_addr constant [23 x i8] c"%s: %s already exists;\00", align 1
@__stdinp = external global %struct.__sFILE*
@.str97 = private unnamed_addr constant [37 x i8] c" do you wish to overwrite (y or n)? \00", align 1
@.str98 = private unnamed_addr constant [18 x i8] c"\09not overwritten\0A\00", align 1
@__mb_sb_limit = external global i32
@_CurrentRuneLocale = external global %struct._RuneLocale*
@.str99 = private unnamed_addr constant [71 x i8] c"%s: compressed data not %s a terminal. Use -f to force %scompression.\0A\00", align 1
@.str100 = private unnamed_addr constant [10 x i8] c"read from\00", align 1
@.str101 = private unnamed_addr constant [11 x i8] c"written to\00", align 1
@.str102 = private unnamed_addr constant [23 x i8] c"For help, type: %s -h\0A\00", align 1
@.str103 = private unnamed_addr constant [6 x i8] c"stdin\00", align 1
@.str104 = private unnamed_addr constant [13 x i8] c"fstat(stdin)\00", align 1
@.str105 = private unnamed_addr constant [5 x i8] c" OK\0A\00", align 1
@.str106 = private unnamed_addr constant [12 x i8] c"%s %s (%s)\0A\00", align 1
@.str107 = private unnamed_addr constant [6 x i8] c"1.2.4\00", align 1
@.str108 = private unnamed_addr constant [10 x i8] c"18 Aug 93\00", align 1
@.str109 = private unnamed_addr constant [28 x i8] c"Compilation options:\0A%s %s \00", align 1
@.str110 = private unnamed_addr constant [7 x i8] c"NO_DIR\00", align 1
@.str111 = private unnamed_addr constant [6 x i8] c"UTIME\00", align 1
@.str112 = private unnamed_addr constant [15 x i8] c"HAVE_UNISTD_H \00", align 1
@.str113 = private unnamed_addr constant [55 x i8] c"usage: %s [-%scdfhlLnN%stvV19] [-S suffix] [file ...]\0A\00", align 1
@license_msg = internal global [15 x i8*] [i8* getelementptr inbounds ([44 x i8]* @.str115, i32 0, i32 0), i8* getelementptr inbounds ([72 x i8]* @.str116, i32 0, i32 0), i8* getelementptr inbounds ([72 x i8]* @.str117, i32 0, i32 0), i8* getelementptr inbounds ([71 x i8]* @.str118, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8]* @.str119, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str42, i32 0, i32 0), i8* getelementptr inbounds ([67 x i8]* @.str120, i32 0, i32 0), i8* getelementptr inbounds ([66 x i8]* @.str121, i32 0, i32 0), i8* getelementptr inbounds ([65 x i8]* @.str122, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8]* @.str123, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str42, i32 0, i32 0), i8* getelementptr inbounds ([69 x i8]* @.str124, i32 0, i32 0), i8* getelementptr inbounds ([63 x i8]* @.str125, i32 0, i32 0), i8* getelementptr inbounds ([61 x i8]* @.str126, i32 0, i32 0), i8* null], align 16
@.str114 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str115 = private unnamed_addr constant [44 x i8] c"   Copyright (C) 1992-1993 Jean-loup Gailly\00", align 1
@.str116 = private unnamed_addr constant [72 x i8] c"   This program is free software; you can redistribute it and/or modify\00", align 1
@.str117 = private unnamed_addr constant [72 x i8] c"   it under the terms of the GNU General Public License as published by\00", align 1
@.str118 = private unnamed_addr constant [71 x i8] c"   the Free Software Foundation; either version 2, or (at your option)\00", align 1
@.str119 = private unnamed_addr constant [22 x i8] c"   any later version.\00", align 1
@.str120 = private unnamed_addr constant [67 x i8] c"   This program is distributed in the hope that it will be useful,\00", align 1
@.str121 = private unnamed_addr constant [66 x i8] c"   but WITHOUT ANY WARRANTY; without even the implied warranty of\00", align 1
@.str122 = private unnamed_addr constant [65 x i8] c"   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\00", align 1
@.str123 = private unnamed_addr constant [48 x i8] c"   GNU General Public License for more details.\00", align 1
@.str124 = private unnamed_addr constant [69 x i8] c"   You should have received a copy of the GNU General Public License\00", align 1
@.str125 = private unnamed_addr constant [63 x i8] c"   along with this program; if not, write to the Free Software\00", align 1
@.str126 = private unnamed_addr constant [61 x i8] c"   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.\00", align 1
@help.help_msg = internal global [17 x i8*] [i8* getelementptr inbounds ([74 x i8]* @.str127, i32 0, i32 0), i8* getelementptr inbounds ([29 x i8]* @.str128, i32 0, i32 0), i8* getelementptr inbounds ([68 x i8]* @.str129, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8]* @.str130, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8]* @.str131, i32 0, i32 0), i8* getelementptr inbounds ([43 x i8]* @.str132, i32 0, i32 0), i8* getelementptr inbounds ([74 x i8]* @.str133, i32 0, i32 0), i8* getelementptr inbounds ([67 x i8]* @.str134, i32 0, i32 0), i8* getelementptr inbounds ([40 x i8]* @.str135, i32 0, i32 0), i8* getelementptr inbounds ([64 x i8]* @.str136, i32 0, i32 0), i8* getelementptr inbounds ([49 x i8]* @.str137, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8]* @.str138, i32 0, i32 0), i8* getelementptr inbounds ([41 x i8]* @.str139, i32 0, i32 0), i8* getelementptr inbounds ([34 x i8]* @.str140, i32 0, i32 0), i8* getelementptr inbounds ([34 x i8]* @.str141, i32 0, i32 0), i8* getelementptr inbounds ([76 x i8]* @.str142, i32 0, i32 0), i8* null], align 16
@.str127 = private unnamed_addr constant [74 x i8] c" -c --stdout      write on standard output, keep original files unchanged\00", align 1
@.str128 = private unnamed_addr constant [29 x i8] c" -d --decompress  decompress\00", align 1
@.str129 = private unnamed_addr constant [68 x i8] c" -f --force       force overwrite of output file and compress links\00", align 1
@.str130 = private unnamed_addr constant [33 x i8] c" -h --help        give this help\00", align 1
@.str131 = private unnamed_addr constant [48 x i8] c" -l --list        list compressed file contents\00", align 1
@.str132 = private unnamed_addr constant [43 x i8] c" -L --license     display software license\00", align 1
@.str133 = private unnamed_addr constant [74 x i8] c" -n --no-name     do not save or restore the original name and time stamp\00", align 1
@.str134 = private unnamed_addr constant [67 x i8] c" -N --name        save or restore the original name and time stamp\00", align 1
@.str135 = private unnamed_addr constant [40 x i8] c" -q --quiet       suppress all warnings\00", align 1
@.str136 = private unnamed_addr constant [64 x i8] c" -S .suf  --suffix .suf     use suffix .suf on compressed files\00", align 1
@.str137 = private unnamed_addr constant [49 x i8] c" -t --test        test compressed file integrity\00", align 1
@.str138 = private unnamed_addr constant [31 x i8] c" -v --verbose     verbose mode\00", align 1
@.str139 = private unnamed_addr constant [41 x i8] c" -V --version     display version number\00", align 1
@.str140 = private unnamed_addr constant [34 x i8] c" -1 --fast        compress faster\00", align 1
@.str141 = private unnamed_addr constant [34 x i8] c" -9 --best        compress better\00", align 1
@.str142 = private unnamed_addr constant [76 x i8] c" file...          files to (de)compress. If none given, use standard input.\00", align 1
@.str143 = private unnamed_addr constant [14 x i8] c"/tmp/dump.txt\00", align 1
@.str1144 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str2145 = private unnamed_addr constant [3 x i8] c"\1F\8B\00", align 1
@crc = internal global i64 0, align 8
@header_bytes = common global i64 0, align 8

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %file_count = alloca i32, align 4
  %proglen = alloca i32, align 4
  %optc = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !240), !dbg !241
  store i8** %argv, i8*** %3, align 8
  call void @llvm.dbg.declare(metadata !{i8*** %3}, metadata !242), !dbg !243
  call void @llvm.dbg.declare(metadata !{i32* %file_count}, metadata !244), !dbg !246
  call void @llvm.dbg.declare(metadata !{i32* %proglen}, metadata !247), !dbg !248
  call void @llvm.dbg.declare(metadata !{i32* %optc}, metadata !249), !dbg !250
  %4 = load i8*** %3, align 8, !dbg !251
  %5 = getelementptr inbounds i8** %4, i64 0, !dbg !251
  %6 = load i8** %5, align 8, !dbg !251
  %7 = call i8* @basename(i8* %6), !dbg !251
  store i8* %7, i8** @progname, align 8, !dbg !251
  %8 = load i8** @progname, align 8, !dbg !252
  %9 = call i64 @strlen(i8* %8) nounwind readonly, !dbg !252
  %10 = trunc i64 %9 to i32, !dbg !252
  store i32 %10, i32* %proglen, align 4, !dbg !252
  %11 = load i32* %proglen, align 4, !dbg !253
  %12 = icmp sgt i32 %11, 4, !dbg !253
  br i1 %12, label %13, label %27, !dbg !253

; <label>:13                                      ; preds = %0
  %14 = load i8** @progname, align 8, !dbg !254
  %15 = load i32* %proglen, align 4, !dbg !254
  %16 = sext i32 %15 to i64, !dbg !254
  %17 = getelementptr inbounds i8* %14, i64 %16, !dbg !254
  %18 = getelementptr inbounds i8* %17, i64 -4, !dbg !254
  %19 = call i32 @strcmp(i8* %18, i8* getelementptr inbounds ([5 x i8]* @.str23, i32 0, i32 0)) nounwind readonly, !dbg !254
  %20 = icmp eq i32 %19, 0, !dbg !254
  br i1 %20, label %21, label %27, !dbg !254

; <label>:21                                      ; preds = %13
  %22 = load i32* %proglen, align 4, !dbg !255
  %23 = sub nsw i32 %22, 4, !dbg !255
  %24 = sext i32 %23 to i64, !dbg !255
  %25 = load i8** @progname, align 8, !dbg !255
  %26 = getelementptr inbounds i8* %25, i64 %24, !dbg !255
  store i8 0, i8* %26, align 1, !dbg !255
  br label %27, !dbg !257

; <label>:27                                      ; preds = %21, %13, %0
  %28 = call i8* @add_envopt(i32* %2, i8*** %3, i8* getelementptr inbounds ([5 x i8]* @.str24, i32 0, i32 0)), !dbg !258
  store i8* %28, i8** @env, align 8, !dbg !258
  %29 = load i8** @env, align 8, !dbg !259
  %30 = icmp ne i8* %29, null, !dbg !259
  br i1 %30, label %31, label %33, !dbg !259

; <label>:31                                      ; preds = %27
  %32 = load i8*** %3, align 8, !dbg !260
  store i8** %32, i8*** @args, align 8, !dbg !260
  br label %33, !dbg !260

; <label>:33                                      ; preds = %31, %27
  %34 = call void (i32)* (i32, void (i32)*)* @signal(i32 2, void (i32)* inttoptr (i64 1 to void (i32)*)), !dbg !261
  %35 = icmp ne void (i32)* %34, inttoptr (i64 1 to void (i32)*), !dbg !261
  %36 = zext i1 %35 to i32, !dbg !261
  store i32 %36, i32* @foreground, align 4, !dbg !261
  %37 = load i32* @foreground, align 4, !dbg !262
  %38 = icmp ne i32 %37, 0, !dbg !262
  br i1 %38, label %39, label %41, !dbg !262

; <label>:39                                      ; preds = %33
  %40 = call void (i32)* (i32, void (i32)*)* @signal(i32 2, void (i32)* bitcast (i32 ()* @abort_gzip to void (i32)*)), !dbg !263
  br label %41, !dbg !265

; <label>:41                                      ; preds = %39, %33
  %42 = call void (i32)* (i32, void (i32)*)* @signal(i32 15, void (i32)* inttoptr (i64 1 to void (i32)*)), !dbg !266
  %43 = icmp ne void (i32)* %42, inttoptr (i64 1 to void (i32)*), !dbg !266
  br i1 %43, label %44, label %46, !dbg !266

; <label>:44                                      ; preds = %41
  %45 = call void (i32)* (i32, void (i32)*)* @signal(i32 15, void (i32)* bitcast (i32 ()* @abort_gzip to void (i32)*)), !dbg !267
  br label %46, !dbg !269

; <label>:46                                      ; preds = %44, %41
  %47 = call void (i32)* (i32, void (i32)*)* @signal(i32 1, void (i32)* inttoptr (i64 1 to void (i32)*)), !dbg !270
  %48 = icmp ne void (i32)* %47, inttoptr (i64 1 to void (i32)*), !dbg !270
  br i1 %48, label %49, label %51, !dbg !270

; <label>:49                                      ; preds = %46
  %50 = call void (i32)* (i32, void (i32)*)* @signal(i32 1, void (i32)* bitcast (i32 ()* @abort_gzip to void (i32)*)), !dbg !271
  br label %51, !dbg !273

; <label>:51                                      ; preds = %49, %46
  %52 = load i8** @progname, align 8, !dbg !274
  %53 = call i32 @strncmp(i8* %52, i8* getelementptr inbounds ([3 x i8]* @.str25, i32 0, i32 0), i64 2) nounwind readonly, !dbg !274
  %54 = icmp eq i32 %53, 0, !dbg !274
  br i1 %54, label %59, label %55, !dbg !274

; <label>:55                                      ; preds = %51
  %56 = load i8** @progname, align 8, !dbg !275
  %57 = call i32 @strncmp(i8* %56, i8* getelementptr inbounds ([4 x i8]* @.str26, i32 0, i32 0), i64 3) nounwind readonly, !dbg !275
  %58 = icmp eq i32 %57, 0, !dbg !275
  br i1 %58, label %59, label %60, !dbg !275

; <label>:59                                      ; preds = %55, %51
  store i32 1, i32* @decompress, align 4, !dbg !276
  br label %71, !dbg !278

; <label>:60                                      ; preds = %55
  %61 = load i8** @progname, align 8, !dbg !279
  %62 = getelementptr inbounds i8* %61, i64 1, !dbg !279
  %63 = call i32 @strcmp(i8* %62, i8* getelementptr inbounds ([4 x i8]* @.str27, i32 0, i32 0)) nounwind readonly, !dbg !279
  %64 = icmp eq i32 %63, 0, !dbg !279
  br i1 %64, label %69, label %65, !dbg !279

; <label>:65                                      ; preds = %60
  %66 = load i8** @progname, align 8, !dbg !280
  %67 = call i32 @strcmp(i8* %66, i8* getelementptr inbounds ([6 x i8]* @.str28, i32 0, i32 0)) nounwind readonly, !dbg !280
  %68 = icmp eq i32 %67, 0, !dbg !280
  br i1 %68, label %69, label %70, !dbg !280

; <label>:69                                      ; preds = %65, %60
  store i32 1, i32* @to_stdout, align 4, !dbg !281
  store i32 1, i32* @decompress, align 4, !dbg !281
  br label %70, !dbg !283

; <label>:70                                      ; preds = %69, %65
  br label %71

; <label>:71                                      ; preds = %70, %59
  %72 = call i8* @strncpy(i8* getelementptr inbounds ([31 x i8]* @z_suffix, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str29, i32 0, i32 0), i64 30), !dbg !284
  %73 = call i64 @strlen(i8* getelementptr inbounds ([31 x i8]* @z_suffix, i32 0, i32 0)) nounwind readonly, !dbg !285
  %74 = trunc i64 %73 to i32, !dbg !285
  store i32 %74, i32* @z_len, align 4, !dbg !285
  br label %75, !dbg !286

; <label>:75                                      ; preds = %122, %71
  %76 = load i32* %2, align 4, !dbg !287
  %77 = load i8*** %3, align 8, !dbg !287
  %78 = call i32 @getopt_long(i32 %76, i8** %77, i8* getelementptr inbounds ([33 x i8]* @.str30, i32 0, i32 0), %struct.option* getelementptr inbounds ([24 x %struct.option]* bitcast (<{ { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] } }>* @longopts to [24 x %struct.option]*), i32 0, i32 0), i32* null), !dbg !287
  store i32 %78, i32* %optc, align 4, !dbg !287
  %79 = icmp ne i32 %78, -1, !dbg !287
  br i1 %79, label %80, label %123, !dbg !287

; <label>:80                                      ; preds = %75
  %81 = load i32* %optc, align 4, !dbg !288
  switch i32 %81, label %121 [
    i32 97, label %82
    i32 98, label %83
    i32 99, label %86
    i32 100, label %87
    i32 102, label %88
    i32 104, label %91
    i32 72, label %91
    i32 63, label %91
    i32 108, label %92
    i32 76, label %93
    i32 109, label %94
    i32 77, label %95
    i32 110, label %96
    i32 78, label %97
    i32 113, label %98
    i32 114, label %99
    i32 83, label %103
    i32 116, label %109
    i32 118, label %110
    i32 86, label %113
    i32 90, label %114
    i32 49, label %118
    i32 50, label %118
    i32 51, label %118
    i32 52, label %118
    i32 53, label %118
    i32 54, label %118
    i32 55, label %118
    i32 56, label %118
    i32 57, label %118
  ], !dbg !288

; <label>:82                                      ; preds = %80
  store i32 1, i32* @ascii, align 4, !dbg !290
  br label %122, !dbg !292

; <label>:83                                      ; preds = %80
  %84 = load i8** @optarg, align 8, !dbg !293
  %85 = call i32 @atoi(i8* %84), !dbg !293
  store i32 %85, i32* @maxbits, align 4, !dbg !293
  br label %122, !dbg !294

; <label>:86                                      ; preds = %80
  store i32 1, i32* @to_stdout, align 4, !dbg !295
  br label %122, !dbg !296

; <label>:87                                      ; preds = %80
  store i32 1, i32* @decompress, align 4, !dbg !297
  br label %122, !dbg !298

; <label>:88                                      ; preds = %80
  %89 = load i32* @force, align 4, !dbg !299
  %90 = add nsw i32 %89, 1, !dbg !299
  store i32 %90, i32* @force, align 4, !dbg !299
  br label %122, !dbg !300

; <label>:91                                      ; preds = %80, %80, %80
  call void @help(), !dbg !301
  call void @do_exit(i32 0), !dbg !302
  br label %122, !dbg !303

; <label>:92                                      ; preds = %80
  store i32 1, i32* @to_stdout, align 4, !dbg !304
  store i32 1, i32* @decompress, align 4, !dbg !304
  store i32 1, i32* @list, align 4, !dbg !304
  br label %122, !dbg !305

; <label>:93                                      ; preds = %80
  call void @license(), !dbg !306
  call void @do_exit(i32 0), !dbg !307
  br label %122, !dbg !308

; <label>:94                                      ; preds = %80
  store i32 1, i32* @no_time, align 4, !dbg !309
  br label %122, !dbg !310

; <label>:95                                      ; preds = %80
  store i32 0, i32* @no_time, align 4, !dbg !311
  br label %122, !dbg !312

; <label>:96                                      ; preds = %80
  store i32 1, i32* @no_time, align 4, !dbg !313
  store i32 1, i32* @no_name, align 4, !dbg !313
  br label %122, !dbg !314

; <label>:97                                      ; preds = %80
  store i32 0, i32* @no_time, align 4, !dbg !315
  store i32 0, i32* @no_name, align 4, !dbg !315
  br label %122, !dbg !316

; <label>:98                                      ; preds = %80
  store i32 1, i32* @quiet, align 4, !dbg !317
  store i32 0, i32* @verbose, align 4, !dbg !318
  br label %122, !dbg !319

; <label>:99                                      ; preds = %80
  %100 = load %struct.__sFILE** @__stderrp, align 8, !dbg !320
  %101 = load i8** @progname, align 8, !dbg !320
  %102 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %100, i8* getelementptr inbounds ([37 x i8]* @.str31, i32 0, i32 0), i8* %101), !dbg !320
  call void @usage(), !dbg !321
  call void @do_exit(i32 1), !dbg !322
  br label %122, !dbg !323

; <label>:103                                     ; preds = %80
  %104 = load i8** @optarg, align 8, !dbg !324
  %105 = call i64 @strlen(i8* %104) nounwind readonly, !dbg !324
  %106 = trunc i64 %105 to i32, !dbg !324
  store i32 %106, i32* @z_len, align 4, !dbg !324
  %107 = load i8** @optarg, align 8, !dbg !325
  %108 = call i8* @strcpy(i8* getelementptr inbounds ([31 x i8]* @z_suffix, i32 0, i32 0), i8* %107), !dbg !325
  br label %122, !dbg !326

; <label>:109                                     ; preds = %80
  store i32 1, i32* @to_stdout, align 4, !dbg !327
  store i32 1, i32* @decompress, align 4, !dbg !327
  store i32 1, i32* @test, align 4, !dbg !327
  br label %122, !dbg !328

; <label>:110                                     ; preds = %80
  %111 = load i32* @verbose, align 4, !dbg !329
  %112 = add nsw i32 %111, 1, !dbg !329
  store i32 %112, i32* @verbose, align 4, !dbg !329
  store i32 0, i32* @quiet, align 4, !dbg !330
  br label %122, !dbg !331

; <label>:113                                     ; preds = %80
  call void @version(), !dbg !332
  call void @do_exit(i32 0), !dbg !333
  br label %122, !dbg !334

; <label>:114                                     ; preds = %80
  %115 = load %struct.__sFILE** @__stderrp, align 8, !dbg !335
  %116 = load i8** @progname, align 8, !dbg !335
  %117 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %115, i8* getelementptr inbounds ([38 x i8]* @.str32, i32 0, i32 0), i8* %116), !dbg !335
  call void @usage(), !dbg !336
  call void @do_exit(i32 1), !dbg !337
  br label %122, !dbg !338

; <label>:118                                     ; preds = %80, %80, %80, %80, %80, %80, %80, %80, %80
  %119 = load i32* %optc, align 4, !dbg !339
  %120 = sub nsw i32 %119, 48, !dbg !339
  store i32 %120, i32* @level, align 4, !dbg !339
  br label %122, !dbg !340

; <label>:121                                     ; preds = %80
  call void @usage(), !dbg !341
  call void @do_exit(i32 1), !dbg !342
  br label %122, !dbg !343

; <label>:122                                     ; preds = %121, %118, %114, %113, %110, %109, %103, %99, %98, %97, %96, %95, %94, %93, %92, %91, %88, %87, %86, %83, %82
  br label %75, !dbg !344

; <label>:123                                     ; preds = %75
  %124 = load i32* @no_time, align 4, !dbg !345
  %125 = icmp slt i32 %124, 0, !dbg !345
  br i1 %125, label %126, label %128, !dbg !345

; <label>:126                                     ; preds = %123
  %127 = load i32* @decompress, align 4, !dbg !346
  store i32 %127, i32* @no_time, align 4, !dbg !346
  br label %128, !dbg !346

; <label>:128                                     ; preds = %126, %123
  %129 = load i32* @no_name, align 4, !dbg !347
  %130 = icmp slt i32 %129, 0, !dbg !347
  br i1 %130, label %131, label %133, !dbg !347

; <label>:131                                     ; preds = %128
  %132 = load i32* @decompress, align 4, !dbg !348
  store i32 %132, i32* @no_name, align 4, !dbg !348
  br label %133, !dbg !348

; <label>:133                                     ; preds = %131, %128
  %134 = load i32* %2, align 4, !dbg !349
  %135 = load i32* @optind, align 4, !dbg !349
  %136 = sub nsw i32 %134, %135, !dbg !349
  store i32 %136, i32* %file_count, align 4, !dbg !349
  %137 = load i32* @ascii, align 4, !dbg !350
  %138 = icmp ne i32 %137, 0, !dbg !350
  br i1 %138, label %139, label %146, !dbg !350

; <label>:139                                     ; preds = %133
  %140 = load i32* @quiet, align 4, !dbg !350
  %141 = icmp ne i32 %140, 0, !dbg !350
  br i1 %141, label %146, label %142, !dbg !350

; <label>:142                                     ; preds = %139
  %143 = load %struct.__sFILE** @__stderrp, align 8, !dbg !351
  %144 = load i8** @progname, align 8, !dbg !351
  %145 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %143, i8* getelementptr inbounds ([43 x i8]* @.str33, i32 0, i32 0), i8* %144), !dbg !351
  br label %146, !dbg !353

; <label>:146                                     ; preds = %142, %139, %133
  %147 = load i32* @z_len, align 4, !dbg !354
  %148 = icmp eq i32 %147, 0, !dbg !354
  br i1 %148, label %149, label %152, !dbg !354

; <label>:149                                     ; preds = %146
  %150 = load i32* @decompress, align 4, !dbg !354
  %151 = icmp ne i32 %150, 0, !dbg !354
  br i1 %151, label %152, label %155, !dbg !354

; <label>:152                                     ; preds = %149, %146
  %153 = load i32* @z_len, align 4, !dbg !354
  %154 = icmp sgt i32 %153, 30, !dbg !354
  br i1 %154, label %155, label %160, !dbg !354

; <label>:155                                     ; preds = %152, %149
  %156 = load %struct.__sFILE** @__stderrp, align 8, !dbg !355
  %157 = load i8** @progname, align 8, !dbg !355
  %158 = load i8** @optarg, align 8, !dbg !355
  %159 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %156, i8* getelementptr inbounds ([27 x i8]* @.str34, i32 0, i32 0), i8* %157, i8* %158), !dbg !355
  call void @do_exit(i32 1), !dbg !357
  br label %160, !dbg !358

; <label>:160                                     ; preds = %155, %152
  %161 = load i32* @do_lzw, align 4, !dbg !359
  %162 = icmp ne i32 %161, 0, !dbg !359
  br i1 %162, label %163, label %167, !dbg !359

; <label>:163                                     ; preds = %160
  %164 = load i32* @decompress, align 4, !dbg !359
  %165 = icmp ne i32 %164, 0, !dbg !359
  br i1 %165, label %167, label %166, !dbg !359

; <label>:166                                     ; preds = %163
  store i32 (i32, i32)* @lzw, i32 (i32, i32)** @work, align 8, !dbg !360
  br label %167, !dbg !360

; <label>:167                                     ; preds = %166, %163, %160
  %168 = load i32* %file_count, align 4, !dbg !361
  %169 = icmp ne i32 %168, 0, !dbg !361
  br i1 %169, label %170, label %199, !dbg !361

; <label>:170                                     ; preds = %167
  %171 = load i32* @to_stdout, align 4, !dbg !362
  %172 = icmp ne i32 %171, 0, !dbg !362
  br i1 %172, label %173, label %186, !dbg !362

; <label>:173                                     ; preds = %170
  %174 = load i32* @test, align 4, !dbg !362
  %175 = icmp ne i32 %174, 0, !dbg !362
  br i1 %175, label %186, label %176, !dbg !362

; <label>:176                                     ; preds = %173
  %177 = load i32* @list, align 4, !dbg !362
  %178 = icmp ne i32 %177, 0, !dbg !362
  br i1 %178, label %186, label %179, !dbg !362

; <label>:179                                     ; preds = %176
  %180 = load i32* @decompress, align 4, !dbg !362
  %181 = icmp ne i32 %180, 0, !dbg !362
  br i1 %181, label %182, label %185, !dbg !362

; <label>:182                                     ; preds = %179
  %183 = load i32* @ascii, align 4, !dbg !362
  %184 = icmp ne i32 %183, 0, !dbg !362
  br i1 %184, label %186, label %185, !dbg !362

; <label>:185                                     ; preds = %182, %179
  br label %186, !dbg !364

; <label>:186                                     ; preds = %185, %182, %176, %173, %170
  br label %187, !dbg !366

; <label>:187                                     ; preds = %191, %186
  %188 = load i32* @optind, align 4, !dbg !366
  %189 = load i32* %2, align 4, !dbg !366
  %190 = icmp slt i32 %188, %189, !dbg !366
  br i1 %190, label %191, label %198, !dbg !366

; <label>:191                                     ; preds = %187
  %192 = load i32* @optind, align 4, !dbg !367
  %193 = add nsw i32 %192, 1, !dbg !367
  store i32 %193, i32* @optind, align 4, !dbg !367
  %194 = sext i32 %192 to i64, !dbg !367
  %195 = load i8*** %3, align 8, !dbg !367
  %196 = getelementptr inbounds i8** %195, i64 %194, !dbg !367
  %197 = load i8** %196, align 8, !dbg !367
  call void @treat_file(i8* %197), !dbg !367
  br label %187, !dbg !369

; <label>:198                                     ; preds = %187
  br label %200, !dbg !370

; <label>:199                                     ; preds = %167
  call void @treat_stdin(), !dbg !371
  br label %200

; <label>:200                                     ; preds = %199, %198
  %201 = load i32* @list, align 4, !dbg !373
  %202 = icmp ne i32 %201, 0, !dbg !373
  br i1 %202, label %203, label %210, !dbg !373

; <label>:203                                     ; preds = %200
  %204 = load i32* @quiet, align 4, !dbg !373
  %205 = icmp ne i32 %204, 0, !dbg !373
  br i1 %205, label %210, label %206, !dbg !373

; <label>:206                                     ; preds = %203
  %207 = load i32* %file_count, align 4, !dbg !373
  %208 = icmp sgt i32 %207, 1, !dbg !373
  br i1 %208, label %209, label %210, !dbg !373

; <label>:209                                     ; preds = %206
  call void @do_list(i32 -1, i32 -1), !dbg !374
  br label %210, !dbg !376

; <label>:210                                     ; preds = %209, %206, %203, %200
  %211 = load i32* @exit_code, align 4, !dbg !377
  call void @do_exit(i32 %211), !dbg !377
  %212 = load i32* @exit_code, align 4, !dbg !378
  ret i32 %212, !dbg !378
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare i8* @basename(i8*)

declare i64 @strlen(i8*) nounwind readonly

declare i32 @strcmp(i8*, i8*) nounwind readonly

declare i8* @add_envopt(i32*, i8***, i8*)

declare void (i32)* @signal(i32, void (i32)*)

define i32 @abort_gzip() nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = load i32* @remove_ofname, align 4, !dbg !379
  %3 = icmp ne i32 %2, 0, !dbg !379
  br i1 %3, label %4, label %8, !dbg !379

; <label>:4                                       ; preds = %0
  %5 = load i32* @ofd, align 4, !dbg !381
  %6 = call i32 @close(i32 %5), !dbg !381
  %7 = call i32 @unlink(i8* getelementptr inbounds ([1024 x i8]* @ofname, i32 0, i32 0)), !dbg !383
  br label %8, !dbg !384

; <label>:8                                       ; preds = %4, %0
  call void (...)* bitcast (void (i32)* @do_exit to void (...)*)(i32 1), !dbg !385
  %9 = load i32* %1, !dbg !386
  ret i32 %9, !dbg !386
}

declare i32 @strncmp(i8*, i8*, i64) nounwind readonly

declare i8* @strncpy(i8*, i8*, i64)

declare i32 @getopt_long(i32, i8**, i8*, %struct.option*, i32*)

declare i32 @atoi(i8*)

define internal void @help() nounwind uwtable {
  %p = alloca i8**, align 8
  call void @llvm.dbg.declare(metadata !{i8*** %p}, metadata !387), !dbg !389
  store i8** getelementptr inbounds ([17 x i8*]* @help.help_msg, i32 0, i32 0), i8*** %p, align 8, !dbg !390
  %1 = load %struct.__sFILE** @__stderrp, align 8, !dbg !391
  %2 = load i8** @progname, align 8, !dbg !391
  %3 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %1, i8* getelementptr inbounds ([12 x i8]* @.str106, i32 0, i32 0), i8* %2, i8* getelementptr inbounds ([6 x i8]* @.str107, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8]* @.str108, i32 0, i32 0)), !dbg !391
  call void @usage(), !dbg !392
  br label %4, !dbg !393

; <label>:4                                       ; preds = %8, %0
  %5 = load i8*** %p, align 8, !dbg !393
  %6 = load i8** %5, align 8, !dbg !393
  %7 = icmp ne i8* %6, null, !dbg !393
  br i1 %7, label %8, label %14, !dbg !393

; <label>:8                                       ; preds = %4
  %9 = load %struct.__sFILE** @__stderrp, align 8, !dbg !394
  %10 = load i8*** %p, align 8, !dbg !394
  %11 = getelementptr inbounds i8** %10, i32 1, !dbg !394
  store i8** %11, i8*** %p, align 8, !dbg !394
  %12 = load i8** %10, align 8, !dbg !394
  %13 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %9, i8* getelementptr inbounds ([4 x i8]* @.str114, i32 0, i32 0), i8* %12), !dbg !394
  br label %4, !dbg !394

; <label>:14                                      ; preds = %4
  ret void, !dbg !395
}

define internal void @do_exit(i32 %exitcode) nounwind uwtable {
  %1 = alloca i32, align 4
  store i32 %exitcode, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !396), !dbg !397
  %2 = load i32* @do_exit.in_exit, align 4, !dbg !398
  %3 = icmp ne i32 %2, 0, !dbg !398
  br i1 %3, label %4, label %6, !dbg !398

; <label>:4                                       ; preds = %0
  %5 = load i32* %1, align 4, !dbg !400
  call void @exit(i32 %5) noreturn, !dbg !400
  unreachable, !dbg !400

; <label>:6                                       ; preds = %0
  store i32 1, i32* @do_exit.in_exit, align 4, !dbg !401
  %7 = load i8** @env, align 8, !dbg !402
  %8 = icmp ne i8* %7, null, !dbg !402
  br i1 %8, label %9, label %11, !dbg !402

; <label>:9                                       ; preds = %6
  %10 = load i8** @env, align 8, !dbg !403
  call void @free(i8* %10), !dbg !403
  store i8* null, i8** @env, align 8, !dbg !403
  br label %11, !dbg !403

; <label>:11                                      ; preds = %9, %6
  %12 = load i8*** @args, align 8, !dbg !404
  %13 = icmp ne i8** %12, null, !dbg !404
  br i1 %13, label %14, label %17, !dbg !404

; <label>:14                                      ; preds = %11
  %15 = load i8*** @args, align 8, !dbg !405
  %16 = bitcast i8** %15 to i8*, !dbg !405
  call void @free(i8* %16), !dbg !405
  store i8** null, i8*** @args, align 8, !dbg !405
  br label %17, !dbg !405

; <label>:17                                      ; preds = %14, %11
  %18 = load i32* %1, align 4, !dbg !406
  call void @exit(i32 %18) noreturn, !dbg !406
  unreachable, !dbg !406
                                                  ; No predecessors!
  ret void, !dbg !407
}

define internal void @license() nounwind uwtable {
  %p = alloca i8**, align 8
  call void @llvm.dbg.declare(metadata !{i8*** %p}, metadata !408), !dbg !410
  store i8** getelementptr inbounds ([15 x i8*]* @license_msg, i32 0, i32 0), i8*** %p, align 8, !dbg !411
  %1 = load %struct.__sFILE** @__stderrp, align 8, !dbg !412
  %2 = load i8** @progname, align 8, !dbg !412
  %3 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %1, i8* getelementptr inbounds ([12 x i8]* @.str106, i32 0, i32 0), i8* %2, i8* getelementptr inbounds ([6 x i8]* @.str107, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8]* @.str108, i32 0, i32 0)), !dbg !412
  br label %4, !dbg !413

; <label>:4                                       ; preds = %8, %0
  %5 = load i8*** %p, align 8, !dbg !413
  %6 = load i8** %5, align 8, !dbg !413
  %7 = icmp ne i8* %6, null, !dbg !413
  br i1 %7, label %8, label %14, !dbg !413

; <label>:8                                       ; preds = %4
  %9 = load %struct.__sFILE** @__stderrp, align 8, !dbg !414
  %10 = load i8*** %p, align 8, !dbg !414
  %11 = getelementptr inbounds i8** %10, i32 1, !dbg !414
  store i8** %11, i8*** %p, align 8, !dbg !414
  %12 = load i8** %10, align 8, !dbg !414
  %13 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %9, i8* getelementptr inbounds ([4 x i8]* @.str114, i32 0, i32 0), i8* %12), !dbg !414
  br label %4, !dbg !414

; <label>:14                                      ; preds = %4
  ret void, !dbg !415
}

declare i32 @fprintf(%struct.__sFILE*, i8*, ...)

define internal void @usage() nounwind uwtable {
  %1 = load %struct.__sFILE** @__stderrp, align 8, !dbg !416
  %2 = load i8** @progname, align 8, !dbg !416
  %3 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %1, i8* getelementptr inbounds ([55 x i8]* @.str113, i32 0, i32 0), i8* %2, i8* getelementptr inbounds ([1 x i8]* @.str42, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str42, i32 0, i32 0)), !dbg !416
  ret void, !dbg !418
}

declare i8* @strcpy(i8*, i8*)

define internal void @version() nounwind uwtable {
  %1 = load %struct.__sFILE** @__stderrp, align 8, !dbg !419
  %2 = load i8** @progname, align 8, !dbg !419
  %3 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %1, i8* getelementptr inbounds ([12 x i8]* @.str106, i32 0, i32 0), i8* %2, i8* getelementptr inbounds ([6 x i8]* @.str107, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8]* @.str108, i32 0, i32 0)), !dbg !419
  %4 = load %struct.__sFILE** @__stderrp, align 8, !dbg !421
  %5 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %4, i8* getelementptr inbounds ([28 x i8]* @.str109, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str110, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8]* @.str111, i32 0, i32 0)), !dbg !421
  %6 = load %struct.__sFILE** @__stderrp, align 8, !dbg !422
  %7 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %6, i8* getelementptr inbounds ([15 x i8]* @.str112, i32 0, i32 0)), !dbg !422
  %8 = load %struct.__sFILE** @__stderrp, align 8, !dbg !423
  %9 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %8, i8* getelementptr inbounds ([2 x i8]* @.str47, i32 0, i32 0)), !dbg !423
  ret void, !dbg !424
}

declare i32 @lzw(i32, i32)

define void @treat_file(i8* %iname) nounwind uwtable {
  %1 = alloca i8*, align 8
  %cflag = alloca i32, align 4
  store i8* %iname, i8** %1, align 8
  call void @llvm.dbg.declare(metadata !{i8** %1}, metadata !425), !dbg !426
  %2 = load i8** %1, align 8, !dbg !427
  %3 = call i32 @strcmp(i8* %2, i8* getelementptr inbounds ([2 x i8]* @.str35, i32 0, i32 0)) nounwind readonly, !dbg !427
  %4 = icmp eq i32 %3, 0, !dbg !427
  br i1 %4, label %5, label %8, !dbg !427

; <label>:5                                       ; preds = %0
  call void @llvm.dbg.declare(metadata !{i32* %cflag}, metadata !429), !dbg !431
  %6 = load i32* @to_stdout, align 4, !dbg !432
  store i32 %6, i32* %cflag, align 4, !dbg !432
  call void @treat_stdin(), !dbg !433
  %7 = load i32* %cflag, align 4, !dbg !434
  store i32 %7, i32* @to_stdout, align 4, !dbg !434
  br label %292, !dbg !435

; <label>:8                                       ; preds = %0
  %9 = load i8** %1, align 8, !dbg !436
  %10 = call i32 @get_istat(i8* %9, %struct.stat* @istat), !dbg !436
  %11 = icmp ne i32 %10, 0, !dbg !436
  br i1 %11, label %12, label %13, !dbg !436

; <label>:12                                      ; preds = %8
  br label %292, !dbg !437

; <label>:13                                      ; preds = %8
  %14 = load i16* getelementptr inbounds (%struct.stat* @istat, i32 0, i32 2), align 2, !dbg !438
  %15 = zext i16 %14 to i32, !dbg !438
  %16 = and i32 %15, 61440, !dbg !438
  %17 = icmp eq i32 %16, 16384, !dbg !438
  br i1 %17, label %18, label %30, !dbg !438

; <label>:18                                      ; preds = %13
  %19 = load i32* @quiet, align 4, !dbg !439
  %20 = icmp ne i32 %19, 0, !dbg !439
  br i1 %20, label %25, label %21, !dbg !439

; <label>:21                                      ; preds = %18
  %22 = load %struct.__sFILE** @__stderrp, align 8, !dbg !439
  %23 = load i8** @progname, align 8, !dbg !439
  %24 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %22, i8* getelementptr inbounds ([34 x i8]* @.str36, i32 0, i32 0), i8* %23, i8* getelementptr inbounds ([1024 x i8]* @ifname, i32 0, i32 0)), !dbg !439
  br label %25, !dbg !439

; <label>:25                                      ; preds = %21, %18
  %26 = load i32* @exit_code, align 4, !dbg !439
  %27 = icmp eq i32 %26, 0, !dbg !439
  br i1 %27, label %28, label %29, !dbg !439

; <label>:28                                      ; preds = %25
  store i32 2, i32* @exit_code, align 4, !dbg !439
  br label %29, !dbg !439

; <label>:29                                      ; preds = %28, %25
  br label %292, !dbg !442

; <label>:30                                      ; preds = %13
  %31 = load i16* getelementptr inbounds (%struct.stat* @istat, i32 0, i32 2), align 2, !dbg !443
  %32 = zext i16 %31 to i32, !dbg !443
  %33 = and i32 %32, 61440, !dbg !443
  %34 = icmp eq i32 %33, 32768, !dbg !443
  br i1 %34, label %47, label %35, !dbg !443

; <label>:35                                      ; preds = %30
  %36 = load i32* @quiet, align 4, !dbg !444
  %37 = icmp ne i32 %36, 0, !dbg !444
  br i1 %37, label %42, label %38, !dbg !444

; <label>:38                                      ; preds = %35
  %39 = load %struct.__sFILE** @__stderrp, align 8, !dbg !444
  %40 = load i8** @progname, align 8, !dbg !444
  %41 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %39, i8* getelementptr inbounds ([55 x i8]* @.str37, i32 0, i32 0), i8* %40, i8* getelementptr inbounds ([1024 x i8]* @ifname, i32 0, i32 0)), !dbg !444
  br label %42, !dbg !444

; <label>:42                                      ; preds = %38, %35
  %43 = load i32* @exit_code, align 4, !dbg !444
  %44 = icmp eq i32 %43, 0, !dbg !444
  br i1 %44, label %45, label %46, !dbg !444

; <label>:45                                      ; preds = %42
  store i32 2, i32* @exit_code, align 4, !dbg !444
  br label %46, !dbg !444

; <label>:46                                      ; preds = %45, %42
  br label %292, !dbg !447

; <label>:47                                      ; preds = %30
  %48 = load i16* getelementptr inbounds (%struct.stat* @istat, i32 0, i32 3), align 2, !dbg !448
  %49 = zext i16 %48 to i32, !dbg !448
  %50 = icmp sgt i32 %49, 1, !dbg !448
  br i1 %50, label %51, label %76, !dbg !448

; <label>:51                                      ; preds = %47
  %52 = load i32* @to_stdout, align 4, !dbg !448
  %53 = icmp ne i32 %52, 0, !dbg !448
  br i1 %53, label %76, label %54, !dbg !448

; <label>:54                                      ; preds = %51
  %55 = load i32* @force, align 4, !dbg !448
  %56 = icmp ne i32 %55, 0, !dbg !448
  br i1 %56, label %76, label %57, !dbg !448

; <label>:57                                      ; preds = %54
  %58 = load i32* @quiet, align 4, !dbg !449
  %59 = icmp ne i32 %58, 0, !dbg !449
  br i1 %59, label %71, label %60, !dbg !449

; <label>:60                                      ; preds = %57
  %61 = load %struct.__sFILE** @__stderrp, align 8, !dbg !449
  %62 = load i8** @progname, align 8, !dbg !449
  %63 = load i16* getelementptr inbounds (%struct.stat* @istat, i32 0, i32 3), align 2, !dbg !449
  %64 = zext i16 %63 to i32, !dbg !449
  %65 = sub nsw i32 %64, 1, !dbg !449
  %66 = load i16* getelementptr inbounds (%struct.stat* @istat, i32 0, i32 3), align 2, !dbg !449
  %67 = zext i16 %66 to i32, !dbg !449
  %68 = icmp sgt i32 %67, 2, !dbg !449
  %69 = select i1 %68, i32 115, i32 32, !dbg !449
  %70 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %61, i8* getelementptr inbounds ([41 x i8]* @.str38, i32 0, i32 0), i8* %62, i8* getelementptr inbounds ([1024 x i8]* @ifname, i32 0, i32 0), i32 %65, i32 %69), !dbg !449
  br label %71, !dbg !449

; <label>:71                                      ; preds = %60, %57
  %72 = load i32* @exit_code, align 4, !dbg !449
  %73 = icmp eq i32 %72, 0, !dbg !449
  br i1 %73, label %74, label %75, !dbg !449

; <label>:74                                      ; preds = %71
  store i32 2, i32* @exit_code, align 4, !dbg !449
  br label %75, !dbg !449

; <label>:75                                      ; preds = %74, %71
  br label %292, !dbg !452

; <label>:76                                      ; preds = %54, %51, %47
  %77 = load i64* getelementptr inbounds (%struct.stat* @istat, i32 0, i32 10), align 8, !dbg !453
  store i64 %77, i64* @ifile_size, align 8, !dbg !453
  %78 = load i32* @no_time, align 4, !dbg !454
  %79 = icmp ne i32 %78, 0, !dbg !454
  br i1 %79, label %80, label %84, !dbg !454

; <label>:80                                      ; preds = %76
  %81 = load i32* @list, align 4, !dbg !454
  %82 = icmp ne i32 %81, 0, !dbg !454
  br i1 %82, label %84, label %83, !dbg !454

; <label>:83                                      ; preds = %80
  br label %86, !dbg !454

; <label>:84                                      ; preds = %80, %76
  %85 = load i64* getelementptr inbounds (%struct.stat* @istat, i32 0, i32 8, i32 0), align 8, !dbg !454
  br label %86, !dbg !454

; <label>:86                                      ; preds = %84, %83
  %87 = phi i64 [ 0, %83 ], [ %85, %84 ], !dbg !454
  store i64 %87, i64* @time_stamp, align 8, !dbg !454
  %88 = load i32* @to_stdout, align 4, !dbg !455
  %89 = icmp ne i32 %88, 0, !dbg !455
  br i1 %89, label %90, label %98, !dbg !455

; <label>:90                                      ; preds = %86
  %91 = load i32* @list, align 4, !dbg !455
  %92 = icmp ne i32 %91, 0, !dbg !455
  br i1 %92, label %98, label %93, !dbg !455

; <label>:93                                      ; preds = %90
  %94 = load i32* @test, align 4, !dbg !455
  %95 = icmp ne i32 %94, 0, !dbg !455
  br i1 %95, label %98, label %96, !dbg !455

; <label>:96                                      ; preds = %93
  %97 = call i8* @strcpy(i8* getelementptr inbounds ([1024 x i8]* @ofname, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str2, i32 0, i32 0)), !dbg !456
  br label %103, !dbg !458

; <label>:98                                      ; preds = %93, %90, %86
  %99 = call i32 @make_ofname(), !dbg !459
  %100 = icmp ne i32 %99, 0, !dbg !459
  br i1 %100, label %101, label %102, !dbg !459

; <label>:101                                     ; preds = %98
  br label %292, !dbg !460

; <label>:102                                     ; preds = %98
  br label %103

; <label>:103                                     ; preds = %102, %96
  %104 = load i32* @ascii, align 4, !dbg !462
  %105 = icmp ne i32 %104, 0, !dbg !462
  br i1 %105, label %106, label %110, !dbg !462

; <label>:106                                     ; preds = %103
  %107 = load i32* @decompress, align 4, !dbg !462
  %108 = icmp ne i32 %107, 0, !dbg !462
  %109 = xor i1 %108, true, !dbg !462
  br label %110

; <label>:110                                     ; preds = %106, %103
  %111 = phi i1 [ false, %103 ], [ %109, %106 ]
  %112 = select i1 %111, i32 0, i32 0
  %113 = call i32 (i8*, i32, ...)* @open(i8* getelementptr inbounds ([1024 x i8]* @ifname, i32 0, i32 0), i32 %112, i32 384)
  store i32 %113, i32* @ifd, align 4
  %114 = load i32* @ifd, align 4, !dbg !463
  %115 = icmp eq i32 %114, -1, !dbg !463
  br i1 %115, label %116, label %120, !dbg !463

; <label>:116                                     ; preds = %110
  %117 = load %struct.__sFILE** @__stderrp, align 8, !dbg !464
  %118 = load i8** @progname, align 8, !dbg !464
  %119 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %117, i8* getelementptr inbounds ([5 x i8]* @.str39, i32 0, i32 0), i8* %118), !dbg !464
  call void @perror(i8* getelementptr inbounds ([1024 x i8]* @ifname, i32 0, i32 0)), !dbg !466
  store i32 1, i32* @exit_code, align 4, !dbg !467
  br label %292, !dbg !468

; <label>:120                                     ; preds = %110
  call void @clear_bufs(), !dbg !469
  store i32 0, i32* @part_nb, align 4, !dbg !470
  %121 = load i32* @decompress, align 4, !dbg !471
  %122 = icmp ne i32 %121, 0, !dbg !471
  br i1 %122, label %123, label %132, !dbg !471

; <label>:123                                     ; preds = %120
  %124 = load i32* @ifd, align 4, !dbg !472
  %125 = call i32 @get_method(i32 %124), !dbg !472
  store i32 %125, i32* @method, align 4, !dbg !472
  %126 = load i32* @method, align 4, !dbg !474
  %127 = icmp slt i32 %126, 0, !dbg !474
  br i1 %127, label %128, label %131, !dbg !474

; <label>:128                                     ; preds = %123
  %129 = load i32* @ifd, align 4, !dbg !475
  %130 = call i32 @close(i32 %129), !dbg !475
  br label %292, !dbg !477

; <label>:131                                     ; preds = %123
  br label %132, !dbg !478

; <label>:132                                     ; preds = %131, %120
  %133 = load i32* @list, align 4, !dbg !479
  %134 = icmp ne i32 %133, 0, !dbg !479
  br i1 %134, label %135, label %140, !dbg !479

; <label>:135                                     ; preds = %132
  %136 = load i32* @ifd, align 4, !dbg !480
  %137 = load i32* @method, align 4, !dbg !480
  call void @do_list(i32 %136, i32 %137), !dbg !480
  %138 = load i32* @ifd, align 4, !dbg !482
  %139 = call i32 @close(i32 %138), !dbg !482
  br label %292, !dbg !483

; <label>:140                                     ; preds = %132
  %141 = load i32* @to_stdout, align 4, !dbg !484
  %142 = icmp ne i32 %141, 0, !dbg !484
  br i1 %142, label %143, label %156, !dbg !484

; <label>:143                                     ; preds = %140
  %144 = load i32* @__isthreaded, align 4, !dbg !485
  %145 = icmp ne i32 %144, 0, !dbg !485
  br i1 %145, label %151, label %146, !dbg !485

; <label>:146                                     ; preds = %143
  %147 = load %struct.__sFILE** @__stdoutp, align 8, !dbg !485
  %148 = getelementptr inbounds %struct.__sFILE* %147, i32 0, i32 4, !dbg !485
  %149 = load i16* %148, align 2, !dbg !485
  %150 = sext i16 %149 to i32, !dbg !485
  br label %154, !dbg !485

; <label>:151                                     ; preds = %143
  %152 = load %struct.__sFILE** @__stdoutp, align 8, !dbg !487
  %153 = call i32 @fileno(%struct.__sFILE* %152), !dbg !487
  br label %154, !dbg !487

; <label>:154                                     ; preds = %151, %146
  %155 = phi i32 [ %150, %146 ], [ %153, %151 ], !dbg !487
  store i32 %155, i32* @ofd, align 4, !dbg !487
  br label %177, !dbg !488

; <label>:156                                     ; preds = %140
  %157 = call i32 @create_outfile(), !dbg !489
  %158 = icmp ne i32 %157, 0, !dbg !489
  br i1 %158, label %159, label %160, !dbg !489

; <label>:159                                     ; preds = %156
  br label %292, !dbg !491

; <label>:160                                     ; preds = %156
  %161 = load i32* @decompress, align 4, !dbg !492
  %162 = icmp ne i32 %161, 0, !dbg !492
  br i1 %162, label %176, label %163, !dbg !492

; <label>:163                                     ; preds = %160
  %164 = load i32* @save_orig_name, align 4, !dbg !492
  %165 = icmp ne i32 %164, 0, !dbg !492
  br i1 %165, label %166, label %176, !dbg !492

; <label>:166                                     ; preds = %163
  %167 = load i32* @verbose, align 4, !dbg !492
  %168 = icmp ne i32 %167, 0, !dbg !492
  br i1 %168, label %176, label %169, !dbg !492

; <label>:169                                     ; preds = %166
  %170 = load i32* @quiet, align 4, !dbg !492
  %171 = icmp ne i32 %170, 0, !dbg !492
  br i1 %171, label %176, label %172, !dbg !492

; <label>:172                                     ; preds = %169
  %173 = load %struct.__sFILE** @__stderrp, align 8, !dbg !493
  %174 = load i8** @progname, align 8, !dbg !493
  %175 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %173, i8* getelementptr inbounds ([25 x i8]* @.str40, i32 0, i32 0), i8* %174, i8* getelementptr inbounds ([1024 x i8]* @ifname, i32 0, i32 0), i8* getelementptr inbounds ([1024 x i8]* @ofname, i32 0, i32 0)), !dbg !493
  br label %176, !dbg !495

; <label>:176                                     ; preds = %172, %169, %166, %163, %160
  br label %177

; <label>:177                                     ; preds = %176, %154
  %178 = load i32* @save_orig_name, align 4, !dbg !496
  %179 = icmp ne i32 %178, 0, !dbg !496
  br i1 %179, label %185, label %180, !dbg !496

; <label>:180                                     ; preds = %177
  %181 = load i32* @no_name, align 4, !dbg !497
  %182 = icmp ne i32 %181, 0, !dbg !497
  %183 = xor i1 %182, true, !dbg !497
  %184 = zext i1 %183 to i32, !dbg !497
  store i32 %184, i32* @save_orig_name, align 4, !dbg !497
  br label %185, !dbg !497

; <label>:185                                     ; preds = %180, %177
  %186 = load i32* @verbose, align 4, !dbg !498
  %187 = icmp ne i32 %186, 0, !dbg !498
  br i1 %187, label %188, label %202, !dbg !498

; <label>:188                                     ; preds = %185
  %189 = load %struct.__sFILE** @__stderrp, align 8, !dbg !499
  %190 = call i64 @strlen(i8* getelementptr inbounds ([1024 x i8]* @ifname, i32 0, i32 0)) nounwind readonly, !dbg !501
  %191 = trunc i64 %190 to i32, !dbg !501
  %192 = icmp sge i32 %191, 15, !dbg !501
  br i1 %192, label %193, label %194, !dbg !501

; <label>:193                                     ; preds = %188
  br label %199, !dbg !501

; <label>:194                                     ; preds = %188
  %195 = call i64 @strlen(i8* getelementptr inbounds ([1024 x i8]* @ifname, i32 0, i32 0)) nounwind readonly, !dbg !502
  %196 = trunc i64 %195 to i32, !dbg !502
  %197 = icmp sge i32 %196, 7, !dbg !502
  %198 = select i1 %197, i8* getelementptr inbounds ([2 x i8]* @.str43, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str44, i32 0, i32 0), !dbg !502
  br label %199, !dbg !502

; <label>:199                                     ; preds = %194, %193
  %200 = phi i8* [ getelementptr inbounds ([1 x i8]* @.str42, i32 0, i32 0), %193 ], [ %198, %194 ], !dbg !502
  %201 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %189, i8* getelementptr inbounds ([7 x i8]* @.str41, i32 0, i32 0), i8* getelementptr inbounds ([1024 x i8]* @ifname, i32 0, i32 0), i8* %200), !dbg !502
  br label %202, !dbg !503

; <label>:202                                     ; preds = %199, %185
  br label %203, !dbg !504

; <label>:203                                     ; preds = %227, %202
  %204 = load i32 (i32, i32)** @work, align 8, !dbg !506
  %205 = load i32* @ifd, align 4, !dbg !506
  %206 = load i32* @ofd, align 4, !dbg !506
  %207 = call i32 %204(i32 %205, i32 %206), !dbg !506
  %208 = icmp ne i32 %207, 0, !dbg !506
  br i1 %208, label %209, label %210, !dbg !506

; <label>:209                                     ; preds = %203
  store i32 -1, i32* @method, align 4, !dbg !508
  br label %228, !dbg !510

; <label>:210                                     ; preds = %203
  %211 = load i32* @decompress, align 4, !dbg !511
  %212 = icmp ne i32 %211, 0, !dbg !511
  br i1 %212, label %213, label %220, !dbg !511

; <label>:213                                     ; preds = %210
  %214 = load i32* @last_member, align 4, !dbg !511
  %215 = icmp ne i32 %214, 0, !dbg !511
  br i1 %215, label %220, label %216, !dbg !511

; <label>:216                                     ; preds = %213
  %217 = load i32* @inptr, align 4, !dbg !511
  %218 = load i32* @insize, align 4, !dbg !511
  %219 = icmp eq i32 %217, %218, !dbg !511
  br i1 %219, label %220, label %221, !dbg !511

; <label>:220                                     ; preds = %216, %213, %210
  br label %228, !dbg !512

; <label>:221                                     ; preds = %216
  %222 = load i32* @ifd, align 4, !dbg !513
  %223 = call i32 @get_method(i32 %222), !dbg !513
  store i32 %223, i32* @method, align 4, !dbg !513
  %224 = load i32* @method, align 4, !dbg !514
  %225 = icmp slt i32 %224, 0, !dbg !514
  br i1 %225, label %226, label %227, !dbg !514

; <label>:226                                     ; preds = %221
  br label %228, !dbg !515

; <label>:227                                     ; preds = %221
  store i64 0, i64* @bytes_out, align 8, !dbg !516
  br label %203, !dbg !517

; <label>:228                                     ; preds = %226, %220, %209
  %229 = load i32* @ifd, align 4, !dbg !518
  %230 = call i32 @close(i32 %229), !dbg !518
  %231 = load i32* @to_stdout, align 4, !dbg !519
  %232 = icmp ne i32 %231, 0, !dbg !519
  br i1 %232, label %238, label %233, !dbg !519

; <label>:233                                     ; preds = %228
  %234 = load i32* @ofd, align 4, !dbg !520
  %235 = call i32 @close(i32 %234), !dbg !520
  %236 = icmp ne i32 %235, 0, !dbg !520
  br i1 %236, label %237, label %238, !dbg !520

; <label>:237                                     ; preds = %233
  call void @write_error(), !dbg !521
  br label %238, !dbg !523

; <label>:238                                     ; preds = %237, %233, %228
  %239 = load i32* @method, align 4, !dbg !524
  %240 = icmp eq i32 %239, -1, !dbg !524
  br i1 %240, label %241, label %247, !dbg !524

; <label>:241                                     ; preds = %238
  %242 = load i32* @to_stdout, align 4, !dbg !525
  %243 = icmp ne i32 %242, 0, !dbg !525
  br i1 %243, label %246, label %244, !dbg !525

; <label>:244                                     ; preds = %241
  %245 = call i32 @unlink(i8* getelementptr inbounds ([1024 x i8]* @ofname, i32 0, i32 0)), !dbg !527
  br label %246, !dbg !527

; <label>:246                                     ; preds = %244, %241
  br label %292, !dbg !528

; <label>:247                                     ; preds = %238
  %248 = load i32* @verbose, align 4, !dbg !529
  %249 = icmp ne i32 %248, 0, !dbg !529
  br i1 %249, label %250, label %288, !dbg !529

; <label>:250                                     ; preds = %247
  %251 = load i32* @test, align 4, !dbg !530
  %252 = icmp ne i32 %251, 0, !dbg !530
  br i1 %252, label %253, label %256, !dbg !530

; <label>:253                                     ; preds = %250
  %254 = load %struct.__sFILE** @__stderrp, align 8, !dbg !532
  %255 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %254, i8* getelementptr inbounds ([4 x i8]* @.str45, i32 0, i32 0)), !dbg !532
  br label %276, !dbg !534

; <label>:256                                     ; preds = %250
  %257 = load i32* @decompress, align 4, !dbg !535
  %258 = icmp ne i32 %257, 0, !dbg !535
  br i1 %258, label %259, label %267, !dbg !535

; <label>:259                                     ; preds = %256
  %260 = load i64* @bytes_out, align 8, !dbg !536
  %261 = load i64* @bytes_in, align 8, !dbg !536
  %262 = load i64* @header_bytes, align 8, !dbg !536
  %263 = sub nsw i64 %261, %262, !dbg !536
  %264 = sub nsw i64 %260, %263, !dbg !536
  %265 = load i64* @bytes_out, align 8, !dbg !536
  %266 = load %struct.__sFILE** @__stderrp, align 8, !dbg !536
  call void @display_ratio(i64 %264, i64 %265, %struct.__sFILE* %266), !dbg !536
  br label %275, !dbg !538

; <label>:267                                     ; preds = %256
  %268 = load i64* @bytes_in, align 8, !dbg !539
  %269 = load i64* @bytes_out, align 8, !dbg !539
  %270 = load i64* @header_bytes, align 8, !dbg !539
  %271 = sub nsw i64 %269, %270, !dbg !539
  %272 = sub nsw i64 %268, %271, !dbg !539
  %273 = load i64* @bytes_in, align 8, !dbg !539
  %274 = load %struct.__sFILE** @__stderrp, align 8, !dbg !539
  call void @display_ratio(i64 %272, i64 %273, %struct.__sFILE* %274), !dbg !539
  br label %275

; <label>:275                                     ; preds = %267, %259
  br label %276

; <label>:276                                     ; preds = %275, %253
  %277 = load i32* @test, align 4, !dbg !541
  %278 = icmp ne i32 %277, 0, !dbg !541
  br i1 %278, label %285, label %279, !dbg !541

; <label>:279                                     ; preds = %276
  %280 = load i32* @to_stdout, align 4, !dbg !541
  %281 = icmp ne i32 %280, 0, !dbg !541
  br i1 %281, label %285, label %282, !dbg !541

; <label>:282                                     ; preds = %279
  %283 = load %struct.__sFILE** @__stderrp, align 8, !dbg !542
  %284 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %283, i8* getelementptr inbounds ([21 x i8]* @.str46, i32 0, i32 0), i8* getelementptr inbounds ([1024 x i8]* @ofname, i32 0, i32 0)), !dbg !542
  br label %285, !dbg !544

; <label>:285                                     ; preds = %282, %279, %276
  %286 = load %struct.__sFILE** @__stderrp, align 8, !dbg !545
  %287 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %286, i8* getelementptr inbounds ([2 x i8]* @.str47, i32 0, i32 0)), !dbg !545
  br label %288, !dbg !546

; <label>:288                                     ; preds = %285, %247
  %289 = load i32* @to_stdout, align 4, !dbg !547
  %290 = icmp ne i32 %289, 0, !dbg !547
  br i1 %290, label %292, label %291, !dbg !547

; <label>:291                                     ; preds = %288
  call void @copy_stat(%struct.stat* @istat), !dbg !548
  br label %292, !dbg !550

; <label>:292                                     ; preds = %291, %288, %246, %159, %135, %128, %116, %101, %75, %46, %29, %12, %5
  ret void, !dbg !551
}

define internal void @treat_stdin() nounwind uwtable {
  %ifd = alloca i32, align 4
  %ofd = alloca i32, align 4
  %1 = load i32* @force, align 4, !dbg !552
  %2 = icmp ne i32 %1, 0, !dbg !552
  br i1 %2, label %48, label %3, !dbg !552

; <label>:3                                       ; preds = %0
  %4 = load i32* @list, align 4, !dbg !552
  %5 = icmp ne i32 %4, 0, !dbg !552
  br i1 %5, label %48, label %6, !dbg !552

; <label>:6                                       ; preds = %3
  %7 = load i32* @__isthreaded, align 4, !dbg !554
  %8 = icmp ne i32 %7, 0, !dbg !554
  br i1 %8, label %21, label %9, !dbg !554

; <label>:9                                       ; preds = %6
  %10 = load i32* @decompress, align 4, !dbg !554
  %11 = icmp ne i32 %10, 0, !dbg !554
  br i1 %11, label %12, label %14, !dbg !554

; <label>:12                                      ; preds = %9
  %13 = load %struct.__sFILE** @__stdinp, align 8, !dbg !554
  br label %16, !dbg !554

; <label>:14                                      ; preds = %9
  %15 = load %struct.__sFILE** @__stdoutp, align 8, !dbg !554
  br label %16, !dbg !554

; <label>:16                                      ; preds = %14, %12
  %17 = phi %struct.__sFILE* [ %13, %12 ], [ %15, %14 ], !dbg !554
  %18 = getelementptr inbounds %struct.__sFILE* %17, i32 0, i32 4, !dbg !554
  %19 = load i16* %18, align 2, !dbg !554
  %20 = sext i16 %19 to i32, !dbg !554
  br label %31, !dbg !554

; <label>:21                                      ; preds = %6
  %22 = load i32* @decompress, align 4, !dbg !555
  %23 = icmp ne i32 %22, 0, !dbg !555
  br i1 %23, label %24, label %26, !dbg !555

; <label>:24                                      ; preds = %21
  %25 = load %struct.__sFILE** @__stdinp, align 8, !dbg !555
  br label %28, !dbg !555

; <label>:26                                      ; preds = %21
  %27 = load %struct.__sFILE** @__stdoutp, align 8, !dbg !555
  br label %28, !dbg !555

; <label>:28                                      ; preds = %26, %24
  %29 = phi %struct.__sFILE* [ %25, %24 ], [ %27, %26 ], !dbg !555
  %30 = call i32 @fileno(%struct.__sFILE* %29), !dbg !555
  br label %31, !dbg !555

; <label>:31                                      ; preds = %28, %16
  %32 = phi i32 [ %20, %16 ], [ %30, %28 ], !dbg !555
  %33 = call i32 @isatty(i32 %32), !dbg !555
  %34 = icmp ne i32 %33, 0, !dbg !555
  br i1 %34, label %35, label %48, !dbg !555

; <label>:35                                      ; preds = %31
  %36 = load %struct.__sFILE** @__stderrp, align 8, !dbg !556
  %37 = load i8** @progname, align 8, !dbg !556
  %38 = load i32* @decompress, align 4, !dbg !556
  %39 = icmp ne i32 %38, 0, !dbg !556
  %40 = select i1 %39, i8* getelementptr inbounds ([10 x i8]* @.str100, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str101, i32 0, i32 0), !dbg !556
  %41 = load i32* @decompress, align 4, !dbg !556
  %42 = icmp ne i32 %41, 0, !dbg !556
  %43 = select i1 %42, i8* getelementptr inbounds ([3 x i8]* @.str93, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str42, i32 0, i32 0), !dbg !556
  %44 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %36, i8* getelementptr inbounds ([71 x i8]* @.str99, i32 0, i32 0), i8* %37, i8* %40, i8* %43), !dbg !556
  %45 = load %struct.__sFILE** @__stderrp, align 8, !dbg !558
  %46 = load i8** @progname, align 8, !dbg !558
  %47 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %45, i8* getelementptr inbounds ([23 x i8]* @.str102, i32 0, i32 0), i8* %46), !dbg !558
  call void @do_exit(i32 1), !dbg !559
  br label %48, !dbg !560

; <label>:48                                      ; preds = %35, %31, %3, %0
  %49 = load i32* @decompress, align 4, !dbg !561
  %50 = icmp ne i32 %49, 0, !dbg !561
  br i1 %50, label %54, label %51, !dbg !561

; <label>:51                                      ; preds = %48
  %52 = load i32* @ascii, align 4, !dbg !561
  %53 = icmp ne i32 %52, 0, !dbg !561
  br i1 %53, label %55, label %54, !dbg !561

; <label>:54                                      ; preds = %51, %48
  br label %55, !dbg !562

; <label>:55                                      ; preds = %54, %51
  %56 = load i32* @test, align 4, !dbg !564
  %57 = icmp ne i32 %56, 0, !dbg !564
  br i1 %57, label %68, label %58, !dbg !564

; <label>:58                                      ; preds = %55
  %59 = load i32* @list, align 4, !dbg !564
  %60 = icmp ne i32 %59, 0, !dbg !564
  br i1 %60, label %68, label %61, !dbg !564

; <label>:61                                      ; preds = %58
  %62 = load i32* @decompress, align 4, !dbg !564
  %63 = icmp ne i32 %62, 0, !dbg !564
  br i1 %63, label %64, label %67, !dbg !564

; <label>:64                                      ; preds = %61
  %65 = load i32* @ascii, align 4, !dbg !564
  %66 = icmp ne i32 %65, 0, !dbg !564
  br i1 %66, label %68, label %67, !dbg !564

; <label>:67                                      ; preds = %64, %61
  br label %68, !dbg !565

; <label>:68                                      ; preds = %67, %64, %58, %55
  %69 = call i8* @strcpy(i8* getelementptr inbounds ([1024 x i8]* @ifname, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8]* @.str103, i32 0, i32 0)), !dbg !567
  %70 = call i8* @strcpy(i8* getelementptr inbounds ([1024 x i8]* @ofname, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str2, i32 0, i32 0)), !dbg !568
  store i64 0, i64* @time_stamp, align 8, !dbg !569
  %71 = load i32* @list, align 4, !dbg !570
  %72 = icmp ne i32 %71, 0, !dbg !570
  br i1 %72, label %76, label %73, !dbg !570

; <label>:73                                      ; preds = %68
  %74 = load i32* @no_time, align 4, !dbg !570
  %75 = icmp ne i32 %74, 0, !dbg !570
  br i1 %75, label %94, label %76, !dbg !570

; <label>:76                                      ; preds = %73, %68
  %77 = load i32* @__isthreaded, align 4, !dbg !571
  %78 = icmp ne i32 %77, 0, !dbg !571
  br i1 %78, label %84, label %79, !dbg !571

; <label>:79                                      ; preds = %76
  %80 = load %struct.__sFILE** @__stdinp, align 8, !dbg !571
  %81 = getelementptr inbounds %struct.__sFILE* %80, i32 0, i32 4, !dbg !571
  %82 = load i16* %81, align 2, !dbg !571
  %83 = sext i16 %82 to i32, !dbg !571
  br label %87, !dbg !571

; <label>:84                                      ; preds = %76
  %85 = load %struct.__sFILE** @__stdinp, align 8, !dbg !573
  %86 = call i32 @fileno(%struct.__sFILE* %85), !dbg !573
  br label %87, !dbg !573

; <label>:87                                      ; preds = %84, %79
  %88 = phi i32 [ %83, %79 ], [ %86, %84 ], !dbg !573
  %89 = call i32 @fstat(i32 %88, %struct.stat* @istat), !dbg !573
  %90 = icmp ne i32 %89, 0, !dbg !573
  br i1 %90, label %91, label %92, !dbg !573

; <label>:91                                      ; preds = %87
  call void @error(i8* getelementptr inbounds ([13 x i8]* @.str104, i32 0, i32 0)), !dbg !574
  br label %92, !dbg !576

; <label>:92                                      ; preds = %91, %87
  %93 = load i64* getelementptr inbounds (%struct.stat* @istat, i32 0, i32 8, i32 0), align 8, !dbg !577
  store i64 %93, i64* @time_stamp, align 8, !dbg !577
  br label %94, !dbg !578

; <label>:94                                      ; preds = %92, %73
  store i64 -1, i64* @ifile_size, align 8, !dbg !579
  call void @clear_bufs(), !dbg !580
  store i32 1, i32* @to_stdout, align 4, !dbg !581
  store i32 0, i32* @part_nb, align 4, !dbg !582
  %95 = load i32* @decompress, align 4, !dbg !583
  %96 = icmp ne i32 %95, 0, !dbg !583
  br i1 %96, label %97, label %105, !dbg !583

; <label>:97                                      ; preds = %94
  %98 = load i32* @ifd, align 4, !dbg !584
  %99 = call i32 @get_method(i32 %98), !dbg !584
  store i32 %99, i32* @method, align 4, !dbg !584
  %100 = load i32* @method, align 4, !dbg !586
  %101 = icmp slt i32 %100, 0, !dbg !586
  br i1 %101, label %102, label %104, !dbg !586

; <label>:102                                     ; preds = %97
  %103 = load i32* @exit_code, align 4, !dbg !587
  call void @do_exit(i32 %103), !dbg !587
  br label %104, !dbg !589

; <label>:104                                     ; preds = %102, %97
  br label %105, !dbg !590

; <label>:105                                     ; preds = %104, %94
  %106 = load i32* @list, align 4, !dbg !591
  %107 = icmp ne i32 %106, 0, !dbg !591
  br i1 %107, label %108, label %111, !dbg !591

; <label>:108                                     ; preds = %105
  %109 = load i32* @ifd, align 4, !dbg !592
  %110 = load i32* @method, align 4, !dbg !592
  call void @do_list(i32 %109, i32 %110), !dbg !592
  br label %185, !dbg !594

; <label>:111                                     ; preds = %105
  br label %112, !dbg !595

; <label>:112                                     ; preds = %160, %111
  call void @llvm.dbg.declare(metadata !{i32* %ifd}, metadata !597), !dbg !599
  %113 = load i32* @__isthreaded, align 4, !dbg !600
  %114 = icmp ne i32 %113, 0, !dbg !600
  br i1 %114, label %120, label %115, !dbg !600

; <label>:115                                     ; preds = %112
  %116 = load %struct.__sFILE** @__stdinp, align 8, !dbg !600
  %117 = getelementptr inbounds %struct.__sFILE* %116, i32 0, i32 4, !dbg !600
  %118 = load i16* %117, align 2, !dbg !600
  %119 = sext i16 %118 to i32, !dbg !600
  br label %123, !dbg !600

; <label>:120                                     ; preds = %112
  %121 = load %struct.__sFILE** @__stdinp, align 8, !dbg !601
  %122 = call i32 @fileno(%struct.__sFILE* %121), !dbg !601
  br label %123, !dbg !601

; <label>:123                                     ; preds = %120, %115
  %124 = phi i32 [ %119, %115 ], [ %122, %120 ], !dbg !601
  store i32 %124, i32* %ifd, align 4, !dbg !601
  call void @llvm.dbg.declare(metadata !{i32* %ofd}, metadata !602), !dbg !603
  %125 = load i32* @__isthreaded, align 4, !dbg !604
  %126 = icmp ne i32 %125, 0, !dbg !604
  br i1 %126, label %132, label %127, !dbg !604

; <label>:127                                     ; preds = %123
  %128 = load %struct.__sFILE** @__stdoutp, align 8, !dbg !604
  %129 = getelementptr inbounds %struct.__sFILE* %128, i32 0, i32 4, !dbg !604
  %130 = load i16* %129, align 2, !dbg !604
  %131 = sext i16 %130 to i32, !dbg !604
  br label %135, !dbg !604

; <label>:132                                     ; preds = %123
  %133 = load %struct.__sFILE** @__stdoutp, align 8, !dbg !605
  %134 = call i32 @fileno(%struct.__sFILE* %133), !dbg !605
  br label %135, !dbg !605

; <label>:135                                     ; preds = %132, %127
  %136 = phi i32 [ %131, %127 ], [ %134, %132 ], !dbg !605
  store i32 %136, i32* %ofd, align 4, !dbg !605
  %137 = load i32 (i32, i32)** @work, align 8, !dbg !606
  %138 = load i32* %ifd, align 4, !dbg !606
  %139 = load i32* %ofd, align 4, !dbg !606
  %140 = call i32 %137(i32 %138, i32 %139), !dbg !606
  %141 = icmp ne i32 %140, 0, !dbg !606
  br i1 %141, label %142, label %143, !dbg !606

; <label>:142                                     ; preds = %135
  br label %185, !dbg !607

; <label>:143                                     ; preds = %135
  %144 = load i32* @decompress, align 4, !dbg !608
  %145 = icmp ne i32 %144, 0, !dbg !608
  br i1 %145, label %146, label %153, !dbg !608

; <label>:146                                     ; preds = %143
  %147 = load i32* @last_member, align 4, !dbg !608
  %148 = icmp ne i32 %147, 0, !dbg !608
  br i1 %148, label %153, label %149, !dbg !608

; <label>:149                                     ; preds = %146
  %150 = load i32* @inptr, align 4, !dbg !608
  %151 = load i32* @insize, align 4, !dbg !608
  %152 = icmp eq i32 %150, %151, !dbg !608
  br i1 %152, label %153, label %154, !dbg !608

; <label>:153                                     ; preds = %149, %146, %143
  br label %161, !dbg !609

; <label>:154                                     ; preds = %149
  %155 = load i32* %ifd, align 4, !dbg !610
  %156 = call i32 @get_method(i32 %155), !dbg !610
  store i32 %156, i32* @method, align 4, !dbg !610
  %157 = load i32* @method, align 4, !dbg !611
  %158 = icmp slt i32 %157, 0, !dbg !611
  br i1 %158, label %159, label %160, !dbg !611

; <label>:159                                     ; preds = %154
  br label %185, !dbg !612

; <label>:160                                     ; preds = %154
  store i64 0, i64* @bytes_out, align 8, !dbg !613
  br label %112, !dbg !614

; <label>:161                                     ; preds = %153
  %162 = load i32* @verbose, align 4, !dbg !615
  %163 = icmp ne i32 %162, 0, !dbg !615
  br i1 %163, label %164, label %185, !dbg !615

; <label>:164                                     ; preds = %161
  %165 = load i32* @test, align 4, !dbg !616
  %166 = icmp ne i32 %165, 0, !dbg !616
  br i1 %166, label %167, label %170, !dbg !616

; <label>:167                                     ; preds = %164
  %168 = load %struct.__sFILE** @__stderrp, align 8, !dbg !618
  %169 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %168, i8* getelementptr inbounds ([5 x i8]* @.str105, i32 0, i32 0)), !dbg !618
  br label %184, !dbg !620

; <label>:170                                     ; preds = %164
  %171 = load i32* @decompress, align 4, !dbg !621
  %172 = icmp ne i32 %171, 0, !dbg !621
  br i1 %172, label %183, label %173, !dbg !621

; <label>:173                                     ; preds = %170
  %174 = load i64* @bytes_in, align 8, !dbg !622
  %175 = load i64* @bytes_out, align 8, !dbg !622
  %176 = load i64* @header_bytes, align 8, !dbg !622
  %177 = sub nsw i64 %175, %176, !dbg !622
  %178 = sub nsw i64 %174, %177, !dbg !622
  %179 = load i64* @bytes_in, align 8, !dbg !622
  %180 = load %struct.__sFILE** @__stderrp, align 8, !dbg !622
  call void @display_ratio(i64 %178, i64 %179, %struct.__sFILE* %180), !dbg !622
  %181 = load %struct.__sFILE** @__stderrp, align 8, !dbg !624
  %182 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %181, i8* getelementptr inbounds ([2 x i8]* @.str47, i32 0, i32 0)), !dbg !624
  br label %183, !dbg !625

; <label>:183                                     ; preds = %173, %170
  br label %184

; <label>:184                                     ; preds = %183, %167
  br label %185, !dbg !626

; <label>:185                                     ; preds = %184, %161, %159, %142, %108
  ret void, !dbg !627
}

define internal void @do_list(i32 %ifd, i32 %method) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %crc = alloca i64, align 8
  %date = alloca i8*, align 8
  %buf = alloca [8 x i8], align 1
  store i32 %ifd, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !628), !dbg !629
  store i32 %method, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !630), !dbg !631
  call void @llvm.dbg.declare(metadata !{i64* %crc}, metadata !632), !dbg !635
  call void @llvm.dbg.declare(metadata !{i8** %date}, metadata !636), !dbg !637
  %3 = load i32* @do_list.first_time, align 4, !dbg !638
  %4 = icmp ne i32 %3, 0, !dbg !638
  br i1 %4, label %5, label %19, !dbg !638

; <label>:5                                       ; preds = %0
  %6 = load i32* %2, align 4, !dbg !638
  %7 = icmp sge i32 %6, 0, !dbg !638
  br i1 %7, label %8, label %19, !dbg !638

; <label>:8                                       ; preds = %5
  store i32 0, i32* @do_list.first_time, align 4, !dbg !639
  %9 = load i32* @verbose, align 4, !dbg !641
  %10 = icmp ne i32 %9, 0, !dbg !641
  br i1 %10, label %11, label %13, !dbg !641

; <label>:11                                      ; preds = %8
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str54, i32 0, i32 0)), !dbg !642
  br label %13, !dbg !644

; <label>:13                                      ; preds = %11, %8
  %14 = load i32* @quiet, align 4, !dbg !645
  %15 = icmp ne i32 %14, 0, !dbg !645
  br i1 %15, label %18, label %16, !dbg !645

; <label>:16                                      ; preds = %13
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([46 x i8]* @.str55, i32 0, i32 0)), !dbg !646
  br label %18, !dbg !648

; <label>:18                                      ; preds = %16, %13
  br label %54, !dbg !649

; <label>:19                                      ; preds = %5, %0
  %20 = load i32* %2, align 4, !dbg !650
  %21 = icmp slt i32 %20, 0, !dbg !650
  br i1 %21, label %22, label %53, !dbg !650

; <label>:22                                      ; preds = %19
  %23 = load i64* @total_in, align 8, !dbg !651
  %24 = icmp sle i64 %23, 0, !dbg !651
  br i1 %24, label %28, label %25, !dbg !651

; <label>:25                                      ; preds = %22
  %26 = load i64* @total_out, align 8, !dbg !651
  %27 = icmp sle i64 %26, 0, !dbg !651
  br i1 %27, label %28, label %29, !dbg !651

; <label>:28                                      ; preds = %25, %22
  br label %189, !dbg !653

; <label>:29                                      ; preds = %25
  %30 = load i32* @verbose, align 4, !dbg !654
  %31 = icmp ne i32 %30, 0, !dbg !654
  br i1 %31, label %32, label %36, !dbg !654

; <label>:32                                      ; preds = %29
  %33 = load i64* @total_in, align 8, !dbg !655
  %34 = load i64* @total_out, align 8, !dbg !655
  %35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str56, i32 0, i32 0), i64 %33, i64 %34), !dbg !655
  br label %44, !dbg !657

; <label>:36                                      ; preds = %29
  %37 = load i32* @quiet, align 4, !dbg !658
  %38 = icmp ne i32 %37, 0, !dbg !658
  br i1 %38, label %43, label %39, !dbg !658

; <label>:39                                      ; preds = %36
  %40 = load i64* @total_in, align 8, !dbg !659
  %41 = load i64* @total_out, align 8, !dbg !659
  %42 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str57, i32 0, i32 0), i64 %40, i64 %41), !dbg !659
  br label %43, !dbg !661

; <label>:43                                      ; preds = %39, %36
  br label %44

; <label>:44                                      ; preds = %43, %32
  %45 = load i64* @total_out, align 8, !dbg !662
  %46 = load i64* @total_in, align 8, !dbg !662
  %47 = load i64* @header_bytes, align 8, !dbg !662
  %48 = sub nsw i64 %46, %47, !dbg !662
  %49 = sub nsw i64 %45, %48, !dbg !662
  %50 = load i64* @total_out, align 8, !dbg !662
  %51 = load %struct.__sFILE** @__stdoutp, align 8, !dbg !662
  call void @display_ratio(i64 %49, i64 %50, %struct.__sFILE* %51), !dbg !662
  %52 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str58, i32 0, i32 0)), !dbg !663
  br label %189, !dbg !664

; <label>:53                                      ; preds = %19
  br label %54

; <label>:54                                      ; preds = %53, %18
  store i64 -1, i64* %crc, align 8, !dbg !665
  store i64 -1, i64* @bytes_out, align 8, !dbg !666
  %55 = load i64* @ifile_size, align 8, !dbg !667
  store i64 %55, i64* @bytes_in, align 8, !dbg !667
  %56 = load i32* %2, align 4, !dbg !668
  %57 = icmp eq i32 %56, 8, !dbg !668
  br i1 %57, label %58, label %138, !dbg !668

; <label>:58                                      ; preds = %54
  %59 = load i32* @last_member, align 4, !dbg !668
  %60 = icmp ne i32 %59, 0, !dbg !668
  br i1 %60, label %138, label %61, !dbg !668

; <label>:61                                      ; preds = %58
  %62 = load i32* %1, align 4, !dbg !669
  %63 = call i64 @lseek(i32 %62, i64 -8, i32 2), !dbg !669
  store i64 %63, i64* @bytes_in, align 8, !dbg !669
  %64 = load i64* @bytes_in, align 8, !dbg !671
  %65 = icmp ne i64 %64, -1, !dbg !671
  br i1 %65, label %66, label %137, !dbg !671

; <label>:66                                      ; preds = %61
  call void @llvm.dbg.declare(metadata !{[8 x i8]* %buf}, metadata !672), !dbg !677
  %67 = load i64* @bytes_in, align 8, !dbg !678
  %68 = add nsw i64 %67, 8, !dbg !678
  store i64 %68, i64* @bytes_in, align 8, !dbg !678
  %69 = load i32* %1, align 4, !dbg !679
  %70 = getelementptr inbounds [8 x i8]* %buf, i32 0, i32 0, !dbg !679
  %71 = call i64 @read(i32 %69, i8* %70, i64 8), !dbg !679
  %72 = icmp ne i64 %71, 8, !dbg !679
  br i1 %72, label %73, label %74, !dbg !679

; <label>:73                                      ; preds = %66
  call void @read_error(), !dbg !680
  br label %74, !dbg !682

; <label>:74                                      ; preds = %73, %66
  %75 = getelementptr inbounds [8 x i8]* %buf, i32 0, i64 0, !dbg !683
  %76 = load i8* %75, align 1, !dbg !683
  %77 = zext i8 %76 to i16, !dbg !683
  %78 = zext i16 %77 to i32, !dbg !683
  %79 = getelementptr inbounds [8 x i8]* %buf, i32 0, i64 1, !dbg !683
  %80 = load i8* %79, align 1, !dbg !683
  %81 = zext i8 %80 to i16, !dbg !683
  %82 = zext i16 %81 to i32, !dbg !683
  %83 = shl i32 %82, 8, !dbg !683
  %84 = or i32 %78, %83, !dbg !683
  %85 = sext i32 %84 to i64, !dbg !683
  %86 = getelementptr inbounds [8 x i8]* %buf, i32 0, i32 0, !dbg !683
  %87 = getelementptr inbounds i8* %86, i64 2, !dbg !683
  %88 = getelementptr inbounds i8* %87, i64 0, !dbg !683
  %89 = load i8* %88, align 1, !dbg !683
  %90 = zext i8 %89 to i16, !dbg !683
  %91 = zext i16 %90 to i32, !dbg !683
  %92 = getelementptr inbounds [8 x i8]* %buf, i32 0, i32 0, !dbg !683
  %93 = getelementptr inbounds i8* %92, i64 2, !dbg !683
  %94 = getelementptr inbounds i8* %93, i64 1, !dbg !683
  %95 = load i8* %94, align 1, !dbg !683
  %96 = zext i8 %95 to i16, !dbg !683
  %97 = zext i16 %96 to i32, !dbg !683
  %98 = shl i32 %97, 8, !dbg !683
  %99 = or i32 %91, %98, !dbg !683
  %100 = sext i32 %99 to i64, !dbg !683
  %101 = shl i64 %100, 16, !dbg !683
  %102 = or i64 %85, %101, !dbg !683
  store i64 %102, i64* %crc, align 8, !dbg !683
  %103 = getelementptr inbounds [8 x i8]* %buf, i32 0, i32 0, !dbg !684
  %104 = getelementptr inbounds i8* %103, i64 4, !dbg !684
  %105 = getelementptr inbounds i8* %104, i64 0, !dbg !684
  %106 = load i8* %105, align 1, !dbg !684
  %107 = zext i8 %106 to i16, !dbg !684
  %108 = zext i16 %107 to i32, !dbg !684
  %109 = getelementptr inbounds [8 x i8]* %buf, i32 0, i32 0, !dbg !684
  %110 = getelementptr inbounds i8* %109, i64 4, !dbg !684
  %111 = getelementptr inbounds i8* %110, i64 1, !dbg !684
  %112 = load i8* %111, align 1, !dbg !684
  %113 = zext i8 %112 to i16, !dbg !684
  %114 = zext i16 %113 to i32, !dbg !684
  %115 = shl i32 %114, 8, !dbg !684
  %116 = or i32 %108, %115, !dbg !684
  %117 = sext i32 %116 to i64, !dbg !684
  %118 = getelementptr inbounds [8 x i8]* %buf, i32 0, i32 0, !dbg !684
  %119 = getelementptr inbounds i8* %118, i64 4, !dbg !684
  %120 = getelementptr inbounds i8* %119, i64 2, !dbg !684
  %121 = getelementptr inbounds i8* %120, i64 0, !dbg !684
  %122 = load i8* %121, align 1, !dbg !684
  %123 = zext i8 %122 to i16, !dbg !684
  %124 = zext i16 %123 to i32, !dbg !684
  %125 = getelementptr inbounds [8 x i8]* %buf, i32 0, i32 0, !dbg !684
  %126 = getelementptr inbounds i8* %125, i64 4, !dbg !684
  %127 = getelementptr inbounds i8* %126, i64 2, !dbg !684
  %128 = getelementptr inbounds i8* %127, i64 1, !dbg !684
  %129 = load i8* %128, align 1, !dbg !684
  %130 = zext i8 %129 to i16, !dbg !684
  %131 = zext i16 %130 to i32, !dbg !684
  %132 = shl i32 %131, 8, !dbg !684
  %133 = or i32 %124, %132, !dbg !684
  %134 = sext i32 %133 to i64, !dbg !684
  %135 = shl i64 %134, 16, !dbg !684
  %136 = or i64 %117, %135, !dbg !684
  store i64 %136, i64* @bytes_out, align 8, !dbg !684
  br label %137, !dbg !685

; <label>:137                                     ; preds = %74, %61
  br label %138, !dbg !686

; <label>:138                                     ; preds = %137, %58, %54
  %139 = call i8* @ctime(i64* @time_stamp), !dbg !687
  %140 = getelementptr inbounds i8* %139, i64 4, !dbg !687
  store i8* %140, i8** %date, align 8, !dbg !687
  %141 = load i8** %date, align 8, !dbg !688
  %142 = getelementptr inbounds i8* %141, i64 12, !dbg !688
  store i8 0, i8* %142, align 1, !dbg !688
  %143 = load i32* @verbose, align 4, !dbg !689
  %144 = icmp ne i32 %143, 0, !dbg !689
  br i1 %144, label %145, label %153, !dbg !689

; <label>:145                                     ; preds = %138
  %146 = load i32* %2, align 4, !dbg !690
  %147 = sext i32 %146 to i64, !dbg !690
  %148 = getelementptr inbounds [9 x i8*]* @do_list.methods, i32 0, i64 %147, !dbg !690
  %149 = load i8** %148, align 8, !dbg !690
  %150 = load i64* %crc, align 8, !dbg !690
  %151 = load i8** %date, align 8, !dbg !690
  %152 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str59, i32 0, i32 0), i8* %149, i64 %150, i8* %151), !dbg !690
  br label %153, !dbg !692

; <label>:153                                     ; preds = %145, %138
  %154 = load i64* @bytes_in, align 8, !dbg !693
  %155 = load i64* @bytes_out, align 8, !dbg !693
  %156 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str57, i32 0, i32 0), i64 %154, i64 %155), !dbg !693
  %157 = load i64* @bytes_in, align 8, !dbg !694
  %158 = icmp eq i64 %157, -1, !dbg !694
  br i1 %158, label %159, label %160, !dbg !694

; <label>:159                                     ; preds = %153
  store i64 -1, i64* @total_in, align 8, !dbg !695
  store i64 0, i64* @header_bytes, align 8, !dbg !697
  store i64 0, i64* @bytes_out, align 8, !dbg !697
  store i64 0, i64* @bytes_in, align 8, !dbg !697
  br label %168, !dbg !698

; <label>:160                                     ; preds = %153
  %161 = load i64* @total_in, align 8, !dbg !699
  %162 = icmp sge i64 %161, 0, !dbg !699
  br i1 %162, label %163, label %167, !dbg !699

; <label>:163                                     ; preds = %160
  %164 = load i64* @bytes_in, align 8, !dbg !700
  %165 = load i64* @total_in, align 8, !dbg !700
  %166 = add nsw i64 %165, %164, !dbg !700
  store i64 %166, i64* @total_in, align 8, !dbg !700
  br label %167, !dbg !702

; <label>:167                                     ; preds = %163, %160
  br label %168

; <label>:168                                     ; preds = %167, %159
  %169 = load i64* @bytes_out, align 8, !dbg !703
  %170 = icmp eq i64 %169, -1, !dbg !703
  br i1 %170, label %171, label %172, !dbg !703

; <label>:171                                     ; preds = %168
  store i64 -1, i64* @total_out, align 8, !dbg !704
  store i64 0, i64* @header_bytes, align 8, !dbg !706
  store i64 0, i64* @bytes_out, align 8, !dbg !706
  store i64 0, i64* @bytes_in, align 8, !dbg !706
  br label %180, !dbg !707

; <label>:172                                     ; preds = %168
  %173 = load i64* @total_out, align 8, !dbg !708
  %174 = icmp sge i64 %173, 0, !dbg !708
  br i1 %174, label %175, label %179, !dbg !708

; <label>:175                                     ; preds = %172
  %176 = load i64* @bytes_out, align 8, !dbg !709
  %177 = load i64* @total_out, align 8, !dbg !709
  %178 = add nsw i64 %177, %176, !dbg !709
  store i64 %178, i64* @total_out, align 8, !dbg !709
  br label %179, !dbg !711

; <label>:179                                     ; preds = %175, %172
  br label %180

; <label>:180                                     ; preds = %179, %171
  %181 = load i64* @bytes_out, align 8, !dbg !712
  %182 = load i64* @bytes_in, align 8, !dbg !712
  %183 = load i64* @header_bytes, align 8, !dbg !712
  %184 = sub nsw i64 %182, %183, !dbg !712
  %185 = sub nsw i64 %181, %184, !dbg !712
  %186 = load i64* @bytes_out, align 8, !dbg !712
  %187 = load %struct.__sFILE** @__stdoutp, align 8, !dbg !712
  call void @display_ratio(i64 %185, i64 %186, %struct.__sFILE* %187), !dbg !712
  %188 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str60, i32 0, i32 0), i8* getelementptr inbounds ([1024 x i8]* @ofname, i32 0, i32 0)), !dbg !713
  br label %189, !dbg !714

; <label>:189                                     ; preds = %180, %44, %28
  ret void, !dbg !714
}

define internal i32 @get_istat(i8* %iname, %struct.stat* %sbuf) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  %3 = alloca %struct.stat*, align 8
  %ilen = alloca i32, align 4
  %suf = alloca i8**, align 8
  %s = alloca i8*, align 8
  store i8* %iname, i8** %2, align 8
  call void @llvm.dbg.declare(metadata !{i8** %2}, metadata !715), !dbg !716
  store %struct.stat* %sbuf, %struct.stat** %3, align 8
  call void @llvm.dbg.declare(metadata !{%struct.stat** %3}, metadata !717), !dbg !718
  call void @llvm.dbg.declare(metadata !{i32* %ilen}, metadata !719), !dbg !721
  call void @llvm.dbg.declare(metadata !{i8*** %suf}, metadata !722), !dbg !723
  store i8** getelementptr inbounds ([6 x i8*]* @get_istat.suffixes, i32 0, i32 0), i8*** %suf, align 8, !dbg !724
  call void @llvm.dbg.declare(metadata !{i8** %s}, metadata !725), !dbg !726
  %4 = load i8** %2, align 8, !dbg !727
  %5 = call i8* @strcpy(i8* getelementptr inbounds ([1024 x i8]* @ifname, i32 0, i32 0), i8* %4), !dbg !727
  %6 = load %struct.stat** %3, align 8, !dbg !728
  %7 = call i32 (...)* bitcast (i32 (i8*, %struct.stat*)* @do_stat to i32 (...)*)(i8* getelementptr inbounds ([1024 x i8]* @ifname, i32 0, i32 0), %struct.stat* %6), !dbg !728
  %8 = icmp eq i32 %7, 0, !dbg !728
  br i1 %8, label %9, label %10, !dbg !728

; <label>:9                                       ; preds = %0
  store i32 0, i32* %1, !dbg !729
  br label %52, !dbg !729

; <label>:10                                      ; preds = %0
  %11 = load i32* @decompress, align 4, !dbg !730
  %12 = icmp ne i32 %11, 0, !dbg !730
  br i1 %12, label %13, label %17, !dbg !730

; <label>:13                                      ; preds = %10
  %14 = call i32* @__error(), !dbg !731
  %15 = load i32* %14, align 4, !dbg !731
  %16 = icmp ne i32 %15, 2, !dbg !731
  br i1 %16, label %17, label %18, !dbg !731

; <label>:17                                      ; preds = %13, %10
  call void @perror(i8* getelementptr inbounds ([1024 x i8]* @ifname, i32 0, i32 0)), !dbg !732
  store i32 1, i32* @exit_code, align 4, !dbg !734
  store i32 1, i32* %1, !dbg !735
  br label %52, !dbg !735

; <label>:18                                      ; preds = %13
  %19 = call i8* (...)* bitcast (i8* (i8*)* @get_suffix to i8* (...)*)(i8* getelementptr inbounds ([1024 x i8]* @ifname, i32 0, i32 0)), !dbg !736
  store i8* %19, i8** %s, align 8, !dbg !736
  %20 = load i8** %s, align 8, !dbg !737
  %21 = icmp ne i8* %20, null, !dbg !737
  br i1 %21, label %22, label %23, !dbg !737

; <label>:22                                      ; preds = %18
  call void @perror(i8* getelementptr inbounds ([1024 x i8]* @ifname, i32 0, i32 0)), !dbg !738
  store i32 1, i32* @exit_code, align 4, !dbg !740
  store i32 1, i32* %1, !dbg !741
  br label %52, !dbg !741

; <label>:23                                      ; preds = %18
  %24 = call i64 @strlen(i8* getelementptr inbounds ([1024 x i8]* @ifname, i32 0, i32 0)) nounwind readonly, !dbg !742
  %25 = trunc i64 %24 to i32, !dbg !742
  store i32 %25, i32* %ilen, align 4, !dbg !742
  %26 = call i32 @strcmp(i8* getelementptr inbounds ([31 x i8]* @z_suffix, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str29, i32 0, i32 0)) nounwind readonly, !dbg !743
  %27 = icmp eq i32 %26, 0, !dbg !743
  br i1 %27, label %28, label %31, !dbg !743

; <label>:28                                      ; preds = %23
  %29 = load i8*** %suf, align 8, !dbg !744
  %30 = getelementptr inbounds i8** %29, i32 1, !dbg !744
  store i8** %30, i8*** %suf, align 8, !dbg !744
  br label %31, !dbg !744

; <label>:31                                      ; preds = %28, %23
  br label %32, !dbg !745

; <label>:32                                      ; preds = %45, %31
  %33 = load i8*** %suf, align 8, !dbg !746
  %34 = load i8** %33, align 8, !dbg !746
  store i8* %34, i8** %s, align 8, !dbg !746
  %35 = load i8** %s, align 8, !dbg !748
  %36 = call i8* @strcat(i8* getelementptr inbounds ([1024 x i8]* @ifname, i32 0, i32 0), i8* %35), !dbg !748
  %37 = load %struct.stat** %3, align 8, !dbg !749
  %38 = call i32 (...)* bitcast (i32 (i8*, %struct.stat*)* @do_stat to i32 (...)*)(i8* getelementptr inbounds ([1024 x i8]* @ifname, i32 0, i32 0), %struct.stat* %37), !dbg !749
  %39 = icmp eq i32 %38, 0, !dbg !749
  br i1 %39, label %40, label %41, !dbg !749

; <label>:40                                      ; preds = %32
  store i32 0, i32* %1, !dbg !750
  br label %52, !dbg !750

; <label>:41                                      ; preds = %32
  %42 = load i32* %ilen, align 4, !dbg !751
  %43 = sext i32 %42 to i64, !dbg !751
  %44 = getelementptr inbounds [1024 x i8]* @ifname, i32 0, i64 %43, !dbg !751
  store i8 0, i8* %44, align 1, !dbg !751
  br label %45, !dbg !752

; <label>:45                                      ; preds = %41
  %46 = load i8*** %suf, align 8, !dbg !752
  %47 = getelementptr inbounds i8** %46, i32 1, !dbg !752
  store i8** %47, i8*** %suf, align 8, !dbg !752
  %48 = load i8** %47, align 8, !dbg !752
  %49 = icmp ne i8* %48, null, !dbg !752
  br i1 %49, label %32, label %50, !dbg !752

; <label>:50                                      ; preds = %45
  %51 = call i8* @strcat(i8* getelementptr inbounds ([1024 x i8]* @ifname, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8]* @z_suffix, i32 0, i32 0)), !dbg !753
  call void @perror(i8* getelementptr inbounds ([1024 x i8]* @ifname, i32 0, i32 0)), !dbg !754
  store i32 1, i32* @exit_code, align 4, !dbg !755
  store i32 1, i32* %1, !dbg !756
  br label %52, !dbg !756

; <label>:52                                      ; preds = %50, %40, %22, %17, %9
  %53 = load i32* %1, !dbg !757
  ret i32 %53, !dbg !757
}

define internal i32 @make_ofname() nounwind uwtable {
  %1 = alloca i32, align 4
  %suff = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata !{i8** %suff}, metadata !758), !dbg !760
  %2 = call i8* @strcpy(i8* getelementptr inbounds ([1024 x i8]* @ofname, i32 0, i32 0), i8* getelementptr inbounds ([1024 x i8]* @ifname, i32 0, i32 0)), !dbg !761
  %3 = call i8* (...)* bitcast (i8* (i8*)* @get_suffix to i8* (...)*)(i8* getelementptr inbounds ([1024 x i8]* @ofname, i32 0, i32 0)), !dbg !762
  store i8* %3, i8** %suff, align 8, !dbg !762
  %4 = load i32* @decompress, align 4, !dbg !763
  %5 = icmp ne i32 %4, 0, !dbg !763
  br i1 %5, label %6, label %57, !dbg !763

; <label>:6                                       ; preds = %0
  %7 = load i8** %suff, align 8, !dbg !764
  %8 = icmp eq i8* %7, null, !dbg !764
  br i1 %8, label %9, label %41, !dbg !764

; <label>:9                                       ; preds = %6
  %10 = load i32* @recursive, align 4, !dbg !766
  %11 = icmp ne i32 %10, 0, !dbg !766
  br i1 %11, label %19, label %12, !dbg !766

; <label>:12                                      ; preds = %9
  %13 = load i32* @list, align 4, !dbg !766
  %14 = icmp ne i32 %13, 0, !dbg !766
  br i1 %14, label %18, label %15, !dbg !766

; <label>:15                                      ; preds = %12
  %16 = load i32* @test, align 4, !dbg !766
  %17 = icmp ne i32 %16, 0, !dbg !766
  br i1 %17, label %18, label %19, !dbg !766

; <label>:18                                      ; preds = %15, %12
  store i32 0, i32* %1, !dbg !768
  br label %83, !dbg !768

; <label>:19                                      ; preds = %15, %9
  %20 = load i32* @verbose, align 4, !dbg !769
  %21 = icmp ne i32 %20, 0, !dbg !769
  br i1 %21, label %28, label %22, !dbg !769

; <label>:22                                      ; preds = %19
  %23 = load i32* @recursive, align 4, !dbg !769
  %24 = icmp ne i32 %23, 0, !dbg !769
  br i1 %24, label %40, label %25, !dbg !769

; <label>:25                                      ; preds = %22
  %26 = load i32* @quiet, align 4, !dbg !769
  %27 = icmp ne i32 %26, 0, !dbg !769
  br i1 %27, label %40, label %28, !dbg !769

; <label>:28                                      ; preds = %25, %19
  %29 = load i32* @quiet, align 4, !dbg !770
  %30 = icmp ne i32 %29, 0, !dbg !770
  br i1 %30, label %35, label %31, !dbg !770

; <label>:31                                      ; preds = %28
  %32 = load %struct.__sFILE** @__stderrp, align 8, !dbg !770
  %33 = load i8** @progname, align 8, !dbg !770
  %34 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %32, i8* getelementptr inbounds ([35 x i8]* @.str76, i32 0, i32 0), i8* %33, i8* getelementptr inbounds ([1024 x i8]* @ifname, i32 0, i32 0)), !dbg !770
  br label %35, !dbg !770

; <label>:35                                      ; preds = %31, %28
  %36 = load i32* @exit_code, align 4, !dbg !770
  %37 = icmp eq i32 %36, 0, !dbg !770
  br i1 %37, label %38, label %39, !dbg !770

; <label>:38                                      ; preds = %35
  store i32 2, i32* @exit_code, align 4, !dbg !770
  br label %39, !dbg !770

; <label>:39                                      ; preds = %38, %35
  br label %40, !dbg !773

; <label>:40                                      ; preds = %39, %25, %22
  store i32 2, i32* %1, !dbg !774
  br label %83, !dbg !774

; <label>:41                                      ; preds = %6
  %42 = load i8** %suff, align 8, !dbg !775
  %43 = call i8* @strlwr(i8* %42), !dbg !775
  %44 = load i8** %suff, align 8, !dbg !776
  %45 = call i32 @strcmp(i8* %44, i8* getelementptr inbounds ([5 x i8]* @.str77, i32 0, i32 0)) nounwind readonly, !dbg !776
  %46 = icmp eq i32 %45, 0, !dbg !776
  br i1 %46, label %51, label %47, !dbg !776

; <label>:47                                      ; preds = %41
  %48 = load i8** %suff, align 8, !dbg !777
  %49 = call i32 @strcmp(i8* %48, i8* getelementptr inbounds ([5 x i8]* @.str78, i32 0, i32 0)) nounwind readonly, !dbg !777
  %50 = icmp eq i32 %49, 0, !dbg !777
  br i1 %50, label %51, label %54, !dbg !777

; <label>:51                                      ; preds = %47, %41
  %52 = load i8** %suff, align 8, !dbg !778
  %53 = call i8* @strcpy(i8* %52, i8* getelementptr inbounds ([5 x i8]* @.str79, i32 0, i32 0)), !dbg !778
  br label %56, !dbg !780

; <label>:54                                      ; preds = %47
  %55 = load i8** %suff, align 8, !dbg !781
  store i8 0, i8* %55, align 1, !dbg !781
  br label %56

; <label>:56                                      ; preds = %54, %51
  br label %82, !dbg !783

; <label>:57                                      ; preds = %0
  %58 = load i8** %suff, align 8, !dbg !784
  %59 = icmp ne i8* %58, null, !dbg !784
  br i1 %59, label %60, label %79, !dbg !784

; <label>:60                                      ; preds = %57
  %61 = load i32* @verbose, align 4, !dbg !785
  %62 = icmp ne i32 %61, 0, !dbg !785
  br i1 %62, label %69, label %63, !dbg !785

; <label>:63                                      ; preds = %60
  %64 = load i32* @recursive, align 4, !dbg !785
  %65 = icmp ne i32 %64, 0, !dbg !785
  br i1 %65, label %74, label %66, !dbg !785

; <label>:66                                      ; preds = %63
  %67 = load i32* @quiet, align 4, !dbg !785
  %68 = icmp ne i32 %67, 0, !dbg !785
  br i1 %68, label %74, label %69, !dbg !785

; <label>:69                                      ; preds = %66, %60
  %70 = load %struct.__sFILE** @__stderrp, align 8, !dbg !787
  %71 = load i8** @progname, align 8, !dbg !787
  %72 = load i8** %suff, align 8, !dbg !787
  %73 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %70, i8* getelementptr inbounds ([43 x i8]* @.str80, i32 0, i32 0), i8* %71, i8* getelementptr inbounds ([1024 x i8]* @ifname, i32 0, i32 0), i8* %72), !dbg !787
  br label %74, !dbg !789

; <label>:74                                      ; preds = %69, %66, %63
  %75 = load i32* @exit_code, align 4, !dbg !790
  %76 = icmp eq i32 %75, 0, !dbg !790
  br i1 %76, label %77, label %78, !dbg !790

; <label>:77                                      ; preds = %74
  store i32 2, i32* @exit_code, align 4, !dbg !791
  br label %78, !dbg !791

; <label>:78                                      ; preds = %77, %74
  store i32 2, i32* %1, !dbg !792
  br label %83, !dbg !792

; <label>:79                                      ; preds = %57
  store i32 0, i32* @save_orig_name, align 4, !dbg !793
  %80 = call i8* @strcat(i8* getelementptr inbounds ([1024 x i8]* @ofname, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8]* @z_suffix, i32 0, i32 0)), !dbg !795
  br label %81

; <label>:81                                      ; preds = %79
  br label %82

; <label>:82                                      ; preds = %81, %56
  store i32 0, i32* %1, !dbg !796
  br label %83, !dbg !796

; <label>:83                                      ; preds = %82, %78, %40, %18
  %84 = load i32* %1, !dbg !797
  ret i32 %84, !dbg !797
}

declare i32 @open(i8*, i32, ...)

declare void @perror(i8*)

declare void @clear_bufs()

define internal i32 @get_method(i32 %in) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %flags = alloca i8, align 1
  %magic = alloca [2 x i8], align 1
  %stamp = alloca i64, align 8
  %part = alloca i32, align 4
  %len = alloca i32, align 4
  %c = alloca i8, align 1
  %p = alloca i8*, align 8
  %base = alloca i8*, align 8
  store i32 %in, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !798), !dbg !799
  call void @llvm.dbg.declare(metadata !{i8* %flags}, metadata !800), !dbg !802
  call void @llvm.dbg.declare(metadata !{[2 x i8]* %magic}, metadata !803), !dbg !807
  call void @llvm.dbg.declare(metadata !{i64* %stamp}, metadata !808), !dbg !809
  %3 = load i32* @force, align 4, !dbg !810
  %4 = icmp ne i32 %3, 0, !dbg !810
  br i1 %4, label %5, label %41, !dbg !810

; <label>:5                                       ; preds = %0
  %6 = load i32* @to_stdout, align 4, !dbg !810
  %7 = icmp ne i32 %6, 0, !dbg !810
  br i1 %7, label %8, label %41, !dbg !810

; <label>:8                                       ; preds = %5
  %9 = load i32* @inptr, align 4, !dbg !811
  %10 = load i32* @insize, align 4, !dbg !811
  %11 = icmp ult i32 %9, %10, !dbg !811
  br i1 %11, label %12, label %19, !dbg !811

; <label>:12                                      ; preds = %8
  %13 = load i32* @inptr, align 4, !dbg !811
  %14 = add i32 %13, 1, !dbg !811
  store i32 %14, i32* @inptr, align 4, !dbg !811
  %15 = zext i32 %13 to i64, !dbg !811
  %16 = getelementptr inbounds [32832 x i8]* @inbuf, i32 0, i64 %15, !dbg !811
  %17 = load i8* %16, align 1, !dbg !811
  %18 = zext i8 %17 to i32, !dbg !811
  br label %21, !dbg !811

; <label>:19                                      ; preds = %8
  %20 = call i32 @fill_inbuf(i32 1), !dbg !813
  br label %21, !dbg !813

; <label>:21                                      ; preds = %19, %12
  %22 = phi i32 [ %18, %12 ], [ %20, %19 ], !dbg !813
  %23 = trunc i32 %22 to i8, !dbg !813
  %24 = getelementptr inbounds [2 x i8]* %magic, i32 0, i64 0, !dbg !813
  store i8 %23, i8* %24, align 1, !dbg !813
  %25 = load i32* @inptr, align 4, !dbg !814
  %26 = load i32* @insize, align 4, !dbg !814
  %27 = icmp ult i32 %25, %26, !dbg !814
  br i1 %27, label %28, label %35, !dbg !814

; <label>:28                                      ; preds = %21
  %29 = load i32* @inptr, align 4, !dbg !814
  %30 = add i32 %29, 1, !dbg !814
  store i32 %30, i32* @inptr, align 4, !dbg !814
  %31 = zext i32 %29 to i64, !dbg !814
  %32 = getelementptr inbounds [32832 x i8]* @inbuf, i32 0, i64 %31, !dbg !814
  %33 = load i8* %32, align 1, !dbg !814
  %34 = zext i8 %33 to i32, !dbg !814
  br label %37, !dbg !814

; <label>:35                                      ; preds = %21
  %36 = call i32 @fill_inbuf(i32 1), !dbg !815
  br label %37, !dbg !815

; <label>:37                                      ; preds = %35, %28
  %38 = phi i32 [ %34, %28 ], [ %36, %35 ], !dbg !815
  %39 = trunc i32 %38 to i8, !dbg !815
  %40 = getelementptr inbounds [2 x i8]* %magic, i32 0, i64 1, !dbg !815
  store i8 %39, i8* %40, align 1, !dbg !815
  br label %74, !dbg !816

; <label>:41                                      ; preds = %5, %0
  %42 = load i32* @inptr, align 4, !dbg !817
  %43 = load i32* @insize, align 4, !dbg !817
  %44 = icmp ult i32 %42, %43, !dbg !817
  br i1 %44, label %45, label %52, !dbg !817

; <label>:45                                      ; preds = %41
  %46 = load i32* @inptr, align 4, !dbg !817
  %47 = add i32 %46, 1, !dbg !817
  store i32 %47, i32* @inptr, align 4, !dbg !817
  %48 = zext i32 %46 to i64, !dbg !817
  %49 = getelementptr inbounds [32832 x i8]* @inbuf, i32 0, i64 %48, !dbg !817
  %50 = load i8* %49, align 1, !dbg !817
  %51 = zext i8 %50 to i32, !dbg !817
  br label %54, !dbg !817

; <label>:52                                      ; preds = %41
  %53 = call i32 @fill_inbuf(i32 0), !dbg !819
  br label %54, !dbg !819

; <label>:54                                      ; preds = %52, %45
  %55 = phi i32 [ %51, %45 ], [ %53, %52 ], !dbg !819
  %56 = trunc i32 %55 to i8, !dbg !819
  %57 = getelementptr inbounds [2 x i8]* %magic, i32 0, i64 0, !dbg !819
  store i8 %56, i8* %57, align 1, !dbg !819
  %58 = load i32* @inptr, align 4, !dbg !820
  %59 = load i32* @insize, align 4, !dbg !820
  %60 = icmp ult i32 %58, %59, !dbg !820
  br i1 %60, label %61, label %68, !dbg !820

; <label>:61                                      ; preds = %54
  %62 = load i32* @inptr, align 4, !dbg !820
  %63 = add i32 %62, 1, !dbg !820
  store i32 %63, i32* @inptr, align 4, !dbg !820
  %64 = zext i32 %62 to i64, !dbg !820
  %65 = getelementptr inbounds [32832 x i8]* @inbuf, i32 0, i64 %64, !dbg !820
  %66 = load i8* %65, align 1, !dbg !820
  %67 = zext i8 %66 to i32, !dbg !820
  br label %70, !dbg !820

; <label>:68                                      ; preds = %54
  %69 = call i32 @fill_inbuf(i32 0), !dbg !821
  br label %70, !dbg !821

; <label>:70                                      ; preds = %68, %61
  %71 = phi i32 [ %67, %61 ], [ %69, %68 ], !dbg !821
  %72 = trunc i32 %71 to i8, !dbg !821
  %73 = getelementptr inbounds [2 x i8]* %magic, i32 0, i64 1, !dbg !821
  store i8 %72, i8* %73, align 1, !dbg !821
  br label %74

; <label>:74                                      ; preds = %70, %37
  store i32 -1, i32* @method, align 4, !dbg !822
  %75 = load i32* @part_nb, align 4, !dbg !823
  %76 = add nsw i32 %75, 1, !dbg !823
  store i32 %76, i32* @part_nb, align 4, !dbg !823
  store i64 0, i64* @header_bytes, align 8, !dbg !824
  store i32 0, i32* @last_member, align 4, !dbg !825
  %77 = getelementptr inbounds [2 x i8]* %magic, i32 0, i32 0, !dbg !826
  %78 = call i32 @memcmp(i8* %77, i8* getelementptr inbounds ([3 x i8]* @.str61, i32 0, i32 0), i64 2) nounwind readonly, !dbg !826
  %79 = icmp eq i32 %78, 0, !dbg !826
  br i1 %79, label %84, label %80, !dbg !826

; <label>:80                                      ; preds = %74
  %81 = getelementptr inbounds [2 x i8]* %magic, i32 0, i32 0, !dbg !827
  %82 = call i32 @memcmp(i8* %81, i8* getelementptr inbounds ([3 x i8]* @.str62, i32 0, i32 0), i64 2) nounwind readonly, !dbg !827
  %83 = icmp eq i32 %82, 0, !dbg !827
  br i1 %83, label %84, label %485, !dbg !827

; <label>:84                                      ; preds = %80, %74
  %85 = load i32* @inptr, align 4, !dbg !828
  %86 = load i32* @insize, align 4, !dbg !828
  %87 = icmp ult i32 %85, %86, !dbg !828
  br i1 %87, label %88, label %95, !dbg !828

; <label>:88                                      ; preds = %84
  %89 = load i32* @inptr, align 4, !dbg !828
  %90 = add i32 %89, 1, !dbg !828
  store i32 %90, i32* @inptr, align 4, !dbg !828
  %91 = zext i32 %89 to i64, !dbg !828
  %92 = getelementptr inbounds [32832 x i8]* @inbuf, i32 0, i64 %91, !dbg !828
  %93 = load i8* %92, align 1, !dbg !828
  %94 = zext i8 %93 to i32, !dbg !828
  br label %97, !dbg !828

; <label>:95                                      ; preds = %84
  %96 = call i32 @fill_inbuf(i32 0), !dbg !830
  br label %97, !dbg !830

; <label>:97                                      ; preds = %95, %88
  %98 = phi i32 [ %94, %88 ], [ %96, %95 ], !dbg !830
  store i32 %98, i32* @method, align 4, !dbg !830
  %99 = load i32* @method, align 4, !dbg !831
  %100 = icmp ne i32 %99, 8, !dbg !831
  br i1 %100, label %101, label %106, !dbg !831

; <label>:101                                     ; preds = %97
  %102 = load %struct.__sFILE** @__stderrp, align 8, !dbg !832
  %103 = load i8** @progname, align 8, !dbg !832
  %104 = load i32* @method, align 4, !dbg !832
  %105 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %102, i8* getelementptr inbounds ([56 x i8]* @.str63, i32 0, i32 0), i8* %103, i8* getelementptr inbounds ([1024 x i8]* @ifname, i32 0, i32 0), i32 %104), !dbg !832
  store i32 1, i32* @exit_code, align 4, !dbg !834
  store i32 -1, i32* %1, !dbg !835
  br label %555, !dbg !835

; <label>:106                                     ; preds = %97
  store i32 (i32, i32)* @unzip, i32 (i32, i32)** @work, align 8, !dbg !836
  %107 = load i32* @inptr, align 4, !dbg !837
  %108 = load i32* @insize, align 4, !dbg !837
  %109 = icmp ult i32 %107, %108, !dbg !837
  br i1 %109, label %110, label %117, !dbg !837

; <label>:110                                     ; preds = %106
  %111 = load i32* @inptr, align 4, !dbg !837
  %112 = add i32 %111, 1, !dbg !837
  store i32 %112, i32* @inptr, align 4, !dbg !837
  %113 = zext i32 %111 to i64, !dbg !837
  %114 = getelementptr inbounds [32832 x i8]* @inbuf, i32 0, i64 %113, !dbg !837
  %115 = load i8* %114, align 1, !dbg !837
  %116 = zext i8 %115 to i32, !dbg !837
  br label %119, !dbg !837

; <label>:117                                     ; preds = %106
  %118 = call i32 @fill_inbuf(i32 0), !dbg !838
  br label %119, !dbg !838

; <label>:119                                     ; preds = %117, %110
  %120 = phi i32 [ %116, %110 ], [ %118, %117 ], !dbg !838
  %121 = trunc i32 %120 to i8, !dbg !838
  store i8 %121, i8* %flags, align 1, !dbg !838
  %122 = load i8* %flags, align 1, !dbg !839
  %123 = zext i8 %122 to i32, !dbg !839
  %124 = and i32 %123, 32, !dbg !839
  %125 = icmp ne i32 %124, 0, !dbg !839
  br i1 %125, label %126, label %130, !dbg !839

; <label>:126                                     ; preds = %119
  %127 = load %struct.__sFILE** @__stderrp, align 8, !dbg !840
  %128 = load i8** @progname, align 8, !dbg !840
  %129 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %127, i8* getelementptr inbounds ([50 x i8]* @.str64, i32 0, i32 0), i8* %128, i8* getelementptr inbounds ([1024 x i8]* @ifname, i32 0, i32 0)), !dbg !840
  store i32 1, i32* @exit_code, align 4, !dbg !842
  store i32 -1, i32* %1, !dbg !843
  br label %555, !dbg !843

; <label>:130                                     ; preds = %119
  %131 = load i8* %flags, align 1, !dbg !844
  %132 = zext i8 %131 to i32, !dbg !844
  %133 = and i32 %132, 2, !dbg !844
  %134 = icmp ne i32 %133, 0, !dbg !844
  br i1 %134, label %135, label %143, !dbg !844

; <label>:135                                     ; preds = %130
  %136 = load %struct.__sFILE** @__stderrp, align 8, !dbg !845
  %137 = load i8** @progname, align 8, !dbg !845
  %138 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %136, i8* getelementptr inbounds ([65 x i8]* @.str65, i32 0, i32 0), i8* %137, i8* getelementptr inbounds ([1024 x i8]* @ifname, i32 0, i32 0)), !dbg !845
  store i32 1, i32* @exit_code, align 4, !dbg !847
  %139 = load i32* @force, align 4, !dbg !848
  %140 = icmp sle i32 %139, 1, !dbg !848
  br i1 %140, label %141, label %142, !dbg !848

; <label>:141                                     ; preds = %135
  store i32 -1, i32* %1, !dbg !849
  br label %555, !dbg !849

; <label>:142                                     ; preds = %135
  br label %143, !dbg !850

; <label>:143                                     ; preds = %142, %130
  %144 = load i8* %flags, align 1, !dbg !851
  %145 = zext i8 %144 to i32, !dbg !851
  %146 = and i32 %145, 192, !dbg !851
  %147 = icmp ne i32 %146, 0, !dbg !851
  br i1 %147, label %148, label %158, !dbg !851

; <label>:148                                     ; preds = %143
  %149 = load %struct.__sFILE** @__stderrp, align 8, !dbg !852
  %150 = load i8** @progname, align 8, !dbg !852
  %151 = load i8* %flags, align 1, !dbg !852
  %152 = zext i8 %151 to i32, !dbg !852
  %153 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %149, i8* getelementptr inbounds ([52 x i8]* @.str66, i32 0, i32 0), i8* %150, i8* getelementptr inbounds ([1024 x i8]* @ifname, i32 0, i32 0), i32 %152), !dbg !852
  store i32 1, i32* @exit_code, align 4, !dbg !854
  %154 = load i32* @force, align 4, !dbg !855
  %155 = icmp sle i32 %154, 1, !dbg !855
  br i1 %155, label %156, label %157, !dbg !855

; <label>:156                                     ; preds = %148
  store i32 -1, i32* %1, !dbg !856
  br label %555, !dbg !856

; <label>:157                                     ; preds = %148
  br label %158, !dbg !857

; <label>:158                                     ; preds = %157, %143
  %159 = load i32* @inptr, align 4, !dbg !858
  %160 = load i32* @insize, align 4, !dbg !858
  %161 = icmp ult i32 %159, %160, !dbg !858
  br i1 %161, label %162, label %169, !dbg !858

; <label>:162                                     ; preds = %158
  %163 = load i32* @inptr, align 4, !dbg !858
  %164 = add i32 %163, 1, !dbg !858
  store i32 %164, i32* @inptr, align 4, !dbg !858
  %165 = zext i32 %163 to i64, !dbg !858
  %166 = getelementptr inbounds [32832 x i8]* @inbuf, i32 0, i64 %165, !dbg !858
  %167 = load i8* %166, align 1, !dbg !858
  %168 = zext i8 %167 to i32, !dbg !858
  br label %171, !dbg !858

; <label>:169                                     ; preds = %158
  %170 = call i32 @fill_inbuf(i32 0), !dbg !859
  br label %171, !dbg !859

; <label>:171                                     ; preds = %169, %162
  %172 = phi i32 [ %168, %162 ], [ %170, %169 ], !dbg !859
  %173 = sext i32 %172 to i64, !dbg !859
  store i64 %173, i64* %stamp, align 8, !dbg !859
  %174 = load i32* @inptr, align 4, !dbg !860
  %175 = load i32* @insize, align 4, !dbg !860
  %176 = icmp ult i32 %174, %175, !dbg !860
  br i1 %176, label %177, label %184, !dbg !860

; <label>:177                                     ; preds = %171
  %178 = load i32* @inptr, align 4, !dbg !860
  %179 = add i32 %178, 1, !dbg !860
  store i32 %179, i32* @inptr, align 4, !dbg !860
  %180 = zext i32 %178 to i64, !dbg !860
  %181 = getelementptr inbounds [32832 x i8]* @inbuf, i32 0, i64 %180, !dbg !860
  %182 = load i8* %181, align 1, !dbg !860
  %183 = zext i8 %182 to i32, !dbg !860
  br label %186, !dbg !860

; <label>:184                                     ; preds = %171
  %185 = call i32 @fill_inbuf(i32 0), !dbg !861
  br label %186, !dbg !861

; <label>:186                                     ; preds = %184, %177
  %187 = phi i32 [ %183, %177 ], [ %185, %184 ], !dbg !861
  %188 = sext i32 %187 to i64, !dbg !861
  %189 = shl i64 %188, 8, !dbg !861
  %190 = load i64* %stamp, align 8, !dbg !861
  %191 = or i64 %190, %189, !dbg !861
  store i64 %191, i64* %stamp, align 8, !dbg !861
  %192 = load i32* @inptr, align 4, !dbg !862
  %193 = load i32* @insize, align 4, !dbg !862
  %194 = icmp ult i32 %192, %193, !dbg !862
  br i1 %194, label %195, label %202, !dbg !862

; <label>:195                                     ; preds = %186
  %196 = load i32* @inptr, align 4, !dbg !862
  %197 = add i32 %196, 1, !dbg !862
  store i32 %197, i32* @inptr, align 4, !dbg !862
  %198 = zext i32 %196 to i64, !dbg !862
  %199 = getelementptr inbounds [32832 x i8]* @inbuf, i32 0, i64 %198, !dbg !862
  %200 = load i8* %199, align 1, !dbg !862
  %201 = zext i8 %200 to i32, !dbg !862
  br label %204, !dbg !862

; <label>:202                                     ; preds = %186
  %203 = call i32 @fill_inbuf(i32 0), !dbg !863
  br label %204, !dbg !863

; <label>:204                                     ; preds = %202, %195
  %205 = phi i32 [ %201, %195 ], [ %203, %202 ], !dbg !863
  %206 = sext i32 %205 to i64, !dbg !863
  %207 = shl i64 %206, 16, !dbg !863
  %208 = load i64* %stamp, align 8, !dbg !863
  %209 = or i64 %208, %207, !dbg !863
  store i64 %209, i64* %stamp, align 8, !dbg !863
  %210 = load i32* @inptr, align 4, !dbg !864
  %211 = load i32* @insize, align 4, !dbg !864
  %212 = icmp ult i32 %210, %211, !dbg !864
  br i1 %212, label %213, label %220, !dbg !864

; <label>:213                                     ; preds = %204
  %214 = load i32* @inptr, align 4, !dbg !864
  %215 = add i32 %214, 1, !dbg !864
  store i32 %215, i32* @inptr, align 4, !dbg !864
  %216 = zext i32 %214 to i64, !dbg !864
  %217 = getelementptr inbounds [32832 x i8]* @inbuf, i32 0, i64 %216, !dbg !864
  %218 = load i8* %217, align 1, !dbg !864
  %219 = zext i8 %218 to i32, !dbg !864
  br label %222, !dbg !864

; <label>:220                                     ; preds = %204
  %221 = call i32 @fill_inbuf(i32 0), !dbg !865
  br label %222, !dbg !865

; <label>:222                                     ; preds = %220, %213
  %223 = phi i32 [ %219, %213 ], [ %221, %220 ], !dbg !865
  %224 = sext i32 %223 to i64, !dbg !865
  %225 = shl i64 %224, 24, !dbg !865
  %226 = load i64* %stamp, align 8, !dbg !865
  %227 = or i64 %226, %225, !dbg !865
  store i64 %227, i64* %stamp, align 8, !dbg !865
  %228 = load i64* %stamp, align 8, !dbg !866
  %229 = icmp ne i64 %228, 0, !dbg !866
  br i1 %229, label %230, label %235, !dbg !866

; <label>:230                                     ; preds = %222
  %231 = load i32* @no_time, align 4, !dbg !866
  %232 = icmp ne i32 %231, 0, !dbg !866
  br i1 %232, label %235, label %233, !dbg !866

; <label>:233                                     ; preds = %230
  %234 = load i64* %stamp, align 8, !dbg !867
  store i64 %234, i64* @time_stamp, align 8, !dbg !867
  br label %235, !dbg !867

; <label>:235                                     ; preds = %233, %230, %222
  %236 = load i32* @inptr, align 4, !dbg !868
  %237 = load i32* @insize, align 4, !dbg !868
  %238 = icmp ult i32 %236, %237, !dbg !868
  br i1 %238, label %239, label %246, !dbg !868

; <label>:239                                     ; preds = %235
  %240 = load i32* @inptr, align 4, !dbg !868
  %241 = add i32 %240, 1, !dbg !868
  store i32 %241, i32* @inptr, align 4, !dbg !868
  %242 = zext i32 %240 to i64, !dbg !868
  %243 = getelementptr inbounds [32832 x i8]* @inbuf, i32 0, i64 %242, !dbg !868
  %244 = load i8* %243, align 1, !dbg !868
  %245 = zext i8 %244 to i32, !dbg !868
  br label %248, !dbg !868

; <label>:246                                     ; preds = %235
  %247 = call i32 @fill_inbuf(i32 0), !dbg !869
  br label %248, !dbg !869

; <label>:248                                     ; preds = %246, %239
  %249 = phi i32 [ %245, %239 ], [ %247, %246 ], !dbg !869
  %250 = load i32* @inptr, align 4, !dbg !870
  %251 = load i32* @insize, align 4, !dbg !870
  %252 = icmp ult i32 %250, %251, !dbg !870
  br i1 %252, label %253, label %260, !dbg !870

; <label>:253                                     ; preds = %248
  %254 = load i32* @inptr, align 4, !dbg !870
  %255 = add i32 %254, 1, !dbg !870
  store i32 %255, i32* @inptr, align 4, !dbg !870
  %256 = zext i32 %254 to i64, !dbg !870
  %257 = getelementptr inbounds [32832 x i8]* @inbuf, i32 0, i64 %256, !dbg !870
  %258 = load i8* %257, align 1, !dbg !870
  %259 = zext i8 %258 to i32, !dbg !870
  br label %262, !dbg !870

; <label>:260                                     ; preds = %248
  %261 = call i32 @fill_inbuf(i32 0), !dbg !871
  br label %262, !dbg !871

; <label>:262                                     ; preds = %260, %253
  %263 = phi i32 [ %259, %253 ], [ %261, %260 ], !dbg !871
  %264 = load i8* %flags, align 1, !dbg !872
  %265 = zext i8 %264 to i32, !dbg !872
  %266 = and i32 %265, 2, !dbg !872
  %267 = icmp ne i32 %266, 0, !dbg !872
  br i1 %267, label %268, label %308, !dbg !872

; <label>:268                                     ; preds = %262
  call void @llvm.dbg.declare(metadata !{i32* %part}, metadata !873), !dbg !875
  %269 = load i32* @inptr, align 4, !dbg !876
  %270 = load i32* @insize, align 4, !dbg !876
  %271 = icmp ult i32 %269, %270, !dbg !876
  br i1 %271, label %272, label %279, !dbg !876

; <label>:272                                     ; preds = %268
  %273 = load i32* @inptr, align 4, !dbg !876
  %274 = add i32 %273, 1, !dbg !876
  store i32 %274, i32* @inptr, align 4, !dbg !876
  %275 = zext i32 %273 to i64, !dbg !876
  %276 = getelementptr inbounds [32832 x i8]* @inbuf, i32 0, i64 %275, !dbg !876
  %277 = load i8* %276, align 1, !dbg !876
  %278 = zext i8 %277 to i32, !dbg !876
  br label %281, !dbg !876

; <label>:279                                     ; preds = %268
  %280 = call i32 @fill_inbuf(i32 0), !dbg !877
  br label %281, !dbg !877

; <label>:281                                     ; preds = %279, %272
  %282 = phi i32 [ %278, %272 ], [ %280, %279 ], !dbg !877
  store i32 %282, i32* %part, align 4, !dbg !877
  %283 = load i32* @inptr, align 4, !dbg !878
  %284 = load i32* @insize, align 4, !dbg !878
  %285 = icmp ult i32 %283, %284, !dbg !878
  br i1 %285, label %286, label %293, !dbg !878

; <label>:286                                     ; preds = %281
  %287 = load i32* @inptr, align 4, !dbg !878
  %288 = add i32 %287, 1, !dbg !878
  store i32 %288, i32* @inptr, align 4, !dbg !878
  %289 = zext i32 %287 to i64, !dbg !878
  %290 = getelementptr inbounds [32832 x i8]* @inbuf, i32 0, i64 %289, !dbg !878
  %291 = load i8* %290, align 1, !dbg !878
  %292 = zext i8 %291 to i32, !dbg !878
  br label %295, !dbg !878

; <label>:293                                     ; preds = %281
  %294 = call i32 @fill_inbuf(i32 0), !dbg !879
  br label %295, !dbg !879

; <label>:295                                     ; preds = %293, %286
  %296 = phi i32 [ %292, %286 ], [ %294, %293 ], !dbg !879
  %297 = shl i32 %296, 8, !dbg !879
  %298 = load i32* %part, align 4, !dbg !879
  %299 = or i32 %298, %297, !dbg !879
  store i32 %299, i32* %part, align 4, !dbg !879
  %300 = load i32* @verbose, align 4, !dbg !880
  %301 = icmp ne i32 %300, 0, !dbg !880
  br i1 %301, label %302, label %307, !dbg !880

; <label>:302                                     ; preds = %295
  %303 = load %struct.__sFILE** @__stderrp, align 8, !dbg !881
  %304 = load i8** @progname, align 8, !dbg !881
  %305 = load i32* %part, align 4, !dbg !881
  %306 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %303, i8* getelementptr inbounds ([24 x i8]* @.str67, i32 0, i32 0), i8* %304, i8* getelementptr inbounds ([1024 x i8]* @ifname, i32 0, i32 0), i32 %305), !dbg !881
  br label %307, !dbg !883

; <label>:307                                     ; preds = %302, %295
  br label %308, !dbg !884

; <label>:308                                     ; preds = %307, %262
  %309 = load i8* %flags, align 1, !dbg !885
  %310 = zext i8 %309 to i32, !dbg !885
  %311 = and i32 %310, 4, !dbg !885
  %312 = icmp ne i32 %311, 0, !dbg !885
  br i1 %312, label %313, label %373, !dbg !885

; <label>:313                                     ; preds = %308
  call void @llvm.dbg.declare(metadata !{i32* %len}, metadata !886), !dbg !888
  %314 = load i32* @inptr, align 4, !dbg !889
  %315 = load i32* @insize, align 4, !dbg !889
  %316 = icmp ult i32 %314, %315, !dbg !889
  br i1 %316, label %317, label %324, !dbg !889

; <label>:317                                     ; preds = %313
  %318 = load i32* @inptr, align 4, !dbg !889
  %319 = add i32 %318, 1, !dbg !889
  store i32 %319, i32* @inptr, align 4, !dbg !889
  %320 = zext i32 %318 to i64, !dbg !889
  %321 = getelementptr inbounds [32832 x i8]* @inbuf, i32 0, i64 %320, !dbg !889
  %322 = load i8* %321, align 1, !dbg !889
  %323 = zext i8 %322 to i32, !dbg !889
  br label %326, !dbg !889

; <label>:324                                     ; preds = %313
  %325 = call i32 @fill_inbuf(i32 0), !dbg !890
  br label %326, !dbg !890

; <label>:326                                     ; preds = %324, %317
  %327 = phi i32 [ %323, %317 ], [ %325, %324 ], !dbg !890
  store i32 %327, i32* %len, align 4, !dbg !890
  %328 = load i32* @inptr, align 4, !dbg !891
  %329 = load i32* @insize, align 4, !dbg !891
  %330 = icmp ult i32 %328, %329, !dbg !891
  br i1 %330, label %331, label %338, !dbg !891

; <label>:331                                     ; preds = %326
  %332 = load i32* @inptr, align 4, !dbg !891
  %333 = add i32 %332, 1, !dbg !891
  store i32 %333, i32* @inptr, align 4, !dbg !891
  %334 = zext i32 %332 to i64, !dbg !891
  %335 = getelementptr inbounds [32832 x i8]* @inbuf, i32 0, i64 %334, !dbg !891
  %336 = load i8* %335, align 1, !dbg !891
  %337 = zext i8 %336 to i32, !dbg !891
  br label %340, !dbg !891

; <label>:338                                     ; preds = %326
  %339 = call i32 @fill_inbuf(i32 0), !dbg !892
  br label %340, !dbg !892

; <label>:340                                     ; preds = %338, %331
  %341 = phi i32 [ %337, %331 ], [ %339, %338 ], !dbg !892
  %342 = shl i32 %341, 8, !dbg !892
  %343 = load i32* %len, align 4, !dbg !892
  %344 = or i32 %343, %342, !dbg !892
  store i32 %344, i32* %len, align 4, !dbg !892
  %345 = load i32* @verbose, align 4, !dbg !893
  %346 = icmp ne i32 %345, 0, !dbg !893
  br i1 %346, label %347, label %352, !dbg !893

; <label>:347                                     ; preds = %340
  %348 = load %struct.__sFILE** @__stderrp, align 8, !dbg !894
  %349 = load i8** @progname, align 8, !dbg !894
  %350 = load i32* %len, align 4, !dbg !894
  %351 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %348, i8* getelementptr inbounds ([41 x i8]* @.str68, i32 0, i32 0), i8* %349, i8* getelementptr inbounds ([1024 x i8]* @ifname, i32 0, i32 0), i32 %350), !dbg !894
  br label %352, !dbg !896

; <label>:352                                     ; preds = %347, %340
  br label %353, !dbg !897

; <label>:353                                     ; preds = %370, %352
  %354 = load i32* %len, align 4, !dbg !897
  %355 = add i32 %354, -1, !dbg !897
  store i32 %355, i32* %len, align 4, !dbg !897
  %356 = icmp ne i32 %354, 0, !dbg !897
  br i1 %356, label %357, label %372, !dbg !897

; <label>:357                                     ; preds = %353
  %358 = load i32* @inptr, align 4, !dbg !898
  %359 = load i32* @insize, align 4, !dbg !898
  %360 = icmp ult i32 %358, %359, !dbg !898
  br i1 %360, label %361, label %368, !dbg !898

; <label>:361                                     ; preds = %357
  %362 = load i32* @inptr, align 4, !dbg !898
  %363 = add i32 %362, 1, !dbg !898
  store i32 %363, i32* @inptr, align 4, !dbg !898
  %364 = zext i32 %362 to i64, !dbg !898
  %365 = getelementptr inbounds [32832 x i8]* @inbuf, i32 0, i64 %364, !dbg !898
  %366 = load i8* %365, align 1, !dbg !898
  %367 = zext i8 %366 to i32, !dbg !898
  br label %370, !dbg !898

; <label>:368                                     ; preds = %357
  %369 = call i32 @fill_inbuf(i32 0), !dbg !899
  br label %370, !dbg !899

; <label>:370                                     ; preds = %368, %361
  %371 = phi i32 [ %367, %361 ], [ %369, %368 ], !dbg !899
  br label %353, !dbg !899

; <label>:372                                     ; preds = %353
  br label %373, !dbg !900

; <label>:373                                     ; preds = %372, %308
  %374 = load i8* %flags, align 1, !dbg !901
  %375 = zext i8 %374 to i32, !dbg !901
  %376 = and i32 %375, 8, !dbg !901
  %377 = icmp ne i32 %376, 0, !dbg !901
  br i1 %377, label %378, label %453, !dbg !901

; <label>:378                                     ; preds = %373
  %379 = load i32* @no_name, align 4, !dbg !902
  %380 = icmp ne i32 %379, 0, !dbg !902
  br i1 %380, label %390, label %381, !dbg !902

; <label>:381                                     ; preds = %378
  %382 = load i32* @to_stdout, align 4, !dbg !902
  %383 = icmp ne i32 %382, 0, !dbg !902
  br i1 %383, label %384, label %387, !dbg !902

; <label>:384                                     ; preds = %381
  %385 = load i32* @list, align 4, !dbg !902
  %386 = icmp ne i32 %385, 0, !dbg !902
  br i1 %386, label %387, label %390, !dbg !902

; <label>:387                                     ; preds = %384, %381
  %388 = load i32* @part_nb, align 4, !dbg !902
  %389 = icmp sgt i32 %388, 1, !dbg !902
  br i1 %389, label %390, label %412, !dbg !902

; <label>:390                                     ; preds = %387, %384, %378
  call void @llvm.dbg.declare(metadata !{i8* %c}, metadata !904), !dbg !906
  br label %391, !dbg !907

; <label>:391                                     ; preds = %407, %390
  %392 = load i32* @inptr, align 4, !dbg !908
  %393 = load i32* @insize, align 4, !dbg !908
  %394 = icmp ult i32 %392, %393, !dbg !908
  br i1 %394, label %395, label %402, !dbg !908

; <label>:395                                     ; preds = %391
  %396 = load i32* @inptr, align 4, !dbg !908
  %397 = add i32 %396, 1, !dbg !908
  store i32 %397, i32* @inptr, align 4, !dbg !908
  %398 = zext i32 %396 to i64, !dbg !908
  %399 = getelementptr inbounds [32832 x i8]* @inbuf, i32 0, i64 %398, !dbg !908
  %400 = load i8* %399, align 1, !dbg !908
  %401 = zext i8 %400 to i32, !dbg !908
  br label %404, !dbg !908

; <label>:402                                     ; preds = %391
  %403 = call i32 @fill_inbuf(i32 0), !dbg !910
  br label %404, !dbg !910

; <label>:404                                     ; preds = %402, %395
  %405 = phi i32 [ %401, %395 ], [ %403, %402 ], !dbg !910
  %406 = trunc i32 %405 to i8, !dbg !910
  store i8 %406, i8* %c, align 1, !dbg !910
  br label %407, !dbg !911

; <label>:407                                     ; preds = %404
  %408 = load i8* %c, align 1, !dbg !911
  %409 = sext i8 %408 to i32, !dbg !911
  %410 = icmp ne i32 %409, 0, !dbg !911
  br i1 %410, label %391, label %411, !dbg !911

; <label>:411                                     ; preds = %407
  br label %452, !dbg !912

; <label>:412                                     ; preds = %387
  call void @llvm.dbg.declare(metadata !{i8** %p}, metadata !913), !dbg !915
  %413 = call i8* @basename(i8* getelementptr inbounds ([1024 x i8]* @ofname, i32 0, i32 0)), !dbg !916
  store i8* %413, i8** %p, align 8, !dbg !916
  call void @llvm.dbg.declare(metadata !{i8** %base}, metadata !917), !dbg !918
  %414 = load i8** %p, align 8, !dbg !919
  store i8* %414, i8** %base, align 8, !dbg !919
  br label %415, !dbg !920

; <label>:415                                     ; preds = %442, %412
  %416 = load i32* @inptr, align 4, !dbg !922
  %417 = load i32* @insize, align 4, !dbg !922
  %418 = icmp ult i32 %416, %417, !dbg !922
  br i1 %418, label %419, label %426, !dbg !922

; <label>:419                                     ; preds = %415
  %420 = load i32* @inptr, align 4, !dbg !922
  %421 = add i32 %420, 1, !dbg !922
  store i32 %421, i32* @inptr, align 4, !dbg !922
  %422 = zext i32 %420 to i64, !dbg !922
  %423 = getelementptr inbounds [32832 x i8]* @inbuf, i32 0, i64 %422, !dbg !922
  %424 = load i8* %423, align 1, !dbg !922
  %425 = zext i8 %424 to i32, !dbg !922
  br label %428, !dbg !922

; <label>:426                                     ; preds = %415
  %427 = call i32 @fill_inbuf(i32 0), !dbg !924
  br label %428, !dbg !924

; <label>:428                                     ; preds = %426, %419
  %429 = phi i32 [ %425, %419 ], [ %427, %426 ], !dbg !924
  %430 = trunc i32 %429 to i8, !dbg !924
  %431 = load i8** %p, align 8, !dbg !924
  store i8 %430, i8* %431, align 1, !dbg !924
  %432 = load i8** %p, align 8, !dbg !925
  %433 = getelementptr inbounds i8* %432, i32 1, !dbg !925
  store i8* %433, i8** %p, align 8, !dbg !925
  %434 = load i8* %432, align 1, !dbg !925
  %435 = sext i8 %434 to i32, !dbg !925
  %436 = icmp eq i32 %435, 0, !dbg !925
  br i1 %436, label %437, label %438, !dbg !925

; <label>:437                                     ; preds = %428
  br label %443, !dbg !926

; <label>:438                                     ; preds = %428
  %439 = load i8** %p, align 8, !dbg !927
  %440 = icmp uge i8* %439, getelementptr inbounds ([1024 x i8]* @ofname, i64 1, i64 0), !dbg !927
  br i1 %440, label %441, label %442, !dbg !927

; <label>:441                                     ; preds = %438
  call void @error(i8* getelementptr inbounds ([39 x i8]* @.str69, i32 0, i32 0)), !dbg !928
  br label %442, !dbg !930

; <label>:442                                     ; preds = %441, %438
  br label %415, !dbg !931

; <label>:443                                     ; preds = %437
  %444 = load i32* @list, align 4, !dbg !932
  %445 = icmp ne i32 %444, 0, !dbg !932
  br i1 %445, label %451, label %446, !dbg !932

; <label>:446                                     ; preds = %443
  %447 = load i8** %base, align 8, !dbg !933
  %448 = icmp ne i8* %447, null, !dbg !933
  br i1 %448, label %449, label %450, !dbg !933

; <label>:449                                     ; preds = %446
  store i32 0, i32* @list, align 4, !dbg !935
  br label %450, !dbg !935

; <label>:450                                     ; preds = %449, %446
  br label %451, !dbg !936

; <label>:451                                     ; preds = %450, %443
  br label %452

; <label>:452                                     ; preds = %451, %411
  br label %453, !dbg !937

; <label>:453                                     ; preds = %452, %373
  %454 = load i8* %flags, align 1, !dbg !938
  %455 = zext i8 %454 to i32, !dbg !938
  %456 = and i32 %455, 16, !dbg !938
  %457 = icmp ne i32 %456, 0, !dbg !938
  br i1 %457, label %458, label %477, !dbg !938

; <label>:458                                     ; preds = %453
  br label %459, !dbg !939

; <label>:459                                     ; preds = %475, %458
  %460 = load i32* @inptr, align 4, !dbg !939
  %461 = load i32* @insize, align 4, !dbg !939
  %462 = icmp ult i32 %460, %461, !dbg !939
  br i1 %462, label %463, label %470, !dbg !939

; <label>:463                                     ; preds = %459
  %464 = load i32* @inptr, align 4, !dbg !939
  %465 = add i32 %464, 1, !dbg !939
  store i32 %465, i32* @inptr, align 4, !dbg !939
  %466 = zext i32 %464 to i64, !dbg !939
  %467 = getelementptr inbounds [32832 x i8]* @inbuf, i32 0, i64 %466, !dbg !939
  %468 = load i8* %467, align 1, !dbg !939
  %469 = zext i8 %468 to i32, !dbg !939
  br label %472, !dbg !939

; <label>:470                                     ; preds = %459
  %471 = call i32 @fill_inbuf(i32 0), !dbg !941
  br label %472, !dbg !941

; <label>:472                                     ; preds = %470, %463
  %473 = phi i32 [ %469, %463 ], [ %471, %470 ], !dbg !941
  %474 = icmp ne i32 %473, 0, !dbg !941
  br i1 %474, label %475, label %476, !dbg !941

; <label>:475                                     ; preds = %472
  br label %459, !dbg !941

; <label>:476                                     ; preds = %472
  br label %477, !dbg !942

; <label>:477                                     ; preds = %476, %453
  %478 = load i32* @part_nb, align 4, !dbg !943
  %479 = icmp eq i32 %478, 1, !dbg !943
  br i1 %479, label %480, label %484, !dbg !943

; <label>:480                                     ; preds = %477
  %481 = load i32* @inptr, align 4, !dbg !944
  %482 = zext i32 %481 to i64, !dbg !944
  %483 = add i64 %482, 16, !dbg !944
  store i64 %483, i64* @header_bytes, align 8, !dbg !944
  br label %484, !dbg !946

; <label>:484                                     ; preds = %480, %477
  br label %531, !dbg !947

; <label>:485                                     ; preds = %80
  %486 = getelementptr inbounds [2 x i8]* %magic, i32 0, i32 0, !dbg !948
  %487 = call i32 @memcmp(i8* %486, i8* getelementptr inbounds ([5 x i8]* @.str70, i32 0, i32 0), i64 2) nounwind readonly, !dbg !948
  %488 = icmp eq i32 %487, 0, !dbg !948
  br i1 %488, label %489, label %501, !dbg !948

; <label>:489                                     ; preds = %485
  %490 = load i32* @inptr, align 4, !dbg !948
  %491 = icmp eq i32 %490, 2, !dbg !948
  br i1 %491, label %492, label %501, !dbg !948

; <label>:492                                     ; preds = %489
  %493 = call i32 @memcmp(i8* getelementptr inbounds ([32832 x i8]* @inbuf, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str70, i32 0, i32 0), i64 4) nounwind readonly, !dbg !949
  %494 = icmp eq i32 %493, 0, !dbg !949
  br i1 %494, label %495, label %501, !dbg !949

; <label>:495                                     ; preds = %492
  store i32 0, i32* @inptr, align 4, !dbg !950
  store i32 (i32, i32)* @unzip, i32 (i32, i32)** @work, align 8, !dbg !952
  %496 = load i32* %2, align 4, !dbg !953
  %497 = call i32 @check_zipfile(i32 %496), !dbg !953
  %498 = icmp ne i32 %497, 0, !dbg !953
  br i1 %498, label %499, label %500, !dbg !953

; <label>:499                                     ; preds = %495
  store i32 -1, i32* %1, !dbg !954
  br label %555, !dbg !954

; <label>:500                                     ; preds = %495
  store i32 1, i32* @last_member, align 4, !dbg !955
  br label %530, !dbg !956

; <label>:501                                     ; preds = %492, %489, %485
  %502 = getelementptr inbounds [2 x i8]* %magic, i32 0, i32 0, !dbg !957
  %503 = call i32 @memcmp(i8* %502, i8* getelementptr inbounds ([3 x i8]* @.str71, i32 0, i32 0), i64 2) nounwind readonly, !dbg !957
  %504 = icmp eq i32 %503, 0, !dbg !957
  br i1 %504, label %505, label %506, !dbg !957

; <label>:505                                     ; preds = %501
  store i32 (i32, i32)* @unpack, i32 (i32, i32)** @work, align 8, !dbg !958
  store i32 2, i32* @method, align 4, !dbg !960
  br label %529, !dbg !961

; <label>:506                                     ; preds = %501
  %507 = getelementptr inbounds [2 x i8]* %magic, i32 0, i32 0, !dbg !962
  %508 = call i32 @memcmp(i8* %507, i8* getelementptr inbounds ([3 x i8]* @.str72, i32 0, i32 0), i64 2) nounwind readonly, !dbg !962
  %509 = icmp eq i32 %508, 0, !dbg !962
  br i1 %509, label %510, label %511, !dbg !962

; <label>:510                                     ; preds = %506
  store i32 (i32, i32)* @unlzw, i32 (i32, i32)** @work, align 8, !dbg !963
  store i32 1, i32* @method, align 4, !dbg !965
  store i32 1, i32* @last_member, align 4, !dbg !966
  br label %528, !dbg !967

; <label>:511                                     ; preds = %506
  %512 = getelementptr inbounds [2 x i8]* %magic, i32 0, i32 0, !dbg !968
  %513 = call i32 @memcmp(i8* %512, i8* getelementptr inbounds ([3 x i8]* @.str73, i32 0, i32 0), i64 2) nounwind readonly, !dbg !968
  %514 = icmp eq i32 %513, 0, !dbg !968
  br i1 %514, label %515, label %516, !dbg !968

; <label>:515                                     ; preds = %511
  store i32 (i32, i32)* @unlzh, i32 (i32, i32)** @work, align 8, !dbg !969
  store i32 3, i32* @method, align 4, !dbg !971
  store i32 1, i32* @last_member, align 4, !dbg !972
  br label %527, !dbg !973

; <label>:516                                     ; preds = %511
  %517 = load i32* @force, align 4, !dbg !974
  %518 = icmp ne i32 %517, 0, !dbg !974
  br i1 %518, label %519, label %526, !dbg !974

; <label>:519                                     ; preds = %516
  %520 = load i32* @to_stdout, align 4, !dbg !974
  %521 = icmp ne i32 %520, 0, !dbg !974
  br i1 %521, label %522, label %526, !dbg !974

; <label>:522                                     ; preds = %519
  %523 = load i32* @list, align 4, !dbg !974
  %524 = icmp ne i32 %523, 0, !dbg !974
  br i1 %524, label %526, label %525, !dbg !974

; <label>:525                                     ; preds = %522
  store i32 0, i32* @method, align 4, !dbg !975
  store i32 (i32, i32)* @copy, i32 (i32, i32)** @work, align 8, !dbg !977
  store i32 0, i32* @inptr, align 4, !dbg !978
  store i32 1, i32* @last_member, align 4, !dbg !979
  br label %526, !dbg !980

; <label>:526                                     ; preds = %525, %522, %519, %516
  br label %527

; <label>:527                                     ; preds = %526, %515
  br label %528

; <label>:528                                     ; preds = %527, %510
  br label %529

; <label>:529                                     ; preds = %528, %505
  br label %530

; <label>:530                                     ; preds = %529, %500
  br label %531

; <label>:531                                     ; preds = %530, %484
  %532 = load i32* @method, align 4, !dbg !981
  %533 = icmp sge i32 %532, 0, !dbg !981
  br i1 %533, label %534, label %536, !dbg !981

; <label>:534                                     ; preds = %531
  %535 = load i32* @method, align 4, !dbg !982
  store i32 %535, i32* %1, !dbg !982
  br label %555, !dbg !982

; <label>:536                                     ; preds = %531
  %537 = load i32* @part_nb, align 4, !dbg !983
  %538 = icmp eq i32 %537, 1, !dbg !983
  br i1 %538, label %539, label %543, !dbg !983

; <label>:539                                     ; preds = %536
  %540 = load %struct.__sFILE** @__stderrp, align 8, !dbg !984
  %541 = load i8** @progname, align 8, !dbg !984
  %542 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %540, i8* getelementptr inbounds ([29 x i8]* @.str74, i32 0, i32 0), i8* %541, i8* getelementptr inbounds ([1024 x i8]* @ifname, i32 0, i32 0)), !dbg !984
  store i32 1, i32* @exit_code, align 4, !dbg !986
  store i32 -1, i32* %1, !dbg !987
  br label %555, !dbg !987

; <label>:543                                     ; preds = %536
  %544 = load i32* @quiet, align 4, !dbg !988
  %545 = icmp ne i32 %544, 0, !dbg !988
  br i1 %545, label %550, label %546, !dbg !988

; <label>:546                                     ; preds = %543
  %547 = load %struct.__sFILE** @__stderrp, align 8, !dbg !988
  %548 = load i8** @progname, align 8, !dbg !988
  %549 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %547, i8* getelementptr inbounds ([53 x i8]* @.str75, i32 0, i32 0), i8* %548, i8* getelementptr inbounds ([1024 x i8]* @ifname, i32 0, i32 0)), !dbg !988
  br label %550, !dbg !988

; <label>:550                                     ; preds = %546, %543
  %551 = load i32* @exit_code, align 4, !dbg !988
  %552 = icmp eq i32 %551, 0, !dbg !988
  br i1 %552, label %553, label %554, !dbg !988

; <label>:553                                     ; preds = %550
  store i32 2, i32* @exit_code, align 4, !dbg !988
  br label %554, !dbg !988

; <label>:554                                     ; preds = %553, %550
  store i32 -2, i32* %1, !dbg !991
  br label %555, !dbg !991

; <label>:555                                     ; preds = %554, %539, %534, %499, %156, %141, %126, %101
  %556 = load i32* %1, !dbg !992
  ret i32 %556, !dbg !992
}

declare i32 @close(i32)

declare i32 @fileno(%struct.__sFILE*)

define internal i32 @create_outfile() nounwind uwtable {
  %1 = alloca i32, align 4
  %ostat = alloca %struct.stat, align 8
  %flags = alloca i32, align 4
  call void @llvm.dbg.declare(metadata !{%struct.stat* %ostat}, metadata !993), !dbg !995
  call void @llvm.dbg.declare(metadata !{i32* %flags}, metadata !996), !dbg !997
  store i32 2561, i32* %flags, align 4, !dbg !998
  %2 = load i32* @ascii, align 4, !dbg !999
  %3 = icmp ne i32 %2, 0, !dbg !999
  br i1 %3, label %4, label %9, !dbg !999

; <label>:4                                       ; preds = %0
  %5 = load i32* @decompress, align 4, !dbg !999
  %6 = icmp ne i32 %5, 0, !dbg !999
  br i1 %6, label %7, label %9, !dbg !999

; <label>:7                                       ; preds = %4
  %8 = load i32* %flags, align 4, !dbg !1000
  store i32 %8, i32* %flags, align 4, !dbg !1000
  br label %9, !dbg !1002

; <label>:9                                       ; preds = %7, %4, %0
  br label %10, !dbg !1003

; <label>:10                                      ; preds = %56, %9
  %11 = call i32 @check_ofname(), !dbg !1005
  %12 = icmp ne i32 %11, 0, !dbg !1005
  br i1 %12, label %13, label %16, !dbg !1005

; <label>:13                                      ; preds = %10
  %14 = load i32* @ifd, align 4, !dbg !1007
  %15 = call i32 @close(i32 %14), !dbg !1007
  store i32 1, i32* %1, !dbg !1009
  br label %60, !dbg !1009

; <label>:16                                      ; preds = %10
  store i32 1, i32* @remove_ofname, align 4, !dbg !1010
  %17 = load i32* %flags, align 4, !dbg !1011
  %18 = call i32 (i8*, i32, ...)* @open(i8* getelementptr inbounds ([1024 x i8]* @ofname, i32 0, i32 0), i32 %17, i32 384), !dbg !1011
  store i32 %18, i32* @ofd, align 4, !dbg !1011
  %19 = load i32* @ofd, align 4, !dbg !1012
  %20 = icmp eq i32 %19, -1, !dbg !1012
  br i1 %20, label %21, label %24, !dbg !1012

; <label>:21                                      ; preds = %16
  call void @perror(i8* getelementptr inbounds ([1024 x i8]* @ofname, i32 0, i32 0)), !dbg !1013
  %22 = load i32* @ifd, align 4, !dbg !1015
  %23 = call i32 @close(i32 %22), !dbg !1015
  store i32 1, i32* @exit_code, align 4, !dbg !1016
  store i32 1, i32* %1, !dbg !1017
  br label %60, !dbg !1017

; <label>:24                                      ; preds = %16
  %25 = load i32* @ofd, align 4, !dbg !1018
  %26 = call i32 @fstat(i32 %25, %struct.stat* %ostat), !dbg !1018
  %27 = icmp ne i32 %26, 0, !dbg !1018
  br i1 %27, label %28, label %37, !dbg !1018

; <label>:28                                      ; preds = %24
  %29 = load %struct.__sFILE** @__stderrp, align 8, !dbg !1019
  %30 = load i8** @progname, align 8, !dbg !1019
  %31 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %29, i8* getelementptr inbounds ([5 x i8]* @.str39, i32 0, i32 0), i8* %30), !dbg !1019
  call void @perror(i8* getelementptr inbounds ([1024 x i8]* @ofname, i32 0, i32 0)), !dbg !1021
  %32 = load i32* @ifd, align 4, !dbg !1022
  %33 = call i32 @close(i32 %32), !dbg !1022
  %34 = load i32* @ofd, align 4, !dbg !1023
  %35 = call i32 @close(i32 %34), !dbg !1023
  %36 = call i32 @unlink(i8* getelementptr inbounds ([1024 x i8]* @ofname, i32 0, i32 0)), !dbg !1024
  store i32 1, i32* @exit_code, align 4, !dbg !1025
  store i32 1, i32* %1, !dbg !1026
  br label %60, !dbg !1026

; <label>:37                                      ; preds = %24
  %38 = call i32 @name_too_long(i8* getelementptr inbounds ([1024 x i8]* @ofname, i32 0, i32 0), %struct.stat* %ostat), !dbg !1027
  %39 = icmp ne i32 %38, 0, !dbg !1027
  br i1 %39, label %41, label %40, !dbg !1027

; <label>:40                                      ; preds = %37
  store i32 0, i32* %1, !dbg !1028
  br label %60, !dbg !1028

; <label>:41                                      ; preds = %37
  %42 = load i32* @decompress, align 4, !dbg !1029
  %43 = icmp ne i32 %42, 0, !dbg !1029
  br i1 %43, label %44, label %56, !dbg !1029

; <label>:44                                      ; preds = %41
  %45 = load i32* @quiet, align 4, !dbg !1030
  %46 = icmp ne i32 %45, 0, !dbg !1030
  br i1 %46, label %51, label %47, !dbg !1030

; <label>:47                                      ; preds = %44
  %48 = load %struct.__sFILE** @__stderrp, align 8, !dbg !1030
  %49 = load i8** @progname, align 8, !dbg !1030
  %50 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %48, i8* getelementptr inbounds ([33 x i8]* @.str87, i32 0, i32 0), i8* %49, i8* getelementptr inbounds ([1024 x i8]* @ofname, i32 0, i32 0)), !dbg !1030
  br label %51, !dbg !1030

; <label>:51                                      ; preds = %47, %44
  %52 = load i32* @exit_code, align 4, !dbg !1030
  %53 = icmp eq i32 %52, 0, !dbg !1030
  br i1 %53, label %54, label %55, !dbg !1030

; <label>:54                                      ; preds = %51
  store i32 2, i32* @exit_code, align 4, !dbg !1030
  br label %55, !dbg !1030

; <label>:55                                      ; preds = %54, %51
  store i32 0, i32* %1, !dbg !1033
  br label %60, !dbg !1033

; <label>:56                                      ; preds = %41
  %57 = load i32* @ofd, align 4, !dbg !1034
  %58 = call i32 @close(i32 %57), !dbg !1034
  %59 = call i32 @unlink(i8* getelementptr inbounds ([1024 x i8]* @ofname, i32 0, i32 0)), !dbg !1035
  call void @shorten_name(i8* getelementptr inbounds ([1024 x i8]* @ofname, i32 0, i32 0)), !dbg !1036
  br label %10, !dbg !1037

; <label>:60                                      ; preds = %55, %40, %28, %21, %13
  %61 = load i32* %1, !dbg !1038
  ret i32 %61, !dbg !1038
}

declare void @write_error()

declare i32 @unlink(i8*)

declare void @display_ratio(i64, i64, %struct.__sFILE*)

define internal void @copy_stat(%struct.stat* %ifstat) nounwind uwtable {
  %1 = alloca %struct.stat*, align 8
  store %struct.stat* %ifstat, %struct.stat** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.stat** %1}, metadata !1039), !dbg !1040
  %2 = load i32* @decompress, align 4, !dbg !1041
  %3 = icmp ne i32 %2, 0, !dbg !1041
  br i1 %3, label %4, label %25, !dbg !1041

; <label>:4                                       ; preds = %0
  %5 = load i64* @time_stamp, align 8, !dbg !1041
  %6 = icmp ne i64 %5, 0, !dbg !1041
  br i1 %6, label %7, label %25, !dbg !1041

; <label>:7                                       ; preds = %4
  %8 = load %struct.stat** %1, align 8, !dbg !1041
  %9 = getelementptr inbounds %struct.stat* %8, i32 0, i32 8, !dbg !1041
  %10 = getelementptr inbounds %struct.timespec* %9, i32 0, i32 0, !dbg !1041
  %11 = load i64* %10, align 8, !dbg !1041
  %12 = load i64* @time_stamp, align 8, !dbg !1041
  %13 = icmp ne i64 %11, %12, !dbg !1041
  br i1 %13, label %14, label %25, !dbg !1041

; <label>:14                                      ; preds = %7
  %15 = load i64* @time_stamp, align 8, !dbg !1043
  %16 = load %struct.stat** %1, align 8, !dbg !1043
  %17 = getelementptr inbounds %struct.stat* %16, i32 0, i32 8, !dbg !1043
  %18 = getelementptr inbounds %struct.timespec* %17, i32 0, i32 0, !dbg !1043
  store i64 %15, i64* %18, align 8, !dbg !1043
  %19 = load i32* @verbose, align 4, !dbg !1045
  %20 = icmp sgt i32 %19, 1, !dbg !1045
  br i1 %20, label %21, label %24, !dbg !1045

; <label>:21                                      ; preds = %14
  %22 = load %struct.__sFILE** @__stderrp, align 8, !dbg !1046
  %23 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %22, i8* getelementptr inbounds ([25 x i8]* @.str48, i32 0, i32 0), i8* getelementptr inbounds ([1024 x i8]* @ofname, i32 0, i32 0)), !dbg !1046
  br label %24, !dbg !1048

; <label>:24                                      ; preds = %21, %14
  br label %25, !dbg !1049

; <label>:25                                      ; preds = %24, %7, %4, %0
  %26 = load %struct.stat** %1, align 8, !dbg !1050
  call void (...)* bitcast (void (i8*, %struct.stat*)* @reset_times to void (...)*)(i8* getelementptr inbounds ([1024 x i8]* @ofname, i32 0, i32 0), %struct.stat* %26), !dbg !1050
  %27 = load %struct.stat** %1, align 8, !dbg !1051
  %28 = getelementptr inbounds %struct.stat* %27, i32 0, i32 2, !dbg !1051
  %29 = load i16* %28, align 2, !dbg !1051
  %30 = zext i16 %29 to i32, !dbg !1051
  %31 = and i32 %30, 4095, !dbg !1051
  %32 = trunc i32 %31 to i16, !dbg !1051
  %33 = call i32 @chmod(i8* getelementptr inbounds ([1024 x i8]* @ofname, i32 0, i32 0), i16 zeroext %32), !dbg !1051
  %34 = icmp ne i32 %33, 0, !dbg !1051
  br i1 %34, label %35, label %51, !dbg !1051

; <label>:35                                      ; preds = %25
  %36 = load i32* @quiet, align 4, !dbg !1052
  %37 = icmp ne i32 %36, 0, !dbg !1052
  br i1 %37, label %42, label %38, !dbg !1052

; <label>:38                                      ; preds = %35
  %39 = load %struct.__sFILE** @__stderrp, align 8, !dbg !1052
  %40 = load i8** @progname, align 8, !dbg !1052
  %41 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %39, i8* getelementptr inbounds ([5 x i8]* @.str39, i32 0, i32 0), i8* %40), !dbg !1052
  br label %42, !dbg !1052

; <label>:42                                      ; preds = %38, %35
  %43 = load i32* @exit_code, align 4, !dbg !1052
  %44 = icmp eq i32 %43, 0, !dbg !1052
  br i1 %44, label %45, label %46, !dbg !1052

; <label>:45                                      ; preds = %42
  store i32 2, i32* @exit_code, align 4, !dbg !1052
  br label %46, !dbg !1052

; <label>:46                                      ; preds = %45, %42
  %47 = load i32* @quiet, align 4, !dbg !1055
  %48 = icmp ne i32 %47, 0, !dbg !1055
  br i1 %48, label %50, label %49, !dbg !1055

; <label>:49                                      ; preds = %46
  call void @perror(i8* getelementptr inbounds ([1024 x i8]* @ofname, i32 0, i32 0)), !dbg !1056
  br label %50, !dbg !1056

; <label>:50                                      ; preds = %49, %46
  br label %51, !dbg !1057

; <label>:51                                      ; preds = %50, %25
  %52 = load %struct.stat** %1, align 8, !dbg !1058
  %53 = getelementptr inbounds %struct.stat* %52, i32 0, i32 4, !dbg !1058
  %54 = load i32* %53, align 4, !dbg !1058
  %55 = load %struct.stat** %1, align 8, !dbg !1058
  %56 = getelementptr inbounds %struct.stat* %55, i32 0, i32 5, !dbg !1058
  %57 = load i32* %56, align 4, !dbg !1058
  %58 = call i32 @chown(i8* getelementptr inbounds ([1024 x i8]* @ofname, i32 0, i32 0), i32 %54, i32 %57), !dbg !1058
  store i32 0, i32* @remove_ofname, align 4, !dbg !1059
  %59 = call i32 @chmod(i8* getelementptr inbounds ([1024 x i8]* @ifname, i32 0, i32 0), i16 zeroext 511), !dbg !1060
  %60 = call i32 @unlink(i8* getelementptr inbounds ([1024 x i8]* @ifname, i32 0, i32 0)), !dbg !1061
  %61 = icmp ne i32 %60, 0, !dbg !1061
  br i1 %61, label %62, label %78, !dbg !1061

; <label>:62                                      ; preds = %51
  %63 = load i32* @quiet, align 4, !dbg !1062
  %64 = icmp ne i32 %63, 0, !dbg !1062
  br i1 %64, label %69, label %65, !dbg !1062

; <label>:65                                      ; preds = %62
  %66 = load %struct.__sFILE** @__stderrp, align 8, !dbg !1062
  %67 = load i8** @progname, align 8, !dbg !1062
  %68 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %66, i8* getelementptr inbounds ([5 x i8]* @.str39, i32 0, i32 0), i8* %67), !dbg !1062
  br label %69, !dbg !1062

; <label>:69                                      ; preds = %65, %62
  %70 = load i32* @exit_code, align 4, !dbg !1062
  %71 = icmp eq i32 %70, 0, !dbg !1062
  br i1 %71, label %72, label %73, !dbg !1062

; <label>:72                                      ; preds = %69
  store i32 2, i32* @exit_code, align 4, !dbg !1062
  br label %73, !dbg !1062

; <label>:73                                      ; preds = %72, %69
  %74 = load i32* @quiet, align 4, !dbg !1065
  %75 = icmp ne i32 %74, 0, !dbg !1065
  br i1 %75, label %77, label %76, !dbg !1065

; <label>:76                                      ; preds = %73
  call void @perror(i8* getelementptr inbounds ([1024 x i8]* @ifname, i32 0, i32 0)), !dbg !1066
  br label %77, !dbg !1066

; <label>:77                                      ; preds = %76, %73
  br label %78, !dbg !1067

; <label>:78                                      ; preds = %77, %51
  ret void, !dbg !1068
}

declare void @exit(i32) noreturn

declare void @free(i8*)

define internal void @reset_times(i8* %name, %struct.stat* %statb) nounwind uwtable {
  %1 = alloca i8*, align 8
  %2 = alloca %struct.stat*, align 8
  %timep = alloca %struct.utimbuf, align 8
  store i8* %name, i8** %1, align 8
  call void @llvm.dbg.declare(metadata !{i8** %1}, metadata !1069), !dbg !1070
  store %struct.stat* %statb, %struct.stat** %2, align 8
  call void @llvm.dbg.declare(metadata !{%struct.stat** %2}, metadata !1071), !dbg !1072
  call void @llvm.dbg.declare(metadata !{%struct.utimbuf* %timep}, metadata !1073), !dbg !1080
  %3 = load %struct.stat** %2, align 8, !dbg !1081
  %4 = getelementptr inbounds %struct.stat* %3, i32 0, i32 7, !dbg !1081
  %5 = getelementptr inbounds %struct.timespec* %4, i32 0, i32 0, !dbg !1081
  %6 = load i64* %5, align 8, !dbg !1081
  %7 = getelementptr inbounds %struct.utimbuf* %timep, i32 0, i32 0, !dbg !1081
  store i64 %6, i64* %7, align 8, !dbg !1081
  %8 = load %struct.stat** %2, align 8, !dbg !1082
  %9 = getelementptr inbounds %struct.stat* %8, i32 0, i32 8, !dbg !1082
  %10 = getelementptr inbounds %struct.timespec* %9, i32 0, i32 0, !dbg !1082
  %11 = load i64* %10, align 8, !dbg !1082
  %12 = getelementptr inbounds %struct.utimbuf* %timep, i32 0, i32 1, !dbg !1082
  store i64 %11, i64* %12, align 8, !dbg !1082
  %13 = load i8** %1, align 8, !dbg !1083
  %14 = call i32 @utime(i8* %13, %struct.utimbuf* %timep), !dbg !1083
  %15 = icmp ne i32 %14, 0, !dbg !1083
  br i1 %15, label %16, label %39, !dbg !1083

; <label>:16                                      ; preds = %0
  %17 = load %struct.stat** %2, align 8, !dbg !1083
  %18 = getelementptr inbounds %struct.stat* %17, i32 0, i32 2, !dbg !1083
  %19 = load i16* %18, align 2, !dbg !1083
  %20 = zext i16 %19 to i32, !dbg !1083
  %21 = and i32 %20, 61440, !dbg !1083
  %22 = icmp eq i32 %21, 16384, !dbg !1083
  br i1 %22, label %39, label %23, !dbg !1083

; <label>:23                                      ; preds = %16
  %24 = load i32* @quiet, align 4, !dbg !1084
  %25 = icmp ne i32 %24, 0, !dbg !1084
  br i1 %25, label %30, label %26, !dbg !1084

; <label>:26                                      ; preds = %23
  %27 = load %struct.__sFILE** @__stderrp, align 8, !dbg !1084
  %28 = load i8** @progname, align 8, !dbg !1084
  %29 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %27, i8* getelementptr inbounds ([5 x i8]* @.str39, i32 0, i32 0), i8* %28), !dbg !1084
  br label %30, !dbg !1084

; <label>:30                                      ; preds = %26, %23
  %31 = load i32* @exit_code, align 4, !dbg !1084
  %32 = icmp eq i32 %31, 0, !dbg !1084
  br i1 %32, label %33, label %34, !dbg !1084

; <label>:33                                      ; preds = %30
  store i32 2, i32* @exit_code, align 4, !dbg !1084
  br label %34, !dbg !1084

; <label>:34                                      ; preds = %33, %30
  %35 = load i32* @quiet, align 4, !dbg !1087
  %36 = icmp ne i32 %35, 0, !dbg !1087
  br i1 %36, label %38, label %37, !dbg !1087

; <label>:37                                      ; preds = %34
  call void @perror(i8* getelementptr inbounds ([1024 x i8]* @ofname, i32 0, i32 0)), !dbg !1088
  br label %38, !dbg !1088

; <label>:38                                      ; preds = %37, %34
  br label %39, !dbg !1089

; <label>:39                                      ; preds = %38, %16, %0
  ret void, !dbg !1090
}

declare i32 @chmod(i8*, i16 zeroext)

declare i32 @chown(i8*, i32, i32)

declare i32 @utime(i8*, %struct.utimbuf*)

declare i32 @printf(i8*, ...)

declare i64 @lseek(i32, i64, i32)

declare i64 @read(i32, i8*, i64)

declare void @read_error()

declare i8* @ctime(i64*)

declare i32 @fill_inbuf(i32)

declare i32 @memcmp(i8*, i8*, i64) nounwind readonly

declare i32 @unzip(i32, i32)

declare void @error(i8*)

declare i32 @check_zipfile(i32)

declare i32 @unpack(i32, i32)

declare i32 @unlzw(i32, i32)

declare i32 @unlzh(i32, i32)

declare i32 @copy(i32, i32)

define internal i8* @get_suffix(i8* %name) nounwind uwtable {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %nlen = alloca i32, align 4
  %slen = alloca i32, align 4
  %suffix = alloca [33 x i8], align 16
  %suf = alloca i8**, align 8
  %s = alloca i32, align 4
  store i8* %name, i8** %2, align 8
  call void @llvm.dbg.declare(metadata !{i8** %2}, metadata !1091), !dbg !1092
  call void @llvm.dbg.declare(metadata !{i32* %nlen}, metadata !1093), !dbg !1095
  call void @llvm.dbg.declare(metadata !{i32* %slen}, metadata !1096), !dbg !1097
  call void @llvm.dbg.declare(metadata !{[33 x i8]* %suffix}, metadata !1098), !dbg !1102
  call void @llvm.dbg.declare(metadata !{i8*** %suf}, metadata !1103), !dbg !1104
  store i8** getelementptr inbounds ([9 x i8*]* @get_suffix.known_suffixes, i32 0, i32 0), i8*** %suf, align 8, !dbg !1105
  %3 = call i32 @strcmp(i8* getelementptr inbounds ([31 x i8]* @z_suffix, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str85, i32 0, i32 0)) nounwind readonly, !dbg !1106
  %4 = icmp eq i32 %3, 0, !dbg !1106
  br i1 %4, label %5, label %8, !dbg !1106

; <label>:5                                       ; preds = %0
  %6 = load i8*** %suf, align 8, !dbg !1107
  %7 = getelementptr inbounds i8** %6, i32 1, !dbg !1107
  store i8** %7, i8*** %suf, align 8, !dbg !1107
  br label %8, !dbg !1107

; <label>:8                                       ; preds = %5, %0
  %9 = load i8** %2, align 8, !dbg !1108
  %10 = call i64 @strlen(i8* %9) nounwind readonly, !dbg !1108
  %11 = trunc i64 %10 to i32, !dbg !1108
  store i32 %11, i32* %nlen, align 4, !dbg !1108
  %12 = load i32* %nlen, align 4, !dbg !1109
  %13 = icmp sle i32 %12, 32, !dbg !1109
  br i1 %13, label %14, label %18, !dbg !1109

; <label>:14                                      ; preds = %8
  %15 = getelementptr inbounds [33 x i8]* %suffix, i32 0, i32 0, !dbg !1110
  %16 = load i8** %2, align 8, !dbg !1110
  %17 = call i8* @strcpy(i8* %15, i8* %16), !dbg !1110
  br label %27, !dbg !1112

; <label>:18                                      ; preds = %8
  %19 = getelementptr inbounds [33 x i8]* %suffix, i32 0, i32 0, !dbg !1113
  %20 = load i8** %2, align 8, !dbg !1113
  %21 = load i32* %nlen, align 4, !dbg !1113
  %22 = sext i32 %21 to i64, !dbg !1113
  %23 = getelementptr inbounds i8* %20, i64 %22, !dbg !1113
  %24 = getelementptr inbounds i8* %23, i64 -30, !dbg !1113
  %25 = getelementptr inbounds i8* %24, i64 -2, !dbg !1113
  %26 = call i8* @strcpy(i8* %19, i8* %25), !dbg !1113
  br label %27

; <label>:27                                      ; preds = %18, %14
  %28 = getelementptr inbounds [33 x i8]* %suffix, i32 0, i32 0, !dbg !1115
  %29 = call i8* @strlwr(i8* %28), !dbg !1115
  %30 = getelementptr inbounds [33 x i8]* %suffix, i32 0, i32 0, !dbg !1116
  %31 = call i64 @strlen(i8* %30) nounwind readonly, !dbg !1116
  %32 = trunc i64 %31 to i32, !dbg !1116
  store i32 %32, i32* %slen, align 4, !dbg !1116
  br label %33, !dbg !1117

; <label>:33                                      ; preds = %74, %27
  call void @llvm.dbg.declare(metadata !{i32* %s}, metadata !1118), !dbg !1120
  %34 = load i8*** %suf, align 8, !dbg !1121
  %35 = load i8** %34, align 8, !dbg !1121
  %36 = call i64 @strlen(i8* %35) nounwind readonly, !dbg !1121
  %37 = trunc i64 %36 to i32, !dbg !1121
  store i32 %37, i32* %s, align 4, !dbg !1121
  %38 = load i32* %slen, align 4, !dbg !1122
  %39 = load i32* %s, align 4, !dbg !1122
  %40 = icmp sgt i32 %38, %39, !dbg !1122
  br i1 %40, label %41, label %73, !dbg !1122

; <label>:41                                      ; preds = %33
  %42 = load i32* %slen, align 4, !dbg !1122
  %43 = load i32* %s, align 4, !dbg !1122
  %44 = sub nsw i32 %42, %43, !dbg !1122
  %45 = sub nsw i32 %44, 1, !dbg !1122
  %46 = sext i32 %45 to i64, !dbg !1122
  %47 = getelementptr inbounds [33 x i8]* %suffix, i32 0, i64 %46, !dbg !1122
  %48 = load i8* %47, align 1, !dbg !1122
  %49 = sext i8 %48 to i32, !dbg !1122
  %50 = icmp ne i32 %49, 47, !dbg !1122
  br i1 %50, label %51, label %73, !dbg !1122

; <label>:51                                      ; preds = %41
  %52 = getelementptr inbounds [33 x i8]* %suffix, i32 0, i32 0, !dbg !1123
  %53 = load i32* %slen, align 4, !dbg !1123
  %54 = sext i32 %53 to i64, !dbg !1123
  %55 = getelementptr inbounds i8* %52, i64 %54, !dbg !1123
  %56 = load i32* %s, align 4, !dbg !1123
  %57 = sext i32 %56 to i64, !dbg !1123
  %58 = sub i64 0, %57, !dbg !1123
  %59 = getelementptr inbounds i8* %55, i64 %58, !dbg !1123
  %60 = load i8*** %suf, align 8, !dbg !1123
  %61 = load i8** %60, align 8, !dbg !1123
  %62 = call i32 @strcmp(i8* %59, i8* %61) nounwind readonly, !dbg !1123
  %63 = icmp eq i32 %62, 0, !dbg !1123
  br i1 %63, label %64, label %73, !dbg !1123

; <label>:64                                      ; preds = %51
  %65 = load i8** %2, align 8, !dbg !1124
  %66 = load i32* %nlen, align 4, !dbg !1124
  %67 = sext i32 %66 to i64, !dbg !1124
  %68 = getelementptr inbounds i8* %65, i64 %67, !dbg !1124
  %69 = load i32* %s, align 4, !dbg !1124
  %70 = sext i32 %69 to i64, !dbg !1124
  %71 = sub i64 0, %70, !dbg !1124
  %72 = getelementptr inbounds i8* %68, i64 %71, !dbg !1124
  store i8* %72, i8** %1, !dbg !1124
  br label %80, !dbg !1124

; <label>:73                                      ; preds = %51, %41, %33
  br label %74, !dbg !1126

; <label>:74                                      ; preds = %73
  %75 = load i8*** %suf, align 8, !dbg !1126
  %76 = getelementptr inbounds i8** %75, i32 1, !dbg !1126
  store i8** %76, i8*** %suf, align 8, !dbg !1126
  %77 = load i8** %76, align 8, !dbg !1126
  %78 = icmp ne i8* %77, null, !dbg !1126
  br i1 %78, label %33, label %79, !dbg !1126

; <label>:79                                      ; preds = %74
  store i8* null, i8** %1, !dbg !1127
  br label %80, !dbg !1127

; <label>:80                                      ; preds = %79, %64
  %81 = load i8** %1, !dbg !1128
  ret i8* %81, !dbg !1128
}

declare i8* @strlwr(i8*)

declare i8* @strcat(i8*, i8*)

define internal i32 @do_stat(i8* %name, %struct.stat* %sbuf) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  %3 = alloca %struct.stat*, align 8
  store i8* %name, i8** %2, align 8
  call void @llvm.dbg.declare(metadata !{i8** %2}, metadata !1129), !dbg !1130
  store %struct.stat* %sbuf, %struct.stat** %3, align 8
  call void @llvm.dbg.declare(metadata !{%struct.stat** %3}, metadata !1131), !dbg !1132
  %4 = call i32* @__error(), !dbg !1133
  store i32 0, i32* %4, align 4, !dbg !1133
  %5 = load i32* @to_stdout, align 4, !dbg !1135
  %6 = icmp ne i32 %5, 0, !dbg !1135
  br i1 %6, label %14, label %7, !dbg !1135

; <label>:7                                       ; preds = %0
  %8 = load i32* @force, align 4, !dbg !1135
  %9 = icmp ne i32 %8, 0, !dbg !1135
  br i1 %9, label %14, label %10, !dbg !1135

; <label>:10                                      ; preds = %7
  %11 = load i8** %2, align 8, !dbg !1136
  %12 = load %struct.stat** %3, align 8, !dbg !1136
  %13 = call i32 @lstat(i8* %11, %struct.stat* %12), !dbg !1136
  store i32 %13, i32* %1, !dbg !1136
  br label %18, !dbg !1136

; <label>:14                                      ; preds = %7, %0
  %15 = load i8** %2, align 8, !dbg !1138
  %16 = load %struct.stat** %3, align 8, !dbg !1138
  %17 = call i32 @stat(i8* %15, %struct.stat* %16), !dbg !1138
  store i32 %17, i32* %1, !dbg !1138
  br label %18, !dbg !1138

; <label>:18                                      ; preds = %14, %10
  %19 = load i32* %1, !dbg !1139
  ret i32 %19, !dbg !1139
}

declare i32* @__error()

declare i32 @lstat(i8*, %struct.stat*)

declare i32 @stat(i8*, %struct.stat*)

define internal i32 @check_ofname() nounwind uwtable {
  %1 = alloca i32, align 4
  %ostat = alloca %struct.stat, align 8
  %response = alloca [80 x i8], align 16
  call void @llvm.dbg.declare(metadata !{%struct.stat* %ostat}, metadata !1140), !dbg !1142
  %2 = call i32* @__error(), !dbg !1143
  store i32 0, i32* %2, align 4, !dbg !1143
  br label %3, !dbg !1144

; <label>:3                                       ; preds = %11, %0
  %4 = call i32 @stat(i8* getelementptr inbounds ([1024 x i8]* @ofname, i32 0, i32 0), %struct.stat* %ostat), !dbg !1145
  %5 = icmp ne i32 %4, 0, !dbg !1145
  br i1 %5, label %6, label %12, !dbg !1145

; <label>:6                                       ; preds = %3
  %7 = call i32* @__error(), !dbg !1146
  %8 = load i32* %7, align 4, !dbg !1146
  %9 = icmp ne i32 %8, 63, !dbg !1146
  br i1 %9, label %10, label %11, !dbg !1146

; <label>:10                                      ; preds = %6
  store i32 0, i32* %1, !dbg !1148
  br label %111, !dbg !1148

; <label>:11                                      ; preds = %6
  call void (...)* bitcast (void (i8*)* @shorten_name to void (...)*)(i8* getelementptr inbounds ([1024 x i8]* @ofname, i32 0, i32 0)), !dbg !1149
  br label %3, !dbg !1150

; <label>:12                                      ; preds = %3
  %13 = load i32* @decompress, align 4, !dbg !1151
  %14 = icmp ne i32 %13, 0, !dbg !1151
  br i1 %14, label %23, label %15, !dbg !1151

; <label>:15                                      ; preds = %12
  %16 = call i32 (...)* bitcast (i32 (i8*, %struct.stat*)* @name_too_long to i32 (...)*)(i8* getelementptr inbounds ([1024 x i8]* @ofname, i32 0, i32 0), %struct.stat* %ostat), !dbg !1152
  %17 = icmp ne i32 %16, 0, !dbg !1152
  br i1 %17, label %18, label %23, !dbg !1152

; <label>:18                                      ; preds = %15
  call void (...)* bitcast (void (i8*)* @shorten_name to void (...)*)(i8* getelementptr inbounds ([1024 x i8]* @ofname, i32 0, i32 0)), !dbg !1153
  %19 = call i32 @stat(i8* getelementptr inbounds ([1024 x i8]* @ofname, i32 0, i32 0), %struct.stat* %ostat), !dbg !1155
  %20 = icmp ne i32 %19, 0, !dbg !1155
  br i1 %20, label %21, label %22, !dbg !1155

; <label>:21                                      ; preds = %18
  store i32 0, i32* %1, !dbg !1156
  br label %111, !dbg !1156

; <label>:22                                      ; preds = %18
  br label %23, !dbg !1157

; <label>:23                                      ; preds = %22, %15, %12
  %24 = call i32 (...)* bitcast (i32 (%struct.stat*, %struct.stat*)* @same_file to i32 (...)*)(%struct.stat* @istat, %struct.stat* %ostat), !dbg !1158
  %25 = icmp ne i32 %24, 0, !dbg !1158
  br i1 %25, label %26, label %41, !dbg !1158

; <label>:26                                      ; preds = %23
  %27 = call i32 @strcmp(i8* getelementptr inbounds ([1024 x i8]* @ifname, i32 0, i32 0), i8* getelementptr inbounds ([1024 x i8]* @ofname, i32 0, i32 0)) nounwind readonly, !dbg !1159
  %28 = icmp eq i32 %27, 0, !dbg !1159
  br i1 %28, label %29, label %36, !dbg !1159

; <label>:29                                      ; preds = %26
  %30 = load %struct.__sFILE** @__stderrp, align 8, !dbg !1161
  %31 = load i8** @progname, align 8, !dbg !1161
  %32 = load i32* @decompress, align 4, !dbg !1161
  %33 = icmp ne i32 %32, 0, !dbg !1161
  %34 = select i1 %33, i8* getelementptr inbounds ([3 x i8]* @.str93, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str42, i32 0, i32 0), !dbg !1161
  %35 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %30, i8* getelementptr inbounds ([39 x i8]* @.str92, i32 0, i32 0), i8* %31, i8* getelementptr inbounds ([1024 x i8]* @ifname, i32 0, i32 0), i8* %34), !dbg !1161
  br label %40, !dbg !1163

; <label>:36                                      ; preds = %26
  %37 = load %struct.__sFILE** @__stderrp, align 8, !dbg !1164
  %38 = load i8** @progname, align 8, !dbg !1164
  %39 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %37, i8* getelementptr inbounds ([33 x i8]* @.str94, i32 0, i32 0), i8* %38, i8* getelementptr inbounds ([1024 x i8]* @ifname, i32 0, i32 0), i8* getelementptr inbounds ([1024 x i8]* @ofname, i32 0, i32 0)), !dbg !1164
  br label %40

; <label>:40                                      ; preds = %36, %29
  store i32 1, i32* @exit_code, align 4, !dbg !1166
  store i32 1, i32* %1, !dbg !1167
  br label %111, !dbg !1167

; <label>:41                                      ; preds = %23
  %42 = load i32* @force, align 4, !dbg !1168
  %43 = icmp ne i32 %42, 0, !dbg !1168
  br i1 %43, label %102, label %44, !dbg !1168

; <label>:44                                      ; preds = %41
  call void @llvm.dbg.declare(metadata !{[80 x i8]* %response}, metadata !1169), !dbg !1174
  %45 = getelementptr inbounds [80 x i8]* %response, i32 0, i32 0, !dbg !1175
  %46 = call i8* @strcpy(i8* %45, i8* getelementptr inbounds ([2 x i8]* @.str95, i32 0, i32 0)), !dbg !1175
  %47 = load %struct.__sFILE** @__stderrp, align 8, !dbg !1176
  %48 = load i8** @progname, align 8, !dbg !1176
  %49 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %47, i8* getelementptr inbounds ([23 x i8]* @.str96, i32 0, i32 0), i8* %48, i8* getelementptr inbounds ([1024 x i8]* @ofname, i32 0, i32 0)), !dbg !1176
  %50 = load i32* @foreground, align 4, !dbg !1177
  %51 = icmp ne i32 %50, 0, !dbg !1177
  br i1 %51, label %52, label %75, !dbg !1177

; <label>:52                                      ; preds = %44
  %53 = load i32* @__isthreaded, align 4, !dbg !1178
  %54 = icmp ne i32 %53, 0, !dbg !1178
  br i1 %54, label %60, label %55, !dbg !1178

; <label>:55                                      ; preds = %52
  %56 = load %struct.__sFILE** @__stdinp, align 8, !dbg !1178
  %57 = getelementptr inbounds %struct.__sFILE* %56, i32 0, i32 4, !dbg !1178
  %58 = load i16* %57, align 2, !dbg !1178
  %59 = sext i16 %58 to i32, !dbg !1178
  br label %63, !dbg !1178

; <label>:60                                      ; preds = %52
  %61 = load %struct.__sFILE** @__stdinp, align 8, !dbg !1179
  %62 = call i32 @fileno(%struct.__sFILE* %61), !dbg !1179
  br label %63, !dbg !1179

; <label>:63                                      ; preds = %60, %55
  %64 = phi i32 [ %59, %55 ], [ %62, %60 ], !dbg !1179
  %65 = call i32 @isatty(i32 %64), !dbg !1179
  %66 = icmp ne i32 %65, 0, !dbg !1179
  br i1 %66, label %67, label %75, !dbg !1179

; <label>:67                                      ; preds = %63
  %68 = load %struct.__sFILE** @__stderrp, align 8, !dbg !1180
  %69 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %68, i8* getelementptr inbounds ([37 x i8]* @.str97, i32 0, i32 0)), !dbg !1180
  %70 = load %struct.__sFILE** @__stderrp, align 8, !dbg !1182
  %71 = call i32 @fflush(%struct.__sFILE* %70), !dbg !1182
  %72 = getelementptr inbounds [80 x i8]* %response, i32 0, i32 0, !dbg !1183
  %73 = load %struct.__sFILE** @__stdinp, align 8, !dbg !1183
  %74 = call i8* @fgets(i8* %72, i32 79, %struct.__sFILE* %73), !dbg !1183
  br label %75, !dbg !1184

; <label>:75                                      ; preds = %67, %63, %44
  %76 = getelementptr inbounds [80 x i8]* %response, i32 0, i32 0, !dbg !1185
  %77 = load i8* %76, align 1, !dbg !1185
  %78 = sext i8 %77 to i32, !dbg !1185
  %79 = call i32 @__sbistype(i32 %78, i64 32768), !dbg !1185
  %80 = icmp ne i32 %79, 0, !dbg !1185
  br i1 %80, label %81, label %87, !dbg !1185

; <label>:81                                      ; preds = %75
  %82 = getelementptr inbounds [80 x i8]* %response, i32 0, i32 0, !dbg !1185
  %83 = load i8* %82, align 1, !dbg !1185
  %84 = sext i8 %83 to i32, !dbg !1185
  %85 = sub nsw i32 %84, 65, !dbg !1185
  %86 = add nsw i32 %85, 97, !dbg !1185
  br label %91, !dbg !1185

; <label>:87                                      ; preds = %75
  %88 = getelementptr inbounds [80 x i8]* %response, i32 0, i32 0, !dbg !1185
  %89 = load i8* %88, align 1, !dbg !1185
  %90 = sext i8 %89 to i32, !dbg !1185
  br label %91, !dbg !1185

; <label>:91                                      ; preds = %87, %81
  %92 = phi i32 [ %86, %81 ], [ %90, %87 ], !dbg !1185
  %93 = icmp ne i32 %92, 121, !dbg !1185
  br i1 %93, label %94, label %101, !dbg !1185

; <label>:94                                      ; preds = %91
  %95 = load %struct.__sFILE** @__stderrp, align 8, !dbg !1186
  %96 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %95, i8* getelementptr inbounds ([18 x i8]* @.str98, i32 0, i32 0)), !dbg !1186
  %97 = load i32* @exit_code, align 4, !dbg !1188
  %98 = icmp eq i32 %97, 0, !dbg !1188
  br i1 %98, label %99, label %100, !dbg !1188

; <label>:99                                      ; preds = %94
  store i32 2, i32* @exit_code, align 4, !dbg !1189
  br label %100, !dbg !1189

; <label>:100                                     ; preds = %99, %94
  store i32 1, i32* %1, !dbg !1190
  br label %111, !dbg !1190

; <label>:101                                     ; preds = %91
  br label %102, !dbg !1191

; <label>:102                                     ; preds = %101, %41
  %103 = call i32 @chmod(i8* getelementptr inbounds ([1024 x i8]* @ofname, i32 0, i32 0), i16 zeroext 511), !dbg !1192
  %104 = call i32 @unlink(i8* getelementptr inbounds ([1024 x i8]* @ofname, i32 0, i32 0)), !dbg !1193
  %105 = icmp ne i32 %104, 0, !dbg !1193
  br i1 %105, label %106, label %110, !dbg !1193

; <label>:106                                     ; preds = %102
  %107 = load %struct.__sFILE** @__stderrp, align 8, !dbg !1194
  %108 = load i8** @progname, align 8, !dbg !1194
  %109 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %107, i8* getelementptr inbounds ([5 x i8]* @.str39, i32 0, i32 0), i8* %108), !dbg !1194
  call void @perror(i8* getelementptr inbounds ([1024 x i8]* @ofname, i32 0, i32 0)), !dbg !1196
  store i32 1, i32* @exit_code, align 4, !dbg !1197
  store i32 1, i32* %1, !dbg !1198
  br label %111, !dbg !1198

; <label>:110                                     ; preds = %102
  store i32 0, i32* %1, !dbg !1199
  br label %111, !dbg !1199

; <label>:111                                     ; preds = %110, %106, %100, %40, %21, %10
  %112 = load i32* %1, !dbg !1200
  ret i32 %112, !dbg !1200
}

declare i32 @fstat(i32, %struct.stat*)

define internal i32 @name_too_long(i8* %name, %struct.stat* %statb) nounwind uwtable {
  %1 = alloca i8*, align 8
  %2 = alloca %struct.stat*, align 8
  %s = alloca i32, align 4
  %c = alloca i8, align 1
  %tstat = alloca %struct.stat, align 8
  %res = alloca i32, align 4
  store i8* %name, i8** %1, align 8
  call void @llvm.dbg.declare(metadata !{i8** %1}, metadata !1201), !dbg !1202
  store %struct.stat* %statb, %struct.stat** %2, align 8
  call void @llvm.dbg.declare(metadata !{%struct.stat** %2}, metadata !1203), !dbg !1204
  call void @llvm.dbg.declare(metadata !{i32* %s}, metadata !1205), !dbg !1207
  %3 = load i8** %1, align 8, !dbg !1208
  %4 = call i64 @strlen(i8* %3) nounwind readonly, !dbg !1208
  %5 = trunc i64 %4 to i32, !dbg !1208
  store i32 %5, i32* %s, align 4, !dbg !1208
  call void @llvm.dbg.declare(metadata !{i8* %c}, metadata !1209), !dbg !1210
  %6 = load i32* %s, align 4, !dbg !1211
  %7 = sub nsw i32 %6, 1, !dbg !1211
  %8 = sext i32 %7 to i64, !dbg !1211
  %9 = load i8** %1, align 8, !dbg !1211
  %10 = getelementptr inbounds i8* %9, i64 %8, !dbg !1211
  %11 = load i8* %10, align 1, !dbg !1211
  store i8 %11, i8* %c, align 1, !dbg !1211
  call void @llvm.dbg.declare(metadata !{%struct.stat* %tstat}, metadata !1212), !dbg !1213
  call void @llvm.dbg.declare(metadata !{i32* %res}, metadata !1214), !dbg !1215
  %12 = load %struct.stat** %2, align 8, !dbg !1216
  %13 = bitcast %struct.stat* %tstat to i8*, !dbg !1216
  %14 = bitcast %struct.stat* %12 to i8*, !dbg !1216
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* %14, i64 120, i32 8, i1 false), !dbg !1216
  %15 = load i32* %s, align 4, !dbg !1217
  %16 = sub nsw i32 %15, 1, !dbg !1217
  %17 = sext i32 %16 to i64, !dbg !1217
  %18 = load i8** %1, align 8, !dbg !1217
  %19 = getelementptr inbounds i8* %18, i64 %17, !dbg !1217
  store i8 0, i8* %19, align 1, !dbg !1217
  %20 = load i8** %1, align 8, !dbg !1218
  %21 = call i32 @stat(i8* %20, %struct.stat* %tstat), !dbg !1218
  %22 = icmp eq i32 %21, 0, !dbg !1218
  br i1 %22, label %23, label %27, !dbg !1218

; <label>:23                                      ; preds = %0
  %24 = load %struct.stat** %2, align 8, !dbg !1219
  %25 = call i32 (...)* bitcast (i32 (%struct.stat*, %struct.stat*)* @same_file to i32 (...)*)(%struct.stat* %24, %struct.stat* %tstat), !dbg !1219
  %26 = icmp ne i32 %25, 0, !dbg !1219
  br label %27

; <label>:27                                      ; preds = %23, %0
  %28 = phi i1 [ false, %0 ], [ %26, %23 ]
  %29 = zext i1 %28 to i32
  store i32 %29, i32* %res, align 4
  %30 = load i8* %c, align 1, !dbg !1220
  %31 = load i32* %s, align 4, !dbg !1220
  %32 = sub nsw i32 %31, 1, !dbg !1220
  %33 = sext i32 %32 to i64, !dbg !1220
  %34 = load i8** %1, align 8, !dbg !1220
  %35 = getelementptr inbounds i8* %34, i64 %33, !dbg !1220
  store i8 %30, i8* %35, align 1, !dbg !1220
  %36 = load i32* %res, align 4, !dbg !1221
  ret i32 %36, !dbg !1221
}

define internal void @shorten_name(i8* %name) nounwind uwtable {
  %1 = alloca i8*, align 8
  %len = alloca i32, align 4
  %trunc = alloca i8*, align 8
  %plen = alloca i32, align 4
  %min_part = alloca i32, align 4
  %p = alloca i8*, align 8
  store i8* %name, i8** %1, align 8
  call void @llvm.dbg.declare(metadata !{i8** %1}, metadata !1222), !dbg !1223
  call void @llvm.dbg.declare(metadata !{i32* %len}, metadata !1224), !dbg !1226
  call void @llvm.dbg.declare(metadata !{i8** %trunc}, metadata !1227), !dbg !1228
  store i8* null, i8** %trunc, align 8, !dbg !1229
  call void @llvm.dbg.declare(metadata !{i32* %plen}, metadata !1230), !dbg !1231
  call void @llvm.dbg.declare(metadata !{i32* %min_part}, metadata !1232), !dbg !1233
  store i32 3, i32* %min_part, align 4, !dbg !1234
  call void @llvm.dbg.declare(metadata !{i8** %p}, metadata !1235), !dbg !1236
  %2 = load i8** %1, align 8, !dbg !1237
  %3 = call i64 @strlen(i8* %2) nounwind readonly, !dbg !1237
  %4 = trunc i64 %3 to i32, !dbg !1237
  store i32 %4, i32* %len, align 4, !dbg !1237
  %5 = load i32* @decompress, align 4, !dbg !1238
  %6 = icmp ne i32 %5, 0, !dbg !1238
  br i1 %6, label %7, label %17, !dbg !1238

; <label>:7                                       ; preds = %0
  %8 = load i32* %len, align 4, !dbg !1239
  %9 = icmp sle i32 %8, 1, !dbg !1239
  br i1 %9, label %10, label %11, !dbg !1239

; <label>:10                                      ; preds = %7
  call void @error(i8* getelementptr inbounds ([15 x i8]* @.str88, i32 0, i32 0)), !dbg !1241
  br label %11, !dbg !1241

; <label>:11                                      ; preds = %10, %7
  %12 = load i32* %len, align 4, !dbg !1242
  %13 = sub nsw i32 %12, 1, !dbg !1242
  %14 = sext i32 %13 to i64, !dbg !1242
  %15 = load i8** %1, align 8, !dbg !1242
  %16 = getelementptr inbounds i8* %15, i64 %14, !dbg !1242
  store i8 0, i8* %16, align 1, !dbg !1242
  br label %124, !dbg !1243

; <label>:17                                      ; preds = %0
  %18 = load i8** %1, align 8, !dbg !1244
  %19 = call i8* (...)* bitcast (i8* (i8*)* @get_suffix to i8* (...)*)(i8* %18), !dbg !1244
  store i8* %19, i8** %p, align 8, !dbg !1244
  %20 = load i8** %p, align 8, !dbg !1245
  %21 = icmp eq i8* %20, null, !dbg !1245
  br i1 %21, label %22, label %23, !dbg !1245

; <label>:22                                      ; preds = %17
  call void @error(i8* getelementptr inbounds ([22 x i8]* @.str89, i32 0, i32 0)), !dbg !1246
  br label %23, !dbg !1246

; <label>:23                                      ; preds = %22, %17
  %24 = load i8** %p, align 8, !dbg !1247
  store i8 0, i8* %24, align 1, !dbg !1247
  store i32 1, i32* @save_orig_name, align 4, !dbg !1248
  %25 = load i32* %len, align 4, !dbg !1249
  %26 = icmp sgt i32 %25, 4, !dbg !1249
  br i1 %26, label %27, label %36, !dbg !1249

; <label>:27                                      ; preds = %23
  %28 = load i8** %p, align 8, !dbg !1250
  %29 = getelementptr inbounds i8* %28, i64 -4, !dbg !1250
  %30 = call i32 @strcmp(i8* %29, i8* getelementptr inbounds ([5 x i8]* @.str79, i32 0, i32 0)) nounwind readonly, !dbg !1250
  %31 = icmp eq i32 %30, 0, !dbg !1250
  br i1 %31, label %32, label %36, !dbg !1250

; <label>:32                                      ; preds = %27
  %33 = load i8** %p, align 8, !dbg !1251
  %34 = getelementptr inbounds i8* %33, i64 -4, !dbg !1251
  %35 = call i8* @strcpy(i8* %34, i8* getelementptr inbounds ([5 x i8]* @.str77, i32 0, i32 0)), !dbg !1251
  br label %124, !dbg !1253

; <label>:36                                      ; preds = %27, %23
  br label %37, !dbg !1254

; <label>:37                                      ; preds = %83, %36
  %38 = load i8** %1, align 8, !dbg !1255
  %39 = call i8* @strrchr(i8* %38, i32 47) nounwind readonly, !dbg !1255
  store i8* %39, i8** %p, align 8, !dbg !1255
  %40 = load i8** %p, align 8, !dbg !1257
  %41 = icmp ne i8* %40, null, !dbg !1257
  br i1 %41, label %42, label %45, !dbg !1257

; <label>:42                                      ; preds = %37
  %43 = load i8** %p, align 8, !dbg !1257
  %44 = getelementptr inbounds i8* %43, i64 1, !dbg !1257
  br label %47, !dbg !1257

; <label>:45                                      ; preds = %37
  %46 = load i8** %1, align 8, !dbg !1257
  br label %47, !dbg !1257

; <label>:47                                      ; preds = %45, %42
  %48 = phi i8* [ %44, %42 ], [ %46, %45 ], !dbg !1257
  store i8* %48, i8** %p, align 8, !dbg !1257
  br label %49, !dbg !1258

; <label>:49                                      ; preds = %74, %47
  %50 = load i8** %p, align 8, !dbg !1258
  %51 = load i8* %50, align 1, !dbg !1258
  %52 = icmp ne i8 %51, 0, !dbg !1258
  br i1 %52, label %53, label %75, !dbg !1258

; <label>:53                                      ; preds = %49
  %54 = load i8** %p, align 8, !dbg !1259
  %55 = call i64 @strcspn(i8* %54, i8* getelementptr inbounds ([2 x i8]* @.str90, i32 0, i32 0)) nounwind readonly, !dbg !1259
  %56 = trunc i64 %55 to i32, !dbg !1259
  store i32 %56, i32* %plen, align 4, !dbg !1259
  %57 = load i32* %plen, align 4, !dbg !1261
  %58 = load i8** %p, align 8, !dbg !1261
  %59 = sext i32 %57 to i64, !dbg !1261
  %60 = getelementptr inbounds i8* %58, i64 %59, !dbg !1261
  store i8* %60, i8** %p, align 8, !dbg !1261
  %61 = load i32* %plen, align 4, !dbg !1262
  %62 = load i32* %min_part, align 4, !dbg !1262
  %63 = icmp sgt i32 %61, %62, !dbg !1262
  br i1 %63, label %64, label %67, !dbg !1262

; <label>:64                                      ; preds = %53
  %65 = load i8** %p, align 8, !dbg !1263
  %66 = getelementptr inbounds i8* %65, i64 -1, !dbg !1263
  store i8* %66, i8** %trunc, align 8, !dbg !1263
  br label %67, !dbg !1263

; <label>:67                                      ; preds = %64, %53
  %68 = load i8** %p, align 8, !dbg !1264
  %69 = load i8* %68, align 1, !dbg !1264
  %70 = icmp ne i8 %69, 0, !dbg !1264
  br i1 %70, label %71, label %74, !dbg !1264

; <label>:71                                      ; preds = %67
  %72 = load i8** %p, align 8, !dbg !1265
  %73 = getelementptr inbounds i8* %72, i32 1, !dbg !1265
  store i8* %73, i8** %p, align 8, !dbg !1265
  br label %74, !dbg !1265

; <label>:74                                      ; preds = %71, %67
  br label %49, !dbg !1266

; <label>:75                                      ; preds = %49
  br label %76, !dbg !1267

; <label>:76                                      ; preds = %75
  %77 = load i8** %trunc, align 8, !dbg !1267
  %78 = icmp eq i8* %77, null, !dbg !1267
  br i1 %78, label %79, label %83, !dbg !1267

; <label>:79                                      ; preds = %76
  %80 = load i32* %min_part, align 4, !dbg !1267
  %81 = add nsw i32 %80, -1, !dbg !1267
  store i32 %81, i32* %min_part, align 4, !dbg !1267
  %82 = icmp ne i32 %81, 0, !dbg !1267
  br label %83

; <label>:83                                      ; preds = %79, %76
  %84 = phi i1 [ false, %76 ], [ %82, %79 ]
  br i1 %84, label %37, label %85

; <label>:85                                      ; preds = %83
  %86 = load i8** %trunc, align 8, !dbg !1268
  %87 = icmp ne i8* %86, null, !dbg !1268
  br i1 %87, label %88, label %103, !dbg !1268

; <label>:88                                      ; preds = %85
  br label %89, !dbg !1269

; <label>:89                                      ; preds = %95, %88
  %90 = load i8** %trunc, align 8, !dbg !1271
  %91 = getelementptr inbounds i8* %90, i64 1, !dbg !1271
  %92 = load i8* %91, align 1, !dbg !1271
  %93 = load i8** %trunc, align 8, !dbg !1271
  %94 = getelementptr inbounds i8* %93, i64 0, !dbg !1271
  store i8 %92, i8* %94, align 1, !dbg !1271
  br label %95, !dbg !1273

; <label>:95                                      ; preds = %89
  %96 = load i8** %trunc, align 8, !dbg !1273
  %97 = getelementptr inbounds i8* %96, i32 1, !dbg !1273
  store i8* %97, i8** %trunc, align 8, !dbg !1273
  %98 = load i8* %96, align 1, !dbg !1273
  %99 = icmp ne i8 %98, 0, !dbg !1273
  br i1 %99, label %89, label %100, !dbg !1273

; <label>:100                                     ; preds = %95
  %101 = load i8** %trunc, align 8, !dbg !1274
  %102 = getelementptr inbounds i8* %101, i32 -1, !dbg !1274
  store i8* %102, i8** %trunc, align 8, !dbg !1274
  br label %121, !dbg !1275

; <label>:103                                     ; preds = %85
  %104 = load i8** %1, align 8, !dbg !1276
  %105 = load i8* getelementptr inbounds ([2 x i8]* @.str90, i32 0, i64 0), align 1, !dbg !1276
  %106 = sext i8 %105 to i32, !dbg !1276
  %107 = call i8* @strrchr(i8* %104, i32 %106) nounwind readonly, !dbg !1276
  store i8* %107, i8** %trunc, align 8, !dbg !1276
  %108 = load i8** %trunc, align 8, !dbg !1278
  %109 = icmp eq i8* %108, null, !dbg !1278
  br i1 %109, label %110, label %111, !dbg !1278

; <label>:110                                     ; preds = %103
  call void @error(i8* getelementptr inbounds ([31 x i8]* @.str91, i32 0, i32 0)), !dbg !1279
  br label %111, !dbg !1279

; <label>:111                                     ; preds = %110, %103
  %112 = load i8** %trunc, align 8, !dbg !1280
  %113 = getelementptr inbounds i8* %112, i64 1, !dbg !1280
  %114 = load i8* %113, align 1, !dbg !1280
  %115 = sext i8 %114 to i32, !dbg !1280
  %116 = icmp eq i32 %115, 0, !dbg !1280
  br i1 %116, label %117, label %120, !dbg !1280

; <label>:117                                     ; preds = %111
  %118 = load i8** %trunc, align 8, !dbg !1281
  %119 = getelementptr inbounds i8* %118, i32 -1, !dbg !1281
  store i8* %119, i8** %trunc, align 8, !dbg !1281
  br label %120, !dbg !1281

; <label>:120                                     ; preds = %117, %111
  br label %121

; <label>:121                                     ; preds = %120, %100
  %122 = load i8** %trunc, align 8, !dbg !1282
  %123 = call i8* @strcpy(i8* %122, i8* getelementptr inbounds ([31 x i8]* @z_suffix, i32 0, i32 0)), !dbg !1282
  br label %124, !dbg !1283

; <label>:124                                     ; preds = %121, %32, %11
  ret void, !dbg !1283
}

declare i8* @strrchr(i8*, i32) nounwind readonly

declare i64 @strcspn(i8*, i8*) nounwind readonly

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define internal i32 @same_file(%struct.stat* %stat1, %struct.stat* %stat2) nounwind uwtable {
  %1 = alloca %struct.stat*, align 8
  %2 = alloca %struct.stat*, align 8
  store %struct.stat* %stat1, %struct.stat** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.stat** %1}, metadata !1284), !dbg !1285
  store %struct.stat* %stat2, %struct.stat** %2, align 8
  call void @llvm.dbg.declare(metadata !{%struct.stat** %2}, metadata !1286), !dbg !1287
  %3 = load %struct.stat** %1, align 8, !dbg !1288
  %4 = getelementptr inbounds %struct.stat* %3, i32 0, i32 1, !dbg !1288
  %5 = load i32* %4, align 4, !dbg !1288
  %6 = load %struct.stat** %2, align 8, !dbg !1288
  %7 = getelementptr inbounds %struct.stat* %6, i32 0, i32 1, !dbg !1288
  %8 = load i32* %7, align 4, !dbg !1288
  %9 = icmp eq i32 %5, %8, !dbg !1288
  br i1 %9, label %10, label %18, !dbg !1288

; <label>:10                                      ; preds = %0
  %11 = load %struct.stat** %1, align 8, !dbg !1288
  %12 = getelementptr inbounds %struct.stat* %11, i32 0, i32 0, !dbg !1288
  %13 = load i32* %12, align 4, !dbg !1288
  %14 = load %struct.stat** %2, align 8, !dbg !1288
  %15 = getelementptr inbounds %struct.stat* %14, i32 0, i32 0, !dbg !1288
  %16 = load i32* %15, align 4, !dbg !1288
  %17 = icmp eq i32 %13, %16, !dbg !1288
  br label %18

; <label>:18                                      ; preds = %10, %0
  %19 = phi i1 [ false, %0 ], [ %17, %10 ]
  %20 = zext i1 %19 to i32
  ret i32 %20, !dbg !1290
}

declare i32 @isatty(i32)

declare i32 @fflush(%struct.__sFILE*)

declare i8* @fgets(i8*, i32, %struct.__sFILE*)

define internal i32 @__sbistype(i32 %_c, i64 %_f) nounwind uwtable inlinehint {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  store i32 %_c, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !1291), !dbg !1292
  store i64 %_f, i64* %2, align 8
  call void @llvm.dbg.declare(metadata !{i64* %2}, metadata !1293), !dbg !1294
  %3 = load i32* %1, align 4, !dbg !1295
  %4 = load i64* %2, align 8, !dbg !1295
  %5 = call i32 @__sbmaskrune(i32 %3, i64 %4), !dbg !1295
  %6 = icmp ne i32 %5, 0, !dbg !1295
  %7 = xor i1 %6, true, !dbg !1295
  %8 = xor i1 %7, true, !dbg !1295
  %9 = zext i1 %8 to i32, !dbg !1295
  ret i32 %9, !dbg !1295
}

define internal i32 @__sbmaskrune(i32 %_c, i64 %_f) nounwind uwtable inlinehint {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  store i32 %_c, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !1297), !dbg !1298
  store i64 %_f, i64* %2, align 8
  call void @llvm.dbg.declare(metadata !{i64* %2}, metadata !1299), !dbg !1300
  %3 = load i32* %1, align 4, !dbg !1301
  %4 = icmp slt i32 %3, 0, !dbg !1301
  br i1 %4, label %9, label %5, !dbg !1301

; <label>:5                                       ; preds = %0
  %6 = load i32* %1, align 4, !dbg !1301
  %7 = load i32* @__mb_sb_limit, align 4, !dbg !1301
  %8 = icmp sge i32 %6, %7, !dbg !1301
  br i1 %8, label %9, label %10, !dbg !1301

; <label>:9                                       ; preds = %5, %0
  br label %19, !dbg !1301

; <label>:10                                      ; preds = %5
  %11 = load i32* %1, align 4, !dbg !1301
  %12 = sext i32 %11 to i64, !dbg !1301
  %13 = load %struct._RuneLocale** @_CurrentRuneLocale, align 8, !dbg !1301
  %14 = getelementptr inbounds %struct._RuneLocale* %13, i32 0, i32 5, !dbg !1301
  %15 = getelementptr inbounds [256 x i64]* %14, i32 0, i64 %12, !dbg !1301
  %16 = load i64* %15, align 8, !dbg !1301
  %17 = load i64* %2, align 8, !dbg !1301
  %18 = and i64 %16, %17, !dbg !1301
  br label %19, !dbg !1301

; <label>:19                                      ; preds = %10, %9
  %20 = phi i64 [ 0, %9 ], [ %18, %10 ], !dbg !1301
  %21 = trunc i64 %20 to i32, !dbg !1301
  ret i32 %21, !dbg !1301
}

define void @zip_attack(i32 %ifd) nounwind uwtable {
  %1 = alloca i32, align 4
  %dump = alloca %struct.__sFILE*, align 8
  %c = alloca i8, align 1
  store i32 %ifd, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !115, metadata !1303), !dbg !1304
  call void @llvm.dbg.declare(metadata !115, metadata !1305), !dbg !1376
  %2 = call %struct.__sFILE* @fopen(i8* getelementptr inbounds ([14 x i8]* @.str143, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str1144, i32 0, i32 0)), !dbg !1377
  store %struct.__sFILE* %2, %struct.__sFILE** %dump, align 8, !dbg !1377
  %3 = load %struct.__sFILE** %dump, align 8, !dbg !1378
  %4 = icmp ne %struct.__sFILE* %3, null, !dbg !1378
  br i1 %4, label %5, label %22, !dbg !1378

; <label>:5                                       ; preds = %0
  call void @llvm.dbg.declare(metadata !115, metadata !1379), !dbg !1381
  %6 = load i32* %1, align 4, !dbg !1382
  %7 = call i64 @read(i32 %6, i8* %c, i64 1), !dbg !1382
  br label %8, !dbg !1383

; <label>:8                                       ; preds = %12, %5
  %9 = load i8* %c, align 1, !dbg !1383
  %10 = sext i8 %9 to i32, !dbg !1383
  %11 = icmp ne i32 %10, 10, !dbg !1383
  br i1 %11, label %12, label %17, !dbg !1383

; <label>:12                                      ; preds = %8
  %13 = load %struct.__sFILE** %dump, align 8, !dbg !1384
  %14 = call i64 @fwrite(i8* %c, i64 1, i64 1, %struct.__sFILE* %13), !dbg !1384
  %15 = load i32* %1, align 4, !dbg !1386
  %16 = call i64 @read(i32 %15, i8* %c, i64 1), !dbg !1386
  br label %8, !dbg !1387

; <label>:17                                      ; preds = %8
  %18 = load %struct.__sFILE** %dump, align 8, !dbg !1388
  %19 = call i64 @fwrite(i8* %c, i64 1, i64 1, %struct.__sFILE* %18), !dbg !1388
  %20 = load %struct.__sFILE** %dump, align 8, !dbg !1389
  %21 = call i32 @fclose(%struct.__sFILE* %20), !dbg !1389
  call void @exit(i32 1) noreturn, !dbg !1390
  unreachable, !dbg !1390

; <label>:22                                      ; preds = %0
  ret void, !dbg !1391
}

declare %struct.__sFILE* @fopen(i8*, i8*)

declare i64 @fwrite(i8*, i64, i64, %struct.__sFILE*)

declare i32 @fclose(%struct.__sFILE*)

define i32 @zip(i32 %in, i32 %out) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %flags = alloca i8, align 1
  %attr = alloca i16, align 2
  %deflate_flags = alloca i16, align 2
  %p = alloca i8*, align 8
  store i32 %in, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !115, metadata !1392), !dbg !1393
  store i32 %out, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !115, metadata !1394), !dbg !1395
  %3 = load i32* %1, align 4, !dbg !1396
  %4 = call i32 (...)* @cw_desc(i32 0, i32 %3), !dbg !1396
  %5 = load i32* %2, align 4, !dbg !1398
  %6 = call i32 (...)* @cw_desc(i32 1, i32 %5), !dbg !1398
  call void @cw_act(i32 0), !dbg !1399
  call void @llvm.dbg.declare(metadata !115, metadata !1400), !dbg !1402
  store i8 0, i8* %flags, align 1, !dbg !1403
  call void @llvm.dbg.declare(metadata !115, metadata !1404), !dbg !1406
  store i16 0, i16* %attr, align 2, !dbg !1407
  call void @llvm.dbg.declare(metadata !115, metadata !1408), !dbg !1409
  store i16 0, i16* %deflate_flags, align 2, !dbg !1410
  %7 = load i32* %1, align 4, !dbg !1411
  store i32 %7, i32* @ifd, align 4, !dbg !1411
  %8 = load i32* %2, align 4, !dbg !1412
  store i32 %8, i32* @ofd, align 4, !dbg !1412
  store i32 0, i32* @outcnt, align 4, !dbg !1413
  store i32 8, i32* @method, align 4, !dbg !1414
  %9 = load i8* getelementptr inbounds ([3 x i8]* @.str2145, i32 0, i64 0), align 1, !dbg !1415
  %10 = load i32* @outcnt, align 4, !dbg !1415
  %11 = add i32 %10, 1, !dbg !1415
  store i32 %11, i32* @outcnt, align 4, !dbg !1415
  %12 = zext i32 %10 to i64, !dbg !1415
  %13 = getelementptr inbounds [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i32 0, i64 %12, !dbg !1415
  store i8 %9, i8* %13, align 1, !dbg !1415
  %14 = load i32* @outcnt, align 4, !dbg !1415
  %15 = icmp eq i32 %14, 16384, !dbg !1415
  br i1 %15, label %16, label %17, !dbg !1415

; <label>:16                                      ; preds = %0
  call void @flush_outbuf(), !dbg !1415
  br label %17, !dbg !1415

; <label>:17                                      ; preds = %16, %0
  %18 = load i8* getelementptr inbounds ([3 x i8]* @.str2145, i32 0, i64 1), align 1, !dbg !1417
  %19 = load i32* @outcnt, align 4, !dbg !1417
  %20 = add i32 %19, 1, !dbg !1417
  store i32 %20, i32* @outcnt, align 4, !dbg !1417
  %21 = zext i32 %19 to i64, !dbg !1417
  %22 = getelementptr inbounds [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i32 0, i64 %21, !dbg !1417
  store i8 %18, i8* %22, align 1, !dbg !1417
  %23 = load i32* @outcnt, align 4, !dbg !1417
  %24 = icmp eq i32 %23, 16384, !dbg !1417
  br i1 %24, label %25, label %26, !dbg !1417

; <label>:25                                      ; preds = %17
  call void @flush_outbuf(), !dbg !1417
  br label %26, !dbg !1417

; <label>:26                                      ; preds = %25, %17
  %27 = load i32* @outcnt, align 4, !dbg !1419
  %28 = add i32 %27, 1, !dbg !1419
  store i32 %28, i32* @outcnt, align 4, !dbg !1419
  %29 = zext i32 %27 to i64, !dbg !1419
  %30 = getelementptr inbounds [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i32 0, i64 %29, !dbg !1419
  store i8 8, i8* %30, align 1, !dbg !1419
  %31 = load i32* @outcnt, align 4, !dbg !1419
  %32 = icmp eq i32 %31, 16384, !dbg !1419
  br i1 %32, label %33, label %34, !dbg !1419

; <label>:33                                      ; preds = %26
  call void @flush_outbuf(), !dbg !1419
  br label %34, !dbg !1419

; <label>:34                                      ; preds = %33, %26
  %35 = load i32* @save_orig_name, align 4, !dbg !1421
  %36 = icmp ne i32 %35, 0, !dbg !1421
  br i1 %36, label %37, label %42, !dbg !1421

; <label>:37                                      ; preds = %34
  %38 = load i8* %flags, align 1, !dbg !1422
  %39 = zext i8 %38 to i32, !dbg !1422
  %40 = or i32 %39, 8, !dbg !1422
  %41 = trunc i32 %40 to i8, !dbg !1422
  store i8 %41, i8* %flags, align 1, !dbg !1422
  br label %42, !dbg !1424

; <label>:42                                      ; preds = %37, %34
  %43 = load i8* %flags, align 1, !dbg !1425
  %44 = load i32* @outcnt, align 4, !dbg !1425
  %45 = add i32 %44, 1, !dbg !1425
  store i32 %45, i32* @outcnt, align 4, !dbg !1425
  %46 = zext i32 %44 to i64, !dbg !1425
  %47 = getelementptr inbounds [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i32 0, i64 %46, !dbg !1425
  store i8 %43, i8* %47, align 1, !dbg !1425
  %48 = load i32* @outcnt, align 4, !dbg !1425
  %49 = icmp eq i32 %48, 16384, !dbg !1425
  br i1 %49, label %50, label %51, !dbg !1425

; <label>:50                                      ; preds = %42
  call void @flush_outbuf(), !dbg !1425
  br label %51, !dbg !1425

; <label>:51                                      ; preds = %50, %42
  %52 = load i32* @outcnt, align 4, !dbg !1427
  %53 = icmp ult i32 %52, 16382, !dbg !1427
  br i1 %53, label %54, label %73, !dbg !1427

; <label>:54                                      ; preds = %51
  %55 = load i64* @time_stamp, align 8, !dbg !1430
  %56 = and i64 %55, 65535, !dbg !1430
  %57 = and i64 %56, 255, !dbg !1430
  %58 = trunc i64 %57 to i8, !dbg !1430
  %59 = load i32* @outcnt, align 4, !dbg !1430
  %60 = add i32 %59, 1, !dbg !1430
  store i32 %60, i32* @outcnt, align 4, !dbg !1430
  %61 = zext i32 %59 to i64, !dbg !1430
  %62 = getelementptr inbounds [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i32 0, i64 %61, !dbg !1430
  store i8 %58, i8* %62, align 1, !dbg !1430
  %63 = load i64* @time_stamp, align 8, !dbg !1430
  %64 = and i64 %63, 65535, !dbg !1430
  %65 = trunc i64 %64 to i16, !dbg !1430
  %66 = zext i16 %65 to i32, !dbg !1430
  %67 = ashr i32 %66, 8, !dbg !1430
  %68 = trunc i32 %67 to i8, !dbg !1430
  %69 = load i32* @outcnt, align 4, !dbg !1430
  %70 = add i32 %69, 1, !dbg !1430
  store i32 %70, i32* @outcnt, align 4, !dbg !1430
  %71 = zext i32 %69 to i64, !dbg !1430
  %72 = getelementptr inbounds [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i32 0, i64 %71, !dbg !1430
  store i8 %68, i8* %72, align 1, !dbg !1430
  br label %100, !dbg !1430

; <label>:73                                      ; preds = %51
  %74 = load i64* @time_stamp, align 8, !dbg !1432
  %75 = and i64 %74, 65535, !dbg !1432
  %76 = and i64 %75, 255, !dbg !1432
  %77 = trunc i64 %76 to i8, !dbg !1432
  %78 = load i32* @outcnt, align 4, !dbg !1432
  %79 = add i32 %78, 1, !dbg !1432
  store i32 %79, i32* @outcnt, align 4, !dbg !1432
  %80 = zext i32 %78 to i64, !dbg !1432
  %81 = getelementptr inbounds [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i32 0, i64 %80, !dbg !1432
  store i8 %77, i8* %81, align 1, !dbg !1432
  %82 = load i32* @outcnt, align 4, !dbg !1432
  %83 = icmp eq i32 %82, 16384, !dbg !1432
  br i1 %83, label %84, label %85, !dbg !1432

; <label>:84                                      ; preds = %73
  call void @flush_outbuf(), !dbg !1432
  br label %85, !dbg !1432

; <label>:85                                      ; preds = %84, %73
  %86 = load i64* @time_stamp, align 8, !dbg !1435
  %87 = and i64 %86, 65535, !dbg !1435
  %88 = trunc i64 %87 to i16, !dbg !1435
  %89 = zext i16 %88 to i32, !dbg !1435
  %90 = ashr i32 %89, 8, !dbg !1435
  %91 = trunc i32 %90 to i8, !dbg !1435
  %92 = load i32* @outcnt, align 4, !dbg !1435
  %93 = add i32 %92, 1, !dbg !1435
  store i32 %93, i32* @outcnt, align 4, !dbg !1435
  %94 = zext i32 %92 to i64, !dbg !1435
  %95 = getelementptr inbounds [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i32 0, i64 %94, !dbg !1435
  store i8 %91, i8* %95, align 1, !dbg !1435
  %96 = load i32* @outcnt, align 4, !dbg !1435
  %97 = icmp eq i32 %96, 16384, !dbg !1435
  br i1 %97, label %98, label %99, !dbg !1435

; <label>:98                                      ; preds = %85
  call void @flush_outbuf(), !dbg !1435
  br label %99, !dbg !1435

; <label>:99                                      ; preds = %98, %85
  br label %100

; <label>:100                                     ; preds = %99, %54
  %101 = load i32* @outcnt, align 4, !dbg !1437
  %102 = icmp ult i32 %101, 16382, !dbg !1437
  br i1 %102, label %103, label %122, !dbg !1437

; <label>:103                                     ; preds = %100
  %104 = load i64* @time_stamp, align 8, !dbg !1439
  %105 = lshr i64 %104, 16, !dbg !1439
  %106 = and i64 %105, 255, !dbg !1439
  %107 = trunc i64 %106 to i8, !dbg !1439
  %108 = load i32* @outcnt, align 4, !dbg !1439
  %109 = add i32 %108, 1, !dbg !1439
  store i32 %109, i32* @outcnt, align 4, !dbg !1439
  %110 = zext i32 %108 to i64, !dbg !1439
  %111 = getelementptr inbounds [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i32 0, i64 %110, !dbg !1439
  store i8 %107, i8* %111, align 1, !dbg !1439
  %112 = load i64* @time_stamp, align 8, !dbg !1439
  %113 = lshr i64 %112, 16, !dbg !1439
  %114 = trunc i64 %113 to i16, !dbg !1439
  %115 = zext i16 %114 to i32, !dbg !1439
  %116 = ashr i32 %115, 8, !dbg !1439
  %117 = trunc i32 %116 to i8, !dbg !1439
  %118 = load i32* @outcnt, align 4, !dbg !1439
  %119 = add i32 %118, 1, !dbg !1439
  store i32 %119, i32* @outcnt, align 4, !dbg !1439
  %120 = zext i32 %118 to i64, !dbg !1439
  %121 = getelementptr inbounds [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i32 0, i64 %120, !dbg !1439
  store i8 %117, i8* %121, align 1, !dbg !1439
  br label %149, !dbg !1439

; <label>:122                                     ; preds = %100
  %123 = load i64* @time_stamp, align 8, !dbg !1441
  %124 = lshr i64 %123, 16, !dbg !1441
  %125 = and i64 %124, 255, !dbg !1441
  %126 = trunc i64 %125 to i8, !dbg !1441
  %127 = load i32* @outcnt, align 4, !dbg !1441
  %128 = add i32 %127, 1, !dbg !1441
  store i32 %128, i32* @outcnt, align 4, !dbg !1441
  %129 = zext i32 %127 to i64, !dbg !1441
  %130 = getelementptr inbounds [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i32 0, i64 %129, !dbg !1441
  store i8 %126, i8* %130, align 1, !dbg !1441
  %131 = load i32* @outcnt, align 4, !dbg !1441
  %132 = icmp eq i32 %131, 16384, !dbg !1441
  br i1 %132, label %133, label %134, !dbg !1441

; <label>:133                                     ; preds = %122
  call void @flush_outbuf(), !dbg !1441
  br label %134, !dbg !1441

; <label>:134                                     ; preds = %133, %122
  %135 = load i64* @time_stamp, align 8, !dbg !1444
  %136 = lshr i64 %135, 16, !dbg !1444
  %137 = trunc i64 %136 to i16, !dbg !1444
  %138 = zext i16 %137 to i32, !dbg !1444
  %139 = ashr i32 %138, 8, !dbg !1444
  %140 = trunc i32 %139 to i8, !dbg !1444
  %141 = load i32* @outcnt, align 4, !dbg !1444
  %142 = add i32 %141, 1, !dbg !1444
  store i32 %142, i32* @outcnt, align 4, !dbg !1444
  %143 = zext i32 %141 to i64, !dbg !1444
  %144 = getelementptr inbounds [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i32 0, i64 %143, !dbg !1444
  store i8 %140, i8* %144, align 1, !dbg !1444
  %145 = load i32* @outcnt, align 4, !dbg !1444
  %146 = icmp eq i32 %145, 16384, !dbg !1444
  br i1 %146, label %147, label %148, !dbg !1444

; <label>:147                                     ; preds = %134
  call void @flush_outbuf(), !dbg !1444
  br label %148, !dbg !1444

; <label>:148                                     ; preds = %147, %134
  br label %149

; <label>:149                                     ; preds = %148, %103
  %150 = call i64 @updcrc(i8* null, i32 0), !dbg !1446
  store i64 %150, i64* @crc, align 8, !dbg !1446
  %151 = load i32* %2, align 4, !dbg !1447
  call void @bi_init(i32 %151), !dbg !1447
  call void @ct_init(i16* %attr, i32* @method), !dbg !1448
  %152 = load i32* @level, align 4, !dbg !1449
  call void @lm_init(i32 %152, i16* %deflate_flags), !dbg !1449
  %153 = load i16* %deflate_flags, align 2, !dbg !1450
  %154 = trunc i16 %153 to i8, !dbg !1450
  %155 = load i32* @outcnt, align 4, !dbg !1450
  %156 = add i32 %155, 1, !dbg !1450
  store i32 %156, i32* @outcnt, align 4, !dbg !1450
  %157 = zext i32 %155 to i64, !dbg !1450
  %158 = getelementptr inbounds [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i32 0, i64 %157, !dbg !1450
  store i8 %154, i8* %158, align 1, !dbg !1450
  %159 = load i32* @outcnt, align 4, !dbg !1450
  %160 = icmp eq i32 %159, 16384, !dbg !1450
  br i1 %160, label %161, label %162, !dbg !1450

; <label>:161                                     ; preds = %149
  call void @flush_outbuf(), !dbg !1450
  br label %162, !dbg !1450

; <label>:162                                     ; preds = %161, %149
  %163 = load i32* @outcnt, align 4, !dbg !1452
  %164 = add i32 %163, 1, !dbg !1452
  store i32 %164, i32* @outcnt, align 4, !dbg !1452
  %165 = zext i32 %163 to i64, !dbg !1452
  %166 = getelementptr inbounds [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i32 0, i64 %165, !dbg !1452
  store i8 3, i8* %166, align 1, !dbg !1452
  %167 = load i32* @outcnt, align 4, !dbg !1452
  %168 = icmp eq i32 %167, 16384, !dbg !1452
  br i1 %168, label %169, label %170, !dbg !1452

; <label>:169                                     ; preds = %162
  call void @flush_outbuf(), !dbg !1452
  br label %170, !dbg !1452

; <label>:170                                     ; preds = %169, %162
  %171 = load i32* @save_orig_name, align 4, !dbg !1454
  %172 = icmp ne i32 %171, 0, !dbg !1454
  br i1 %172, label %173, label %192, !dbg !1454

; <label>:173                                     ; preds = %170
  call void @llvm.dbg.declare(metadata !115, metadata !1455), !dbg !1457
  %174 = call i8* @basename(i8* getelementptr inbounds ([1024 x i8]* @ifname, i32 0, i32 0)), !dbg !1458
  store i8* %174, i8** %p, align 8, !dbg !1458
  br label %175, !dbg !1459

; <label>:175                                     ; preds = %186, %173
  %176 = load i8** %p, align 8, !dbg !1460
  %177 = load i8* %176, align 1, !dbg !1460
  %178 = load i32* @outcnt, align 4, !dbg !1460
  %179 = add i32 %178, 1, !dbg !1460
  store i32 %179, i32* @outcnt, align 4, !dbg !1460
  %180 = zext i32 %178 to i64, !dbg !1460
  %181 = getelementptr inbounds [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i32 0, i64 %180, !dbg !1460
  store i8 %177, i8* %181, align 1, !dbg !1460
  %182 = load i32* @outcnt, align 4, !dbg !1460
  %183 = icmp eq i32 %182, 16384, !dbg !1460
  br i1 %183, label %184, label %185, !dbg !1460

; <label>:184                                     ; preds = %175
  call void @flush_outbuf(), !dbg !1460
  br label %185, !dbg !1460

; <label>:185                                     ; preds = %184, %175
  br label %186, !dbg !1463

; <label>:186                                     ; preds = %185
  %187 = load i8** %p, align 8, !dbg !1463
  %188 = getelementptr inbounds i8* %187, i32 1, !dbg !1463
  store i8* %188, i8** %p, align 8, !dbg !1463
  %189 = load i8* %187, align 1, !dbg !1463
  %190 = icmp ne i8 %189, 0, !dbg !1463
  br i1 %190, label %175, label %191, !dbg !1463

; <label>:191                                     ; preds = %186
  br label %192, !dbg !1464

; <label>:192                                     ; preds = %191, %170
  %193 = load i32* @outcnt, align 4, !dbg !1465
  %194 = zext i32 %193 to i64, !dbg !1465
  store i64 %194, i64* @header_bytes, align 8, !dbg !1465
  %195 = call i64 @deflate(), !dbg !1466
  %196 = load i32* @outcnt, align 4, !dbg !1467
  %197 = icmp ult i32 %196, 16382, !dbg !1467
  br i1 %197, label %198, label %217, !dbg !1467

; <label>:198                                     ; preds = %192
  %199 = load i64* @crc, align 8, !dbg !1470
  %200 = and i64 %199, 65535, !dbg !1470
  %201 = and i64 %200, 255, !dbg !1470
  %202 = trunc i64 %201 to i8, !dbg !1470
  %203 = load i32* @outcnt, align 4, !dbg !1470
  %204 = add i32 %203, 1, !dbg !1470
  store i32 %204, i32* @outcnt, align 4, !dbg !1470
  %205 = zext i32 %203 to i64, !dbg !1470
  %206 = getelementptr inbounds [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i32 0, i64 %205, !dbg !1470
  store i8 %202, i8* %206, align 1, !dbg !1470
  %207 = load i64* @crc, align 8, !dbg !1470
  %208 = and i64 %207, 65535, !dbg !1470
  %209 = trunc i64 %208 to i16, !dbg !1470
  %210 = zext i16 %209 to i32, !dbg !1470
  %211 = ashr i32 %210, 8, !dbg !1470
  %212 = trunc i32 %211 to i8, !dbg !1470
  %213 = load i32* @outcnt, align 4, !dbg !1470
  %214 = add i32 %213, 1, !dbg !1470
  store i32 %214, i32* @outcnt, align 4, !dbg !1470
  %215 = zext i32 %213 to i64, !dbg !1470
  %216 = getelementptr inbounds [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i32 0, i64 %215, !dbg !1470
  store i8 %212, i8* %216, align 1, !dbg !1470
  br label %244, !dbg !1470

; <label>:217                                     ; preds = %192
  %218 = load i64* @crc, align 8, !dbg !1472
  %219 = and i64 %218, 65535, !dbg !1472
  %220 = and i64 %219, 255, !dbg !1472
  %221 = trunc i64 %220 to i8, !dbg !1472
  %222 = load i32* @outcnt, align 4, !dbg !1472
  %223 = add i32 %222, 1, !dbg !1472
  store i32 %223, i32* @outcnt, align 4, !dbg !1472
  %224 = zext i32 %222 to i64, !dbg !1472
  %225 = getelementptr inbounds [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i32 0, i64 %224, !dbg !1472
  store i8 %221, i8* %225, align 1, !dbg !1472
  %226 = load i32* @outcnt, align 4, !dbg !1472
  %227 = icmp eq i32 %226, 16384, !dbg !1472
  br i1 %227, label %228, label %229, !dbg !1472

; <label>:228                                     ; preds = %217
  call void @flush_outbuf(), !dbg !1472
  br label %229, !dbg !1472

; <label>:229                                     ; preds = %228, %217
  %230 = load i64* @crc, align 8, !dbg !1475
  %231 = and i64 %230, 65535, !dbg !1475
  %232 = trunc i64 %231 to i16, !dbg !1475
  %233 = zext i16 %232 to i32, !dbg !1475
  %234 = ashr i32 %233, 8, !dbg !1475
  %235 = trunc i32 %234 to i8, !dbg !1475
  %236 = load i32* @outcnt, align 4, !dbg !1475
  %237 = add i32 %236, 1, !dbg !1475
  store i32 %237, i32* @outcnt, align 4, !dbg !1475
  %238 = zext i32 %236 to i64, !dbg !1475
  %239 = getelementptr inbounds [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i32 0, i64 %238, !dbg !1475
  store i8 %235, i8* %239, align 1, !dbg !1475
  %240 = load i32* @outcnt, align 4, !dbg !1475
  %241 = icmp eq i32 %240, 16384, !dbg !1475
  br i1 %241, label %242, label %243, !dbg !1475

; <label>:242                                     ; preds = %229
  call void @flush_outbuf(), !dbg !1475
  br label %243, !dbg !1475

; <label>:243                                     ; preds = %242, %229
  br label %244

; <label>:244                                     ; preds = %243, %198
  %245 = load i32* @outcnt, align 4, !dbg !1477
  %246 = icmp ult i32 %245, 16382, !dbg !1477
  br i1 %246, label %247, label %266, !dbg !1477

; <label>:247                                     ; preds = %244
  %248 = load i64* @crc, align 8, !dbg !1479
  %249 = lshr i64 %248, 16, !dbg !1479
  %250 = and i64 %249, 255, !dbg !1479
  %251 = trunc i64 %250 to i8, !dbg !1479
  %252 = load i32* @outcnt, align 4, !dbg !1479
  %253 = add i32 %252, 1, !dbg !1479
  store i32 %253, i32* @outcnt, align 4, !dbg !1479
  %254 = zext i32 %252 to i64, !dbg !1479
  %255 = getelementptr inbounds [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i32 0, i64 %254, !dbg !1479
  store i8 %251, i8* %255, align 1, !dbg !1479
  %256 = load i64* @crc, align 8, !dbg !1479
  %257 = lshr i64 %256, 16, !dbg !1479
  %258 = trunc i64 %257 to i16, !dbg !1479
  %259 = zext i16 %258 to i32, !dbg !1479
  %260 = ashr i32 %259, 8, !dbg !1479
  %261 = trunc i32 %260 to i8, !dbg !1479
  %262 = load i32* @outcnt, align 4, !dbg !1479
  %263 = add i32 %262, 1, !dbg !1479
  store i32 %263, i32* @outcnt, align 4, !dbg !1479
  %264 = zext i32 %262 to i64, !dbg !1479
  %265 = getelementptr inbounds [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i32 0, i64 %264, !dbg !1479
  store i8 %261, i8* %265, align 1, !dbg !1479
  br label %293, !dbg !1479

; <label>:266                                     ; preds = %244
  %267 = load i64* @crc, align 8, !dbg !1481
  %268 = lshr i64 %267, 16, !dbg !1481
  %269 = and i64 %268, 255, !dbg !1481
  %270 = trunc i64 %269 to i8, !dbg !1481
  %271 = load i32* @outcnt, align 4, !dbg !1481
  %272 = add i32 %271, 1, !dbg !1481
  store i32 %272, i32* @outcnt, align 4, !dbg !1481
  %273 = zext i32 %271 to i64, !dbg !1481
  %274 = getelementptr inbounds [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i32 0, i64 %273, !dbg !1481
  store i8 %270, i8* %274, align 1, !dbg !1481
  %275 = load i32* @outcnt, align 4, !dbg !1481
  %276 = icmp eq i32 %275, 16384, !dbg !1481
  br i1 %276, label %277, label %278, !dbg !1481

; <label>:277                                     ; preds = %266
  call void @flush_outbuf(), !dbg !1481
  br label %278, !dbg !1481

; <label>:278                                     ; preds = %277, %266
  %279 = load i64* @crc, align 8, !dbg !1484
  %280 = lshr i64 %279, 16, !dbg !1484
  %281 = trunc i64 %280 to i16, !dbg !1484
  %282 = zext i16 %281 to i32, !dbg !1484
  %283 = ashr i32 %282, 8, !dbg !1484
  %284 = trunc i32 %283 to i8, !dbg !1484
  %285 = load i32* @outcnt, align 4, !dbg !1484
  %286 = add i32 %285, 1, !dbg !1484
  store i32 %286, i32* @outcnt, align 4, !dbg !1484
  %287 = zext i32 %285 to i64, !dbg !1484
  %288 = getelementptr inbounds [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i32 0, i64 %287, !dbg !1484
  store i8 %284, i8* %288, align 1, !dbg !1484
  %289 = load i32* @outcnt, align 4, !dbg !1484
  %290 = icmp eq i32 %289, 16384, !dbg !1484
  br i1 %290, label %291, label %292, !dbg !1484

; <label>:291                                     ; preds = %278
  call void @flush_outbuf(), !dbg !1484
  br label %292, !dbg !1484

; <label>:292                                     ; preds = %291, %278
  br label %293

; <label>:293                                     ; preds = %292, %247
  %294 = load i32* @outcnt, align 4, !dbg !1486
  %295 = icmp ult i32 %294, 16382, !dbg !1486
  br i1 %295, label %296, label %315, !dbg !1486

; <label>:296                                     ; preds = %293
  %297 = load i64* @bytes_in, align 8, !dbg !1489
  %298 = and i64 %297, 65535, !dbg !1489
  %299 = and i64 %298, 255, !dbg !1489
  %300 = trunc i64 %299 to i8, !dbg !1489
  %301 = load i32* @outcnt, align 4, !dbg !1489
  %302 = add i32 %301, 1, !dbg !1489
  store i32 %302, i32* @outcnt, align 4, !dbg !1489
  %303 = zext i32 %301 to i64, !dbg !1489
  %304 = getelementptr inbounds [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i32 0, i64 %303, !dbg !1489
  store i8 %300, i8* %304, align 1, !dbg !1489
  %305 = load i64* @bytes_in, align 8, !dbg !1489
  %306 = and i64 %305, 65535, !dbg !1489
  %307 = trunc i64 %306 to i16, !dbg !1489
  %308 = zext i16 %307 to i32, !dbg !1489
  %309 = ashr i32 %308, 8, !dbg !1489
  %310 = trunc i32 %309 to i8, !dbg !1489
  %311 = load i32* @outcnt, align 4, !dbg !1489
  %312 = add i32 %311, 1, !dbg !1489
  store i32 %312, i32* @outcnt, align 4, !dbg !1489
  %313 = zext i32 %311 to i64, !dbg !1489
  %314 = getelementptr inbounds [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i32 0, i64 %313, !dbg !1489
  store i8 %310, i8* %314, align 1, !dbg !1489
  br label %342, !dbg !1489

; <label>:315                                     ; preds = %293
  %316 = load i64* @bytes_in, align 8, !dbg !1491
  %317 = and i64 %316, 65535, !dbg !1491
  %318 = and i64 %317, 255, !dbg !1491
  %319 = trunc i64 %318 to i8, !dbg !1491
  %320 = load i32* @outcnt, align 4, !dbg !1491
  %321 = add i32 %320, 1, !dbg !1491
  store i32 %321, i32* @outcnt, align 4, !dbg !1491
  %322 = zext i32 %320 to i64, !dbg !1491
  %323 = getelementptr inbounds [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i32 0, i64 %322, !dbg !1491
  store i8 %319, i8* %323, align 1, !dbg !1491
  %324 = load i32* @outcnt, align 4, !dbg !1491
  %325 = icmp eq i32 %324, 16384, !dbg !1491
  br i1 %325, label %326, label %327, !dbg !1491

; <label>:326                                     ; preds = %315
  call void @flush_outbuf(), !dbg !1491
  br label %327, !dbg !1491

; <label>:327                                     ; preds = %326, %315
  %328 = load i64* @bytes_in, align 8, !dbg !1494
  %329 = and i64 %328, 65535, !dbg !1494
  %330 = trunc i64 %329 to i16, !dbg !1494
  %331 = zext i16 %330 to i32, !dbg !1494
  %332 = ashr i32 %331, 8, !dbg !1494
  %333 = trunc i32 %332 to i8, !dbg !1494
  %334 = load i32* @outcnt, align 4, !dbg !1494
  %335 = add i32 %334, 1, !dbg !1494
  store i32 %335, i32* @outcnt, align 4, !dbg !1494
  %336 = zext i32 %334 to i64, !dbg !1494
  %337 = getelementptr inbounds [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i32 0, i64 %336, !dbg !1494
  store i8 %333, i8* %337, align 1, !dbg !1494
  %338 = load i32* @outcnt, align 4, !dbg !1494
  %339 = icmp eq i32 %338, 16384, !dbg !1494
  br i1 %339, label %340, label %341, !dbg !1494

; <label>:340                                     ; preds = %327
  call void @flush_outbuf(), !dbg !1494
  br label %341, !dbg !1494

; <label>:341                                     ; preds = %340, %327
  br label %342

; <label>:342                                     ; preds = %341, %296
  %343 = load i32* @outcnt, align 4, !dbg !1496
  %344 = icmp ult i32 %343, 16382, !dbg !1496
  br i1 %344, label %345, label %364, !dbg !1496

; <label>:345                                     ; preds = %342
  %346 = load i64* @bytes_in, align 8, !dbg !1498
  %347 = lshr i64 %346, 16, !dbg !1498
  %348 = and i64 %347, 255, !dbg !1498
  %349 = trunc i64 %348 to i8, !dbg !1498
  %350 = load i32* @outcnt, align 4, !dbg !1498
  %351 = add i32 %350, 1, !dbg !1498
  store i32 %351, i32* @outcnt, align 4, !dbg !1498
  %352 = zext i32 %350 to i64, !dbg !1498
  %353 = getelementptr inbounds [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i32 0, i64 %352, !dbg !1498
  store i8 %349, i8* %353, align 1, !dbg !1498
  %354 = load i64* @bytes_in, align 8, !dbg !1498
  %355 = lshr i64 %354, 16, !dbg !1498
  %356 = trunc i64 %355 to i16, !dbg !1498
  %357 = zext i16 %356 to i32, !dbg !1498
  %358 = ashr i32 %357, 8, !dbg !1498
  %359 = trunc i32 %358 to i8, !dbg !1498
  %360 = load i32* @outcnt, align 4, !dbg !1498
  %361 = add i32 %360, 1, !dbg !1498
  store i32 %361, i32* @outcnt, align 4, !dbg !1498
  %362 = zext i32 %360 to i64, !dbg !1498
  %363 = getelementptr inbounds [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i32 0, i64 %362, !dbg !1498
  store i8 %359, i8* %363, align 1, !dbg !1498
  br label %391, !dbg !1498

; <label>:364                                     ; preds = %342
  %365 = load i64* @bytes_in, align 8, !dbg !1500
  %366 = lshr i64 %365, 16, !dbg !1500
  %367 = and i64 %366, 255, !dbg !1500
  %368 = trunc i64 %367 to i8, !dbg !1500
  %369 = load i32* @outcnt, align 4, !dbg !1500
  %370 = add i32 %369, 1, !dbg !1500
  store i32 %370, i32* @outcnt, align 4, !dbg !1500
  %371 = zext i32 %369 to i64, !dbg !1500
  %372 = getelementptr inbounds [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i32 0, i64 %371, !dbg !1500
  store i8 %368, i8* %372, align 1, !dbg !1500
  %373 = load i32* @outcnt, align 4, !dbg !1500
  %374 = icmp eq i32 %373, 16384, !dbg !1500
  br i1 %374, label %375, label %376, !dbg !1500

; <label>:375                                     ; preds = %364
  call void @flush_outbuf(), !dbg !1500
  br label %376, !dbg !1500

; <label>:376                                     ; preds = %375, %364
  %377 = load i64* @bytes_in, align 8, !dbg !1503
  %378 = lshr i64 %377, 16, !dbg !1503
  %379 = trunc i64 %378 to i16, !dbg !1503
  %380 = zext i16 %379 to i32, !dbg !1503
  %381 = ashr i32 %380, 8, !dbg !1503
  %382 = trunc i32 %381 to i8, !dbg !1503
  %383 = load i32* @outcnt, align 4, !dbg !1503
  %384 = add i32 %383, 1, !dbg !1503
  store i32 %384, i32* @outcnt, align 4, !dbg !1503
  %385 = zext i32 %383 to i64, !dbg !1503
  %386 = getelementptr inbounds [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i32 0, i64 %385, !dbg !1503
  store i8 %382, i8* %386, align 1, !dbg !1503
  %387 = load i32* @outcnt, align 4, !dbg !1503
  %388 = icmp eq i32 %387, 16384, !dbg !1503
  br i1 %388, label %389, label %390, !dbg !1503

; <label>:389                                     ; preds = %376
  call void @flush_outbuf(), !dbg !1503
  br label %390, !dbg !1503

; <label>:390                                     ; preds = %389, %376
  br label %391

; <label>:391                                     ; preds = %390, %345
  %392 = load i64* @header_bytes, align 8, !dbg !1505
  %393 = add i64 %392, 16, !dbg !1505
  store i64 %393, i64* @header_bytes, align 8, !dbg !1505
  call void @flush_outbuf(), !dbg !1506
  call void @cw_act(i32 1), !dbg !1507
  ret i32 0, !dbg !1508
}

declare i32 @cw_desc(...)

declare void @cw_act(i32)

declare void @flush_outbuf()

declare i64 @updcrc(i8*, i32)

declare void @bi_init(i32)

declare void @ct_init(i16*, i32*)

declare void @lm_init(i32, i16*)

declare i64 @deflate()

define i32 @file_read(i8* %buf, i32 %size) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %len = alloca i32, align 4
  store i8* %buf, i8** %2, align 8
  call void @llvm.dbg.declare(metadata !115, metadata !1509), !dbg !1510
  store i32 %size, i32* %3, align 4
  call void @llvm.dbg.declare(metadata !115, metadata !1511), !dbg !1512
  call void @llvm.dbg.declare(metadata !115, metadata !1513), !dbg !1515
  %4 = load i32* @ifd, align 4, !dbg !1516
  %5 = load i8** %2, align 8, !dbg !1516
  %6 = load i32* %3, align 4, !dbg !1516
  %7 = zext i32 %6 to i64, !dbg !1516
  %8 = call i64 @read(i32 %4, i8* %5, i64 %7), !dbg !1516
  %9 = trunc i64 %8 to i32, !dbg !1516
  store i32 %9, i32* %len, align 4, !dbg !1516
  %10 = load i32* %len, align 4, !dbg !1517
  %11 = icmp eq i32 %10, -1, !dbg !1517
  br i1 %11, label %15, label %12, !dbg !1517

; <label>:12                                      ; preds = %0
  %13 = load i32* %len, align 4, !dbg !1517
  %14 = icmp eq i32 %13, 0, !dbg !1517
  br i1 %14, label %15, label %17, !dbg !1517

; <label>:15                                      ; preds = %12, %0
  %16 = load i32* %len, align 4, !dbg !1518
  store i32 %16, i32* %1, !dbg !1518
  br label %26, !dbg !1518

; <label>:17                                      ; preds = %12
  %18 = load i8** %2, align 8, !dbg !1519
  %19 = load i32* %len, align 4, !dbg !1519
  %20 = call i64 @updcrc(i8* %18, i32 %19), !dbg !1519
  store i64 %20, i64* @crc, align 8, !dbg !1519
  %21 = load i32* %len, align 4, !dbg !1520
  %22 = zext i32 %21 to i64, !dbg !1520
  %23 = load i64* @bytes_in, align 8, !dbg !1520
  %24 = add i64 %23, %22, !dbg !1520
  store i64 %24, i64* @bytes_in, align 8, !dbg !1520
  %25 = load i32* %len, align 4, !dbg !1521
  store i32 %25, i32* %1, !dbg !1521
  br label %26, !dbg !1521

; <label>:26                                      ; preds = %17, %15
  %27 = load i32* %1, !dbg !1522
  ret i32 %27, !dbg !1522
}

!llvm.dbg.cu = !{!0, !226}

!0 = metadata !{i32 786449, i32 0, i32 12, metadata !"gzip.c", metadata !"/home/capsicum/wvd/gzip-1.2.4", metadata !"clang version 3.1 (tags/RELEASE_31/final)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !120} ; [ DW_TAG_compile_unit ]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5, metadata !15, metadata !18, metadata !21, metadata !24, metadata !82, metadata !85, metadata !88, metadata !91, metadata !92, metadata !95, metadata !98, metadata !99, metadata !100, metadata !101, metadata !102, metadata !105, metadata !106, metadata !112, metadata !113, metadata !116, metadata !117, metadata !118, metadata !119}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"main", metadata !"main", metadata !"", metadata !6, i32 424, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i32, i8**)* @main, null, null, metadata !13, i32 427} ; [ DW_TAG_subprogram ]
!6 = metadata !{i32 786473, metadata !"gzip.c", metadata !"/home/capsicum/wvd/gzip-1.2.4", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!8 = metadata !{metadata !9, metadata !9, metadata !10}
!9 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!10 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ]
!11 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !12} ; [ DW_TAG_pointer_type ]
!12 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!13 = metadata !{metadata !14}
!14 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!15 = metadata !{i32 786478, i32 0, metadata !6, metadata !"treat_file", metadata !"treat_file", metadata !"", metadata !6, i32 710, metadata !16, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, void (i8*)* @treat_file, null, null, metadata !13, i32 712} ; [ DW_TAG_subprogram ]
!16 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !17, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!17 = metadata !{null, metadata !11}
!18 = metadata !{i32 786478, i32 0, metadata !6, metadata !"abort_gzip", metadata !"abort_gzip", metadata !"", metadata !6, i32 1743, metadata !19, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @abort_gzip, null, null, metadata !13, i32 1744} ; [ DW_TAG_subprogram ]
!19 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !20, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!20 = metadata !{metadata !9}
!21 = metadata !{i32 786478, i32 0, metadata !6, metadata !"do_exit", metadata !"do_exit", metadata !"", metadata !6, i32 1718, metadata !22, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 false, void (i32)* @do_exit, null, null, metadata !13, i32 1720} ; [ DW_TAG_subprogram ]
!22 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !23, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!23 = metadata !{null, metadata !9}
!24 = metadata !{i32 786478, i32 0, metadata !6, metadata !"copy_stat", metadata !"copy_stat", metadata !"", metadata !6, i32 1620, metadata !25, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 false, void (%struct.stat*)* @copy_stat, null, null, metadata !13, i32 1622} ; [ DW_TAG_subprogram ]
!25 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !26, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!26 = metadata !{null, metadata !27}
!27 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !28} ; [ DW_TAG_pointer_type ]
!28 = metadata !{i32 786451, null, metadata !"stat", metadata !29, i32 122, i64 960, i64 64, i32 0, i32 0, null, metadata !30, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!29 = metadata !{i32 786473, metadata !"/usr/include/sys/stat.h", metadata !"/home/capsicum/wvd/gzip-1.2.4", null} ; [ DW_TAG_file_type ]
!30 = metadata !{metadata !31, metadata !35, metadata !38, metadata !43, metadata !46, metadata !49, metadata !52, metadata !53, metadata !64, metadata !65, metadata !66, metadata !69, metadata !72, metadata !75, metadata !78, metadata !79, metadata !81}
!31 = metadata !{i32 786445, metadata !28, metadata !"st_dev", metadata !29, i32 123, i64 32, i64 32, i64 0, i32 0, metadata !32} ; [ DW_TAG_member ]
!32 = metadata !{i32 786454, null, metadata !"__dev_t", metadata !29, i32 93, i64 0, i64 0, i64 0, i32 0, metadata !33} ; [ DW_TAG_typedef ]
!33 = metadata !{i32 786454, null, metadata !"__uint32_t", metadata !29, i32 56, i64 0, i64 0, i64 0, i32 0, metadata !34} ; [ DW_TAG_typedef ]
!34 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!35 = metadata !{i32 786445, metadata !28, metadata !"st_ino", metadata !29, i32 124, i64 32, i64 32, i64 32, i32 0, metadata !36} ; [ DW_TAG_member ]
!36 = metadata !{i32 786454, null, metadata !"ino_t", metadata !29, i32 191, i64 0, i64 0, i64 0, i32 0, metadata !37} ; [ DW_TAG_typedef ]
!37 = metadata !{i32 786454, null, metadata !"__ino_t", metadata !29, i32 47, i64 0, i64 0, i64 0, i32 0, metadata !33} ; [ DW_TAG_typedef ]
!38 = metadata !{i32 786445, metadata !28, metadata !"st_mode", metadata !29, i32 125, i64 16, i64 16, i64 64, i32 0, metadata !39} ; [ DW_TAG_member ]
!39 = metadata !{i32 786454, null, metadata !"mode_t", metadata !29, i32 206, i64 0, i64 0, i64 0, i32 0, metadata !40} ; [ DW_TAG_typedef ]
!40 = metadata !{i32 786454, null, metadata !"__mode_t", metadata !29, i32 50, i64 0, i64 0, i64 0, i32 0, metadata !41} ; [ DW_TAG_typedef ]
!41 = metadata !{i32 786454, null, metadata !"__uint16_t", metadata !29, i32 54, i64 0, i64 0, i64 0, i32 0, metadata !42} ; [ DW_TAG_typedef ]
!42 = metadata !{i32 786468, null, metadata !"unsigned short", null, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!43 = metadata !{i32 786445, metadata !28, metadata !"st_nlink", metadata !29, i32 126, i64 16, i64 16, i64 80, i32 0, metadata !44} ; [ DW_TAG_member ]
!44 = metadata !{i32 786454, null, metadata !"nlink_t", metadata !29, i32 216, i64 0, i64 0, i64 0, i32 0, metadata !45} ; [ DW_TAG_typedef ]
!45 = metadata !{i32 786454, null, metadata !"__nlink_t", metadata !29, i32 53, i64 0, i64 0, i64 0, i32 0, metadata !41} ; [ DW_TAG_typedef ]
!46 = metadata !{i32 786445, metadata !28, metadata !"st_uid", metadata !29, i32 127, i64 32, i64 32, i64 96, i32 0, metadata !47} ; [ DW_TAG_member ]
!47 = metadata !{i32 786454, null, metadata !"uid_t", metadata !29, i32 272, i64 0, i64 0, i64 0, i32 0, metadata !48} ; [ DW_TAG_typedef ]
!48 = metadata !{i32 786454, null, metadata !"__uid_t", metadata !29, i32 64, i64 0, i64 0, i64 0, i32 0, metadata !33} ; [ DW_TAG_typedef ]
!49 = metadata !{i32 786445, metadata !28, metadata !"st_gid", metadata !29, i32 128, i64 32, i64 32, i64 128, i32 0, metadata !50} ; [ DW_TAG_member ]
!50 = metadata !{i32 786454, null, metadata !"gid_t", metadata !29, i32 171, i64 0, i64 0, i64 0, i32 0, metadata !51} ; [ DW_TAG_typedef ]
!51 = metadata !{i32 786454, null, metadata !"__gid_t", metadata !29, i32 45, i64 0, i64 0, i64 0, i32 0, metadata !33} ; [ DW_TAG_typedef ]
!52 = metadata !{i32 786445, metadata !28, metadata !"st_rdev", metadata !29, i32 129, i64 32, i64 32, i64 160, i32 0, metadata !32} ; [ DW_TAG_member ]
!53 = metadata !{i32 786445, metadata !28, metadata !"st_atim", metadata !29, i32 130, i64 128, i64 64, i64 192, i32 0, metadata !54} ; [ DW_TAG_member ]
!54 = metadata !{i32 786451, null, metadata !"timespec", metadata !55, i32 44, i64 128, i64 64, i32 0, i32 0, null, metadata !56, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!55 = metadata !{i32 786473, metadata !"/usr/include/sys/_timespec.h", metadata !"/home/capsicum/wvd/gzip-1.2.4", null} ; [ DW_TAG_file_type ]
!56 = metadata !{metadata !57, metadata !63}
!57 = metadata !{i32 786445, metadata !54, metadata !"tv_sec", metadata !55, i32 45, i64 64, i64 64, i64 0, i32 0, metadata !58} ; [ DW_TAG_member ]
!58 = metadata !{i32 786454, null, metadata !"time_t", metadata !55, i32 255, i64 0, i64 0, i64 0, i32 0, metadata !59} ; [ DW_TAG_typedef ]
!59 = metadata !{i32 786454, null, metadata !"__time_t", metadata !55, i32 84, i64 0, i64 0, i64 0, i32 0, metadata !60} ; [ DW_TAG_typedef ]
!60 = metadata !{i32 786454, null, metadata !"__int64_t", metadata !61, i32 57, i64 0, i64 0, i64 0, i32 0, metadata !62} ; [ DW_TAG_typedef ]
!61 = metadata !{i32 786473, metadata !"/usr/include/stdio.h", metadata !"/home/capsicum/wvd/gzip-1.2.4", null} ; [ DW_TAG_file_type ]
!62 = metadata !{i32 786468, null, metadata !"long int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!63 = metadata !{i32 786445, metadata !54, metadata !"tv_nsec", metadata !55, i32 46, i64 64, i64 64, i64 64, i32 0, metadata !62} ; [ DW_TAG_member ]
!64 = metadata !{i32 786445, metadata !28, metadata !"st_mtim", metadata !29, i32 131, i64 128, i64 64, i64 320, i32 0, metadata !54} ; [ DW_TAG_member ]
!65 = metadata !{i32 786445, metadata !28, metadata !"st_ctim", metadata !29, i32 132, i64 128, i64 64, i64 448, i32 0, metadata !54} ; [ DW_TAG_member ]
!66 = metadata !{i32 786445, metadata !28, metadata !"st_size", metadata !29, i32 133, i64 64, i64 64, i64 576, i32 0, metadata !67} ; [ DW_TAG_member ]
!67 = metadata !{i32 786454, null, metadata !"off_t", metadata !29, i32 221, i64 0, i64 0, i64 0, i32 0, metadata !68} ; [ DW_TAG_typedef ]
!68 = metadata !{i32 786454, null, metadata !"__off_t", metadata !61, i32 54, i64 0, i64 0, i64 0, i32 0, metadata !60} ; [ DW_TAG_typedef ]
!69 = metadata !{i32 786445, metadata !28, metadata !"st_blocks", metadata !29, i32 134, i64 64, i64 64, i64 640, i32 0, metadata !70} ; [ DW_TAG_member ]
!70 = metadata !{i32 786454, null, metadata !"blkcnt_t", metadata !29, i32 132, i64 0, i64 0, i64 0, i32 0, metadata !71} ; [ DW_TAG_typedef ]
!71 = metadata !{i32 786454, null, metadata !"__blkcnt_t", metadata !29, i32 39, i64 0, i64 0, i64 0, i32 0, metadata !60} ; [ DW_TAG_typedef ]
!72 = metadata !{i32 786445, metadata !28, metadata !"st_blksize", metadata !29, i32 135, i64 32, i64 32, i64 704, i32 0, metadata !73} ; [ DW_TAG_member ]
!73 = metadata !{i32 786454, null, metadata !"blksize_t", metadata !29, i32 123, i64 0, i64 0, i64 0, i32 0, metadata !74} ; [ DW_TAG_typedef ]
!74 = metadata !{i32 786454, null, metadata !"__blksize_t", metadata !29, i32 38, i64 0, i64 0, i64 0, i32 0, metadata !33} ; [ DW_TAG_typedef ]
!75 = metadata !{i32 786445, metadata !28, metadata !"st_flags", metadata !29, i32 136, i64 32, i64 32, i64 736, i32 0, metadata !76} ; [ DW_TAG_member ]
!76 = metadata !{i32 786454, null, metadata !"fflags_t", metadata !29, i32 158, i64 0, i64 0, i64 0, i32 0, metadata !77} ; [ DW_TAG_typedef ]
!77 = metadata !{i32 786454, null, metadata !"__fflags_t", metadata !29, i32 42, i64 0, i64 0, i64 0, i32 0, metadata !33} ; [ DW_TAG_typedef ]
!78 = metadata !{i32 786445, metadata !28, metadata !"st_gen", metadata !29, i32 137, i64 32, i64 32, i64 768, i32 0, metadata !33} ; [ DW_TAG_member ]
!79 = metadata !{i32 786445, metadata !28, metadata !"st_lspare", metadata !29, i32 138, i64 32, i64 32, i64 800, i32 0, metadata !80} ; [ DW_TAG_member ]
!80 = metadata !{i32 786454, null, metadata !"__int32_t", metadata !29, i32 55, i64 0, i64 0, i64 0, i32 0, metadata !9} ; [ DW_TAG_typedef ]
!81 = metadata !{i32 786445, metadata !28, metadata !"st_birthtim", metadata !29, i32 139, i64 128, i64 64, i64 832, i32 0, metadata !54} ; [ DW_TAG_member ]
!82 = metadata !{i32 786478, i32 0, metadata !6, metadata !"reset_times", metadata !"reset_times", metadata !"", metadata !6, i32 1597, metadata !83, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 false, void (i8*, %struct.stat*)* @reset_times, null, null, metadata !13, i32 1600} ; [ DW_TAG_subprogram ]
!83 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !84, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!84 = metadata !{null, metadata !11, metadata !27}
!85 = metadata !{i32 786478, i32 0, metadata !6, metadata !"do_list", metadata !"do_list", metadata !"", metadata !6, i32 1325, metadata !86, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 false, void (i32, i32)* @do_list, null, null, metadata !13, i32 1328} ; [ DW_TAG_subprogram ]
!86 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !87, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!87 = metadata !{null, metadata !9, metadata !9}
!88 = metadata !{i32 786478, i32 0, metadata !6, metadata !"get_method", metadata !"get_method", metadata !"", metadata !6, i32 1157, metadata !89, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i32)* @get_method, null, null, metadata !13, i32 1159} ; [ DW_TAG_subprogram ]
!89 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !90, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!90 = metadata !{metadata !9, metadata !9}
!91 = metadata !{i32 786478, i32 0, metadata !6, metadata !"make_ofname", metadata !"make_ofname", metadata !"", metadata !6, i32 1078, metadata !19, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @make_ofname, null, null, metadata !13, i32 1079} ; [ DW_TAG_subprogram ]
!92 = metadata !{i32 786478, i32 0, metadata !6, metadata !"get_suffix", metadata !"get_suffix", metadata !"", metadata !6, i32 954, metadata !93, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 false, i8* (i8*)* @get_suffix, null, null, metadata !13, i32 956} ; [ DW_TAG_subprogram ]
!93 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !94, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!94 = metadata !{metadata !11, metadata !11}
!95 = metadata !{i32 786478, i32 0, metadata !6, metadata !"get_istat", metadata !"get_istat", metadata !"", metadata !6, i32 1003, metadata !96, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i8*, %struct.stat*)* @get_istat, null, null, metadata !13, i32 1006} ; [ DW_TAG_subprogram ]
!96 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !97, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!97 = metadata !{metadata !9, metadata !11, metadata !27}
!98 = metadata !{i32 786478, i32 0, metadata !6, metadata !"do_stat", metadata !"do_stat", metadata !"", metadata !6, i32 929, metadata !96, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i8*, %struct.stat*)* @do_stat, null, null, metadata !13, i32 932} ; [ DW_TAG_subprogram ]
!99 = metadata !{i32 786478, i32 0, metadata !6, metadata !"create_outfile", metadata !"create_outfile", metadata !"", metadata !6, i32 869, metadata !19, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @create_outfile, null, null, metadata !13, i32 870} ; [ DW_TAG_subprogram ]
!100 = metadata !{i32 786478, i32 0, metadata !6, metadata !"shorten_name", metadata !"shorten_name", metadata !"", metadata !6, i32 1461, metadata !16, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 false, void (i8*)* @shorten_name, null, null, metadata !13, i32 1463} ; [ DW_TAG_subprogram ]
!101 = metadata !{i32 786478, i32 0, metadata !6, metadata !"name_too_long", metadata !"name_too_long", metadata !"", metadata !6, i32 1435, metadata !96, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i8*, %struct.stat*)* @name_too_long, null, null, metadata !13, i32 1438} ; [ DW_TAG_subprogram ]
!102 = metadata !{i32 786478, i32 0, metadata !6, metadata !"same_file", metadata !"same_file", metadata !"", metadata !6, i32 1412, metadata !103, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (%struct.stat*, %struct.stat*)* @same_file, null, null, metadata !13, i32 1415} ; [ DW_TAG_subprogram ]
!103 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !104, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!104 = metadata !{metadata !9, metadata !27, metadata !27}
!105 = metadata !{i32 786478, i32 0, metadata !6, metadata !"check_ofname", metadata !"check_ofname", metadata !"", metadata !6, i32 1527, metadata !19, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @check_ofname, null, null, metadata !13, i32 1528} ; [ DW_TAG_subprogram ]
!106 = metadata !{i32 786478, i32 0, metadata !107, metadata !"__sbistype", metadata !"__sbistype", metadata !"", metadata !107, i32 117, metadata !108, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i64)* @__sbistype, null, null, metadata !13, i32 118} ; [ DW_TAG_subprogram ]
!107 = metadata !{i32 786473, metadata !"/usr/include/_ctype.h", metadata !"/home/capsicum/wvd/gzip-1.2.4", null} ; [ DW_TAG_file_type ]
!108 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !109, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!109 = metadata !{metadata !9, metadata !110, metadata !111}
!110 = metadata !{i32 786454, null, metadata !"__ct_rune_t", metadata !107, i32 88, i64 0, i64 0, i64 0, i32 0, metadata !9} ; [ DW_TAG_typedef ]
!111 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!112 = metadata !{i32 786478, i32 0, metadata !107, metadata !"__sbmaskrune", metadata !"__sbmaskrune", metadata !"", metadata !107, i32 104, metadata !108, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i64)* @__sbmaskrune, null, null, metadata !13, i32 105} ; [ DW_TAG_subprogram ]
!113 = metadata !{i32 786478, i32 0, metadata !6, metadata !"treat_stdin", metadata !"treat_stdin", metadata !"", metadata !6, i32 608, metadata !114, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @treat_stdin, null, null, metadata !13, i32 609} ; [ DW_TAG_subprogram ]
!114 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !115, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!115 = metadata !{null}
!116 = metadata !{i32 786478, i32 0, metadata !6, metadata !"version", metadata !"version", metadata !"", metadata !6, i32 379, metadata !114, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @version, null, null, metadata !13, i32 380} ; [ DW_TAG_subprogram ]
!117 = metadata !{i32 786478, i32 0, metadata !6, metadata !"usage", metadata !"usage", metadata !"", metadata !6, i32 308, metadata !114, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @usage, null, null, metadata !13, i32 309} ; [ DW_TAG_subprogram ]
!118 = metadata !{i32 786478, i32 0, metadata !6, metadata !"license", metadata !"license", metadata !"", metadata !6, i32 370, metadata !114, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @license, null, null, metadata !13, i32 371} ; [ DW_TAG_subprogram ]
!119 = metadata !{i32 786478, i32 0, metadata !6, metadata !"help", metadata !"help", metadata !"", metadata !6, i32 326, metadata !114, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @help, null, null, metadata !13, i32 327} ; [ DW_TAG_subprogram ]
!120 = metadata !{metadata !121}
!121 = metadata !{metadata !122, metadata !123, metadata !124, metadata !125, metadata !126, metadata !127, metadata !128, metadata !129, metadata !130, metadata !131, metadata !132, metadata !133, metadata !134, metadata !135, metadata !136, metadata !137, metadata !138, metadata !139, metadata !140, metadata !141, metadata !142, metadata !156, metadata !160, metadata !166, metadata !170, metadata !175, metadata !179, metadata !181, metadata !182, metadata !183, metadata !184, metadata !185, metadata !186, metadata !187, metadata !188, metadata !189, metadata !193, metadata !194, metadata !195, metadata !196, metadata !200, metadata !201, metadata !202, metadata !203, metadata !204, metadata !205, metadata !206, metadata !207, metadata !208, metadata !209, metadata !213, metadata !214, metadata !218, metadata !222}
!122 = metadata !{i32 786484, i32 0, null, metadata !"ascii", metadata !"ascii", metadata !"", metadata !6, i32 201, metadata !9, i32 0, i32 1, i32* @ascii} ; [ DW_TAG_variable ]
!123 = metadata !{i32 786484, i32 0, null, metadata !"to_stdout", metadata !"to_stdout", metadata !"", metadata !6, i32 202, metadata !9, i32 0, i32 1, i32* @to_stdout} ; [ DW_TAG_variable ]
!124 = metadata !{i32 786484, i32 0, null, metadata !"decompress", metadata !"decompress", metadata !"", metadata !6, i32 203, metadata !9, i32 0, i32 1, i32* @decompress} ; [ DW_TAG_variable ]
!125 = metadata !{i32 786484, i32 0, null, metadata !"force", metadata !"force", metadata !"", metadata !6, i32 204, metadata !9, i32 0, i32 1, i32* @force} ; [ DW_TAG_variable ]
!126 = metadata !{i32 786484, i32 0, null, metadata !"no_name", metadata !"no_name", metadata !"", metadata !6, i32 205, metadata !9, i32 0, i32 1, i32* @no_name} ; [ DW_TAG_variable ]
!127 = metadata !{i32 786484, i32 0, null, metadata !"no_time", metadata !"no_time", metadata !"", metadata !6, i32 206, metadata !9, i32 0, i32 1, i32* @no_time} ; [ DW_TAG_variable ]
!128 = metadata !{i32 786484, i32 0, null, metadata !"recursive", metadata !"recursive", metadata !"", metadata !6, i32 207, metadata !9, i32 0, i32 1, i32* @recursive} ; [ DW_TAG_variable ]
!129 = metadata !{i32 786484, i32 0, null, metadata !"list", metadata !"list", metadata !"", metadata !6, i32 208, metadata !9, i32 0, i32 1, i32* @list} ; [ DW_TAG_variable ]
!130 = metadata !{i32 786484, i32 0, null, metadata !"verbose", metadata !"verbose", metadata !"", metadata !6, i32 209, metadata !9, i32 0, i32 1, i32* @verbose} ; [ DW_TAG_variable ]
!131 = metadata !{i32 786484, i32 0, null, metadata !"quiet", metadata !"quiet", metadata !"", metadata !6, i32 210, metadata !9, i32 0, i32 1, i32* @quiet} ; [ DW_TAG_variable ]
!132 = metadata !{i32 786484, i32 0, null, metadata !"do_lzw", metadata !"do_lzw", metadata !"", metadata !6, i32 211, metadata !9, i32 0, i32 1, i32* @do_lzw} ; [ DW_TAG_variable ]
!133 = metadata !{i32 786484, i32 0, null, metadata !"test", metadata !"test", metadata !"", metadata !6, i32 212, metadata !9, i32 0, i32 1, i32* @test} ; [ DW_TAG_variable ]
!134 = metadata !{i32 786484, i32 0, null, metadata !"maxbits", metadata !"maxbits", metadata !"", metadata !6, i32 215, metadata !9, i32 0, i32 1, i32* @maxbits} ; [ DW_TAG_variable ]
!135 = metadata !{i32 786484, i32 0, null, metadata !"method", metadata !"method", metadata !"", metadata !6, i32 216, metadata !9, i32 0, i32 1, i32* @method} ; [ DW_TAG_variable ]
!136 = metadata !{i32 786484, i32 0, null, metadata !"level", metadata !"level", metadata !"", metadata !6, i32 217, metadata !9, i32 0, i32 1, i32* @level} ; [ DW_TAG_variable ]
!137 = metadata !{i32 786484, i32 0, null, metadata !"exit_code", metadata !"exit_code", metadata !"", metadata !6, i32 218, metadata !9, i32 0, i32 1, i32* @exit_code} ; [ DW_TAG_variable ]
!138 = metadata !{i32 786484, i32 0, null, metadata !"args", metadata !"args", metadata !"", metadata !6, i32 225, metadata !10, i32 0, i32 1, i8*** @args} ; [ DW_TAG_variable ]
!139 = metadata !{i32 786484, i32 0, null, metadata !"total_in", metadata !"total_in", metadata !"", metadata !6, i32 231, metadata !62, i32 0, i32 1, i64* @total_in} ; [ DW_TAG_variable ]
!140 = metadata !{i32 786484, i32 0, null, metadata !"total_out", metadata !"total_out", metadata !"", metadata !6, i32 232, metadata !62, i32 0, i32 1, i64* @total_out} ; [ DW_TAG_variable ]
!141 = metadata !{i32 786484, i32 0, null, metadata !"remove_ofname", metadata !"remove_ofname", metadata !"", metadata !6, i32 235, metadata !9, i32 0, i32 1, i32* @remove_ofname} ; [ DW_TAG_variable ]
!142 = metadata !{i32 786484, i32 0, null, metadata !"longopts", metadata !"longopts", metadata !"", metadata !6, i32 243, metadata !143, i32 0, i32 1, <{ { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] } }>* @longopts} ; [ DW_TAG_variable ]
!143 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 6144, i64 64, i32 0, i32 0, metadata !144, metadata !154, i32 0, i32 0} ; [ DW_TAG_array_type ]
!144 = metadata !{i32 786451, null, metadata !"option", metadata !145, i32 77, i64 256, i64 64, i32 0, i32 0, null, metadata !146, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!145 = metadata !{i32 786473, metadata !"./getopt.h", metadata !"/home/capsicum/wvd/gzip-1.2.4", null} ; [ DW_TAG_file_type ]
!146 = metadata !{metadata !147, metadata !150, metadata !151, metadata !153}
!147 = metadata !{i32 786445, metadata !144, metadata !"name", metadata !145, i32 80, i64 64, i64 64, i64 0, i32 0, metadata !148} ; [ DW_TAG_member ]
!148 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !149} ; [ DW_TAG_pointer_type ]
!149 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !12} ; [ DW_TAG_const_type ]
!150 = metadata !{i32 786445, metadata !144, metadata !"has_arg", metadata !145, i32 86, i64 32, i64 32, i64 64, i32 0, metadata !9} ; [ DW_TAG_member ]
!151 = metadata !{i32 786445, metadata !144, metadata !"flag", metadata !145, i32 87, i64 64, i64 64, i64 128, i32 0, metadata !152} ; [ DW_TAG_member ]
!152 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ]
!153 = metadata !{i32 786445, metadata !144, metadata !"val", metadata !145, i32 88, i64 32, i64 32, i64 192, i32 0, metadata !9} ; [ DW_TAG_member ]
!154 = metadata !{metadata !155}
!155 = metadata !{i32 786465, i64 0, i64 23}      ; [ DW_TAG_subrange_type ]
!156 = metadata !{i32 786484, i32 0, null, metadata !"work", metadata !"work", metadata !"", metadata !6, i32 296, metadata !157, i32 0, i32 1, i32 (i32, i32)** @work} ; [ DW_TAG_variable ]
!157 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !158} ; [ DW_TAG_pointer_type ]
!158 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !159, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!159 = metadata !{metadata !9, metadata !9, metadata !9}
!160 = metadata !{i32 786484, i32 0, null, metadata !"inbuf", metadata !"inbuf", metadata !"", metadata !6, i32 188, metadata !161, i32 0, i32 1, [32832 x i8]* @inbuf} ; [ DW_TAG_variable ]
!161 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 262656, i64 8, i32 0, i32 0, metadata !162, metadata !164, i32 0, i32 0} ; [ DW_TAG_array_type ]
!162 = metadata !{i32 786454, null, metadata !"uch", metadata !6, i32 44, i64 0, i64 0, i64 0, i32 0, metadata !163} ; [ DW_TAG_typedef ]
!163 = metadata !{i32 786468, null, metadata !"unsigned char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!164 = metadata !{metadata !165}
!165 = metadata !{i32 786465, i64 0, i64 32831}   ; [ DW_TAG_subrange_type ]
!166 = metadata !{i32 786484, i32 0, null, metadata !"outbuf", metadata !"outbuf", metadata !"", metadata !6, i32 189, metadata !167, i32 0, i32 1, [18432 x i8]* @outbuf} ; [ DW_TAG_variable ]
!167 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 147456, i64 8, i32 0, i32 0, metadata !162, metadata !168, i32 0, i32 0} ; [ DW_TAG_array_type ]
!168 = metadata !{metadata !169}
!169 = metadata !{i32 786465, i64 0, i64 18431}   ; [ DW_TAG_subrange_type ]
!170 = metadata !{i32 786484, i32 0, null, metadata !"d_buf", metadata !"d_buf", metadata !"", metadata !6, i32 190, metadata !171, i32 0, i32 1, [32768 x i16]* @d_buf} ; [ DW_TAG_variable ]
!171 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 524288, i64 16, i32 0, i32 0, metadata !172, metadata !173, i32 0, i32 0} ; [ DW_TAG_array_type ]
!172 = metadata !{i32 786454, null, metadata !"ush", metadata !6, i32 45, i64 0, i64 0, i64 0, i32 0, metadata !42} ; [ DW_TAG_typedef ]
!173 = metadata !{metadata !174}
!174 = metadata !{i32 786465, i64 0, i64 32767}   ; [ DW_TAG_subrange_type ]
!175 = metadata !{i32 786484, i32 0, null, metadata !"window", metadata !"window", metadata !"", metadata !6, i32 191, metadata !176, i32 0, i32 1, [65536 x i8]* @window} ; [ DW_TAG_variable ]
!176 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 524288, i64 8, i32 0, i32 0, metadata !162, metadata !177, i32 0, i32 0} ; [ DW_TAG_array_type ]
!177 = metadata !{metadata !178}
!178 = metadata !{i32 786465, i64 0, i64 65535}   ; [ DW_TAG_subrange_type ]
!179 = metadata !{i32 786484, i32 0, null, metadata !"prev", metadata !"prev", metadata !"", metadata !6, i32 193, metadata !180, i32 0, i32 1, [65536 x i16]* @prev} ; [ DW_TAG_variable ]
!180 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 1048576, i64 16, i32 0, i32 0, metadata !172, metadata !177, i32 0, i32 0} ; [ DW_TAG_array_type ]
!181 = metadata !{i32 786484, i32 0, null, metadata !"foreground", metadata !"foreground", metadata !"", metadata !6, i32 213, metadata !9, i32 0, i32 1, i32* @foreground} ; [ DW_TAG_variable ]
!182 = metadata !{i32 786484, i32 0, null, metadata !"progname", metadata !"progname", metadata !"", metadata !6, i32 214, metadata !11, i32 0, i32 1, i8** @progname} ; [ DW_TAG_variable ]
!183 = metadata !{i32 786484, i32 0, null, metadata !"save_orig_name", metadata !"save_orig_name", metadata !"", metadata !6, i32 219, metadata !9, i32 0, i32 1, i32* @save_orig_name} ; [ DW_TAG_variable ]
!184 = metadata !{i32 786484, i32 0, null, metadata !"last_member", metadata !"last_member", metadata !"", metadata !6, i32 220, metadata !9, i32 0, i32 1, i32* @last_member} ; [ DW_TAG_variable ]
!185 = metadata !{i32 786484, i32 0, null, metadata !"part_nb", metadata !"part_nb", metadata !"", metadata !6, i32 221, metadata !9, i32 0, i32 1, i32* @part_nb} ; [ DW_TAG_variable ]
!186 = metadata !{i32 786484, i32 0, null, metadata !"time_stamp", metadata !"time_stamp", metadata !"", metadata !6, i32 222, metadata !62, i32 0, i32 1, i64* @time_stamp} ; [ DW_TAG_variable ]
!187 = metadata !{i32 786484, i32 0, null, metadata !"ifile_size", metadata !"ifile_size", metadata !"", metadata !6, i32 223, metadata !62, i32 0, i32 1, i64* @ifile_size} ; [ DW_TAG_variable ]
!188 = metadata !{i32 786484, i32 0, null, metadata !"env", metadata !"env", metadata !"", metadata !6, i32 224, metadata !11, i32 0, i32 1, i8** @env} ; [ DW_TAG_variable ]
!189 = metadata !{i32 786484, i32 0, null, metadata !"z_suffix", metadata !"z_suffix", metadata !"", metadata !6, i32 226, metadata !190, i32 0, i32 1, [31 x i8]* @z_suffix} ; [ DW_TAG_variable ]
!190 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 248, i64 8, i32 0, i32 0, metadata !12, metadata !191, i32 0, i32 0} ; [ DW_TAG_array_type ]
!191 = metadata !{metadata !192}
!192 = metadata !{i32 786465, i64 0, i64 30}      ; [ DW_TAG_subrange_type ]
!193 = metadata !{i32 786484, i32 0, null, metadata !"z_len", metadata !"z_len", metadata !"", metadata !6, i32 227, metadata !9, i32 0, i32 1, i32* @z_len} ; [ DW_TAG_variable ]
!194 = metadata !{i32 786484, i32 0, null, metadata !"bytes_in", metadata !"bytes_in", metadata !"", metadata !6, i32 229, metadata !62, i32 0, i32 1, i64* @bytes_in} ; [ DW_TAG_variable ]
!195 = metadata !{i32 786484, i32 0, null, metadata !"bytes_out", metadata !"bytes_out", metadata !"", metadata !6, i32 230, metadata !62, i32 0, i32 1, i64* @bytes_out} ; [ DW_TAG_variable ]
!196 = metadata !{i32 786484, i32 0, null, metadata !"ifname", metadata !"ifname", metadata !"", metadata !6, i32 233, metadata !197, i32 0, i32 1, [1024 x i8]* @ifname} ; [ DW_TAG_variable ]
!197 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 8192, i64 8, i32 0, i32 0, metadata !12, metadata !198, i32 0, i32 0} ; [ DW_TAG_array_type ]
!198 = metadata !{metadata !199}
!199 = metadata !{i32 786465, i64 0, i64 1023}    ; [ DW_TAG_subrange_type ]
!200 = metadata !{i32 786484, i32 0, null, metadata !"ofname", metadata !"ofname", metadata !"", metadata !6, i32 234, metadata !197, i32 0, i32 1, [1024 x i8]* @ofname} ; [ DW_TAG_variable ]
!201 = metadata !{i32 786484, i32 0, null, metadata !"istat", metadata !"istat", metadata !"", metadata !6, i32 236, metadata !28, i32 0, i32 1, %struct.stat* @istat} ; [ DW_TAG_variable ]
!202 = metadata !{i32 786484, i32 0, null, metadata !"ifd", metadata !"ifd", metadata !"", metadata !6, i32 237, metadata !9, i32 0, i32 1, i32* @ifd} ; [ DW_TAG_variable ]
!203 = metadata !{i32 786484, i32 0, null, metadata !"ofd", metadata !"ofd", metadata !"", metadata !6, i32 238, metadata !9, i32 0, i32 1, i32* @ofd} ; [ DW_TAG_variable ]
!204 = metadata !{i32 786484, i32 0, null, metadata !"insize", metadata !"insize", metadata !"", metadata !6, i32 239, metadata !34, i32 0, i32 1, i32* @insize} ; [ DW_TAG_variable ]
!205 = metadata !{i32 786484, i32 0, null, metadata !"inptr", metadata !"inptr", metadata !"", metadata !6, i32 240, metadata !34, i32 0, i32 1, i32* @inptr} ; [ DW_TAG_variable ]
!206 = metadata !{i32 786484, i32 0, null, metadata !"outcnt", metadata !"outcnt", metadata !"", metadata !6, i32 241, metadata !34, i32 0, i32 1, i32* @outcnt} ; [ DW_TAG_variable ]
!207 = metadata !{i32 786484, i32 0, metadata !21, metadata !"in_exit", metadata !"in_exit", metadata !"", metadata !6, i32 1721, metadata !9, i32 1, i32 1, i32* @do_exit.in_exit} ; [ DW_TAG_variable ]
!208 = metadata !{i32 786484, i32 0, metadata !85, metadata !"first_time", metadata !"first_time", metadata !"", metadata !6, i32 1330, metadata !9, i32 1, i32 1, i32* @do_list.first_time} ; [ DW_TAG_variable ]
!209 = metadata !{i32 786484, i32 0, metadata !85, metadata !"methods", metadata !"methods", metadata !"", metadata !6, i32 1331, metadata !210, i32 1, i32 1, [9 x i8*]* @do_list.methods} ; [ DW_TAG_variable ]
!210 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 576, i64 64, i32 0, i32 0, metadata !11, metadata !211, i32 0, i32 0} ; [ DW_TAG_array_type ]
!211 = metadata !{metadata !212}
!212 = metadata !{i32 786465, i64 0, i64 8}       ; [ DW_TAG_subrange_type ]
!213 = metadata !{i32 786484, i32 0, metadata !92, metadata !"known_suffixes", metadata !"known_suffixes", metadata !"", metadata !6, i32 959, metadata !210, i32 1, i32 1, [9 x i8*]* @get_suffix.known_suffixes} ; [ DW_TAG_variable ]
!214 = metadata !{i32 786484, i32 0, metadata !95, metadata !"suffixes", metadata !"suffixes", metadata !"", metadata !6, i32 1008, metadata !215, i32 1, i32 1, [6 x i8*]* @get_istat.suffixes} ; [ DW_TAG_variable ]
!215 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 384, i64 64, i32 0, i32 0, metadata !11, metadata !216, i32 0, i32 0} ; [ DW_TAG_array_type ]
!216 = metadata !{metadata !217}
!217 = metadata !{i32 786465, i64 0, i64 5}       ; [ DW_TAG_subrange_type ]
!218 = metadata !{i32 786484, i32 0, null, metadata !"license_msg", metadata !"license_msg", metadata !"", metadata !6, i32 12, metadata !219, i32 1, i32 1, [15 x i8*]* @license_msg} ; [ DW_TAG_variable ]
!219 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 960, i64 64, i32 0, i32 0, metadata !11, metadata !220, i32 0, i32 0} ; [ DW_TAG_array_type ]
!220 = metadata !{metadata !221}
!221 = metadata !{i32 786465, i64 0, i64 14}      ; [ DW_TAG_subrange_type ]
!222 = metadata !{i32 786484, i32 0, metadata !119, metadata !"help_msg", metadata !"help_msg", metadata !"", metadata !6, i32 328, metadata !223, i32 1, i32 1, [17 x i8*]* @help.help_msg} ; [ DW_TAG_variable ]
!223 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 1088, i64 64, i32 0, i32 0, metadata !11, metadata !224, i32 0, i32 0} ; [ DW_TAG_array_type ]
!224 = metadata !{metadata !225}
!225 = metadata !{i32 786465, i64 0, i64 16}      ; [ DW_TAG_subrange_type ]
!226 = metadata !{i32 786449, i32 0, i32 12, metadata !"zip.c", metadata !"/home/capsicum/wvd/gzip-1.2.4", metadata !"clang version 3.1 (tags/RELEASE_31/final)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !227, metadata !235} ; [ DW_TAG_compile_unit ]
!227 = metadata !{metadata !228}
!228 = metadata !{metadata !229, metadata !231, metadata !232}
!229 = metadata !{i32 786478, i32 0, metadata !230, metadata !"zip_attack", metadata !"zip_attack", metadata !"", metadata !230, i32 33, metadata !22, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32)* @zip_attack, null, null, metadata !13, i32 33} ; [ DW_TAG_subprogram ]
!230 = metadata !{i32 786473, metadata !"zip.c", metadata !"/home/capsicum/wvd/gzip-1.2.4", null} ; [ DW_TAG_file_type ]
!231 = metadata !{i32 786478, i32 0, metadata !230, metadata !"zip", metadata !"zip", metadata !"", metadata !230, i32 55, metadata !158, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i32, i32)* @zip, null, null, metadata !13, i32 57} ; [ DW_TAG_subprogram ]
!232 = metadata !{i32 786478, i32 0, metadata !230, metadata !"file_read", metadata !"file_read", metadata !"", metadata !230, i32 130, metadata !233, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 (i8*, i32)* @file_read, null, null, metadata !13, i32 133} ; [ DW_TAG_subprogram ]
!233 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !234, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!234 = metadata !{metadata !9, metadata !11, metadata !34}
!235 = metadata !{metadata !236}
!236 = metadata !{metadata !237, metadata !239}
!237 = metadata !{i32 786484, i32 0, null, metadata !"crc", metadata !"crc", metadata !"", metadata !230, i32 25, metadata !238, i32 1, i32 1, i64* @crc} ; [ DW_TAG_variable ]
!238 = metadata !{i32 786454, null, metadata !"ulg", metadata !230, i32 46, i64 0, i64 0, i64 0, i32 0, metadata !111} ; [ DW_TAG_typedef ]
!239 = metadata !{i32 786484, i32 0, null, metadata !"header_bytes", metadata !"header_bytes", metadata !"", metadata !230, i32 26, metadata !62, i32 0, i32 1, i64* @header_bytes} ; [ DW_TAG_variable ]
!240 = metadata !{i32 786689, metadata !5, metadata !"argc", metadata !6, i32 16777641, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!241 = metadata !{i32 425, i32 9, metadata !5, null}
!242 = metadata !{i32 786689, metadata !5, metadata !"argv", metadata !6, i32 33554858, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!243 = metadata !{i32 426, i32 12, metadata !5, null}
!244 = metadata !{i32 786688, metadata !245, metadata !"file_count", metadata !6, i32 428, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!245 = metadata !{i32 786443, metadata !5, i32 427, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ]
!246 = metadata !{i32 428, i32 9, metadata !245, null}
!247 = metadata !{i32 786688, metadata !245, metadata !"proglen", metadata !6, i32 429, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!248 = metadata !{i32 429, i32 9, metadata !245, null}
!249 = metadata !{i32 786688, metadata !245, metadata !"optc", metadata !6, i32 430, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!250 = metadata !{i32 430, i32 9, metadata !245, null}
!251 = metadata !{i32 434, i32 16, metadata !245, null}
!252 = metadata !{i32 435, i32 15, metadata !245, null}
!253 = metadata !{i32 438, i32 5, metadata !245, null}
!254 = metadata !{i32 438, i32 24, metadata !245, null}
!255 = metadata !{i32 439, i32 9, metadata !256, null}
!256 = metadata !{i32 786443, metadata !245, i32 438, i32 60, metadata !6, i32 1} ; [ DW_TAG_lexical_block ]
!257 = metadata !{i32 440, i32 5, metadata !256, null}
!258 = metadata !{i32 443, i32 11, metadata !245, null}
!259 = metadata !{i32 444, i32 5, metadata !245, null}
!260 = metadata !{i32 444, i32 22, metadata !245, null}
!261 = metadata !{i32 446, i32 18, metadata !245, null}
!262 = metadata !{i32 447, i32 5, metadata !245, null}
!263 = metadata !{i32 448, i32 9, metadata !264, null}
!264 = metadata !{i32 786443, metadata !245, i32 447, i32 21, metadata !6, i32 2} ; [ DW_TAG_lexical_block ]
!265 = metadata !{i32 449, i32 5, metadata !264, null}
!266 = metadata !{i32 451, i32 9, metadata !245, null}
!267 = metadata !{i32 452, i32 9, metadata !268, null}
!268 = metadata !{i32 786443, metadata !245, i32 451, i32 46, metadata !6, i32 3} ; [ DW_TAG_lexical_block ]
!269 = metadata !{i32 453, i32 5, metadata !268, null}
!270 = metadata !{i32 456, i32 9, metadata !245, null}
!271 = metadata !{i32 457, i32 9, metadata !272, null}
!272 = metadata !{i32 786443, metadata !245, i32 456, i32 45, metadata !6, i32 4} ; [ DW_TAG_lexical_block ]
!273 = metadata !{i32 458, i32 5, metadata !272, null}
!274 = metadata !{i32 469, i32 11, metadata !245, null}
!275 = metadata !{i32 470, i32 11, metadata !245, null}
!276 = metadata !{i32 471, i32 2, metadata !277, null}
!277 = metadata !{i32 786443, metadata !245, i32 470, i32 45, metadata !6, i32 5} ; [ DW_TAG_lexical_block ]
!278 = metadata !{i32 472, i32 5, metadata !277, null}
!279 = metadata !{i32 472, i32 16, metadata !245, null}
!280 = metadata !{i32 473, i32 9, metadata !245, null}
!281 = metadata !{i32 474, i32 2, metadata !282, null}
!282 = metadata !{i32 786443, metadata !245, i32 473, i32 36, metadata !6, i32 6} ; [ DW_TAG_lexical_block ]
!283 = metadata !{i32 475, i32 5, metadata !282, null}
!284 = metadata !{i32 478, i32 5, metadata !245, null}
!285 = metadata !{i32 479, i32 13, metadata !245, null}
!286 = metadata !{i32 481, i32 5, metadata !245, null}
!287 = metadata !{i32 481, i32 20, metadata !245, null}
!288 = metadata !{i32 483, i32 2, metadata !289, null}
!289 = metadata !{i32 786443, metadata !245, i32 482, i32 34, metadata !6, i32 7} ; [ DW_TAG_lexical_block ]
!290 = metadata !{i32 485, i32 13, metadata !291, null}
!291 = metadata !{i32 786443, metadata !289, i32 483, i32 16, metadata !6, i32 8} ; [ DW_TAG_lexical_block ]
!292 = metadata !{i32 485, i32 24, metadata !291, null}
!293 = metadata !{i32 487, i32 16, metadata !291, null}
!294 = metadata !{i32 488, i32 6, metadata !291, null}
!295 = metadata !{i32 490, i32 6, metadata !291, null}
!296 = metadata !{i32 490, i32 21, metadata !291, null}
!297 = metadata !{i32 492, i32 6, metadata !291, null}
!298 = metadata !{i32 492, i32 22, metadata !291, null}
!299 = metadata !{i32 494, i32 6, metadata !291, null}
!300 = metadata !{i32 494, i32 15, metadata !291, null}
!301 = metadata !{i32 496, i32 6, metadata !291, null}
!302 = metadata !{i32 496, i32 14, metadata !291, null}
!303 = metadata !{i32 496, i32 27, metadata !291, null}
!304 = metadata !{i32 498, i32 6, metadata !291, null}
!305 = metadata !{i32 498, i32 41, metadata !291, null}
!306 = metadata !{i32 500, i32 6, metadata !291, null}
!307 = metadata !{i32 500, i32 17, metadata !291, null}
!308 = metadata !{i32 500, i32 30, metadata !291, null}
!309 = metadata !{i32 502, i32 6, metadata !291, null}
!310 = metadata !{i32 502, i32 19, metadata !291, null}
!311 = metadata !{i32 504, i32 6, metadata !291, null}
!312 = metadata !{i32 504, i32 19, metadata !291, null}
!313 = metadata !{i32 506, i32 6, metadata !291, null}
!314 = metadata !{i32 506, i32 29, metadata !291, null}
!315 = metadata !{i32 508, i32 6, metadata !291, null}
!316 = metadata !{i32 508, i32 29, metadata !291, null}
!317 = metadata !{i32 510, i32 6, metadata !291, null}
!318 = metadata !{i32 510, i32 17, metadata !291, null}
!319 = metadata !{i32 510, i32 30, metadata !291, null}
!320 = metadata !{i32 513, i32 6, metadata !291, null}
!321 = metadata !{i32 514, i32 6, metadata !291, null}
!322 = metadata !{i32 515, i32 6, metadata !291, null}
!323 = metadata !{i32 515, i32 22, metadata !291, null}
!324 = metadata !{i32 523, i32 21, metadata !291, null}
!325 = metadata !{i32 524, i32 13, metadata !291, null}
!326 = metadata !{i32 525, i32 13, metadata !291, null}
!327 = metadata !{i32 527, i32 6, metadata !291, null}
!328 = metadata !{i32 528, i32 6, metadata !291, null}
!329 = metadata !{i32 530, i32 6, metadata !291, null}
!330 = metadata !{i32 530, i32 17, metadata !291, null}
!331 = metadata !{i32 530, i32 28, metadata !291, null}
!332 = metadata !{i32 532, i32 6, metadata !291, null}
!333 = metadata !{i32 532, i32 17, metadata !291, null}
!334 = metadata !{i32 532, i32 30, metadata !291, null}
!335 = metadata !{i32 537, i32 6, metadata !291, null}
!336 = metadata !{i32 539, i32 6, metadata !291, null}
!337 = metadata !{i32 540, i32 6, metadata !291, null}
!338 = metadata !{i32 540, i32 22, metadata !291, null}
!339 = metadata !{i32 544, i32 6, metadata !291, null}
!340 = metadata !{i32 545, i32 6, metadata !291, null}
!341 = metadata !{i32 548, i32 6, metadata !291, null}
!342 = metadata !{i32 549, i32 6, metadata !291, null}
!343 = metadata !{i32 550, i32 2, metadata !291, null}
!344 = metadata !{i32 551, i32 5, metadata !289, null}
!345 = metadata !{i32 556, i32 5, metadata !245, null}
!346 = metadata !{i32 556, i32 22, metadata !245, null}
!347 = metadata !{i32 557, i32 5, metadata !245, null}
!348 = metadata !{i32 557, i32 22, metadata !245, null}
!349 = metadata !{i32 559, i32 5, metadata !245, null}
!350 = metadata !{i32 563, i32 5, metadata !245, null}
!351 = metadata !{i32 564, i32 2, metadata !352, null}
!352 = metadata !{i32 786443, metadata !245, i32 563, i32 26, metadata !6, i32 9} ; [ DW_TAG_lexical_block ]
!353 = metadata !{i32 566, i32 5, metadata !352, null}
!354 = metadata !{i32 568, i32 5, metadata !245, null}
!355 = metadata !{i32 569, i32 9, metadata !356, null}
!356 = metadata !{i32 786443, metadata !245, i32 568, i32 60, metadata !6, i32 10} ; [ DW_TAG_lexical_block ]
!357 = metadata !{i32 571, i32 9, metadata !356, null}
!358 = metadata !{i32 572, i32 5, metadata !356, null}
!359 = metadata !{i32 573, i32 5, metadata !245, null}
!360 = metadata !{i32 573, i32 32, metadata !245, null}
!361 = metadata !{i32 588, i32 5, metadata !245, null}
!362 = metadata !{i32 589, i32 2, metadata !363, null}
!363 = metadata !{i32 786443, metadata !245, i32 588, i32 26, metadata !6, i32 11} ; [ DW_TAG_lexical_block ]
!364 = metadata !{i32 591, i32 2, metadata !365, null}
!365 = metadata !{i32 786443, metadata !363, i32 589, i32 62, metadata !6, i32 12} ; [ DW_TAG_lexical_block ]
!366 = metadata !{i32 592, i32 9, metadata !363, null}
!367 = metadata !{i32 593, i32 6, metadata !368, null}
!368 = metadata !{i32 786443, metadata !363, i32 592, i32 31, metadata !6, i32 13} ; [ DW_TAG_lexical_block ]
!369 = metadata !{i32 594, i32 2, metadata !368, null}
!370 = metadata !{i32 595, i32 5, metadata !363, null}
!371 = metadata !{i32 596, i32 2, metadata !372, null}
!372 = metadata !{i32 786443, metadata !245, i32 595, i32 12, metadata !6, i32 14} ; [ DW_TAG_lexical_block ]
!373 = metadata !{i32 598, i32 5, metadata !245, null}
!374 = metadata !{i32 599, i32 2, metadata !375, null}
!375 = metadata !{i32 786443, metadata !245, i32 598, i32 43, metadata !6, i32 15} ; [ DW_TAG_lexical_block ]
!376 = metadata !{i32 600, i32 5, metadata !375, null}
!377 = metadata !{i32 601, i32 5, metadata !245, null}
!378 = metadata !{i32 602, i32 5, metadata !245, null}
!379 = metadata !{i32 1745, i32 4, metadata !380, null}
!380 = metadata !{i32 786443, metadata !18, i32 1744, i32 1, metadata !6, i32 45} ; [ DW_TAG_lexical_block ]
!381 = metadata !{i32 1746, i32 8, metadata !382, null}
!382 = metadata !{i32 786443, metadata !380, i32 1745, i32 23, metadata !6, i32 46} ; [ DW_TAG_lexical_block ]
!383 = metadata !{i32 1747, i32 8, metadata !382, null}
!384 = metadata !{i32 1748, i32 4, metadata !382, null}
!385 = metadata !{i32 1749, i32 4, metadata !380, null}
!386 = metadata !{i32 1750, i32 1, metadata !380, null}
!387 = metadata !{i32 786688, metadata !388, metadata !"p", metadata !6, i32 362, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!388 = metadata !{i32 786443, metadata !119, i32 327, i32 1, metadata !6, i32 172} ; [ DW_TAG_lexical_block ]
!389 = metadata !{i32 362, i32 12, metadata !388, null}
!390 = metadata !{i32 362, i32 24, metadata !388, null}
!391 = metadata !{i32 364, i32 5, metadata !388, null}
!392 = metadata !{i32 365, i32 5, metadata !388, null}
!393 = metadata !{i32 366, i32 5, metadata !388, null}
!394 = metadata !{i32 366, i32 16, metadata !388, null}
!395 = metadata !{i32 367, i32 1, metadata !388, null}
!396 = metadata !{i32 786689, metadata !21, metadata !"exitcode", metadata !6, i32 16778935, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!397 = metadata !{i32 1719, i32 9, metadata !21, null}
!398 = metadata !{i32 1723, i32 5, metadata !399, null}
!399 = metadata !{i32 786443, metadata !21, i32 1720, i32 1, metadata !6, i32 47} ; [ DW_TAG_lexical_block ]
!400 = metadata !{i32 1723, i32 18, metadata !399, null}
!401 = metadata !{i32 1724, i32 5, metadata !399, null}
!402 = metadata !{i32 1725, i32 5, metadata !399, null}
!403 = metadata !{i32 1725, i32 23, metadata !399, null}
!404 = metadata !{i32 1726, i32 5, metadata !399, null}
!405 = metadata !{i32 1726, i32 23, metadata !399, null}
!406 = metadata !{i32 1737, i32 5, metadata !399, null}
!407 = metadata !{i32 1738, i32 1, metadata !399, null}
!408 = metadata !{i32 786688, metadata !409, metadata !"p", metadata !6, i32 372, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!409 = metadata !{i32 786443, metadata !118, i32 371, i32 1, metadata !6, i32 171} ; [ DW_TAG_lexical_block ]
!410 = metadata !{i32 372, i32 12, metadata !409, null}
!411 = metadata !{i32 372, i32 27, metadata !409, null}
!412 = metadata !{i32 374, i32 5, metadata !409, null}
!413 = metadata !{i32 375, i32 5, metadata !409, null}
!414 = metadata !{i32 375, i32 16, metadata !409, null}
!415 = metadata !{i32 376, i32 1, metadata !409, null}
!416 = metadata !{i32 310, i32 5, metadata !417, null}
!417 = metadata !{i32 786443, metadata !117, i32 309, i32 1, metadata !6, i32 170} ; [ DW_TAG_lexical_block ]
!418 = metadata !{i32 323, i32 1, metadata !417, null}
!419 = metadata !{i32 381, i32 5, metadata !420, null}
!420 = metadata !{i32 786443, metadata !116, i32 380, i32 1, metadata !6, i32 169} ; [ DW_TAG_lexical_block ]
!421 = metadata !{i32 383, i32 5, metadata !420, null}
!422 = metadata !{i32 388, i32 5, metadata !420, null}
!423 = metadata !{i32 420, i32 5, metadata !420, null}
!424 = metadata !{i32 421, i32 1, metadata !420, null}
!425 = metadata !{i32 786689, metadata !15, metadata !"iname", metadata !6, i32 16777927, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!426 = metadata !{i32 711, i32 11, metadata !15, null}
!427 = metadata !{i32 714, i32 9, metadata !428, null}
!428 = metadata !{i32 786443, metadata !15, i32 712, i32 1, metadata !6, i32 16} ; [ DW_TAG_lexical_block ]
!429 = metadata !{i32 786688, metadata !430, metadata !"cflag", metadata !6, i32 715, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!430 = metadata !{i32 786443, metadata !428, i32 714, i32 29, metadata !6, i32 17} ; [ DW_TAG_lexical_block ]
!431 = metadata !{i32 715, i32 6, metadata !430, null}
!432 = metadata !{i32 715, i32 23, metadata !430, null}
!433 = metadata !{i32 716, i32 2, metadata !430, null}
!434 = metadata !{i32 717, i32 2, metadata !430, null}
!435 = metadata !{i32 718, i32 2, metadata !430, null}
!436 = metadata !{i32 722, i32 9, metadata !428, null}
!437 = metadata !{i32 722, i32 41, metadata !428, null}
!438 = metadata !{i32 725, i32 5, metadata !428, null}
!439 = metadata !{i32 737, i32 2, metadata !440, null}
!440 = metadata !{i32 786443, metadata !441, i32 737, i32 2, metadata !6, i32 19} ; [ DW_TAG_lexical_block ]
!441 = metadata !{i32 786443, metadata !428, i32 725, i32 33, metadata !6, i32 18} ; [ DW_TAG_lexical_block ]
!442 = metadata !{i32 738, i32 2, metadata !441, null}
!443 = metadata !{i32 740, i32 5, metadata !428, null}
!444 = metadata !{i32 741, i32 2, metadata !445, null}
!445 = metadata !{i32 786443, metadata !446, i32 741, i32 2, metadata !6, i32 21} ; [ DW_TAG_lexical_block ]
!446 = metadata !{i32 786443, metadata !428, i32 740, i32 34, metadata !6, i32 20} ; [ DW_TAG_lexical_block ]
!447 = metadata !{i32 744, i32 2, metadata !446, null}
!448 = metadata !{i32 746, i32 5, metadata !428, null}
!449 = metadata !{i32 747, i32 2, metadata !450, null}
!450 = metadata !{i32 786443, metadata !451, i32 747, i32 2, metadata !6, i32 23} ; [ DW_TAG_lexical_block ]
!451 = metadata !{i32 786443, metadata !428, i32 746, i32 53, metadata !6, i32 22} ; [ DW_TAG_lexical_block ]
!452 = metadata !{i32 750, i32 2, metadata !451, null}
!453 = metadata !{i32 753, i32 5, metadata !428, null}
!454 = metadata !{i32 754, i32 5, metadata !428, null}
!455 = metadata !{i32 759, i32 5, metadata !428, null}
!456 = metadata !{i32 760, i32 2, metadata !457, null}
!457 = metadata !{i32 786443, metadata !428, i32 759, i32 38, metadata !6, i32 24} ; [ DW_TAG_lexical_block ]
!458 = metadata !{i32 762, i32 5, metadata !457, null}
!459 = metadata !{i32 762, i32 16, metadata !428, null}
!460 = metadata !{i32 763, i32 2, metadata !461, null}
!461 = metadata !{i32 786443, metadata !428, i32 762, i32 37, metadata !6, i32 25} ; [ DW_TAG_lexical_block ]
!462 = metadata !{i32 770, i32 11, metadata !428, null}
!463 = metadata !{i32 772, i32 5, metadata !428, null}
!464 = metadata !{i32 773, i32 2, metadata !465, null}
!465 = metadata !{i32 786443, metadata !428, i32 772, i32 20, metadata !6, i32 26} ; [ DW_TAG_lexical_block ]
!466 = metadata !{i32 774, i32 2, metadata !465, null}
!467 = metadata !{i32 775, i32 2, metadata !465, null}
!468 = metadata !{i32 776, i32 2, metadata !465, null}
!469 = metadata !{i32 778, i32 5, metadata !428, null}
!470 = metadata !{i32 779, i32 5, metadata !428, null}
!471 = metadata !{i32 781, i32 5, metadata !428, null}
!472 = metadata !{i32 782, i32 11, metadata !473, null}
!473 = metadata !{i32 786443, metadata !428, i32 781, i32 21, metadata !6, i32 27} ; [ DW_TAG_lexical_block ]
!474 = metadata !{i32 783, i32 2, metadata !473, null}
!475 = metadata !{i32 784, i32 6, metadata !476, null}
!476 = metadata !{i32 786443, metadata !473, i32 783, i32 18, metadata !6, i32 28} ; [ DW_TAG_lexical_block ]
!477 = metadata !{i32 785, i32 6, metadata !476, null}
!478 = metadata !{i32 787, i32 5, metadata !473, null}
!479 = metadata !{i32 788, i32 5, metadata !428, null}
!480 = metadata !{i32 789, i32 9, metadata !481, null}
!481 = metadata !{i32 786443, metadata !428, i32 788, i32 15, metadata !6, i32 29} ; [ DW_TAG_lexical_block ]
!482 = metadata !{i32 790, i32 9, metadata !481, null}
!483 = metadata !{i32 791, i32 9, metadata !481, null}
!484 = metadata !{i32 798, i32 5, metadata !428, null}
!485 = metadata !{i32 799, i32 2, metadata !486, null}
!486 = metadata !{i32 786443, metadata !428, i32 798, i32 20, metadata !6, i32 30} ; [ DW_TAG_lexical_block ]
!487 = metadata !{i32 799, i32 8, metadata !486, null}
!488 = metadata !{i32 801, i32 5, metadata !486, null}
!489 = metadata !{i32 802, i32 6, metadata !490, null}
!490 = metadata !{i32 786443, metadata !428, i32 801, i32 12, metadata !6, i32 31} ; [ DW_TAG_lexical_block ]
!491 = metadata !{i32 802, i32 30, metadata !490, null}
!492 = metadata !{i32 804, i32 2, metadata !490, null}
!493 = metadata !{i32 805, i32 6, metadata !494, null}
!494 = metadata !{i32 786443, metadata !490, i32 804, i32 59, metadata !6, i32 32} ; [ DW_TAG_lexical_block ]
!495 = metadata !{i32 807, i32 2, metadata !494, null}
!496 = metadata !{i32 810, i32 5, metadata !428, null}
!497 = metadata !{i32 810, i32 26, metadata !428, null}
!498 = metadata !{i32 812, i32 5, metadata !428, null}
!499 = metadata !{i32 813, i32 2, metadata !500, null}
!500 = metadata !{i32 786443, metadata !428, i32 812, i32 18, metadata !6, i32 33} ; [ DW_TAG_lexical_block ]
!501 = metadata !{i32 813, i32 42, metadata !500, null}
!502 = metadata !{i32 814, i32 14, metadata !500, null}
!503 = metadata !{i32 815, i32 5, metadata !500, null}
!504 = metadata !{i32 819, i32 5, metadata !505, null}
!505 = metadata !{i32 786443, metadata !428, i32 819, i32 5, metadata !6, i32 34} ; [ DW_TAG_lexical_block ]
!506 = metadata !{i32 820, i32 6, metadata !507, null}
!507 = metadata !{i32 786443, metadata !505, i32 819, i32 14, metadata !6, i32 35} ; [ DW_TAG_lexical_block ]
!508 = metadata !{i32 821, i32 6, metadata !509, null}
!509 = metadata !{i32 786443, metadata !507, i32 820, i32 31, metadata !6, i32 36} ; [ DW_TAG_lexical_block ]
!510 = metadata !{i32 822, i32 6, metadata !509, null}
!511 = metadata !{i32 824, i32 2, metadata !507, null}
!512 = metadata !{i32 824, i32 53, metadata !507, null}
!513 = metadata !{i32 827, i32 11, metadata !507, null}
!514 = metadata !{i32 828, i32 2, metadata !507, null}
!515 = metadata !{i32 828, i32 18, metadata !507, null}
!516 = metadata !{i32 829, i32 2, metadata !507, null}
!517 = metadata !{i32 830, i32 5, metadata !507, null}
!518 = metadata !{i32 832, i32 5, metadata !428, null}
!519 = metadata !{i32 833, i32 5, metadata !428, null}
!520 = metadata !{i32 833, i32 23, metadata !428, null}
!521 = metadata !{i32 834, i32 2, metadata !522, null}
!522 = metadata !{i32 786443, metadata !428, i32 833, i32 35, metadata !6, i32 37} ; [ DW_TAG_lexical_block ]
!523 = metadata !{i32 835, i32 5, metadata !522, null}
!524 = metadata !{i32 836, i32 5, metadata !428, null}
!525 = metadata !{i32 837, i32 2, metadata !526, null}
!526 = metadata !{i32 786443, metadata !428, i32 836, i32 23, metadata !6, i32 38} ; [ DW_TAG_lexical_block ]
!527 = metadata !{i32 837, i32 18, metadata !526, null}
!528 = metadata !{i32 838, i32 2, metadata !526, null}
!529 = metadata !{i32 841, i32 5, metadata !428, null}
!530 = metadata !{i32 842, i32 2, metadata !531, null}
!531 = metadata !{i32 786443, metadata !428, i32 841, i32 17, metadata !6, i32 39} ; [ DW_TAG_lexical_block ]
!532 = metadata !{i32 843, i32 6, metadata !533, null}
!533 = metadata !{i32 786443, metadata !531, i32 842, i32 12, metadata !6, i32 40} ; [ DW_TAG_lexical_block ]
!534 = metadata !{i32 844, i32 2, metadata !533, null}
!535 = metadata !{i32 844, i32 9, metadata !531, null}
!536 = metadata !{i32 845, i32 6, metadata !537, null}
!537 = metadata !{i32 786443, metadata !531, i32 844, i32 25, metadata !6, i32 41} ; [ DW_TAG_lexical_block ]
!538 = metadata !{i32 846, i32 2, metadata !537, null}
!539 = metadata !{i32 847, i32 6, metadata !540, null}
!540 = metadata !{i32 786443, metadata !531, i32 846, i32 9, metadata !6, i32 42} ; [ DW_TAG_lexical_block ]
!541 = metadata !{i32 849, i32 2, metadata !531, null}
!542 = metadata !{i32 850, i32 6, metadata !543, null}
!543 = metadata !{i32 786443, metadata !531, i32 849, i32 27, metadata !6, i32 43} ; [ DW_TAG_lexical_block ]
!544 = metadata !{i32 851, i32 2, metadata !543, null}
!545 = metadata !{i32 852, i32 2, metadata !531, null}
!546 = metadata !{i32 853, i32 5, metadata !531, null}
!547 = metadata !{i32 855, i32 5, metadata !428, null}
!548 = metadata !{i32 856, i32 2, metadata !549, null}
!549 = metadata !{i32 786443, metadata !428, i32 855, i32 21, metadata !6, i32 44} ; [ DW_TAG_lexical_block ]
!550 = metadata !{i32 857, i32 5, metadata !549, null}
!551 = metadata !{i32 858, i32 1, metadata !428, null}
!552 = metadata !{i32 610, i32 5, metadata !553, null}
!553 = metadata !{i32 786443, metadata !113, i32 609, i32 1, metadata !6, i32 155} ; [ DW_TAG_lexical_block ]
!554 = metadata !{i32 611, i32 2, metadata !553, null}
!555 = metadata !{i32 611, i32 9, metadata !553, null}
!556 = metadata !{i32 624, i32 2, metadata !557, null}
!557 = metadata !{i32 786443, metadata !553, i32 611, i32 57, metadata !6, i32 156} ; [ DW_TAG_lexical_block ]
!558 = metadata !{i32 628, i32 2, metadata !557, null}
!559 = metadata !{i32 629, i32 2, metadata !557, null}
!560 = metadata !{i32 630, i32 5, metadata !557, null}
!561 = metadata !{i32 632, i32 5, metadata !553, null}
!562 = metadata !{i32 634, i32 5, metadata !563, null}
!563 = metadata !{i32 786443, metadata !553, i32 632, i32 31, metadata !6, i32 157} ; [ DW_TAG_lexical_block ]
!564 = metadata !{i32 635, i32 5, metadata !553, null}
!565 = metadata !{i32 637, i32 5, metadata !566, null}
!566 = metadata !{i32 786443, metadata !553, i32 635, i32 52, metadata !6, i32 158} ; [ DW_TAG_lexical_block ]
!567 = metadata !{i32 638, i32 5, metadata !553, null}
!568 = metadata !{i32 639, i32 5, metadata !553, null}
!569 = metadata !{i32 642, i32 5, metadata !553, null}
!570 = metadata !{i32 645, i32 5, metadata !553, null}
!571 = metadata !{i32 646, i32 6, metadata !572, null}
!572 = metadata !{i32 786443, metadata !553, i32 645, i32 27, metadata !6, i32 159} ; [ DW_TAG_lexical_block ]
!573 = metadata !{i32 646, i32 12, metadata !572, null}
!574 = metadata !{i32 647, i32 6, metadata !575, null}
!575 = metadata !{i32 786443, metadata !572, i32 646, i32 41, metadata !6, i32 160} ; [ DW_TAG_lexical_block ]
!576 = metadata !{i32 648, i32 2, metadata !575, null}
!577 = metadata !{i32 652, i32 6, metadata !572, null}
!578 = metadata !{i32 654, i32 5, metadata !572, null}
!579 = metadata !{i32 655, i32 5, metadata !553, null}
!580 = metadata !{i32 657, i32 5, metadata !553, null}
!581 = metadata !{i32 658, i32 5, metadata !553, null}
!582 = metadata !{i32 659, i32 5, metadata !553, null}
!583 = metadata !{i32 661, i32 5, metadata !553, null}
!584 = metadata !{i32 662, i32 11, metadata !585, null}
!585 = metadata !{i32 786443, metadata !553, i32 661, i32 21, metadata !6, i32 161} ; [ DW_TAG_lexical_block ]
!586 = metadata !{i32 663, i32 2, metadata !585, null}
!587 = metadata !{i32 664, i32 6, metadata !588, null}
!588 = metadata !{i32 786443, metadata !585, i32 663, i32 18, metadata !6, i32 162} ; [ DW_TAG_lexical_block ]
!589 = metadata !{i32 665, i32 2, metadata !588, null}
!590 = metadata !{i32 666, i32 5, metadata !585, null}
!591 = metadata !{i32 667, i32 5, metadata !553, null}
!592 = metadata !{i32 668, i32 9, metadata !593, null}
!593 = metadata !{i32 786443, metadata !553, i32 667, i32 15, metadata !6, i32 163} ; [ DW_TAG_lexical_block ]
!594 = metadata !{i32 669, i32 9, metadata !593, null}
!595 = metadata !{i32 674, i32 5, metadata !596, null}
!596 = metadata !{i32 786443, metadata !553, i32 674, i32 5, metadata !6, i32 164} ; [ DW_TAG_lexical_block ]
!597 = metadata !{i32 786688, metadata !598, metadata !"ifd", metadata !6, i32 676, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!598 = metadata !{i32 786443, metadata !596, i32 674, i32 14, metadata !6, i32 165} ; [ DW_TAG_lexical_block ]
!599 = metadata !{i32 676, i32 6, metadata !598, null}
!600 = metadata !{i32 676, i32 25, metadata !598, null}
!601 = metadata !{i32 676, i32 12, metadata !598, null}
!602 = metadata !{i32 786688, metadata !598, metadata !"ofd", metadata !6, i32 677, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!603 = metadata !{i32 677, i32 6, metadata !598, null}
!604 = metadata !{i32 677, i32 26, metadata !598, null}
!605 = metadata !{i32 677, i32 12, metadata !598, null}
!606 = metadata !{i32 678, i32 6, metadata !598, null}
!607 = metadata !{i32 678, i32 31, metadata !598, null}
!608 = metadata !{i32 680, i32 2, metadata !598, null}
!609 = metadata !{i32 680, i32 53, metadata !598, null}
!610 = metadata !{i32 683, i32 11, metadata !598, null}
!611 = metadata !{i32 684, i32 2, metadata !598, null}
!612 = metadata !{i32 684, i32 18, metadata !598, null}
!613 = metadata !{i32 685, i32 2, metadata !598, null}
!614 = metadata !{i32 686, i32 5, metadata !598, null}
!615 = metadata !{i32 688, i32 5, metadata !553, null}
!616 = metadata !{i32 689, i32 2, metadata !617, null}
!617 = metadata !{i32 786443, metadata !553, i32 688, i32 18, metadata !6, i32 166} ; [ DW_TAG_lexical_block ]
!618 = metadata !{i32 690, i32 6, metadata !619, null}
!619 = metadata !{i32 786443, metadata !617, i32 689, i32 12, metadata !6, i32 167} ; [ DW_TAG_lexical_block ]
!620 = metadata !{i32 692, i32 2, metadata !619, null}
!621 = metadata !{i32 692, i32 9, metadata !617, null}
!622 = metadata !{i32 693, i32 6, metadata !623, null}
!623 = metadata !{i32 786443, metadata !617, i32 692, i32 26, metadata !6, i32 168} ; [ DW_TAG_lexical_block ]
!624 = metadata !{i32 694, i32 6, metadata !623, null}
!625 = metadata !{i32 700, i32 2, metadata !623, null}
!626 = metadata !{i32 701, i32 5, metadata !617, null}
!627 = metadata !{i32 702, i32 1, metadata !553, null}
!628 = metadata !{i32 786689, metadata !85, metadata !"ifd", metadata !6, i32 16778542, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!629 = metadata !{i32 1326, i32 9, metadata !85, null}
!630 = metadata !{i32 786689, metadata !85, metadata !"method", metadata !6, i32 33555759, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!631 = metadata !{i32 1327, i32 9, metadata !85, null}
!632 = metadata !{i32 786688, metadata !633, metadata !"crc", metadata !6, i32 1329, metadata !634, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!633 = metadata !{i32 786443, metadata !85, i32 1328, i32 1, metadata !6, i32 58} ; [ DW_TAG_lexical_block ]
!634 = metadata !{i32 786454, null, metadata !"ulg", metadata !6, i32 46, i64 0, i64 0, i64 0, i32 0, metadata !111} ; [ DW_TAG_typedef ]
!635 = metadata !{i32 1329, i32 9, metadata !633, null}
!636 = metadata !{i32 786688, metadata !633, metadata !"date", metadata !6, i32 1338, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!637 = metadata !{i32 1338, i32 11, metadata !633, null}
!638 = metadata !{i32 1340, i32 5, metadata !633, null}
!639 = metadata !{i32 1341, i32 2, metadata !640, null}
!640 = metadata !{i32 786443, metadata !633, i32 1340, i32 36, metadata !6, i32 59} ; [ DW_TAG_lexical_block ]
!641 = metadata !{i32 1342, i32 2, metadata !640, null}
!642 = metadata !{i32 1343, i32 6, metadata !643, null}
!643 = metadata !{i32 786443, metadata !640, i32 1342, i32 16, metadata !6, i32 60} ; [ DW_TAG_lexical_block ]
!644 = metadata !{i32 1344, i32 2, metadata !643, null}
!645 = metadata !{i32 1345, i32 2, metadata !640, null}
!646 = metadata !{i32 1346, i32 6, metadata !647, null}
!647 = metadata !{i32 786443, metadata !640, i32 1345, i32 14, metadata !6, i32 61} ; [ DW_TAG_lexical_block ]
!648 = metadata !{i32 1347, i32 2, metadata !647, null}
!649 = metadata !{i32 1348, i32 5, metadata !640, null}
!650 = metadata !{i32 1348, i32 12, metadata !633, null}
!651 = metadata !{i32 1349, i32 2, metadata !652, null}
!652 = metadata !{i32 786443, metadata !633, i32 1348, i32 28, metadata !6, i32 62} ; [ DW_TAG_lexical_block ]
!653 = metadata !{i32 1349, i32 39, metadata !652, null}
!654 = metadata !{i32 1350, i32 2, metadata !652, null}
!655 = metadata !{i32 1351, i32 6, metadata !656, null}
!656 = metadata !{i32 786443, metadata !652, i32 1350, i32 15, metadata !6, i32 63} ; [ DW_TAG_lexical_block ]
!657 = metadata !{i32 1353, i32 2, metadata !656, null}
!658 = metadata !{i32 1353, i32 9, metadata !652, null}
!659 = metadata !{i32 1354, i32 6, metadata !660, null}
!660 = metadata !{i32 786443, metadata !652, i32 1353, i32 21, metadata !6, i32 64} ; [ DW_TAG_lexical_block ]
!661 = metadata !{i32 1355, i32 2, metadata !660, null}
!662 = metadata !{i32 1356, i32 2, metadata !652, null}
!663 = metadata !{i32 1360, i32 2, metadata !652, null}
!664 = metadata !{i32 1361, i32 2, metadata !652, null}
!665 = metadata !{i32 1363, i32 5, metadata !633, null}
!666 = metadata !{i32 1364, i32 5, metadata !633, null}
!667 = metadata !{i32 1365, i32 5, metadata !633, null}
!668 = metadata !{i32 1368, i32 5, metadata !633, null}
!669 = metadata !{i32 1375, i32 26, metadata !670, null}
!670 = metadata !{i32 786443, metadata !633, i32 1368, i32 45, metadata !6, i32 65} ; [ DW_TAG_lexical_block ]
!671 = metadata !{i32 1376, i32 9, metadata !670, null}
!672 = metadata !{i32 786688, metadata !673, metadata !"buf", metadata !6, i32 1377, metadata !674, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!673 = metadata !{i32 786443, metadata !670, i32 1376, i32 30, metadata !6, i32 66} ; [ DW_TAG_lexical_block ]
!674 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 64, i64 8, i32 0, i32 0, metadata !162, metadata !675, i32 0, i32 0} ; [ DW_TAG_array_type ]
!675 = metadata !{metadata !676}
!676 = metadata !{i32 786465, i64 0, i64 7}       ; [ DW_TAG_subrange_type ]
!677 = metadata !{i32 1377, i32 17, metadata !673, null}
!678 = metadata !{i32 1378, i32 13, metadata !673, null}
!679 = metadata !{i32 1379, i32 17, metadata !673, null}
!680 = metadata !{i32 1380, i32 17, metadata !681, null}
!681 = metadata !{i32 786443, metadata !673, i32 1379, i32 68, metadata !6, i32 67} ; [ DW_TAG_lexical_block ]
!682 = metadata !{i32 1381, i32 13, metadata !681, null}
!683 = metadata !{i32 1382, i32 13, metadata !673, null}
!684 = metadata !{i32 1383, i32 6, metadata !673, null}
!685 = metadata !{i32 1384, i32 2, metadata !673, null}
!686 = metadata !{i32 1385, i32 5, metadata !670, null}
!687 = metadata !{i32 1387, i32 12, metadata !633, null}
!688 = metadata !{i32 1388, i32 5, metadata !633, null}
!689 = metadata !{i32 1389, i32 5, metadata !633, null}
!690 = metadata !{i32 1390, i32 9, metadata !691, null}
!691 = metadata !{i32 786443, metadata !633, i32 1389, i32 18, metadata !6, i32 68} ; [ DW_TAG_lexical_block ]
!692 = metadata !{i32 1391, i32 5, metadata !691, null}
!693 = metadata !{i32 1392, i32 5, metadata !633, null}
!694 = metadata !{i32 1393, i32 5, metadata !633, null}
!695 = metadata !{i32 1394, i32 2, metadata !696, null}
!696 = metadata !{i32 786443, metadata !633, i32 1393, i32 27, metadata !6, i32 69} ; [ DW_TAG_lexical_block ]
!697 = metadata !{i32 1395, i32 2, metadata !696, null}
!698 = metadata !{i32 1396, i32 5, metadata !696, null}
!699 = metadata !{i32 1396, i32 12, metadata !633, null}
!700 = metadata !{i32 1397, i32 2, metadata !701, null}
!701 = metadata !{i32 786443, metadata !633, i32 1396, i32 31, metadata !6, i32 70} ; [ DW_TAG_lexical_block ]
!702 = metadata !{i32 1398, i32 5, metadata !701, null}
!703 = metadata !{i32 1399, i32 5, metadata !633, null}
!704 = metadata !{i32 1400, i32 2, metadata !705, null}
!705 = metadata !{i32 786443, metadata !633, i32 1399, i32 27, metadata !6, i32 71} ; [ DW_TAG_lexical_block ]
!706 = metadata !{i32 1401, i32 2, metadata !705, null}
!707 = metadata !{i32 1402, i32 5, metadata !705, null}
!708 = metadata !{i32 1402, i32 12, metadata !633, null}
!709 = metadata !{i32 1403, i32 2, metadata !710, null}
!710 = metadata !{i32 786443, metadata !633, i32 1402, i32 32, metadata !6, i32 72} ; [ DW_TAG_lexical_block ]
!711 = metadata !{i32 1404, i32 5, metadata !710, null}
!712 = metadata !{i32 1405, i32 5, metadata !633, null}
!713 = metadata !{i32 1406, i32 5, metadata !633, null}
!714 = metadata !{i32 1407, i32 1, metadata !633, null}
!715 = metadata !{i32 786689, metadata !95, metadata !"iname", metadata !6, i32 16778220, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!716 = metadata !{i32 1004, i32 11, metadata !95, null}
!717 = metadata !{i32 786689, metadata !95, metadata !"sbuf", metadata !6, i32 33555437, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!718 = metadata !{i32 1005, i32 18, metadata !95, null}
!719 = metadata !{i32 786688, metadata !720, metadata !"ilen", metadata !6, i32 1007, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!720 = metadata !{i32 786443, metadata !95, i32 1006, i32 1, metadata !6, i32 118} ; [ DW_TAG_lexical_block ]
!721 = metadata !{i32 1007, i32 9, metadata !720, null}
!722 = metadata !{i32 786688, metadata !720, metadata !"suf", metadata !6, i32 1009, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!723 = metadata !{i32 1009, i32 12, metadata !720, null}
!724 = metadata !{i32 1009, i32 26, metadata !720, null}
!725 = metadata !{i32 786688, metadata !720, metadata !"s", metadata !6, i32 1010, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!726 = metadata !{i32 1010, i32 11, metadata !720, null}
!727 = metadata !{i32 1015, i32 5, metadata !720, null}
!728 = metadata !{i32 1018, i32 9, metadata !720, null}
!729 = metadata !{i32 1018, i32 37, metadata !720, null}
!730 = metadata !{i32 1020, i32 5, metadata !720, null}
!731 = metadata !{i32 1020, i32 24, metadata !720, null}
!732 = metadata !{i32 1021, i32 2, metadata !733, null}
!733 = metadata !{i32 786443, metadata !720, i32 1020, i32 41, metadata !6, i32 119} ; [ DW_TAG_lexical_block ]
!734 = metadata !{i32 1022, i32 2, metadata !733, null}
!735 = metadata !{i32 1023, i32 2, metadata !733, null}
!736 = metadata !{i32 1028, i32 9, metadata !720, null}
!737 = metadata !{i32 1029, i32 5, metadata !720, null}
!738 = metadata !{i32 1030, i32 2, metadata !739, null}
!739 = metadata !{i32 786443, metadata !720, i32 1029, i32 20, metadata !6, i32 120} ; [ DW_TAG_lexical_block ]
!740 = metadata !{i32 1031, i32 2, metadata !739, null}
!741 = metadata !{i32 1032, i32 2, metadata !739, null}
!742 = metadata !{i32 1041, i32 12, metadata !720, null}
!743 = metadata !{i32 1042, i32 9, metadata !720, null}
!744 = metadata !{i32 1042, i32 34, metadata !720, null}
!745 = metadata !{i32 1045, i32 5, metadata !720, null}
!746 = metadata !{i32 1046, i32 9, metadata !747, null}
!747 = metadata !{i32 786443, metadata !720, i32 1045, i32 8, metadata !6, i32 121} ; [ DW_TAG_lexical_block ]
!748 = metadata !{i32 1057, i32 9, metadata !747, null}
!749 = metadata !{i32 1058, i32 13, metadata !747, null}
!750 = metadata !{i32 1058, i32 41, metadata !747, null}
!751 = metadata !{i32 1059, i32 2, metadata !747, null}
!752 = metadata !{i32 1060, i32 5, metadata !747, null}
!753 = metadata !{i32 1068, i32 5, metadata !720, null}
!754 = metadata !{i32 1069, i32 5, metadata !720, null}
!755 = metadata !{i32 1070, i32 5, metadata !720, null}
!756 = metadata !{i32 1071, i32 5, metadata !720, null}
!757 = metadata !{i32 1072, i32 1, metadata !720, null}
!758 = metadata !{i32 786688, metadata !759, metadata !"suff", metadata !6, i32 1080, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!759 = metadata !{i32 786443, metadata !91, i32 1079, i32 1, metadata !6, i32 103} ; [ DW_TAG_lexical_block ]
!760 = metadata !{i32 1080, i32 11, metadata !759, null}
!761 = metadata !{i32 1082, i32 5, metadata !759, null}
!762 = metadata !{i32 1084, i32 12, metadata !759, null}
!763 = metadata !{i32 1086, i32 5, metadata !759, null}
!764 = metadata !{i32 1087, i32 2, metadata !765, null}
!765 = metadata !{i32 786443, metadata !759, i32 1086, i32 21, metadata !6, i32 104} ; [ DW_TAG_lexical_block ]
!766 = metadata !{i32 1091, i32 13, metadata !767, null}
!767 = metadata !{i32 786443, metadata !765, i32 1087, i32 20, metadata !6, i32 105} ; [ DW_TAG_lexical_block ]
!768 = metadata !{i32 1091, i32 47, metadata !767, null}
!769 = metadata !{i32 1094, i32 6, metadata !767, null}
!770 = metadata !{i32 1095, i32 3, metadata !771, null}
!771 = metadata !{i32 786443, metadata !772, i32 1095, i32 3, metadata !6, i32 107} ; [ DW_TAG_lexical_block ]
!772 = metadata !{i32 786443, metadata !767, i32 1094, i32 45, metadata !6, i32 106} ; [ DW_TAG_lexical_block ]
!773 = metadata !{i32 1097, i32 6, metadata !772, null}
!774 = metadata !{i32 1098, i32 6, metadata !767, null}
!775 = metadata !{i32 1101, i32 2, metadata !765, null}
!776 = metadata !{i32 1102, i32 6, metadata !765, null}
!777 = metadata !{i32 1102, i32 30, metadata !765, null}
!778 = metadata !{i32 1103, i32 6, metadata !779, null}
!779 = metadata !{i32 786443, metadata !765, i32 1102, i32 52, metadata !6, i32 108} ; [ DW_TAG_lexical_block ]
!780 = metadata !{i32 1104, i32 2, metadata !779, null}
!781 = metadata !{i32 1105, i32 6, metadata !782, null}
!782 = metadata !{i32 786443, metadata !765, i32 1104, i32 9, metadata !6, i32 109} ; [ DW_TAG_lexical_block ]
!783 = metadata !{i32 1109, i32 5, metadata !765, null}
!784 = metadata !{i32 1109, i32 12, metadata !759, null}
!785 = metadata !{i32 1111, i32 2, metadata !786, null}
!786 = metadata !{i32 786443, metadata !759, i32 1109, i32 30, metadata !6, i32 110} ; [ DW_TAG_lexical_block ]
!787 = metadata !{i32 1112, i32 6, metadata !788, null}
!788 = metadata !{i32 786443, metadata !786, i32 1111, i32 41, metadata !6, i32 111} ; [ DW_TAG_lexical_block ]
!789 = metadata !{i32 1114, i32 2, metadata !788, null}
!790 = metadata !{i32 1115, i32 2, metadata !786, null}
!791 = metadata !{i32 1115, i32 23, metadata !786, null}
!792 = metadata !{i32 1116, i32 2, metadata !786, null}
!793 = metadata !{i32 1118, i32 9, metadata !794, null}
!794 = metadata !{i32 786443, metadata !759, i32 1117, i32 12, metadata !6, i32 112} ; [ DW_TAG_lexical_block ]
!795 = metadata !{i32 1139, i32 2, metadata !794, null}
!796 = metadata !{i32 1142, i32 5, metadata !759, null}
!797 = metadata !{i32 1143, i32 1, metadata !759, null}
!798 = metadata !{i32 786689, metadata !88, metadata !"in", metadata !6, i32 16778374, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!799 = metadata !{i32 1158, i32 9, metadata !88, null}
!800 = metadata !{i32 786688, metadata !801, metadata !"flags", metadata !6, i32 1160, metadata !162, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!801 = metadata !{i32 786443, metadata !88, i32 1159, i32 1, metadata !6, i32 73} ; [ DW_TAG_lexical_block ]
!802 = metadata !{i32 1160, i32 9, metadata !801, null}
!803 = metadata !{i32 786688, metadata !801, metadata !"magic", metadata !6, i32 1161, metadata !804, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!804 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 16, i64 8, i32 0, i32 0, metadata !12, metadata !805, i32 0, i32 0} ; [ DW_TAG_array_type ]
!805 = metadata !{metadata !806}
!806 = metadata !{i32 786465, i64 0, i64 1}       ; [ DW_TAG_subrange_type ]
!807 = metadata !{i32 1161, i32 10, metadata !801, null}
!808 = metadata !{i32 786688, metadata !801, metadata !"stamp", metadata !6, i32 1162, metadata !634, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!809 = metadata !{i32 1162, i32 9, metadata !801, null}
!810 = metadata !{i32 1167, i32 5, metadata !801, null}
!811 = metadata !{i32 1168, i32 2, metadata !812, null}
!812 = metadata !{i32 786443, metadata !801, i32 1167, i32 29, metadata !6, i32 74} ; [ DW_TAG_lexical_block ]
!813 = metadata !{i32 1168, i32 19, metadata !812, null}
!814 = metadata !{i32 1169, i32 2, metadata !812, null}
!815 = metadata !{i32 1169, i32 19, metadata !812, null}
!816 = metadata !{i32 1171, i32 5, metadata !812, null}
!817 = metadata !{i32 1172, i32 2, metadata !818, null}
!818 = metadata !{i32 786443, metadata !801, i32 1171, i32 12, metadata !6, i32 75} ; [ DW_TAG_lexical_block ]
!819 = metadata !{i32 1172, i32 19, metadata !818, null}
!820 = metadata !{i32 1173, i32 2, metadata !818, null}
!821 = metadata !{i32 1173, i32 19, metadata !818, null}
!822 = metadata !{i32 1175, i32 5, metadata !801, null}
!823 = metadata !{i32 1176, i32 5, metadata !801, null}
!824 = metadata !{i32 1177, i32 5, metadata !801, null}
!825 = metadata !{i32 1178, i32 5, metadata !801, null}
!826 = metadata !{i32 1181, i32 9, metadata !801, null}
!827 = metadata !{i32 1182, i32 12, metadata !801, null}
!828 = metadata !{i32 1184, i32 2, metadata !829, null}
!829 = metadata !{i32 786443, metadata !801, i32 1182, i32 51, metadata !6, i32 76} ; [ DW_TAG_lexical_block ]
!830 = metadata !{i32 1184, i32 16, metadata !829, null}
!831 = metadata !{i32 1185, i32 2, metadata !829, null}
!832 = metadata !{i32 1186, i32 6, metadata !833, null}
!833 = metadata !{i32 786443, metadata !829, i32 1185, i32 26, metadata !6, i32 77} ; [ DW_TAG_lexical_block ]
!834 = metadata !{i32 1189, i32 6, metadata !833, null}
!835 = metadata !{i32 1190, i32 6, metadata !833, null}
!836 = metadata !{i32 1192, i32 2, metadata !829, null}
!837 = metadata !{i32 1193, i32 2, metadata !829, null}
!838 = metadata !{i32 1193, i32 16, metadata !829, null}
!839 = metadata !{i32 1195, i32 2, metadata !829, null}
!840 = metadata !{i32 1196, i32 6, metadata !841, null}
!841 = metadata !{i32 786443, metadata !829, i32 1195, i32 32, metadata !6, i32 78} ; [ DW_TAG_lexical_block ]
!842 = metadata !{i32 1199, i32 6, metadata !841, null}
!843 = metadata !{i32 1200, i32 6, metadata !841, null}
!844 = metadata !{i32 1202, i32 2, metadata !829, null}
!845 = metadata !{i32 1203, i32 6, metadata !846, null}
!846 = metadata !{i32 786443, metadata !829, i32 1202, i32 35, metadata !6, i32 79} ; [ DW_TAG_lexical_block ]
!847 = metadata !{i32 1206, i32 6, metadata !846, null}
!848 = metadata !{i32 1207, i32 6, metadata !846, null}
!849 = metadata !{i32 1207, i32 22, metadata !846, null}
!850 = metadata !{i32 1208, i32 2, metadata !846, null}
!851 = metadata !{i32 1209, i32 2, metadata !829, null}
!852 = metadata !{i32 1210, i32 6, metadata !853, null}
!853 = metadata !{i32 786443, metadata !829, i32 1209, i32 31, metadata !6, i32 80} ; [ DW_TAG_lexical_block ]
!854 = metadata !{i32 1213, i32 6, metadata !853, null}
!855 = metadata !{i32 1214, i32 6, metadata !853, null}
!856 = metadata !{i32 1214, i32 22, metadata !853, null}
!857 = metadata !{i32 1215, i32 2, metadata !853, null}
!858 = metadata !{i32 1216, i32 2, metadata !829, null}
!859 = metadata !{i32 1216, i32 16, metadata !829, null}
!860 = metadata !{i32 1217, i32 2, metadata !829, null}
!861 = metadata !{i32 1217, i32 17, metadata !829, null}
!862 = metadata !{i32 1218, i32 2, metadata !829, null}
!863 = metadata !{i32 1218, i32 17, metadata !829, null}
!864 = metadata !{i32 1219, i32 2, metadata !829, null}
!865 = metadata !{i32 1219, i32 17, metadata !829, null}
!866 = metadata !{i32 1220, i32 2, metadata !829, null}
!867 = metadata !{i32 1220, i32 30, metadata !829, null}
!868 = metadata !{i32 1222, i32 2, metadata !829, null}
!869 = metadata !{i32 1222, i32 8, metadata !829, null}
!870 = metadata !{i32 1223, i32 2, metadata !829, null}
!871 = metadata !{i32 1223, i32 8, metadata !829, null}
!872 = metadata !{i32 1225, i32 2, metadata !829, null}
!873 = metadata !{i32 786688, metadata !874, metadata !"part", metadata !6, i32 1226, metadata !34, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!874 = metadata !{i32 786443, metadata !829, i32 1225, i32 35, metadata !6, i32 81} ; [ DW_TAG_lexical_block ]
!875 = metadata !{i32 1226, i32 15, metadata !874, null}
!876 = metadata !{i32 1226, i32 42, metadata !874, null}
!877 = metadata !{i32 1226, i32 32, metadata !874, null}
!878 = metadata !{i32 1227, i32 6, metadata !874, null}
!879 = metadata !{i32 1227, i32 25, metadata !874, null}
!880 = metadata !{i32 1228, i32 6, metadata !874, null}
!881 = metadata !{i32 1229, i32 3, metadata !882, null}
!882 = metadata !{i32 786443, metadata !874, i32 1228, i32 19, metadata !6, i32 82} ; [ DW_TAG_lexical_block ]
!883 = metadata !{i32 1231, i32 6, metadata !882, null}
!884 = metadata !{i32 1232, i32 2, metadata !874, null}
!885 = metadata !{i32 1233, i32 2, metadata !829, null}
!886 = metadata !{i32 786688, metadata !887, metadata !"len", metadata !6, i32 1234, metadata !34, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!887 = metadata !{i32 786443, metadata !829, i32 1233, i32 34, metadata !6, i32 83} ; [ DW_TAG_lexical_block ]
!888 = metadata !{i32 1234, i32 15, metadata !887, null}
!889 = metadata !{i32 1234, i32 41, metadata !887, null}
!890 = metadata !{i32 1234, i32 31, metadata !887, null}
!891 = metadata !{i32 1235, i32 6, metadata !887, null}
!892 = metadata !{i32 1235, i32 24, metadata !887, null}
!893 = metadata !{i32 1236, i32 6, metadata !887, null}
!894 = metadata !{i32 1237, i32 3, metadata !895, null}
!895 = metadata !{i32 786443, metadata !887, i32 1236, i32 19, metadata !6, i32 84} ; [ DW_TAG_lexical_block ]
!896 = metadata !{i32 1239, i32 6, metadata !895, null}
!897 = metadata !{i32 1240, i32 6, metadata !887, null}
!898 = metadata !{i32 1240, i32 20, metadata !887, null}
!899 = metadata !{i32 1240, i32 26, metadata !887, null}
!900 = metadata !{i32 1241, i32 2, metadata !887, null}
!901 = metadata !{i32 1244, i32 2, metadata !829, null}
!902 = metadata !{i32 1245, i32 6, metadata !903, null}
!903 = metadata !{i32 786443, metadata !829, i32 1244, i32 32, metadata !6, i32 85} ; [ DW_TAG_lexical_block ]
!904 = metadata !{i32 786688, metadata !905, metadata !"c", metadata !6, i32 1247, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!905 = metadata !{i32 786443, metadata !903, i32 1245, i32 58, metadata !6, i32 86} ; [ DW_TAG_lexical_block ]
!906 = metadata !{i32 1247, i32 8, metadata !905, null}
!907 = metadata !{i32 1248, i32 3, metadata !905, null}
!908 = metadata !{i32 1248, i32 7, metadata !909, null}
!909 = metadata !{i32 786443, metadata !905, i32 1248, i32 6, metadata !6, i32 87} ; [ DW_TAG_lexical_block ]
!910 = metadata !{i32 1248, i32 9, metadata !909, null}
!911 = metadata !{i32 1248, i32 20, metadata !909, null}
!912 = metadata !{i32 1249, i32 6, metadata !905, null}
!913 = metadata !{i32 786688, metadata !914, metadata !"p", metadata !6, i32 1251, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!914 = metadata !{i32 786443, metadata !903, i32 1249, i32 13, metadata !6, i32 88} ; [ DW_TAG_lexical_block ]
!915 = metadata !{i32 1251, i32 23, metadata !914, null}
!916 = metadata !{i32 1251, i32 27, metadata !914, null}
!917 = metadata !{i32 786688, metadata !914, metadata !"base", metadata !6, i32 1252, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!918 = metadata !{i32 1252, i32 23, metadata !914, null}
!919 = metadata !{i32 1252, i32 31, metadata !914, null}
!920 = metadata !{i32 1253, i32 3, metadata !921, null}
!921 = metadata !{i32 786443, metadata !914, i32 1253, i32 3, metadata !6, i32 89} ; [ DW_TAG_lexical_block ]
!922 = metadata !{i32 1254, i32 7, metadata !923, null}
!923 = metadata !{i32 786443, metadata !921, i32 1253, i32 12, metadata !6, i32 90} ; [ DW_TAG_lexical_block ]
!924 = metadata !{i32 1254, i32 18, metadata !923, null}
!925 = metadata !{i32 1255, i32 7, metadata !923, null}
!926 = metadata !{i32 1255, i32 25, metadata !923, null}
!927 = metadata !{i32 1256, i32 7, metadata !923, null}
!928 = metadata !{i32 1257, i32 4, metadata !929, null}
!929 = metadata !{i32 786443, metadata !923, i32 1256, i32 39, metadata !6, i32 91} ; [ DW_TAG_lexical_block ]
!930 = metadata !{i32 1258, i32 7, metadata !929, null}
!931 = metadata !{i32 1259, i32 3, metadata !923, null}
!932 = metadata !{i32 1261, i32 17, metadata !914, null}
!933 = metadata !{i32 1263, i32 6, metadata !934, null}
!934 = metadata !{i32 786443, metadata !914, i32 1261, i32 28, metadata !6, i32 92} ; [ DW_TAG_lexical_block ]
!935 = metadata !{i32 1263, i32 16, metadata !934, null}
!936 = metadata !{i32 1264, i32 17, metadata !934, null}
!937 = metadata !{i32 1266, i32 2, metadata !903, null}
!938 = metadata !{i32 1269, i32 2, metadata !829, null}
!939 = metadata !{i32 1270, i32 6, metadata !940, null}
!940 = metadata !{i32 786443, metadata !829, i32 1269, i32 30, metadata !6, i32 93} ; [ DW_TAG_lexical_block ]
!941 = metadata !{i32 1270, i32 13, metadata !940, null}
!942 = metadata !{i32 1271, i32 2, metadata !940, null}
!943 = metadata !{i32 1272, i32 2, metadata !829, null}
!944 = metadata !{i32 1273, i32 6, metadata !945, null}
!945 = metadata !{i32 786443, metadata !829, i32 1272, i32 20, metadata !6, i32 94} ; [ DW_TAG_lexical_block ]
!946 = metadata !{i32 1274, i32 2, metadata !945, null}
!947 = metadata !{i32 1276, i32 5, metadata !829, null}
!948 = metadata !{i32 1276, i32 16, metadata !801, null}
!949 = metadata !{i32 1277, i32 9, metadata !801, null}
!950 = metadata !{i32 1281, i32 9, metadata !951, null}
!951 = metadata !{i32 786443, metadata !801, i32 1277, i32 52, metadata !6, i32 95} ; [ DW_TAG_lexical_block ]
!952 = metadata !{i32 1282, i32 2, metadata !951, null}
!953 = metadata !{i32 1283, i32 6, metadata !951, null}
!954 = metadata !{i32 1283, i32 31, metadata !951, null}
!955 = metadata !{i32 1285, i32 2, metadata !951, null}
!956 = metadata !{i32 1287, i32 5, metadata !951, null}
!957 = metadata !{i32 1287, i32 16, metadata !801, null}
!958 = metadata !{i32 1288, i32 2, metadata !959, null}
!959 = metadata !{i32 786443, metadata !801, i32 1287, i32 51, metadata !6, i32 96} ; [ DW_TAG_lexical_block ]
!960 = metadata !{i32 1289, i32 2, metadata !959, null}
!961 = metadata !{i32 1291, i32 5, metadata !959, null}
!962 = metadata !{i32 1291, i32 16, metadata !801, null}
!963 = metadata !{i32 1292, i32 2, metadata !964, null}
!964 = metadata !{i32 786443, metadata !801, i32 1291, i32 50, metadata !6, i32 97} ; [ DW_TAG_lexical_block ]
!965 = metadata !{i32 1293, i32 2, metadata !964, null}
!966 = metadata !{i32 1294, i32 2, metadata !964, null}
!967 = metadata !{i32 1296, i32 5, metadata !964, null}
!968 = metadata !{i32 1296, i32 16, metadata !801, null}
!969 = metadata !{i32 1297, i32 2, metadata !970, null}
!970 = metadata !{i32 786443, metadata !801, i32 1296, i32 50, metadata !6, i32 98} ; [ DW_TAG_lexical_block ]
!971 = metadata !{i32 1298, i32 2, metadata !970, null}
!972 = metadata !{i32 1299, i32 2, metadata !970, null}
!973 = metadata !{i32 1301, i32 5, metadata !970, null}
!974 = metadata !{i32 1301, i32 12, metadata !801, null}
!975 = metadata !{i32 1302, i32 2, metadata !976, null}
!976 = metadata !{i32 786443, metadata !801, i32 1301, i32 45, metadata !6, i32 99} ; [ DW_TAG_lexical_block ]
!977 = metadata !{i32 1303, i32 2, metadata !976, null}
!978 = metadata !{i32 1304, i32 9, metadata !976, null}
!979 = metadata !{i32 1305, i32 2, metadata !976, null}
!980 = metadata !{i32 1306, i32 5, metadata !976, null}
!981 = metadata !{i32 1307, i32 5, metadata !801, null}
!982 = metadata !{i32 1307, i32 22, metadata !801, null}
!983 = metadata !{i32 1309, i32 5, metadata !801, null}
!984 = metadata !{i32 1310, i32 2, metadata !985, null}
!985 = metadata !{i32 786443, metadata !801, i32 1309, i32 23, metadata !6, i32 100} ; [ DW_TAG_lexical_block ]
!986 = metadata !{i32 1311, i32 2, metadata !985, null}
!987 = metadata !{i32 1312, i32 2, metadata !985, null}
!988 = metadata !{i32 1314, i32 2, metadata !989, null}
!989 = metadata !{i32 786443, metadata !990, i32 1314, i32 2, metadata !6, i32 102} ; [ DW_TAG_lexical_block ]
!990 = metadata !{i32 786443, metadata !801, i32 1313, i32 12, metadata !6, i32 101} ; [ DW_TAG_lexical_block ]
!991 = metadata !{i32 1316, i32 2, metadata !990, null}
!992 = metadata !{i32 1318, i32 1, metadata !801, null}
!993 = metadata !{i32 786688, metadata !994, metadata !"ostat", metadata !6, i32 871, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!994 = metadata !{i32 786443, metadata !99, i32 870, i32 1, metadata !6, i32 124} ; [ DW_TAG_lexical_block ]
!995 = metadata !{i32 871, i32 17, metadata !994, null}
!996 = metadata !{i32 786688, metadata !994, metadata !"flags", metadata !6, i32 872, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!997 = metadata !{i32 872, i32 9, metadata !994, null}
!998 = metadata !{i32 872, i32 55, metadata !994, null}
!999 = metadata !{i32 874, i32 5, metadata !994, null}
!1000 = metadata !{i32 875, i32 2, metadata !1001, null}
!1001 = metadata !{i32 786443, metadata !994, i32 874, i32 30, metadata !6, i32 125} ; [ DW_TAG_lexical_block ]
!1002 = metadata !{i32 876, i32 5, metadata !1001, null}
!1003 = metadata !{i32 877, i32 5, metadata !1004, null}
!1004 = metadata !{i32 786443, metadata !994, i32 877, i32 5, metadata !6, i32 126} ; [ DW_TAG_lexical_block ]
!1005 = metadata !{i32 879, i32 6, metadata !1006, null}
!1006 = metadata !{i32 786443, metadata !1004, i32 877, i32 14, metadata !6, i32 127} ; [ DW_TAG_lexical_block ]
!1007 = metadata !{i32 880, i32 6, metadata !1008, null}
!1008 = metadata !{i32 786443, metadata !1006, i32 879, i32 28, metadata !6, i32 128} ; [ DW_TAG_lexical_block ]
!1009 = metadata !{i32 881, i32 6, metadata !1008, null}
!1010 = metadata !{i32 884, i32 2, metadata !1006, null}
!1011 = metadata !{i32 885, i32 8, metadata !1006, null}
!1012 = metadata !{i32 886, i32 2, metadata !1006, null}
!1013 = metadata !{i32 887, i32 6, metadata !1014, null}
!1014 = metadata !{i32 786443, metadata !1006, i32 886, i32 17, metadata !6, i32 129} ; [ DW_TAG_lexical_block ]
!1015 = metadata !{i32 888, i32 6, metadata !1014, null}
!1016 = metadata !{i32 889, i32 6, metadata !1014, null}
!1017 = metadata !{i32 890, i32 6, metadata !1014, null}
!1018 = metadata !{i32 897, i32 6, metadata !1006, null}
!1019 = metadata !{i32 899, i32 6, metadata !1020, null}
!1020 = metadata !{i32 786443, metadata !1006, i32 897, i32 31, metadata !6, i32 130} ; [ DW_TAG_lexical_block ]
!1021 = metadata !{i32 900, i32 6, metadata !1020, null}
!1022 = metadata !{i32 901, i32 6, metadata !1020, null}
!1023 = metadata !{i32 901, i32 18, metadata !1020, null}
!1024 = metadata !{i32 902, i32 6, metadata !1020, null}
!1025 = metadata !{i32 903, i32 6, metadata !1020, null}
!1026 = metadata !{i32 904, i32 6, metadata !1020, null}
!1027 = metadata !{i32 906, i32 7, metadata !1006, null}
!1028 = metadata !{i32 906, i32 38, metadata !1006, null}
!1029 = metadata !{i32 908, i32 2, metadata !1006, null}
!1030 = metadata !{i32 910, i32 6, metadata !1031, null}
!1031 = metadata !{i32 786443, metadata !1032, i32 910, i32 6, metadata !6, i32 132} ; [ DW_TAG_lexical_block ]
!1032 = metadata !{i32 786443, metadata !1006, i32 908, i32 18, metadata !6, i32 131} ; [ DW_TAG_lexical_block ]
!1033 = metadata !{i32 912, i32 6, metadata !1032, null}
!1034 = metadata !{i32 914, i32 2, metadata !1006, null}
!1035 = metadata !{i32 915, i32 2, metadata !1006, null}
!1036 = metadata !{i32 921, i32 2, metadata !1006, null}
!1037 = metadata !{i32 922, i32 5, metadata !1006, null}
!1038 = metadata !{i32 923, i32 1, metadata !994, null}
!1039 = metadata !{i32 786689, metadata !24, metadata !"ifstat", metadata !6, i32 16778837, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1040 = metadata !{i32 1621, i32 18, metadata !24, null}
!1041 = metadata !{i32 1624, i32 5, metadata !1042, null}
!1042 = metadata !{i32 786443, metadata !24, i32 1622, i32 1, metadata !6, i32 48} ; [ DW_TAG_lexical_block ]
!1043 = metadata !{i32 1625, i32 2, metadata !1044, null}
!1044 = metadata !{i32 786443, metadata !1042, i32 1624, i32 74, metadata !6, i32 49} ; [ DW_TAG_lexical_block ]
!1045 = metadata !{i32 1626, i32 2, metadata !1044, null}
!1046 = metadata !{i32 1627, i32 6, metadata !1047, null}
!1047 = metadata !{i32 786443, metadata !1044, i32 1626, i32 19, metadata !6, i32 50} ; [ DW_TAG_lexical_block ]
!1048 = metadata !{i32 1628, i32 2, metadata !1047, null}
!1049 = metadata !{i32 1629, i32 5, metadata !1044, null}
!1050 = metadata !{i32 1630, i32 5, metadata !1042, null}
!1051 = metadata !{i32 1633, i32 9, metadata !1042, null}
!1052 = metadata !{i32 1634, i32 2, metadata !1053, null}
!1053 = metadata !{i32 786443, metadata !1054, i32 1634, i32 2, metadata !6, i32 52} ; [ DW_TAG_lexical_block ]
!1054 = metadata !{i32 786443, metadata !1042, i32 1633, i32 49, metadata !6, i32 51} ; [ DW_TAG_lexical_block ]
!1055 = metadata !{i32 1635, i32 2, metadata !1054, null}
!1056 = metadata !{i32 1635, i32 14, metadata !1054, null}
!1057 = metadata !{i32 1636, i32 5, metadata !1054, null}
!1058 = metadata !{i32 1638, i32 5, metadata !1042, null}
!1059 = metadata !{i32 1640, i32 5, metadata !1042, null}
!1060 = metadata !{i32 1642, i32 12, metadata !1042, null}
!1061 = metadata !{i32 1643, i32 9, metadata !1042, null}
!1062 = metadata !{i32 1644, i32 2, metadata !1063, null}
!1063 = metadata !{i32 786443, metadata !1064, i32 1644, i32 2, metadata !6, i32 54} ; [ DW_TAG_lexical_block ]
!1064 = metadata !{i32 786443, metadata !1042, i32 1643, i32 25, metadata !6, i32 53} ; [ DW_TAG_lexical_block ]
!1065 = metadata !{i32 1645, i32 2, metadata !1064, null}
!1066 = metadata !{i32 1645, i32 14, metadata !1064, null}
!1067 = metadata !{i32 1646, i32 5, metadata !1064, null}
!1068 = metadata !{i32 1647, i32 1, metadata !1042, null}
!1069 = metadata !{i32 786689, metadata !82, metadata !"name", metadata !6, i32 16778814, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1070 = metadata !{i32 1598, i32 11, metadata !82, null}
!1071 = metadata !{i32 786689, metadata !82, metadata !"statb", metadata !6, i32 33556031, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1072 = metadata !{i32 1599, i32 18, metadata !82, null}
!1073 = metadata !{i32 786688, metadata !1074, metadata !"timep", metadata !6, i32 1601, metadata !1075, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1074 = metadata !{i32 786443, metadata !82, i32 1600, i32 1, metadata !6, i32 55} ; [ DW_TAG_lexical_block ]
!1075 = metadata !{i32 786451, null, metadata !"utimbuf", metadata !1076, i32 44, i64 128, i64 64, i32 0, i32 0, null, metadata !1077, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!1076 = metadata !{i32 786473, metadata !"/usr/include/utime.h", metadata !"/home/capsicum/wvd/gzip-1.2.4", null} ; [ DW_TAG_file_type ]
!1077 = metadata !{metadata !1078, metadata !1079}
!1078 = metadata !{i32 786445, metadata !1075, metadata !"actime", metadata !1076, i32 45, i64 64, i64 64, i64 0, i32 0, metadata !58} ; [ DW_TAG_member ]
!1079 = metadata !{i32 786445, metadata !1075, metadata !"modtime", metadata !1076, i32 46, i64 64, i64 64, i64 64, i32 0, metadata !58} ; [ DW_TAG_member ]
!1080 = metadata !{i32 1601, i32 20, metadata !1074, null}
!1081 = metadata !{i32 1604, i32 5, metadata !1074, null}
!1082 = metadata !{i32 1605, i32 5, metadata !1074, null}
!1083 = metadata !{i32 1608, i32 9, metadata !1074, null}
!1084 = metadata !{i32 1609, i32 2, metadata !1085, null}
!1085 = metadata !{i32 786443, metadata !1086, i32 1609, i32 2, metadata !6, i32 57} ; [ DW_TAG_lexical_block ]
!1086 = metadata !{i32 786443, metadata !1074, i32 1608, i32 58, metadata !6, i32 56} ; [ DW_TAG_lexical_block ]
!1087 = metadata !{i32 1610, i32 2, metadata !1086, null}
!1088 = metadata !{i32 1610, i32 14, metadata !1086, null}
!1089 = metadata !{i32 1611, i32 5, metadata !1086, null}
!1090 = metadata !{i32 1612, i32 1, metadata !1074, null}
!1091 = metadata !{i32 786689, metadata !92, metadata !"name", metadata !6, i32 16778171, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1092 = metadata !{i32 955, i32 11, metadata !92, null}
!1093 = metadata !{i32 786688, metadata !1094, metadata !"nlen", metadata !6, i32 957, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1094 = metadata !{i32 786443, metadata !92, i32 956, i32 1, metadata !6, i32 113} ; [ DW_TAG_lexical_block ]
!1095 = metadata !{i32 957, i32 9, metadata !1094, null}
!1096 = metadata !{i32 786688, metadata !1094, metadata !"slen", metadata !6, i32 957, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1097 = metadata !{i32 957, i32 15, metadata !1094, null}
!1098 = metadata !{i32 786688, metadata !1094, metadata !"suffix", metadata !6, i32 958, metadata !1099, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1099 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 264, i64 8, i32 0, i32 0, metadata !12, metadata !1100, i32 0, i32 0} ; [ DW_TAG_array_type ]
!1100 = metadata !{metadata !1101}
!1101 = metadata !{i32 786465, i64 0, i64 32}     ; [ DW_TAG_subrange_type ]
!1102 = metadata !{i32 958, i32 10, metadata !1094, null}
!1103 = metadata !{i32 786688, metadata !1094, metadata !"suf", metadata !6, i32 965, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1104 = metadata !{i32 965, i32 12, metadata !1094, null}
!1105 = metadata !{i32 965, i32 32, metadata !1094, null}
!1106 = metadata !{i32 967, i32 9, metadata !1094, null}
!1107 = metadata !{i32 967, i32 32, metadata !1094, null}
!1108 = metadata !{i32 976, i32 12, metadata !1094, null}
!1109 = metadata !{i32 977, i32 5, metadata !1094, null}
!1110 = metadata !{i32 978, i32 9, metadata !1111, null}
!1111 = metadata !{i32 786443, metadata !1094, i32 977, i32 31, metadata !6, i32 114} ; [ DW_TAG_lexical_block ]
!1112 = metadata !{i32 979, i32 5, metadata !1111, null}
!1113 = metadata !{i32 980, i32 9, metadata !1114, null}
!1114 = metadata !{i32 786443, metadata !1094, i32 979, i32 12, metadata !6, i32 115} ; [ DW_TAG_lexical_block ]
!1115 = metadata !{i32 982, i32 5, metadata !1094, null}
!1116 = metadata !{i32 983, i32 12, metadata !1094, null}
!1117 = metadata !{i32 984, i32 5, metadata !1094, null}
!1118 = metadata !{i32 786688, metadata !1119, metadata !"s", metadata !6, i32 985, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1119 = metadata !{i32 786443, metadata !1094, i32 984, i32 8, metadata !6, i32 116} ; [ DW_TAG_lexical_block ]
!1120 = metadata !{i32 985, i32 12, metadata !1119, null}
!1121 = metadata !{i32 985, i32 16, metadata !1119, null}
!1122 = metadata !{i32 986, i32 8, metadata !1119, null}
!1123 = metadata !{i32 987, i32 15, metadata !1119, null}
!1124 = metadata !{i32 988, i32 12, metadata !1125, null}
!1125 = metadata !{i32 786443, metadata !1119, i32 987, i32 48, metadata !6, i32 117} ; [ DW_TAG_lexical_block ]
!1126 = metadata !{i32 990, i32 5, metadata !1119, null}
!1127 = metadata !{i32 992, i32 5, metadata !1094, null}
!1128 = metadata !{i32 993, i32 1, metadata !1094, null}
!1129 = metadata !{i32 786689, metadata !98, metadata !"name", metadata !6, i32 16778146, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1130 = metadata !{i32 930, i32 11, metadata !98, null}
!1131 = metadata !{i32 786689, metadata !98, metadata !"sbuf", metadata !6, i32 33555363, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1132 = metadata !{i32 931, i32 18, metadata !98, null}
!1133 = metadata !{i32 933, i32 5, metadata !1134, null}
!1134 = metadata !{i32 786443, metadata !98, i32 932, i32 1, metadata !6, i32 122} ; [ DW_TAG_lexical_block ]
!1135 = metadata !{i32 935, i32 5, metadata !1134, null}
!1136 = metadata !{i32 936, i32 9, metadata !1137, null}
!1137 = metadata !{i32 786443, metadata !1134, i32 935, i32 31, metadata !6, i32 123} ; [ DW_TAG_lexical_block ]
!1138 = metadata !{i32 939, i32 12, metadata !1134, null}
!1139 = metadata !{i32 940, i32 1, metadata !1134, null}
!1140 = metadata !{i32 786688, metadata !1141, metadata !"ostat", metadata !6, i32 1529, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1141 = metadata !{i32 786443, metadata !105, i32 1528, i32 1, metadata !6, i32 143} ; [ DW_TAG_lexical_block ]
!1142 = metadata !{i32 1529, i32 17, metadata !1141, null}
!1143 = metadata !{i32 1535, i32 5, metadata !1141, null}
!1144 = metadata !{i32 1536, i32 5, metadata !1141, null}
!1145 = metadata !{i32 1536, i32 12, metadata !1141, null}
!1146 = metadata !{i32 1537, i32 13, metadata !1147, null}
!1147 = metadata !{i32 786443, metadata !1141, i32 1536, i32 39, metadata !6, i32 144} ; [ DW_TAG_lexical_block ]
!1148 = metadata !{i32 1537, i32 36, metadata !1147, null}
!1149 = metadata !{i32 1538, i32 2, metadata !1147, null}
!1150 = metadata !{i32 1539, i32 5, metadata !1147, null}
!1151 = metadata !{i32 1547, i32 5, metadata !1141, null}
!1152 = metadata !{i32 1547, i32 24, metadata !1141, null}
!1153 = metadata !{i32 1548, i32 2, metadata !1154, null}
!1154 = metadata !{i32 786443, metadata !1141, i32 1547, i32 55, metadata !6, i32 145} ; [ DW_TAG_lexical_block ]
!1155 = metadata !{i32 1549, i32 6, metadata !1154, null}
!1156 = metadata !{i32 1549, i32 33, metadata !1154, null}
!1157 = metadata !{i32 1550, i32 5, metadata !1154, null}
!1158 = metadata !{i32 1555, i32 9, metadata !1141, null}
!1159 = metadata !{i32 1556, i32 6, metadata !1160, null}
!1160 = metadata !{i32 786443, metadata !1141, i32 1555, i32 36, metadata !6, i32 146} ; [ DW_TAG_lexical_block ]
!1161 = metadata !{i32 1557, i32 6, metadata !1162, null}
!1162 = metadata !{i32 786443, metadata !1160, i32 1556, i32 30, metadata !6, i32 147} ; [ DW_TAG_lexical_block ]
!1163 = metadata !{i32 1559, i32 2, metadata !1162, null}
!1164 = metadata !{i32 1560, i32 6, metadata !1165, null}
!1165 = metadata !{i32 786443, metadata !1160, i32 1559, i32 9, metadata !6, i32 148} ; [ DW_TAG_lexical_block ]
!1166 = metadata !{i32 1563, i32 2, metadata !1160, null}
!1167 = metadata !{i32 1564, i32 2, metadata !1160, null}
!1168 = metadata !{i32 1567, i32 5, metadata !1141, null}
!1169 = metadata !{i32 786688, metadata !1170, metadata !"response", metadata !6, i32 1568, metadata !1171, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1170 = metadata !{i32 786443, metadata !1141, i32 1567, i32 17, metadata !6, i32 149} ; [ DW_TAG_lexical_block ]
!1171 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 640, i64 8, i32 0, i32 0, metadata !12, metadata !1172, i32 0, i32 0} ; [ DW_TAG_array_type ]
!1172 = metadata !{metadata !1173}
!1173 = metadata !{i32 786465, i64 0, i64 79}     ; [ DW_TAG_subrange_type ]
!1174 = metadata !{i32 1568, i32 7, metadata !1170, null}
!1175 = metadata !{i32 1569, i32 2, metadata !1170, null}
!1176 = metadata !{i32 1570, i32 2, metadata !1170, null}
!1177 = metadata !{i32 1571, i32 2, metadata !1170, null}
!1178 = metadata !{i32 1571, i32 20, metadata !1170, null}
!1179 = metadata !{i32 1571, i32 27, metadata !1170, null}
!1180 = metadata !{i32 1572, i32 6, metadata !1181, null}
!1181 = metadata !{i32 786443, metadata !1170, i32 1571, i32 43, metadata !6, i32 150} ; [ DW_TAG_lexical_block ]
!1182 = metadata !{i32 1573, i32 6, metadata !1181, null}
!1183 = metadata !{i32 1574, i32 12, metadata !1181, null}
!1184 = metadata !{i32 1575, i32 2, metadata !1181, null}
!1185 = metadata !{i32 1576, i32 6, metadata !1170, null}
!1186 = metadata !{i32 1577, i32 6, metadata !1187, null}
!1187 = metadata !{i32 786443, metadata !1170, i32 1576, i32 31, metadata !6, i32 151} ; [ DW_TAG_lexical_block ]
!1188 = metadata !{i32 1578, i32 6, metadata !1187, null}
!1189 = metadata !{i32 1578, i32 27, metadata !1187, null}
!1190 = metadata !{i32 1579, i32 6, metadata !1187, null}
!1191 = metadata !{i32 1581, i32 5, metadata !1170, null}
!1192 = metadata !{i32 1582, i32 12, metadata !1141, null}
!1193 = metadata !{i32 1583, i32 9, metadata !1141, null}
!1194 = metadata !{i32 1584, i32 2, metadata !1195, null}
!1195 = metadata !{i32 786443, metadata !1141, i32 1583, i32 25, metadata !6, i32 152} ; [ DW_TAG_lexical_block ]
!1196 = metadata !{i32 1585, i32 2, metadata !1195, null}
!1197 = metadata !{i32 1586, i32 2, metadata !1195, null}
!1198 = metadata !{i32 1587, i32 2, metadata !1195, null}
!1199 = metadata !{i32 1589, i32 5, metadata !1141, null}
!1200 = metadata !{i32 1590, i32 1, metadata !1141, null}
!1201 = metadata !{i32 786689, metadata !101, metadata !"name", metadata !6, i32 16778652, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1202 = metadata !{i32 1436, i32 11, metadata !101, null}
!1203 = metadata !{i32 786689, metadata !101, metadata !"statb", metadata !6, i32 33555869, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1204 = metadata !{i32 1437, i32 18, metadata !101, null}
!1205 = metadata !{i32 786688, metadata !1206, metadata !"s", metadata !6, i32 1439, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1206 = metadata !{i32 786443, metadata !101, i32 1438, i32 1, metadata !6, i32 141} ; [ DW_TAG_lexical_block ]
!1207 = metadata !{i32 1439, i32 9, metadata !1206, null}
!1208 = metadata !{i32 1439, i32 13, metadata !1206, null}
!1209 = metadata !{i32 786688, metadata !1206, metadata !"c", metadata !6, i32 1440, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1210 = metadata !{i32 1440, i32 10, metadata !1206, null}
!1211 = metadata !{i32 1440, i32 23, metadata !1206, null}
!1212 = metadata !{i32 786688, metadata !1206, metadata !"tstat", metadata !6, i32 1441, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1213 = metadata !{i32 1441, i32 17, metadata !1206, null}
!1214 = metadata !{i32 786688, metadata !1206, metadata !"res", metadata !6, i32 1442, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1215 = metadata !{i32 1442, i32 9, metadata !1206, null}
!1216 = metadata !{i32 1444, i32 5, metadata !1206, null}
!1217 = metadata !{i32 1445, i32 5, metadata !1206, null}
!1218 = metadata !{i32 1446, i32 11, metadata !1206, null}
!1219 = metadata !{i32 1446, i32 38, metadata !1206, null}
!1220 = metadata !{i32 1447, i32 5, metadata !1206, null}
!1221 = metadata !{i32 1449, i32 5, metadata !1206, null}
!1222 = metadata !{i32 786689, metadata !100, metadata !"name", metadata !6, i32 16778678, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1223 = metadata !{i32 1462, i32 11, metadata !100, null}
!1224 = metadata !{i32 786688, metadata !1225, metadata !"len", metadata !6, i32 1464, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1225 = metadata !{i32 786443, metadata !100, i32 1463, i32 1, metadata !6, i32 133} ; [ DW_TAG_lexical_block ]
!1226 = metadata !{i32 1464, i32 9, metadata !1225, null}
!1227 = metadata !{i32 786688, metadata !1225, metadata !"trunc", metadata !6, i32 1465, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1228 = metadata !{i32 1465, i32 11, metadata !1225, null}
!1229 = metadata !{i32 1465, i32 23, metadata !1225, null}
!1230 = metadata !{i32 786688, metadata !1225, metadata !"plen", metadata !6, i32 1466, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1231 = metadata !{i32 1466, i32 9, metadata !1225, null}
!1232 = metadata !{i32 786688, metadata !1225, metadata !"min_part", metadata !6, i32 1467, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1233 = metadata !{i32 1467, i32 9, metadata !1225, null}
!1234 = metadata !{i32 1467, i32 28, metadata !1225, null}
!1235 = metadata !{i32 786688, metadata !1225, metadata !"p", metadata !6, i32 1468, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1236 = metadata !{i32 1468, i32 11, metadata !1225, null}
!1237 = metadata !{i32 1470, i32 11, metadata !1225, null}
!1238 = metadata !{i32 1471, i32 5, metadata !1225, null}
!1239 = metadata !{i32 1472, i32 2, metadata !1240, null}
!1240 = metadata !{i32 786443, metadata !1225, i32 1471, i32 21, metadata !6, i32 134} ; [ DW_TAG_lexical_block ]
!1241 = metadata !{i32 1472, i32 16, metadata !1240, null}
!1242 = metadata !{i32 1473, i32 2, metadata !1240, null}
!1243 = metadata !{i32 1474, i32 2, metadata !1240, null}
!1244 = metadata !{i32 1476, i32 9, metadata !1225, null}
!1245 = metadata !{i32 1477, i32 5, metadata !1225, null}
!1246 = metadata !{i32 1477, i32 20, metadata !1225, null}
!1247 = metadata !{i32 1478, i32 5, metadata !1225, null}
!1248 = metadata !{i32 1479, i32 5, metadata !1225, null}
!1249 = metadata !{i32 1482, i32 5, metadata !1225, null}
!1250 = metadata !{i32 1482, i32 20, metadata !1225, null}
!1251 = metadata !{i32 1483, i32 2, metadata !1252, null}
!1252 = metadata !{i32 786443, metadata !1225, i32 1482, i32 41, metadata !6, i32 135} ; [ DW_TAG_lexical_block ]
!1253 = metadata !{i32 1484, i32 2, metadata !1252, null}
!1254 = metadata !{i32 1489, i32 5, metadata !1225, null}
!1255 = metadata !{i32 1490, i32 6, metadata !1256, null}
!1256 = metadata !{i32 786443, metadata !1225, i32 1489, i32 8, metadata !6, i32 136} ; [ DW_TAG_lexical_block ]
!1257 = metadata !{i32 1491, i32 2, metadata !1256, null}
!1258 = metadata !{i32 1492, i32 2, metadata !1256, null}
!1259 = metadata !{i32 1493, i32 13, metadata !1260, null}
!1260 = metadata !{i32 786443, metadata !1256, i32 1492, i32 13, metadata !6, i32 137} ; [ DW_TAG_lexical_block ]
!1261 = metadata !{i32 1494, i32 6, metadata !1260, null}
!1262 = metadata !{i32 1495, i32 6, metadata !1260, null}
!1263 = metadata !{i32 1495, i32 27, metadata !1260, null}
!1264 = metadata !{i32 1496, i32 6, metadata !1260, null}
!1265 = metadata !{i32 1496, i32 14, metadata !1260, null}
!1266 = metadata !{i32 1497, i32 2, metadata !1260, null}
!1267 = metadata !{i32 1498, i32 5, metadata !1256, null}
!1268 = metadata !{i32 1500, i32 5, metadata !1225, null}
!1269 = metadata !{i32 1501, i32 2, metadata !1270, null}
!1270 = metadata !{i32 786443, metadata !1225, i32 1500, i32 24, metadata !6, i32 138} ; [ DW_TAG_lexical_block ]
!1271 = metadata !{i32 1502, i32 6, metadata !1272, null}
!1272 = metadata !{i32 786443, metadata !1270, i32 1501, i32 5, metadata !6, i32 139} ; [ DW_TAG_lexical_block ]
!1273 = metadata !{i32 1503, i32 2, metadata !1272, null}
!1274 = metadata !{i32 1504, i32 2, metadata !1270, null}
!1275 = metadata !{i32 1505, i32 5, metadata !1270, null}
!1276 = metadata !{i32 1506, i32 10, metadata !1277, null}
!1277 = metadata !{i32 786443, metadata !1225, i32 1505, i32 12, metadata !6, i32 140} ; [ DW_TAG_lexical_block ]
!1278 = metadata !{i32 1507, i32 2, metadata !1277, null}
!1279 = metadata !{i32 1507, i32 21, metadata !1277, null}
!1280 = metadata !{i32 1508, i32 2, metadata !1277, null}
!1281 = metadata !{i32 1508, i32 24, metadata !1277, null}
!1282 = metadata !{i32 1510, i32 5, metadata !1225, null}
!1283 = metadata !{i32 1511, i32 1, metadata !1225, null}
!1284 = metadata !{i32 786689, metadata !102, metadata !"stat1", metadata !6, i32 16778629, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1285 = metadata !{i32 1413, i32 18, metadata !102, null}
!1286 = metadata !{i32 786689, metadata !102, metadata !"stat2", metadata !6, i32 33555846, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1287 = metadata !{i32 1414, i32 18, metadata !102, null}
!1288 = metadata !{i32 1416, i32 5, metadata !1289, null}
!1289 = metadata !{i32 786443, metadata !102, i32 1415, i32 1, metadata !6, i32 142} ; [ DW_TAG_lexical_block ]
!1290 = metadata !{i32 1429, i32 1, metadata !102, null}
!1291 = metadata !{i32 786689, metadata !106, metadata !"_c", metadata !107, i32 16777333, metadata !110, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1292 = metadata !{i32 117, i32 24, metadata !106, null}
!1293 = metadata !{i32 786689, metadata !106, metadata !"_f", metadata !107, i32 33554549, metadata !111, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1294 = metadata !{i32 117, i32 42, metadata !106, null}
!1295 = metadata !{i32 119, i32 12, metadata !1296, null}
!1296 = metadata !{i32 786443, metadata !106, i32 118, i32 1, metadata !107, i32 153} ; [ DW_TAG_lexical_block ]
!1297 = metadata !{i32 786689, metadata !112, metadata !"_c", metadata !107, i32 16777320, metadata !110, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1298 = metadata !{i32 104, i32 26, metadata !112, null}
!1299 = metadata !{i32 786689, metadata !112, metadata !"_f", metadata !107, i32 33554536, metadata !111, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1300 = metadata !{i32 104, i32 44, metadata !112, null}
!1301 = metadata !{i32 106, i32 2, metadata !1302, null}
!1302 = metadata !{i32 786443, metadata !112, i32 105, i32 1, metadata !107, i32 154} ; [ DW_TAG_lexical_block ]
!1303 = metadata !{i32 786689, metadata !229, metadata !"ifd", metadata !230, i32 16777249, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1304 = metadata !{i32 33, i32 21, metadata !229, null}
!1305 = metadata !{i32 786688, metadata !1306, metadata !"dump", metadata !230, i32 34, metadata !1307, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1306 = metadata !{i32 786443, metadata !229, i32 33, i32 26, metadata !230, i32 0} ; [ DW_TAG_lexical_block ]
!1307 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1308} ; [ DW_TAG_pointer_type ]
!1308 = metadata !{i32 786454, null, metadata !"FILE", metadata !230, i32 147, i64 0, i64 0, i64 0, i32 0, metadata !1309} ; [ DW_TAG_typedef ]
!1309 = metadata !{i32 786451, null, metadata !"__sFILE", metadata !61, i32 110, i64 2432, i64 64, i32 0, i32 0, null, metadata !1310, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!1310 = metadata !{metadata !1311, metadata !1313, metadata !1314, metadata !1315, metadata !1317, metadata !1318, metadata !1323, metadata !1324, metadata !1326, metadata !1330, metadata !1334, metadata !1339, metadata !1343, metadata !1344, metadata !1345, metadata !1346, metadata !1350, metadata !1354, metadata !1355, metadata !1356, metadata !1357, metadata !1361, metadata !1364, metadata !1365, metadata !1366}
!1311 = metadata !{i32 786445, metadata !1309, metadata !"_p", metadata !61, i32 111, i64 64, i64 64, i64 0, i32 0, metadata !1312} ; [ DW_TAG_member ]
!1312 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !163} ; [ DW_TAG_pointer_type ]
!1313 = metadata !{i32 786445, metadata !1309, metadata !"_r", metadata !61, i32 112, i64 32, i64 32, i64 64, i32 0, metadata !9} ; [ DW_TAG_member ]
!1314 = metadata !{i32 786445, metadata !1309, metadata !"_w", metadata !61, i32 113, i64 32, i64 32, i64 96, i32 0, metadata !9} ; [ DW_TAG_member ]
!1315 = metadata !{i32 786445, metadata !1309, metadata !"_flags", metadata !61, i32 114, i64 16, i64 16, i64 128, i32 0, metadata !1316} ; [ DW_TAG_member ]
!1316 = metadata !{i32 786468, null, metadata !"short", null, i32 0, i64 16, i64 16, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!1317 = metadata !{i32 786445, metadata !1309, metadata !"_file", metadata !61, i32 115, i64 16, i64 16, i64 144, i32 0, metadata !1316} ; [ DW_TAG_member ]
!1318 = metadata !{i32 786445, metadata !1309, metadata !"_bf", metadata !61, i32 116, i64 128, i64 64, i64 192, i32 0, metadata !1319} ; [ DW_TAG_member ]
!1319 = metadata !{i32 786451, null, metadata !"__sbuf", metadata !61, i32 77, i64 128, i64 64, i32 0, i32 0, null, metadata !1320, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!1320 = metadata !{metadata !1321, metadata !1322}
!1321 = metadata !{i32 786445, metadata !1319, metadata !"_base", metadata !61, i32 78, i64 64, i64 64, i64 0, i32 0, metadata !1312} ; [ DW_TAG_member ]
!1322 = metadata !{i32 786445, metadata !1319, metadata !"_size", metadata !61, i32 79, i64 32, i64 32, i64 64, i32 0, metadata !9} ; [ DW_TAG_member ]
!1323 = metadata !{i32 786445, metadata !1309, metadata !"_lbfsize", metadata !61, i32 117, i64 32, i64 32, i64 320, i32 0, metadata !9} ; [ DW_TAG_member ]
!1324 = metadata !{i32 786445, metadata !1309, metadata !"_cookie", metadata !61, i32 120, i64 64, i64 64, i64 384, i32 0, metadata !1325} ; [ DW_TAG_member ]
!1325 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!1326 = metadata !{i32 786445, metadata !1309, metadata !"_close", metadata !61, i32 121, i64 64, i64 64, i64 448, i32 0, metadata !1327} ; [ DW_TAG_member ]
!1327 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1328} ; [ DW_TAG_pointer_type ]
!1328 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1329, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!1329 = metadata !{metadata !9, metadata !1325}
!1330 = metadata !{i32 786445, metadata !1309, metadata !"_read", metadata !61, i32 122, i64 64, i64 64, i64 512, i32 0, metadata !1331} ; [ DW_TAG_member ]
!1331 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1332} ; [ DW_TAG_pointer_type ]
!1332 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1333, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!1333 = metadata !{metadata !9, metadata !1325, metadata !11, metadata !9}
!1334 = metadata !{i32 786445, metadata !1309, metadata !"_seek", metadata !61, i32 123, i64 64, i64 64, i64 576, i32 0, metadata !1335} ; [ DW_TAG_member ]
!1335 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1336} ; [ DW_TAG_pointer_type ]
!1336 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1337, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!1337 = metadata !{metadata !1338, metadata !1325, metadata !1338, metadata !9}
!1338 = metadata !{i32 786454, null, metadata !"fpos_t", metadata !61, i32 43, i64 0, i64 0, i64 0, i32 0, metadata !68} ; [ DW_TAG_typedef ]
!1339 = metadata !{i32 786445, metadata !1309, metadata !"_write", metadata !61, i32 124, i64 64, i64 64, i64 640, i32 0, metadata !1340} ; [ DW_TAG_member ]
!1340 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1341} ; [ DW_TAG_pointer_type ]
!1341 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1342, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!1342 = metadata !{metadata !9, metadata !1325, metadata !148, metadata !9}
!1343 = metadata !{i32 786445, metadata !1309, metadata !"_ub", metadata !61, i32 127, i64 128, i64 64, i64 704, i32 0, metadata !1319} ; [ DW_TAG_member ]
!1344 = metadata !{i32 786445, metadata !1309, metadata !"_up", metadata !61, i32 128, i64 64, i64 64, i64 832, i32 0, metadata !1312} ; [ DW_TAG_member ]
!1345 = metadata !{i32 786445, metadata !1309, metadata !"_ur", metadata !61, i32 129, i64 32, i64 32, i64 896, i32 0, metadata !9} ; [ DW_TAG_member ]
!1346 = metadata !{i32 786445, metadata !1309, metadata !"_ubuf", metadata !61, i32 132, i64 24, i64 8, i64 928, i32 0, metadata !1347} ; [ DW_TAG_member ]
!1347 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 24, i64 8, i32 0, i32 0, metadata !163, metadata !1348, i32 0, i32 0} ; [ DW_TAG_array_type ]
!1348 = metadata !{metadata !1349}
!1349 = metadata !{i32 786465, i64 0, i64 2}      ; [ DW_TAG_subrange_type ]
!1350 = metadata !{i32 786445, metadata !1309, metadata !"_nbuf", metadata !61, i32 133, i64 8, i64 8, i64 952, i32 0, metadata !1351} ; [ DW_TAG_member ]
!1351 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 8, i64 8, i32 0, i32 0, metadata !163, metadata !1352, i32 0, i32 0} ; [ DW_TAG_array_type ]
!1352 = metadata !{metadata !1353}
!1353 = metadata !{i32 786465, i64 0, i64 0}      ; [ DW_TAG_subrange_type ]
!1354 = metadata !{i32 786445, metadata !1309, metadata !"_lb", metadata !61, i32 136, i64 128, i64 64, i64 960, i32 0, metadata !1319} ; [ DW_TAG_member ]
!1355 = metadata !{i32 786445, metadata !1309, metadata !"_blksize", metadata !61, i32 139, i64 32, i64 32, i64 1088, i32 0, metadata !9} ; [ DW_TAG_member ]
!1356 = metadata !{i32 786445, metadata !1309, metadata !"_offset", metadata !61, i32 140, i64 64, i64 64, i64 1152, i32 0, metadata !1338} ; [ DW_TAG_member ]
!1357 = metadata !{i32 786445, metadata !1309, metadata !"_fl_mutex", metadata !61, i32 142, i64 64, i64 64, i64 1216, i32 0, metadata !1358} ; [ DW_TAG_member ]
!1358 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1359} ; [ DW_TAG_pointer_type ]
!1359 = metadata !{i32 786451, null, metadata !"pthread_mutex", metadata !1360, i32 48, i32 0, i32 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ]
!1360 = metadata !{i32 786473, metadata !"/usr/include/sys/_pthreadtypes.h", metadata !"/home/capsicum/wvd/gzip-1.2.4", null} ; [ DW_TAG_file_type ]
!1361 = metadata !{i32 786445, metadata !1309, metadata !"_fl_owner", metadata !61, i32 143, i64 64, i64 64, i64 1280, i32 0, metadata !1362} ; [ DW_TAG_member ]
!1362 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1363} ; [ DW_TAG_pointer_type ]
!1363 = metadata !{i32 786451, null, metadata !"pthread", metadata !1360, i32 44, i32 0, i32 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ]
!1364 = metadata !{i32 786445, metadata !1309, metadata !"_fl_count", metadata !61, i32 144, i64 32, i64 32, i64 1344, i32 0, metadata !9} ; [ DW_TAG_member ]
!1365 = metadata !{i32 786445, metadata !1309, metadata !"_orientation", metadata !61, i32 145, i64 32, i64 32, i64 1376, i32 0, metadata !9} ; [ DW_TAG_member ]
!1366 = metadata !{i32 786445, metadata !1309, metadata !"_mbstate", metadata !61, i32 146, i64 1024, i64 64, i64 1408, i32 0, metadata !1367} ; [ DW_TAG_member ]
!1367 = metadata !{i32 786454, null, metadata !"__mbstate_t", metadata !61, i32 104, i64 0, i64 0, i64 0, i32 0, metadata !1368} ; [ DW_TAG_typedef ]
!1368 = metadata !{i32 786455, null, metadata !"", metadata !1369, i32 101, i64 1024, i64 64, i64 0, i32 0, null, metadata !1370, i32 0, i32 0} ; [ DW_TAG_union_type ]
!1369 = metadata !{i32 786473, metadata !"/usr/include/sys/_types.h", metadata !"/home/capsicum/wvd/gzip-1.2.4", null} ; [ DW_TAG_file_type ]
!1370 = metadata !{metadata !1371, metadata !1375}
!1371 = metadata !{i32 786445, metadata !1368, metadata !"__mbstate8", metadata !1369, i32 102, i64 1024, i64 8, i64 0, i32 0, metadata !1372} ; [ DW_TAG_member ]
!1372 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 1024, i64 8, i32 0, i32 0, metadata !12, metadata !1373, i32 0, i32 0} ; [ DW_TAG_array_type ]
!1373 = metadata !{metadata !1374}
!1374 = metadata !{i32 786465, i64 0, i64 127}    ; [ DW_TAG_subrange_type ]
!1375 = metadata !{i32 786445, metadata !1368, metadata !"_mbstateL", metadata !1369, i32 103, i64 64, i64 64, i64 0, i32 0, metadata !60} ; [ DW_TAG_member ]
!1376 = metadata !{i32 34, i32 9, metadata !1306, null}
!1377 = metadata !{i32 34, i32 16, metadata !1306, null}
!1378 = metadata !{i32 35, i32 3, metadata !1306, null}
!1379 = metadata !{i32 786688, metadata !1380, metadata !"c", metadata !230, i32 36, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1380 = metadata !{i32 786443, metadata !1306, i32 35, i32 13, metadata !230, i32 1} ; [ DW_TAG_lexical_block ]
!1381 = metadata !{i32 36, i32 10, metadata !1380, null}
!1382 = metadata !{i32 37, i32 5, metadata !1380, null}
!1383 = metadata !{i32 38, i32 5, metadata !1380, null}
!1384 = metadata !{i32 39, i32 7, metadata !1385, null}
!1385 = metadata !{i32 786443, metadata !1380, i32 38, i32 23, metadata !230, i32 2} ; [ DW_TAG_lexical_block ]
!1386 = metadata !{i32 40, i32 7, metadata !1385, null}
!1387 = metadata !{i32 41, i32 5, metadata !1385, null}
!1388 = metadata !{i32 42, i32 5, metadata !1380, null}
!1389 = metadata !{i32 43, i32 5, metadata !1380, null}
!1390 = metadata !{i32 44, i32 5, metadata !1380, null}
!1391 = metadata !{i32 47, i32 3, metadata !1306, null}
!1392 = metadata !{i32 786689, metadata !231, metadata !"in", metadata !230, i32 16777272, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1393 = metadata !{i32 56, i32 9, metadata !231, null}
!1394 = metadata !{i32 786689, metadata !231, metadata !"out", metadata !230, i32 33554488, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1395 = metadata !{i32 56, i32 13, metadata !231, null}
!1396 = metadata !{i32 58, i32 2, metadata !1397, null}
!1397 = metadata !{i32 786443, metadata !231, i32 57, i32 1, metadata !230, i32 3} ; [ DW_TAG_lexical_block ]
!1398 = metadata !{i32 59, i32 2, metadata !1397, null}
!1399 = metadata !{i32 60, i32 2, metadata !1397, null}
!1400 = metadata !{i32 786688, metadata !1397, metadata !"flags", metadata !230, i32 62, metadata !1401, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1401 = metadata !{i32 786454, null, metadata !"uch", metadata !230, i32 44, i64 0, i64 0, i64 0, i32 0, metadata !163} ; [ DW_TAG_typedef ]
!1402 = metadata !{i32 62, i32 10, metadata !1397, null}
!1403 = metadata !{i32 62, i32 19, metadata !1397, null}
!1404 = metadata !{i32 786688, metadata !1397, metadata !"attr", metadata !230, i32 63, metadata !1405, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1405 = metadata !{i32 786454, null, metadata !"ush", metadata !230, i32 45, i64 0, i64 0, i64 0, i32 0, metadata !42} ; [ DW_TAG_typedef ]
!1406 = metadata !{i32 63, i32 10, metadata !1397, null}
!1407 = metadata !{i32 63, i32 18, metadata !1397, null}
!1408 = metadata !{i32 786688, metadata !1397, metadata !"deflate_flags", metadata !230, i32 64, metadata !1405, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1409 = metadata !{i32 64, i32 10, metadata !1397, null}
!1410 = metadata !{i32 64, i32 27, metadata !1397, null}
!1411 = metadata !{i32 66, i32 5, metadata !1397, null}
!1412 = metadata !{i32 67, i32 5, metadata !1397, null}
!1413 = metadata !{i32 68, i32 5, metadata !1397, null}
!1414 = metadata !{i32 72, i32 5, metadata !1397, null}
!1415 = metadata !{i32 73, i32 5, metadata !1416, null}
!1416 = metadata !{i32 786443, metadata !1397, i32 73, i32 5, metadata !230, i32 4} ; [ DW_TAG_lexical_block ]
!1417 = metadata !{i32 74, i32 5, metadata !1418, null}
!1418 = metadata !{i32 786443, metadata !1397, i32 74, i32 5, metadata !230, i32 5} ; [ DW_TAG_lexical_block ]
!1419 = metadata !{i32 75, i32 5, metadata !1420, null}
!1420 = metadata !{i32 786443, metadata !1397, i32 75, i32 5, metadata !230, i32 6} ; [ DW_TAG_lexical_block ]
!1421 = metadata !{i32 77, i32 5, metadata !1397, null}
!1422 = metadata !{i32 78, i32 2, metadata !1423, null}
!1423 = metadata !{i32 786443, metadata !1397, i32 77, i32 25, metadata !230, i32 7} ; [ DW_TAG_lexical_block ]
!1424 = metadata !{i32 79, i32 5, metadata !1423, null}
!1425 = metadata !{i32 80, i32 5, metadata !1426, null}
!1426 = metadata !{i32 786443, metadata !1397, i32 80, i32 5, metadata !230, i32 8} ; [ DW_TAG_lexical_block ]
!1427 = metadata !{i32 81, i32 5, metadata !1428, null}
!1428 = metadata !{i32 786443, metadata !1429, i32 81, i32 5, metadata !230, i32 10} ; [ DW_TAG_lexical_block ]
!1429 = metadata !{i32 786443, metadata !1397, i32 81, i32 5, metadata !230, i32 9} ; [ DW_TAG_lexical_block ]
!1430 = metadata !{i32 81, i32 5, metadata !1431, null}
!1431 = metadata !{i32 786443, metadata !1428, i32 81, i32 5, metadata !230, i32 11} ; [ DW_TAG_lexical_block ]
!1432 = metadata !{i32 81, i32 5, metadata !1433, null}
!1433 = metadata !{i32 786443, metadata !1434, i32 81, i32 5, metadata !230, i32 13} ; [ DW_TAG_lexical_block ]
!1434 = metadata !{i32 786443, metadata !1428, i32 81, i32 5, metadata !230, i32 12} ; [ DW_TAG_lexical_block ]
!1435 = metadata !{i32 81, i32 5, metadata !1436, null}
!1436 = metadata !{i32 786443, metadata !1434, i32 81, i32 5, metadata !230, i32 14} ; [ DW_TAG_lexical_block ]
!1437 = metadata !{i32 81, i32 5, metadata !1438, null}
!1438 = metadata !{i32 786443, metadata !1429, i32 81, i32 5, metadata !230, i32 15} ; [ DW_TAG_lexical_block ]
!1439 = metadata !{i32 81, i32 5, metadata !1440, null}
!1440 = metadata !{i32 786443, metadata !1438, i32 81, i32 5, metadata !230, i32 16} ; [ DW_TAG_lexical_block ]
!1441 = metadata !{i32 81, i32 5, metadata !1442, null}
!1442 = metadata !{i32 786443, metadata !1443, i32 81, i32 5, metadata !230, i32 18} ; [ DW_TAG_lexical_block ]
!1443 = metadata !{i32 786443, metadata !1438, i32 81, i32 5, metadata !230, i32 17} ; [ DW_TAG_lexical_block ]
!1444 = metadata !{i32 81, i32 5, metadata !1445, null}
!1445 = metadata !{i32 786443, metadata !1443, i32 81, i32 5, metadata !230, i32 19} ; [ DW_TAG_lexical_block ]
!1446 = metadata !{i32 84, i32 11, metadata !1397, null}
!1447 = metadata !{i32 86, i32 5, metadata !1397, null}
!1448 = metadata !{i32 87, i32 5, metadata !1397, null}
!1449 = metadata !{i32 88, i32 5, metadata !1397, null}
!1450 = metadata !{i32 90, i32 5, metadata !1451, null}
!1451 = metadata !{i32 786443, metadata !1397, i32 90, i32 5, metadata !230, i32 20} ; [ DW_TAG_lexical_block ]
!1452 = metadata !{i32 91, i32 5, metadata !1453, null}
!1453 = metadata !{i32 786443, metadata !1397, i32 91, i32 5, metadata !230, i32 21} ; [ DW_TAG_lexical_block ]
!1454 = metadata !{i32 93, i32 5, metadata !1397, null}
!1455 = metadata !{i32 786688, metadata !1456, metadata !"p", metadata !230, i32 94, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1456 = metadata !{i32 786443, metadata !1397, i32 93, i32 25, metadata !230, i32 22} ; [ DW_TAG_lexical_block ]
!1457 = metadata !{i32 94, i32 8, metadata !1456, null}
!1458 = metadata !{i32 94, i32 12, metadata !1456, null}
!1459 = metadata !{i32 95, i32 2, metadata !1456, null}
!1460 = metadata !{i32 96, i32 6, metadata !1461, null}
!1461 = metadata !{i32 786443, metadata !1462, i32 96, i32 6, metadata !230, i32 24} ; [ DW_TAG_lexical_block ]
!1462 = metadata !{i32 786443, metadata !1456, i32 95, i32 5, metadata !230, i32 23} ; [ DW_TAG_lexical_block ]
!1463 = metadata !{i32 97, i32 2, metadata !1462, null}
!1464 = metadata !{i32 98, i32 5, metadata !1456, null}
!1465 = metadata !{i32 99, i32 5, metadata !1397, null}
!1466 = metadata !{i32 101, i32 11, metadata !1397, null}
!1467 = metadata !{i32 115, i32 5, metadata !1468, null}
!1468 = metadata !{i32 786443, metadata !1469, i32 115, i32 5, metadata !230, i32 26} ; [ DW_TAG_lexical_block ]
!1469 = metadata !{i32 786443, metadata !1397, i32 115, i32 5, metadata !230, i32 25} ; [ DW_TAG_lexical_block ]
!1470 = metadata !{i32 115, i32 5, metadata !1471, null}
!1471 = metadata !{i32 786443, metadata !1468, i32 115, i32 5, metadata !230, i32 27} ; [ DW_TAG_lexical_block ]
!1472 = metadata !{i32 115, i32 5, metadata !1473, null}
!1473 = metadata !{i32 786443, metadata !1474, i32 115, i32 5, metadata !230, i32 29} ; [ DW_TAG_lexical_block ]
!1474 = metadata !{i32 786443, metadata !1468, i32 115, i32 5, metadata !230, i32 28} ; [ DW_TAG_lexical_block ]
!1475 = metadata !{i32 115, i32 5, metadata !1476, null}
!1476 = metadata !{i32 786443, metadata !1474, i32 115, i32 5, metadata !230, i32 30} ; [ DW_TAG_lexical_block ]
!1477 = metadata !{i32 115, i32 5, metadata !1478, null}
!1478 = metadata !{i32 786443, metadata !1469, i32 115, i32 5, metadata !230, i32 31} ; [ DW_TAG_lexical_block ]
!1479 = metadata !{i32 115, i32 5, metadata !1480, null}
!1480 = metadata !{i32 786443, metadata !1478, i32 115, i32 5, metadata !230, i32 32} ; [ DW_TAG_lexical_block ]
!1481 = metadata !{i32 115, i32 5, metadata !1482, null}
!1482 = metadata !{i32 786443, metadata !1483, i32 115, i32 5, metadata !230, i32 34} ; [ DW_TAG_lexical_block ]
!1483 = metadata !{i32 786443, metadata !1478, i32 115, i32 5, metadata !230, i32 33} ; [ DW_TAG_lexical_block ]
!1484 = metadata !{i32 115, i32 5, metadata !1485, null}
!1485 = metadata !{i32 786443, metadata !1483, i32 115, i32 5, metadata !230, i32 35} ; [ DW_TAG_lexical_block ]
!1486 = metadata !{i32 116, i32 5, metadata !1487, null}
!1487 = metadata !{i32 786443, metadata !1488, i32 116, i32 5, metadata !230, i32 37} ; [ DW_TAG_lexical_block ]
!1488 = metadata !{i32 786443, metadata !1397, i32 116, i32 5, metadata !230, i32 36} ; [ DW_TAG_lexical_block ]
!1489 = metadata !{i32 116, i32 5, metadata !1490, null}
!1490 = metadata !{i32 786443, metadata !1487, i32 116, i32 5, metadata !230, i32 38} ; [ DW_TAG_lexical_block ]
!1491 = metadata !{i32 116, i32 5, metadata !1492, null}
!1492 = metadata !{i32 786443, metadata !1493, i32 116, i32 5, metadata !230, i32 40} ; [ DW_TAG_lexical_block ]
!1493 = metadata !{i32 786443, metadata !1487, i32 116, i32 5, metadata !230, i32 39} ; [ DW_TAG_lexical_block ]
!1494 = metadata !{i32 116, i32 5, metadata !1495, null}
!1495 = metadata !{i32 786443, metadata !1493, i32 116, i32 5, metadata !230, i32 41} ; [ DW_TAG_lexical_block ]
!1496 = metadata !{i32 116, i32 5, metadata !1497, null}
!1497 = metadata !{i32 786443, metadata !1488, i32 116, i32 5, metadata !230, i32 42} ; [ DW_TAG_lexical_block ]
!1498 = metadata !{i32 116, i32 5, metadata !1499, null}
!1499 = metadata !{i32 786443, metadata !1497, i32 116, i32 5, metadata !230, i32 43} ; [ DW_TAG_lexical_block ]
!1500 = metadata !{i32 116, i32 5, metadata !1501, null}
!1501 = metadata !{i32 786443, metadata !1502, i32 116, i32 5, metadata !230, i32 45} ; [ DW_TAG_lexical_block ]
!1502 = metadata !{i32 786443, metadata !1497, i32 116, i32 5, metadata !230, i32 44} ; [ DW_TAG_lexical_block ]
!1503 = metadata !{i32 116, i32 5, metadata !1504, null}
!1504 = metadata !{i32 786443, metadata !1502, i32 116, i32 5, metadata !230, i32 46} ; [ DW_TAG_lexical_block ]
!1505 = metadata !{i32 117, i32 5, metadata !1397, null}
!1506 = metadata !{i32 119, i32 5, metadata !1397, null}
!1507 = metadata !{i32 120, i32 2, metadata !1397, null}
!1508 = metadata !{i32 121, i32 5, metadata !1397, null}
!1509 = metadata !{i32 786689, metadata !232, metadata !"buf", metadata !230, i32 16777347, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1510 = metadata !{i32 131, i32 11, metadata !232, null}
!1511 = metadata !{i32 786689, metadata !232, metadata !"size", metadata !230, i32 33554564, metadata !34, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1512 = metadata !{i32 132, i32 14, metadata !232, null}
!1513 = metadata !{i32 786688, metadata !1514, metadata !"len", metadata !230, i32 134, metadata !34, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1514 = metadata !{i32 786443, metadata !232, i32 133, i32 1, metadata !230, i32 47} ; [ DW_TAG_lexical_block ]
!1515 = metadata !{i32 134, i32 14, metadata !1514, null}
!1516 = metadata !{i32 138, i32 11, metadata !1514, null}
!1517 = metadata !{i32 139, i32 5, metadata !1514, null}
!1518 = metadata !{i32 139, i32 44, metadata !1514, null}
!1519 = metadata !{i32 141, i32 11, metadata !1514, null}
!1520 = metadata !{i32 142, i32 5, metadata !1514, null}
!1521 = metadata !{i32 143, i32 5, metadata !1514, null}
!1522 = metadata !{i32 144, i32 1, metadata !1514, null}

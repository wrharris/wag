; ModuleID = 'wget.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-freebsd9.0"

%struct.cookie_jar = type opaque
%struct.anon = type { i32, i8*, i32, i8, i8, %struct.ntlmdata }
%struct.ntlmdata = type { i32, [8 x i8] }
%struct.iri = type { i8*, i8*, i8*, i8 }
%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, i8*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64, %struct.pthread_mutex*, %struct.pthread*, i32, i32, %union.__mbstate_t }
%struct.__sbuf = type { i8*, i32 }
%struct.pthread_mutex = type opaque
%struct.pthread = type opaque
%union.__mbstate_t = type { i64, [120 x i8] }
%struct.hash_table = type opaque
%struct.anon.0 = type { i8*, i8** }
%struct.option = type { i8*, i32, i32*, i32 }
%struct.options = type { i32, i8, i32, i8, i8, i8, i8, i8, i32, i8, i8, i32, i8, i8, i32, i8, i8, i8, i8*, i8*, i8*, i8, i8*, i8, i8**, i8**, i8**, i8**, i8, i8**, i8**, i8, i8**, i8**, i8, i8, i8*, i8*, i8*, i8, i8, i8*, i8*, i8, i8, i8, i8*, i8*, i8**, i8, i8, i8, i8*, i8*, i8*, i8**, i8*, i8*, i8*, i8*, double, double, double, i8, double, double, i8, i64, i64, i8, i8, i8, i8, i8, i8, i8*, i8*, i8, i8, i8, i8*, i64, i32, i32, i8, i8, i8, i8*, i32, i8, i8*, i8*, i32, i32, i8*, i8*, i8*, i8*, i8, i8*, i8*, i8, i8*, i8*, i32, i8, i8, i32, i8, i8, i8, i8, i32, i8, i8, i8, i8*, i8* }
%struct.param_token = type { i8*, i8* }
%struct.url = type { i8*, i32, i8*, i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8* }
%struct.http_stat = type { i64, i64, i64, i32, i8*, i8*, i8*, i8*, i32, i8*, i64, double, i8*, i8*, i8, i8, i8*, i64, i64 }
%struct.stat = type <{ i32, i32, i16, i16, i32, i32, i32, %struct.timespec, %struct.timespec, %struct.timespec, i64, i64, i32, i32, i32, i32, %struct.timespec }>
%struct.timespec = type { i64, i64 }
%struct.request = type { i8*, i8*, %struct.request_header*, i32, i32 }
%struct.request_header = type { i8*, i8*, i32 }
%struct.response = type { i8*, i8** }
%struct.tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i8* }
%struct.ip_address = type { i32, %union.anon, i32 }
%union.anon = type { %struct.in6_addr }
%struct.in6_addr = type { %union.anon.1 }
%union.anon.1 = type { [4 x i32] }
%struct.address_list = type opaque
%struct.gen_md5_context = type opaque
%struct.cmdline_option = type { i8*, i8, i32, i8*, i32 }

@__func__.http_loop = private unnamed_addr constant [10 x i8] c"http_loop\00", align 1
@.str = private unnamed_addr constant [7 x i8] c"http.c\00", align 1
@.str1 = private unnamed_addr constant [42 x i8] c"local_file == NULL || *local_file == NULL\00", align 1
@.str2 = private unnamed_addr constant [43 x i8] c"Warning: wildcards not supported in HTTP.\0A\00", align 1
@.str3 = private unnamed_addr constant [41 x i8] c"File %s already there; not retrieving.\0A\0A\00", align 1
@.str4 = private unnamed_addr constant [51 x i8] c"Spider mode enabled. Check if remote file exists.\0A\00", align 1
@.str5 = private unnamed_addr constant [10 x i8] c"(try:%2d)\00", align 1
@.str6 = private unnamed_addr constant [16 x i8] c"--%s--  %s  %s\0A\00", align 1
@.str7 = private unnamed_addr constant [12 x i8] c"--%s--  %s\0A\00", align 1
@.str8 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str9 = private unnamed_addr constant [26 x i8] c"Cannot write to %s (%s).\0A\00", align 1
@.str10 = private unnamed_addr constant [37 x i8] c"Unable to establish SSL connection.\0A\00", align 1
@.str11 = private unnamed_addr constant [43 x i8] c"ERROR: Redirection (%d) without location.\0A\00", align 1
@.str12 = private unnamed_addr constant [5 x i8] c"%s:\0A\00", align 1
@.str13 = private unnamed_addr constant [46 x i8] c"Remote file does not exist -- broken link!!!\0A\00", align 1
@.str14 = private unnamed_addr constant [18 x i8] c"%s ERROR %d: %s.\0A\00", align 1
@.str15 = private unnamed_addr constant [57 x i8] c"Last-modified header missing -- time-stamps turned off.\0A\00", align 1
@.str16 = private unnamed_addr constant [53 x i8] c"Last-modified header invalid -- time-stamp ignored.\0A\00", align 1
@.str17 = private unnamed_addr constant [61 x i8] c"Server file no newer than local file %s -- not retrieving.\0A\0A\00", align 1
@.str18 = private unnamed_addr constant [50 x i8] c"The sizes do not match (local %s) -- retrieving.\0A\00", align 1
@.str19 = private unnamed_addr constant [35 x i8] c"Remote file is newer, retrieving.\0A\00", align 1
@.str20 = private unnamed_addr constant [79 x i8] c"Remote file exists and could contain links to other resources -- retrieving.\0A\0A\00", align 1
@.str21 = private unnamed_addr constant [70 x i8] c"Remote file exists but does not contain any link -- not retrieving.\0A\0A\00", align 1
@.str22 = private unnamed_addr constant [99 x i8] c"Remote file exists and could contain further links,\0Abut recursion is disabled -- not retrieving.\0A\0A\00", align 1
@.str23 = private unnamed_addr constant [22 x i8] c"Remote file exists.\0A\0A\00", align 1
@.str24 = private unnamed_addr constant [19 x i8] c"%s URL: %s %2d %s\0A\00", align 1
@.str25 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@total_download_time = external global double
@.str26 = private unnamed_addr constant [40 x i8] c"%s (%s) - written to stdout %s[%s/%s]\0A\0A\00", align 1
@.str27 = private unnamed_addr constant [29 x i8] c"%s (%s) - %s saved [%s/%s]\0A\0A\00", align 1
@.str28 = private unnamed_addr constant [32 x i8] c"%s URL:%s [%s/%s] -> \22%s\22 [%d]\0A\00", align 1
@total_downloaded_bytes = external global i64
@.str29 = private unnamed_addr constant [37 x i8] c"%s (%s) - written to stdout %s[%s]\0A\0A\00", align 1
@.str30 = private unnamed_addr constant [26 x i8] c"%s (%s) - %s saved [%s]\0A\0A\00", align 1
@.str31 = private unnamed_addr constant [29 x i8] c"%s URL:%s [%s] -> \22%s\22 [%d]\0A\00", align 1
@.str32 = private unnamed_addr constant [41 x i8] c"%s (%s) - Connection closed at byte %s. \00", align 1
@.str33 = private unnamed_addr constant [38 x i8] c"%s (%s) - Read error at byte %s (%s).\00", align 1
@.str34 = private unnamed_addr constant [42 x i8] c"%s (%s) - Read error at byte %s/%s (%s). \00", align 1
@http_atotm.time_formats = internal unnamed_addr constant [4 x i8*] [i8* getelementptr inbounds ([16 x i8]* @.str35, i32 0, i32 0), i8* getelementptr inbounds ([16 x i8]* @.str36, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8]* @.str37, i32 0, i32 0), i8* getelementptr inbounds ([16 x i8]* @.str38, i32 0, i32 0)], align 16
@.str35 = private unnamed_addr constant [16 x i8] c"%a, %d %b %Y %T\00", align 1
@.str36 = private unnamed_addr constant [16 x i8] c"%A, %d-%b-%y %T\00", align 1
@.str37 = private unnamed_addr constant [15 x i8] c"%a %b %d %T %Y\00", align 1
@.str38 = private unnamed_addr constant [16 x i8] c"%a, %d-%b-%Y %T\00", align 1
@.str39 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@wget_cookie_jar = internal unnamed_addr global %struct.cookie_jar* null, align 8
@pconn = internal global %struct.anon zeroinitializer, align 8
@dummy_iri = common global %struct.iri zeroinitializer, align 8
@cookies_loaded_p.b = internal unnamed_addr global i1 false
@.str40 = private unnamed_addr constant [42 x i8] c"Disabling SSL due to encountered errors.\0A\00", align 1
@.str41 = private unnamed_addr constant [4 x i8] c"GET\00", align 1
@.str42 = private unnamed_addr constant [5 x i8] c"HEAD\00", align 1
@.str43 = private unnamed_addr constant [5 x i8] c"POST\00", align 1
@.str44 = private unnamed_addr constant [8 x i8] c"Referer\00", align 1
@.str45 = private unnamed_addr constant [7 x i8] c"Pragma\00", align 1
@.str46 = private unnamed_addr constant [9 x i8] c"no-cache\00", align 1
@.str47 = private unnamed_addr constant [6 x i8] c"Range\00", align 1
@.str48 = private unnamed_addr constant [10 x i8] c"bytes=%s-\00", align 1
@.str49 = private unnamed_addr constant [11 x i8] c"User-Agent\00", align 1
@.str50 = private unnamed_addr constant [13 x i8] c"Wget/%s (%s)\00", align 1
@version_string = external global i8*
@.str51 = private unnamed_addr constant [11 x i8] c"freebsd9.0\00", align 1
@.str52 = private unnamed_addr constant [7 x i8] c"Accept\00", align 1
@.str53 = private unnamed_addr constant [4 x i8] c"*/*\00", align 1
@gethttp.hfmt = internal unnamed_addr constant [2 x [2 x i8*]] [[2 x i8*] [i8* getelementptr inbounds ([3 x i8]* @.str54, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str55, i32 0, i32 0)], [2 x i8*] [i8* getelementptr inbounds ([6 x i8]* @.str56, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8]* @.str57, i32 0, i32 0)]], align 16
@.str54 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str55 = private unnamed_addr constant [5 x i8] c"[%s]\00", align 1
@.str56 = private unnamed_addr constant [6 x i8] c"%s:%d\00", align 1
@.str57 = private unnamed_addr constant [8 x i8] c"[%s]:%d\00", align 1
@.str58 = private unnamed_addr constant [5 x i8] c"Host\00", align 1
@.str59 = private unnamed_addr constant [11 x i8] c"Connection\00", align 1
@.str60 = private unnamed_addr constant [11 x i8] c"Keep-Alive\00", align 1
@.str61 = private unnamed_addr constant [7 x i8] c"Cookie\00", align 1
@.str62 = private unnamed_addr constant [13 x i8] c"Content-Type\00", align 1
@.str63 = private unnamed_addr constant [34 x i8] c"application/x-www-form-urlencoded\00", align 1
@.str64 = private unnamed_addr constant [31 x i8] c"POST data file %s missing: %s\0A\00", align 1
@.str65 = private unnamed_addr constant [15 x i8] c"Content-Length\00", align 1
@.str66 = private unnamed_addr constant [20 x i8] c"Proxy-Authorization\00", align 1
@.str67 = private unnamed_addr constant [39 x i8] c"Reusing existing connection to %s:%d.\0A\00", align 1
@.str68 = private unnamed_addr constant [16 x i8] c"Reusing fd %d.\0A\00", align 1
@.str69 = private unnamed_addr constant [14 x i8] c"Authorization\00", align 1
@.str70 = private unnamed_addr constant [39 x i8] c"%s: unable to resolve host address %s\0A\00", align 1
@.str71 = private unnamed_addr constant [8 x i8] c"CONNECT\00", align 1
@pconn_active.b = internal unnamed_addr global i1 false
@.str72 = private unnamed_addr constant [35 x i8] c"Failed reading proxy response: %s\0A\00", align 1
@.str73 = private unnamed_addr constant [28 x i8] c"proxy responded with: [%s]\0A\00", align 1
@.str74 = private unnamed_addr constant [27 x i8] c"Proxy tunneling failed: %s\00", align 1
@.str75 = private unnamed_addr constant [2 x i8] c"?\00", align 1
@.str76 = private unnamed_addr constant [17 x i8] c"[POST data: %s]\0A\00", align 1
@.str77 = private unnamed_addr constant [39 x i8] c"%s request sent, awaiting response... \00", align 1
@.str78 = private unnamed_addr constant [6 x i8] c"Proxy\00", align 1
@.str79 = private unnamed_addr constant [5 x i8] c"HTTP\00", align 1
@.str80 = private unnamed_addr constant [19 x i8] c"No data received.\0A\00", align 1
@.str81 = private unnamed_addr constant [29 x i8] c"Read error (%s) in headers.\0A\00", align 1
@.str82 = private unnamed_addr constant [44 x i8] c"\0A---response begin---\0A%s---response end---\0A\00", align 1
@.str83 = private unnamed_addr constant [8 x i8] c"%2d %s\0A\00", align 1
@.str84 = private unnamed_addr constant [3 x i8] c"  \00", align 1
@__func__.gethttp = private unnamed_addr constant [8 x i8] c"gethttp\00", align 1
@.str85 = private unnamed_addr constant [24 x i8] c"wget_cookie_jar != NULL\00", align 1
@.str86 = private unnamed_addr constant [11 x i8] c"Set-Cookie\00", align 1
@.str87 = private unnamed_addr constant [17 x i8] c"WWW-Authenticate\00", align 1
@.str88 = private unnamed_addr constant [32 x i8] c"Unknown authentication scheme.\0A\00", align 1
@.str89 = private unnamed_addr constant [6 x i8] c"Basic\00", align 1
@.str90 = private unnamed_addr constant [5 x i8] c"NTLM\00", align 1
@.str91 = private unnamed_addr constant [23 x i8] c"Authorization failed.\0A\00", align 1
@.str92 = private unnamed_addr constant [20 x i8] c"Content-Disposition\00", align 1
@.str93 = private unnamed_addr constant [6 x i8] c".orig\00", align 1
@.str94 = private unnamed_addr constant [22 x i8] c"Malformed status line\00", align 1
@.str95 = private unnamed_addr constant [17 x i8] c"(no description)\00", align 1
@.str96 = private unnamed_addr constant [9 x i8] c"Location\00", align 1
@.str97 = private unnamed_addr constant [14 x i8] c"Last-Modified\00", align 1
@.str98 = private unnamed_addr constant [14 x i8] c"Content-Range\00", align 1
@.str99 = private unnamed_addr constant [16 x i8] c"Location: %s%s\0A\00", align 1
@.str100 = private unnamed_addr constant [12 x i8] c"unspecified\00", align 1
@.str101 = private unnamed_addr constant [13 x i8] c" [following]\00", align 1
@.str102 = private unnamed_addr constant [10 x i8] c"text/html\00", align 1
@.str103 = private unnamed_addr constant [22 x i8] c"application/xhtml+xml\00", align 1
@.str104 = private unnamed_addr constant [9 x i8] c"text/css\00", align 1
@.str105 = private unnamed_addr constant [6 x i8] c".html\00", align 1
@.str106 = private unnamed_addr constant [5 x i8] c".css\00", align 1
@.str107 = private unnamed_addr constant [59 x i8] c"\0A    The file is already fully retrieved; nothing to do.\0A\0A\00", align 1
@.str108 = private unnamed_addr constant [9 x i8] c"Length: \00", align 1
@.str109 = private unnamed_addr constant [6 x i8] c" (%s)\00", align 1
@.str110 = private unnamed_addr constant [20 x i8] c", %s (%s) remaining\00", align 1
@.str111 = private unnamed_addr constant [15 x i8] c", %s remaining\00", align 1
@.str112 = private unnamed_addr constant [8 x i8] c"ignored\00", align 1
@.str113 = private unnamed_addr constant [7 x i8] c" [%s]\0A\00", align 1
@output_stream = external global %struct.__sFILE*
@.str114 = private unnamed_addr constant [3 x i8] c"ab\00", align 1
@.str115 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str116 = private unnamed_addr constant [31 x i8] c"%s has sprung into existence.\0A\00", align 1
@.str117 = private unnamed_addr constant [8 x i8] c"%s: %s\0A\00", align 1
@.str118 = private unnamed_addr constant [15 x i8] c"Saving to: %s\0A\00", align 1
@.str119 = private unnamed_addr constant [7 x i8] c"STDOUT\00", align 1
@.str120 = private unnamed_addr constant [6 x i8] c".%d%s\00", align 1
@.str121 = private unnamed_addr constant [6 x i8] c"bytes\00", align 1
@.str122 = private unnamed_addr constant [9 x i8] c"filename\00", align 1
@basic_authed_hosts = internal unnamed_addr global %struct.hash_table* null, align 8
@.str123 = private unnamed_addr constant [37 x i8] c"Inserted %s into basic_authed_hosts\0A\00", align 1
@digest_authentication_encode.realm = internal global i8* null, align 8
@digest_authentication_encode.opaque = internal global i8* null, align 8
@digest_authentication_encode.nonce = internal global i8* null, align 8
@digest_authentication_encode.options = internal unnamed_addr constant [3 x %struct.anon.0] [%struct.anon.0 { i8* getelementptr inbounds ([6 x i8]* @.str124, i32 0, i32 0), i8** @digest_authentication_encode.realm }, %struct.anon.0 { i8* getelementptr inbounds ([7 x i8]* @.str125, i32 0, i32 0), i8** @digest_authentication_encode.opaque }, %struct.anon.0 { i8* getelementptr inbounds ([6 x i8]* @.str126, i32 0, i32 0), i8** @digest_authentication_encode.nonce }], align 16
@.str124 = private unnamed_addr constant [6 x i8] c"realm\00", align 1
@.str125 = private unnamed_addr constant [7 x i8] c"opaque\00", align 1
@.str126 = private unnamed_addr constant [6 x i8] c"nonce\00", align 1
@.str127 = private unnamed_addr constant [2 x i8] c":\00", align 1
@.str128 = private unnamed_addr constant [70 x i8] c"Digest username=\22%s\22, realm=\22%s\22, nonce=\22%s\22, uri=\22%s\22, response=\22%s\22\00", align 1
@.str129 = private unnamed_addr constant [11 x i8] c", opaque=\22\00", align 1
@.str130 = private unnamed_addr constant [2 x i8] c"\22\00", align 1
@.str131 = private unnamed_addr constant [17 x i8] c"0123456789abcdef\00", align 1
@.str132 = private unnamed_addr constant [7 x i8] c"Digest\00", align 1
@__func__.skip_short_body = private unnamed_addr constant [16 x i8] c"skip_short_body\00", align 1
@.str133 = private unnamed_addr constant [14 x i8] c"contlen != -1\00", align 1
@.str134 = private unnamed_addr constant [29 x i8] c"Skipping %s bytes of body: [\00", align 1
@.str135 = private unnamed_addr constant [18 x i8] c"] aborting (%s).\0A\00", align 1
@.str136 = private unnamed_addr constant [13 x i8] c"EOF received\00", align 1
@.str137 = private unnamed_addr constant [5 x i8] c"%.*s\00", align 1
@.str138 = private unnamed_addr constant [9 x i8] c"] done.\0A\00", align 1
@.str139 = private unnamed_addr constant [44 x i8] c"Registered socket %d for persistent reuse.\0A\00", align 1
@.str140 = private unnamed_addr constant [6 x i8] c"%s%s\0A\00", align 1
@post_file.chunk = internal global [8192 x i8] zeroinitializer, align 16
@.str141 = private unnamed_addr constant [27 x i8] c"[writing POST file %s ... \00", align 1
@.str142 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@__isthreaded = external global i32
@__func__.post_file = private unnamed_addr constant [10 x i8] c"post_file\00", align 1
@.str143 = private unnamed_addr constant [25 x i8] c"written == promised_size\00", align 1
@.str144 = private unnamed_addr constant [7 x i8] c"done]\0A\00", align 1
@.str145 = private unnamed_addr constant [30 x i8] c"No headers, assuming HTTP/0.9\00", align 1
@.str146 = private unnamed_addr constant [39 x i8] c"Disabling further reuse of socket %d.\0A\00", align 1
@.str147 = private unnamed_addr constant [11 x i8] c"HTTP/1.0\0D\0A\00", align 1
@__func__.request_send = private unnamed_addr constant [13 x i8] c"request_send\00", align 1
@.str148 = private unnamed_addr constant [27 x i8] c"p - request_string == size\00", align 1
@.str149 = private unnamed_addr constant [42 x i8] c"\0A---request begin---\0A%s---request end---\0A\00", align 1
@.str150 = private unnamed_addr constant [34 x i8] c"Failed writing HTTP request: %s.\0A\00", align 1
@.str151 = private unnamed_addr constant [6 x i8] c"%s:%s\00", align 1
@.str152 = private unnamed_addr constant [7 x i8] c"Basic \00", align 1
@.str153 = private unnamed_addr constant [56 x i8] c"Auth-without-challenge set, sending Basic credentials.\0A\00", align 1
@.str154 = private unnamed_addr constant [33 x i8] c"Found %s in basic_authed_hosts.\0A\00", align 1
@.str155 = private unnamed_addr constant [51 x i8] c"Host %s has not issued a general basic challenge.\0A\00", align 1
@numurls = global i32 0, align 4
@glob = common global i32 0, align 4
@program_name = common global i8* null, align 8
@exec_name = common global i8* null, align 8
@short_options = internal global [128 x i8] zeroinitializer, align 16
@long_options = internal global [243 x %struct.option] zeroinitializer, align 16
@.str156 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str1157 = private unnamed_addr constant [35 x i8] c"Try `%s --help' for more options.\0A\00", align 1
@optmap = internal unnamed_addr global [96 x i8] zeroinitializer, align 16
@rpl_optarg = external global i8*
@.str2158 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str3159 = private unnamed_addr constant [2 x i8] c"1\00", align 1
@.str4160 = private unnamed_addr constant [8 x i8] c"logfile\00", align 1
@.str5161 = private unnamed_addr constant [8 x i8] c"verbose\00", align 1
@.str6162 = private unnamed_addr constant [11 x i8] c"addhostdir\00", align 1
@.str7163 = private unnamed_addr constant [10 x i8] c"dirstruct\00", align 1
@.str8164 = private unnamed_addr constant [10 x i8] c"noclobber\00", align 1
@.str9165 = private unnamed_addr constant [9 x i8] c"noparent\00", align 1
@.str10166 = private unnamed_addr constant [30 x i8] c"%s: illegal option -- `-n%c'\0A\00", align 1
@.str11167 = private unnamed_addr constant [14 x i8] c"removelisting\00", align 1
@rpl_optind = external global i32
@opt = common global %struct.options zeroinitializer, align 8
@.str12170 = private unnamed_addr constant [46 x i8] c"Can't be verbose and quiet at the same time.\0A\00", align 1
@.str13171 = private unnamed_addr constant [61 x i8] c"Can't timestamp and not clobber old files at the same time.\0A\00", align 1
@.str14172 = private unnamed_addr constant [52 x i8] c"Cannot specify both --inet4-only and --inet6-only.\0A\00", align 1
@.str15173 = private unnamed_addr constant [121 x i8] c"Cannot specify both -k and -O if multiple URLs are given, or in combination\0Awith -p or -r. See the manual for details.\0A\0A\00", align 1
@__stdoutp = external global %struct.__sFILE*
@.str16174 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str17175 = private unnamed_addr constant [125 x i8] c"WARNING: combining -O with -r or -p will mean that all downloaded content\0Awill be placed in the single file you specified.\0A\0A\00", align 1
@.str18176 = private unnamed_addr constant [89 x i8] c"WARNING: timestamping does nothing in combination with -O. See the manual\0Afor details.\0A\0A\00", align 1
@.str19177 = private unnamed_addr constant [42 x i8] c"File `%s' already there; not retrieving.\0A\00", align 1
@.str20178 = private unnamed_addr constant [52 x i8] c"Cannot specify both --ask-password and --password.\0A\00", align 1
@.str21179 = private unnamed_addr constant [17 x i8] c"%s: missing URL\0A\00", align 1
@.str22180 = private unnamed_addr constant [45 x i8] c"This version does not have support for IRIs\0A\00", align 1
@.str23181 = private unnamed_addr constant [41 x i8] c"DEBUG output created by Wget %s on %s.\0A\0A\00", align 1
@.str24182 = private unnamed_addr constant [11 x i8] c"freebsd9.0\00", align 1
@.str25183 = private unnamed_addr constant [3 x i8] c"ab\00", align 1
@.str26184 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@output_stream_regular = external global i8
@.str27185 = private unnamed_addr constant [9 x i8] c"%s: %s.\0A\00", align 1
@.str28186 = private unnamed_addr constant [48 x i8] c"Removing file due to --delete-after in main():\0A\00", align 1
@.str29187 = private unnamed_addr constant [14 x i8] c"Removing %s.\0A\00", align 1
@.str30188 = private unnamed_addr constant [12 x i8] c"unlink: %s\0A\00", align 1
@.str31189 = private unnamed_addr constant [22 x i8] c"No URLs found in %s.\0A\00", align 1
@.str32190 = private unnamed_addr constant [53 x i8] c"FINISHED --%s--\0ADownloaded: %d files, %s in %s (%s)\0A\00", align 1
@.str33191 = private unnamed_addr constant [32 x i8] c"Download quota of %s EXCEEDED!\0A\00", align 1
@.str34192 = private unnamed_addr constant [7 x i8] c"SIGHUP\00", align 1
@.str35193 = private unnamed_addr constant [8 x i8] c"SIGUSR1\00", align 1
@.str36194 = private unnamed_addr constant [6 x i8] c"WTF?!\00", align 1
@secs_to_human_time.buf = internal global [32 x i8] zeroinitializer, align 16
@.str37195 = private unnamed_addr constant [16 x i8] c"%dd %dh %dm %ds\00", align 1
@.str38196 = private unnamed_addr constant [12 x i8] c"%dh %dm %ds\00", align 1
@.str39197 = private unnamed_addr constant [8 x i8] c"%dm %ds\00", align 1
@.str40198 = private unnamed_addr constant [4 x i8] c"%ss\00", align 1
@.str41199 = private unnamed_addr constant [23 x i8] c"Password for user %s: \00", align 1
@.str42200 = private unnamed_addr constant [11 x i8] c"Password: \00", align 1
@.str43201 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str44202 = private unnamed_addr constant [7 x i8] c"accept\00", align 1
@.str45203 = private unnamed_addr constant [17 x i8] c"adjust-extension\00", align 1
@.str46204 = private unnamed_addr constant [16 x i8] c"adjustextension\00", align 1
@.str47205 = private unnamed_addr constant [14 x i8] c"append-output\00", align 1
@.str48206 = private unnamed_addr constant [13 x i8] c"ask-password\00", align 1
@.str49207 = private unnamed_addr constant [12 x i8] c"askpassword\00", align 1
@.str50208 = private unnamed_addr constant [18 x i8] c"auth-no-challenge\00", align 1
@.str51209 = private unnamed_addr constant [16 x i8] c"authnochallenge\00", align 1
@.str52210 = private unnamed_addr constant [11 x i8] c"background\00", align 1
@.str53211 = private unnamed_addr constant [17 x i8] c"backup-converted\00", align 1
@.str54212 = private unnamed_addr constant [16 x i8] c"backupconverted\00", align 1
@.str55213 = private unnamed_addr constant [8 x i8] c"backups\00", align 1
@.str56214 = private unnamed_addr constant [5 x i8] c"base\00", align 1
@.str57215 = private unnamed_addr constant [13 x i8] c"bind-address\00", align 1
@.str58216 = private unnamed_addr constant [12 x i8] c"bindaddress\00", align 1
@.str59217 = private unnamed_addr constant [15 x i8] c"ca-certificate\00", align 1
@.str60218 = private unnamed_addr constant [14 x i8] c"cacertificate\00", align 1
@.str61219 = private unnamed_addr constant [13 x i8] c"ca-directory\00", align 1
@.str62220 = private unnamed_addr constant [12 x i8] c"cadirectory\00", align 1
@.str63221 = private unnamed_addr constant [6 x i8] c"cache\00", align 1
@.str64222 = private unnamed_addr constant [12 x i8] c"certificate\00", align 1
@.str65223 = private unnamed_addr constant [17 x i8] c"certificate-type\00", align 1
@.str66224 = private unnamed_addr constant [16 x i8] c"certificatetype\00", align 1
@.str67225 = private unnamed_addr constant [18 x i8] c"check-certificate\00", align 1
@.str68226 = private unnamed_addr constant [17 x i8] c"checkcertificate\00", align 1
@.str69227 = private unnamed_addr constant [8 x i8] c"clobber\00", align 1
@.str70228 = private unnamed_addr constant [16 x i8] c"connect-timeout\00", align 1
@.str71229 = private unnamed_addr constant [15 x i8] c"connecttimeout\00", align 1
@.str72230 = private unnamed_addr constant [9 x i8] c"continue\00", align 1
@.str73231 = private unnamed_addr constant [14 x i8] c"convert-links\00", align 1
@.str74232 = private unnamed_addr constant [13 x i8] c"convertlinks\00", align 1
@.str75233 = private unnamed_addr constant [20 x i8] c"content-disposition\00", align 1
@.str76234 = private unnamed_addr constant [19 x i8] c"contentdisposition\00", align 1
@.str77235 = private unnamed_addr constant [8 x i8] c"cookies\00", align 1
@.str78236 = private unnamed_addr constant [9 x i8] c"cut-dirs\00", align 1
@.str79237 = private unnamed_addr constant [8 x i8] c"cutdirs\00", align 1
@.str80238 = private unnamed_addr constant [6 x i8] c"debug\00", align 1
@.str81239 = private unnamed_addr constant [13 x i8] c"default-page\00", align 1
@.str82240 = private unnamed_addr constant [12 x i8] c"defaultpage\00", align 1
@.str83241 = private unnamed_addr constant [13 x i8] c"delete-after\00", align 1
@.str84242 = private unnamed_addr constant [12 x i8] c"deleteafter\00", align 1
@.str85243 = private unnamed_addr constant [12 x i8] c"directories\00", align 1
@.str86244 = private unnamed_addr constant [17 x i8] c"directory-prefix\00", align 1
@.str87245 = private unnamed_addr constant [10 x i8] c"dirprefix\00", align 1
@.str88246 = private unnamed_addr constant [10 x i8] c"dns-cache\00", align 1
@.str89247 = private unnamed_addr constant [9 x i8] c"dnscache\00", align 1
@.str90248 = private unnamed_addr constant [12 x i8] c"dns-timeout\00", align 1
@.str91249 = private unnamed_addr constant [11 x i8] c"dnstimeout\00", align 1
@.str92250 = private unnamed_addr constant [8 x i8] c"domains\00", align 1
@.str93251 = private unnamed_addr constant [20 x i8] c"dont-remove-listing\00", align 1
@.str94252 = private unnamed_addr constant [10 x i8] c"dot-style\00", align 1
@.str95253 = private unnamed_addr constant [9 x i8] c"dotstyle\00", align 1
@.str96254 = private unnamed_addr constant [9 x i8] c"egd-file\00", align 1
@.str97255 = private unnamed_addr constant [8 x i8] c"egdfile\00", align 1
@.str98256 = private unnamed_addr constant [20 x i8] c"exclude-directories\00", align 1
@.str99257 = private unnamed_addr constant [19 x i8] c"excludedirectories\00", align 1
@.str100258 = private unnamed_addr constant [16 x i8] c"exclude-domains\00", align 1
@.str101259 = private unnamed_addr constant [15 x i8] c"excludedomains\00", align 1
@.str102260 = private unnamed_addr constant [8 x i8] c"execute\00", align 1
@.str103261 = private unnamed_addr constant [11 x i8] c"follow-ftp\00", align 1
@.str104262 = private unnamed_addr constant [10 x i8] c"followftp\00", align 1
@.str105263 = private unnamed_addr constant [12 x i8] c"follow-tags\00", align 1
@.str106264 = private unnamed_addr constant [11 x i8] c"followtags\00", align 1
@.str107265 = private unnamed_addr constant [18 x i8] c"force-directories\00", align 1
@.str108266 = private unnamed_addr constant [11 x i8] c"force-html\00", align 1
@.str109267 = private unnamed_addr constant [10 x i8] c"forcehtml\00", align 1
@.str110268 = private unnamed_addr constant [13 x i8] c"ftp-password\00", align 1
@.str111269 = private unnamed_addr constant [12 x i8] c"ftppassword\00", align 1
@.str112270 = private unnamed_addr constant [9 x i8] c"ftp-user\00", align 1
@.str113271 = private unnamed_addr constant [8 x i8] c"ftpuser\00", align 1
@.str114272 = private unnamed_addr constant [5 x i8] c"glob\00", align 1
@.str115273 = private unnamed_addr constant [7 x i8] c"header\00", align 1
@.str116274 = private unnamed_addr constant [5 x i8] c"help\00", align 1
@.str117275 = private unnamed_addr constant [17 x i8] c"host-directories\00", align 1
@.str118276 = private unnamed_addr constant [15 x i8] c"html-extension\00", align 1
@.str119277 = private unnamed_addr constant [8 x i8] c"htmlify\00", align 1
@.str120278 = private unnamed_addr constant [16 x i8] c"http-keep-alive\00", align 1
@.str121279 = private unnamed_addr constant [14 x i8] c"httpkeepalive\00", align 1
@.str122280 = private unnamed_addr constant [12 x i8] c"http-passwd\00", align 1
@.str123281 = private unnamed_addr constant [13 x i8] c"httppassword\00", align 1
@.str124282 = private unnamed_addr constant [14 x i8] c"http-password\00", align 1
@.str125283 = private unnamed_addr constant [10 x i8] c"http-user\00", align 1
@.str126284 = private unnamed_addr constant [9 x i8] c"httpuser\00", align 1
@.str127285 = private unnamed_addr constant [12 x i8] c"ignore-case\00", align 1
@.str128286 = private unnamed_addr constant [11 x i8] c"ignorecase\00", align 1
@.str129287 = private unnamed_addr constant [14 x i8] c"ignore-length\00", align 1
@.str130288 = private unnamed_addr constant [13 x i8] c"ignorelength\00", align 1
@.str131289 = private unnamed_addr constant [12 x i8] c"ignore-tags\00", align 1
@.str132290 = private unnamed_addr constant [11 x i8] c"ignoretags\00", align 1
@.str133291 = private unnamed_addr constant [20 x i8] c"include-directories\00", align 1
@.str134292 = private unnamed_addr constant [19 x i8] c"includedirectories\00", align 1
@.str135293 = private unnamed_addr constant [11 x i8] c"inet4-only\00", align 1
@.str136294 = private unnamed_addr constant [10 x i8] c"inet4only\00", align 1
@.str137295 = private unnamed_addr constant [11 x i8] c"inet6-only\00", align 1
@.str138296 = private unnamed_addr constant [10 x i8] c"inet6only\00", align 1
@.str139297 = private unnamed_addr constant [11 x i8] c"input-file\00", align 1
@.str140298 = private unnamed_addr constant [6 x i8] c"input\00", align 1
@.str141299 = private unnamed_addr constant [4 x i8] c"iri\00", align 1
@.str142300 = private unnamed_addr constant [21 x i8] c"keep-session-cookies\00", align 1
@.str143301 = private unnamed_addr constant [19 x i8] c"keepsessioncookies\00", align 1
@.str144302 = private unnamed_addr constant [6 x i8] c"level\00", align 1
@.str145303 = private unnamed_addr constant [9 x i8] c"reclevel\00", align 1
@.str146304 = private unnamed_addr constant [11 x i8] c"limit-rate\00", align 1
@.str147305 = private unnamed_addr constant [10 x i8] c"limitrate\00", align 1
@.str148306 = private unnamed_addr constant [13 x i8] c"load-cookies\00", align 1
@.str149307 = private unnamed_addr constant [12 x i8] c"loadcookies\00", align 1
@.str150308 = private unnamed_addr constant [15 x i8] c"local-encoding\00", align 1
@.str151309 = private unnamed_addr constant [14 x i8] c"localencoding\00", align 1
@.str152310 = private unnamed_addr constant [13 x i8] c"max-redirect\00", align 1
@.str153311 = private unnamed_addr constant [12 x i8] c"maxredirect\00", align 1
@.str154312 = private unnamed_addr constant [7 x i8] c"mirror\00", align 1
@.str155313 = private unnamed_addr constant [3 x i8] c"no\00", align 1
@.str156314 = private unnamed_addr constant [11 x i8] c"no-clobber\00", align 1
@.str157 = private unnamed_addr constant [10 x i8] c"no-parent\00", align 1
@.str158 = private unnamed_addr constant [16 x i8] c"output-document\00", align 1
@.str159 = private unnamed_addr constant [15 x i8] c"outputdocument\00", align 1
@.str160 = private unnamed_addr constant [12 x i8] c"output-file\00", align 1
@.str161 = private unnamed_addr constant [16 x i8] c"page-requisites\00", align 1
@.str162 = private unnamed_addr constant [15 x i8] c"pagerequisites\00", align 1
@.str163 = private unnamed_addr constant [7 x i8] c"parent\00", align 1
@.str164 = private unnamed_addr constant [12 x i8] c"passive-ftp\00", align 1
@.str165 = private unnamed_addr constant [11 x i8] c"passiveftp\00", align 1
@.str166 = private unnamed_addr constant [9 x i8] c"password\00", align 1
@.str167 = private unnamed_addr constant [10 x i8] c"post-data\00", align 1
@.str168 = private unnamed_addr constant [9 x i8] c"postdata\00", align 1
@.str169 = private unnamed_addr constant [10 x i8] c"post-file\00", align 1
@.str170 = private unnamed_addr constant [9 x i8] c"postfile\00", align 1
@.str171 = private unnamed_addr constant [14 x i8] c"prefer-family\00", align 1
@.str172 = private unnamed_addr constant [13 x i8] c"preferfamily\00", align 1
@.str173 = private unnamed_addr constant [21 x i8] c"preserve-permissions\00", align 1
@.str174 = private unnamed_addr constant [20 x i8] c"preservepermissions\00", align 1
@.str175 = private unnamed_addr constant [12 x i8] c"private-key\00", align 1
@.str176 = private unnamed_addr constant [11 x i8] c"privatekey\00", align 1
@.str177 = private unnamed_addr constant [17 x i8] c"private-key-type\00", align 1
@.str178 = private unnamed_addr constant [15 x i8] c"privatekeytype\00", align 1
@.str179 = private unnamed_addr constant [9 x i8] c"progress\00", align 1
@.str180 = private unnamed_addr constant [21 x i8] c"protocol-directories\00", align 1
@.str181 = private unnamed_addr constant [20 x i8] c"protocoldirectories\00", align 1
@.str182 = private unnamed_addr constant [6 x i8] c"proxy\00", align 1
@.str183 = private unnamed_addr constant [9 x i8] c"useproxy\00", align 1
@.str184 = private unnamed_addr constant [14 x i8] c"proxy__compat\00", align 1
@.str185 = private unnamed_addr constant [13 x i8] c"proxy-passwd\00", align 1
@.str186 = private unnamed_addr constant [14 x i8] c"proxypassword\00", align 1
@.str187 = private unnamed_addr constant [15 x i8] c"proxy-password\00", align 1
@.str188 = private unnamed_addr constant [11 x i8] c"proxy-user\00", align 1
@.str189 = private unnamed_addr constant [10 x i8] c"proxyuser\00", align 1
@.str190 = private unnamed_addr constant [6 x i8] c"quiet\00", align 1
@.str191 = private unnamed_addr constant [6 x i8] c"quota\00", align 1
@.str192 = private unnamed_addr constant [12 x i8] c"random-file\00", align 1
@.str193 = private unnamed_addr constant [11 x i8] c"randomfile\00", align 1
@.str194 = private unnamed_addr constant [12 x i8] c"random-wait\00", align 1
@.str195 = private unnamed_addr constant [11 x i8] c"randomwait\00", align 1
@.str196 = private unnamed_addr constant [13 x i8] c"read-timeout\00", align 1
@.str197 = private unnamed_addr constant [12 x i8] c"readtimeout\00", align 1
@.str198 = private unnamed_addr constant [10 x i8] c"recursive\00", align 1
@.str199 = private unnamed_addr constant [8 x i8] c"referer\00", align 1
@.str200 = private unnamed_addr constant [7 x i8] c"reject\00", align 1
@.str201 = private unnamed_addr constant [9 x i8] c"relative\00", align 1
@.str202 = private unnamed_addr constant [13 x i8] c"relativeonly\00", align 1
@.str203 = private unnamed_addr constant [16 x i8] c"remote-encoding\00", align 1
@.str204 = private unnamed_addr constant [15 x i8] c"remoteencoding\00", align 1
@.str205 = private unnamed_addr constant [15 x i8] c"remove-listing\00", align 1
@.str206 = private unnamed_addr constant [20 x i8] c"restrict-file-names\00", align 1
@.str207 = private unnamed_addr constant [18 x i8] c"restrictfilenames\00", align 1
@.str208 = private unnamed_addr constant [14 x i8] c"retr-symlinks\00", align 1
@.str209 = private unnamed_addr constant [13 x i8] c"retrsymlinks\00", align 1
@.str210 = private unnamed_addr constant [18 x i8] c"retry-connrefused\00", align 1
@.str211 = private unnamed_addr constant [17 x i8] c"retryconnrefused\00", align 1
@.str212 = private unnamed_addr constant [13 x i8] c"save-cookies\00", align 1
@.str213 = private unnamed_addr constant [12 x i8] c"savecookies\00", align 1
@.str214 = private unnamed_addr constant [13 x i8] c"save-headers\00", align 1
@.str215 = private unnamed_addr constant [12 x i8] c"saveheaders\00", align 1
@.str216 = private unnamed_addr constant [16 x i8] c"secure-protocol\00", align 1
@.str217 = private unnamed_addr constant [15 x i8] c"secureprotocol\00", align 1
@.str218 = private unnamed_addr constant [16 x i8] c"server-response\00", align 1
@.str219 = private unnamed_addr constant [15 x i8] c"serverresponse\00", align 1
@.str220 = private unnamed_addr constant [11 x i8] c"span-hosts\00", align 1
@.str221 = private unnamed_addr constant [10 x i8] c"spanhosts\00", align 1
@.str222 = private unnamed_addr constant [7 x i8] c"spider\00", align 1
@.str223 = private unnamed_addr constant [16 x i8] c"strict-comments\00", align 1
@.str224 = private unnamed_addr constant [15 x i8] c"strictcomments\00", align 1
@.str225 = private unnamed_addr constant [8 x i8] c"timeout\00", align 1
@.str226 = private unnamed_addr constant [13 x i8] c"timestamping\00", align 1
@.str227 = private unnamed_addr constant [6 x i8] c"tries\00", align 1
@.str228 = private unnamed_addr constant [5 x i8] c"user\00", align 1
@.str229 = private unnamed_addr constant [11 x i8] c"user-agent\00", align 1
@.str230 = private unnamed_addr constant [10 x i8] c"useragent\00", align 1
@.str231 = private unnamed_addr constant [8 x i8] c"version\00", align 1
@.str232 = private unnamed_addr constant [5 x i8] c"wait\00", align 1
@.str233 = private unnamed_addr constant [10 x i8] c"waitretry\00", align 1
@option_data = internal unnamed_addr constant <{ { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] } }> <{ { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([7 x i8]* @.str44202, i32 0, i32 0), i8 65, i32 0, i8* getelementptr inbounds ([7 x i8]* @.str44202, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([17 x i8]* @.str45203, i32 0, i32 0), i8 69, i32 1, i8* getelementptr inbounds ([16 x i8]* @.str46204, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([14 x i8]* @.str47205, i32 0, i32 0), i8 97, i32 3, i8* null, i32 1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([13 x i8]* @.str48206, i32 0, i32 0), i8 0, i32 1, i8* getelementptr inbounds ([12 x i8]* @.str49207, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([18 x i8]* @.str50208, i32 0, i32 0), i8 0, i32 1, i8* getelementptr inbounds ([16 x i8]* @.str51209, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([11 x i8]* @.str52210, i32 0, i32 0), i8 98, i32 1, i8* getelementptr inbounds ([11 x i8]* @.str52210, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([17 x i8]* @.str53211, i32 0, i32 0), i8 75, i32 1, i8* getelementptr inbounds ([16 x i8]* @.str54212, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([8 x i8]* @.str55213, i32 0, i32 0), i8 0, i32 1, i8* getelementptr inbounds ([8 x i8]* @.str55213, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([5 x i8]* @.str56214, i32 0, i32 0), i8 66, i32 0, i8* getelementptr inbounds ([5 x i8]* @.str56214, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([13 x i8]* @.str57215, i32 0, i32 0), i8 0, i32 0, i8* getelementptr inbounds ([12 x i8]* @.str58216, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([15 x i8]* @.str59217, i32 0, i32 0), i8 0, i32 0, i8* getelementptr inbounds ([14 x i8]* @.str60218, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([13 x i8]* @.str61219, i32 0, i32 0), i8 0, i32 0, i8* getelementptr inbounds ([12 x i8]* @.str62220, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([6 x i8]* @.str63221, i32 0, i32 0), i8 0, i32 1, i8* getelementptr inbounds ([6 x i8]* @.str63221, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([12 x i8]* @.str64222, i32 0, i32 0), i8 0, i32 0, i8* getelementptr inbounds ([12 x i8]* @.str64222, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([17 x i8]* @.str65223, i32 0, i32 0), i8 0, i32 0, i8* getelementptr inbounds ([16 x i8]* @.str66224, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([18 x i8]* @.str67225, i32 0, i32 0), i8 0, i32 1, i8* getelementptr inbounds ([17 x i8]* @.str68226, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([8 x i8]* @.str69227, i32 0, i32 0), i8 0, i32 4, i8* null, i32 2, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([16 x i8]* @.str70228, i32 0, i32 0), i8 0, i32 0, i8* getelementptr inbounds ([15 x i8]* @.str71229, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([9 x i8]* @.str72230, i32 0, i32 0), i8 99, i32 1, i8* getelementptr inbounds ([9 x i8]* @.str72230, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([14 x i8]* @.str73231, i32 0, i32 0), i8 107, i32 1, i8* getelementptr inbounds ([13 x i8]* @.str74232, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([20 x i8]* @.str75233, i32 0, i32 0), i8 0, i32 1, i8* getelementptr inbounds ([19 x i8]* @.str76234, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([8 x i8]* @.str77235, i32 0, i32 0), i8 0, i32 1, i8* getelementptr inbounds ([8 x i8]* @.str77235, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([9 x i8]* @.str78236, i32 0, i32 0), i8 0, i32 0, i8* getelementptr inbounds ([8 x i8]* @.str79237, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([6 x i8]* @.str80238, i32 0, i32 0), i8 100, i32 1, i8* getelementptr inbounds ([6 x i8]* @.str80238, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([13 x i8]* @.str81239, i32 0, i32 0), i8 0, i32 0, i8* getelementptr inbounds ([12 x i8]* @.str82240, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([13 x i8]* @.str83241, i32 0, i32 0), i8 0, i32 1, i8* getelementptr inbounds ([12 x i8]* @.str84242, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([12 x i8]* @.str85243, i32 0, i32 0), i8 0, i32 1, i8* getelementptr inbounds ([10 x i8]* @.str7163, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([17 x i8]* @.str86244, i32 0, i32 0), i8 80, i32 0, i8* getelementptr inbounds ([10 x i8]* @.str87245, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([10 x i8]* @.str88246, i32 0, i32 0), i8 0, i32 1, i8* getelementptr inbounds ([9 x i8]* @.str89247, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([12 x i8]* @.str90248, i32 0, i32 0), i8 0, i32 0, i8* getelementptr inbounds ([11 x i8]* @.str91249, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([8 x i8]* @.str92250, i32 0, i32 0), i8 68, i32 0, i8* getelementptr inbounds ([8 x i8]* @.str92250, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([20 x i8]* @.str93251, i32 0, i32 0), i8 0, i32 5, i8* null, i32 0, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([10 x i8]* @.str94252, i32 0, i32 0), i8 0, i32 0, i8* getelementptr inbounds ([9 x i8]* @.str95253, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([9 x i8]* @.str96254, i32 0, i32 0), i8 0, i32 0, i8* getelementptr inbounds ([8 x i8]* @.str97255, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([20 x i8]* @.str98256, i32 0, i32 0), i8 88, i32 0, i8* getelementptr inbounds ([19 x i8]* @.str99257, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([16 x i8]* @.str100258, i32 0, i32 0), i8 0, i32 0, i8* getelementptr inbounds ([15 x i8]* @.str101259, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([8 x i8]* @.str102260, i32 0, i32 0), i8 101, i32 6, i8* null, i32 1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([11 x i8]* @.str103261, i32 0, i32 0), i8 0, i32 1, i8* getelementptr inbounds ([10 x i8]* @.str104262, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([12 x i8]* @.str105263, i32 0, i32 0), i8 0, i32 0, i8* getelementptr inbounds ([11 x i8]* @.str106264, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([18 x i8]* @.str107265, i32 0, i32 0), i8 120, i32 1, i8* getelementptr inbounds ([10 x i8]* @.str7163, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([11 x i8]* @.str108266, i32 0, i32 0), i8 70, i32 1, i8* getelementptr inbounds ([10 x i8]* @.str109267, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([13 x i8]* @.str110268, i32 0, i32 0), i8 0, i32 0, i8* getelementptr inbounds ([12 x i8]* @.str111269, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([9 x i8]* @.str112270, i32 0, i32 0), i8 0, i32 0, i8* getelementptr inbounds ([8 x i8]* @.str113271, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([5 x i8]* @.str114272, i32 0, i32 0), i8 0, i32 1, i8* getelementptr inbounds ([5 x i8]* @.str114272, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([7 x i8]* @.str115273, i32 0, i32 0), i8 0, i32 0, i8* getelementptr inbounds ([7 x i8]* @.str115273, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([5 x i8]* @.str116274, i32 0, i32 0), i8 104, i32 2, i8* bitcast (void ()* @print_help to i8*), i32 0, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([17 x i8]* @.str117275, i32 0, i32 0), i8 0, i32 1, i8* getelementptr inbounds ([11 x i8]* @.str6162, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([15 x i8]* @.str118276, i32 0, i32 0), i8 69, i32 1, i8* getelementptr inbounds ([16 x i8]* @.str46204, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([8 x i8]* @.str119277, i32 0, i32 0), i8 0, i32 1, i8* getelementptr inbounds ([8 x i8]* @.str119277, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([16 x i8]* @.str120278, i32 0, i32 0), i8 0, i32 1, i8* getelementptr inbounds ([14 x i8]* @.str121279, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([12 x i8]* @.str122280, i32 0, i32 0), i8 0, i32 0, i8* getelementptr inbounds ([13 x i8]* @.str123281, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([14 x i8]* @.str124282, i32 0, i32 0), i8 0, i32 0, i8* getelementptr inbounds ([13 x i8]* @.str123281, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([10 x i8]* @.str125283, i32 0, i32 0), i8 0, i32 0, i8* getelementptr inbounds ([9 x i8]* @.str126284, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([12 x i8]* @.str127285, i32 0, i32 0), i8 0, i32 1, i8* getelementptr inbounds ([11 x i8]* @.str128286, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([14 x i8]* @.str129287, i32 0, i32 0), i8 0, i32 1, i8* getelementptr inbounds ([13 x i8]* @.str130288, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([12 x i8]* @.str131289, i32 0, i32 0), i8 0, i32 0, i8* getelementptr inbounds ([11 x i8]* @.str132290, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([20 x i8]* @.str133291, i32 0, i32 0), i8 73, i32 0, i8* getelementptr inbounds ([19 x i8]* @.str134292, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([11 x i8]* @.str135293, i32 0, i32 0), i8 52, i32 1, i8* getelementptr inbounds ([10 x i8]* @.str136294, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([11 x i8]* @.str137295, i32 0, i32 0), i8 54, i32 1, i8* getelementptr inbounds ([10 x i8]* @.str138296, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([11 x i8]* @.str139297, i32 0, i32 0), i8 105, i32 0, i8* getelementptr inbounds ([6 x i8]* @.str140298, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([4 x i8]* @.str141299, i32 0, i32 0), i8 0, i32 1, i8* getelementptr inbounds ([4 x i8]* @.str141299, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([21 x i8]* @.str142300, i32 0, i32 0), i8 0, i32 1, i8* getelementptr inbounds ([19 x i8]* @.str143301, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([6 x i8]* @.str144302, i32 0, i32 0), i8 108, i32 0, i8* getelementptr inbounds ([9 x i8]* @.str145303, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([11 x i8]* @.str146304, i32 0, i32 0), i8 0, i32 0, i8* getelementptr inbounds ([10 x i8]* @.str147305, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([13 x i8]* @.str148306, i32 0, i32 0), i8 0, i32 0, i8* getelementptr inbounds ([12 x i8]* @.str149307, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([15 x i8]* @.str150308, i32 0, i32 0), i8 0, i32 0, i8* getelementptr inbounds ([14 x i8]* @.str151309, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([13 x i8]* @.str152310, i32 0, i32 0), i8 0, i32 0, i8* getelementptr inbounds ([12 x i8]* @.str153311, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([7 x i8]* @.str154312, i32 0, i32 0), i8 109, i32 1, i8* getelementptr inbounds ([7 x i8]* @.str154312, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([3 x i8]* @.str155313, i32 0, i32 0), i8 110, i32 7, i8* null, i32 1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([11 x i8]* @.str156314, i32 0, i32 0), i8 0, i32 1, i8* getelementptr inbounds ([10 x i8]* @.str8164, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([10 x i8]* @.str157, i32 0, i32 0), i8 0, i32 1, i8* getelementptr inbounds ([9 x i8]* @.str9165, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([16 x i8]* @.str158, i32 0, i32 0), i8 79, i32 0, i8* getelementptr inbounds ([15 x i8]* @.str159, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([12 x i8]* @.str160, i32 0, i32 0), i8 111, i32 0, i8* getelementptr inbounds ([8 x i8]* @.str4160, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([16 x i8]* @.str161, i32 0, i32 0), i8 112, i32 1, i8* getelementptr inbounds ([15 x i8]* @.str162, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([7 x i8]* @.str163, i32 0, i32 0), i8 0, i32 8, i8* null, i32 2, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([12 x i8]* @.str164, i32 0, i32 0), i8 0, i32 1, i8* getelementptr inbounds ([11 x i8]* @.str165, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([9 x i8]* @.str166, i32 0, i32 0), i8 0, i32 0, i8* getelementptr inbounds ([9 x i8]* @.str166, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([10 x i8]* @.str167, i32 0, i32 0), i8 0, i32 0, i8* getelementptr inbounds ([9 x i8]* @.str168, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([10 x i8]* @.str169, i32 0, i32 0), i8 0, i32 0, i8* getelementptr inbounds ([9 x i8]* @.str170, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([14 x i8]* @.str171, i32 0, i32 0), i8 0, i32 0, i8* getelementptr inbounds ([13 x i8]* @.str172, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([21 x i8]* @.str173, i32 0, i32 0), i8 0, i32 1, i8* getelementptr inbounds ([20 x i8]* @.str174, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([12 x i8]* @.str175, i32 0, i32 0), i8 0, i32 0, i8* getelementptr inbounds ([11 x i8]* @.str176, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([17 x i8]* @.str177, i32 0, i32 0), i8 0, i32 0, i8* getelementptr inbounds ([15 x i8]* @.str178, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([9 x i8]* @.str179, i32 0, i32 0), i8 0, i32 0, i8* getelementptr inbounds ([9 x i8]* @.str179, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([21 x i8]* @.str180, i32 0, i32 0), i8 0, i32 1, i8* getelementptr inbounds ([20 x i8]* @.str181, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([6 x i8]* @.str182, i32 0, i32 0), i8 0, i32 1, i8* getelementptr inbounds ([9 x i8]* @.str183, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([14 x i8]* @.str184, i32 0, i32 0), i8 89, i32 0, i8* getelementptr inbounds ([9 x i8]* @.str183, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([13 x i8]* @.str185, i32 0, i32 0), i8 0, i32 0, i8* getelementptr inbounds ([14 x i8]* @.str186, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([15 x i8]* @.str187, i32 0, i32 0), i8 0, i32 0, i8* getelementptr inbounds ([14 x i8]* @.str186, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([11 x i8]* @.str188, i32 0, i32 0), i8 0, i32 0, i8* getelementptr inbounds ([10 x i8]* @.str189, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([6 x i8]* @.str190, i32 0, i32 0), i8 113, i32 1, i8* getelementptr inbounds ([6 x i8]* @.str190, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([6 x i8]* @.str191, i32 0, i32 0), i8 81, i32 0, i8* getelementptr inbounds ([6 x i8]* @.str191, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([12 x i8]* @.str192, i32 0, i32 0), i8 0, i32 0, i8* getelementptr inbounds ([11 x i8]* @.str193, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([12 x i8]* @.str194, i32 0, i32 0), i8 0, i32 1, i8* getelementptr inbounds ([11 x i8]* @.str195, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([13 x i8]* @.str196, i32 0, i32 0), i8 0, i32 0, i8* getelementptr inbounds ([12 x i8]* @.str197, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([10 x i8]* @.str198, i32 0, i32 0), i8 114, i32 1, i8* getelementptr inbounds ([10 x i8]* @.str198, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([8 x i8]* @.str199, i32 0, i32 0), i8 0, i32 0, i8* getelementptr inbounds ([8 x i8]* @.str199, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([7 x i8]* @.str200, i32 0, i32 0), i8 82, i32 0, i8* getelementptr inbounds ([7 x i8]* @.str200, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([9 x i8]* @.str201, i32 0, i32 0), i8 76, i32 1, i8* getelementptr inbounds ([13 x i8]* @.str202, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([16 x i8]* @.str203, i32 0, i32 0), i8 0, i32 0, i8* getelementptr inbounds ([15 x i8]* @.str204, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([15 x i8]* @.str205, i32 0, i32 0), i8 0, i32 1, i8* getelementptr inbounds ([14 x i8]* @.str11167, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([20 x i8]* @.str206, i32 0, i32 0), i8 0, i32 1, i8* getelementptr inbounds ([18 x i8]* @.str207, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([14 x i8]* @.str208, i32 0, i32 0), i8 0, i32 1, i8* getelementptr inbounds ([13 x i8]* @.str209, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([18 x i8]* @.str210, i32 0, i32 0), i8 0, i32 1, i8* getelementptr inbounds ([17 x i8]* @.str211, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([13 x i8]* @.str212, i32 0, i32 0), i8 0, i32 0, i8* getelementptr inbounds ([12 x i8]* @.str213, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([13 x i8]* @.str214, i32 0, i32 0), i8 0, i32 1, i8* getelementptr inbounds ([12 x i8]* @.str215, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([16 x i8]* @.str216, i32 0, i32 0), i8 0, i32 0, i8* getelementptr inbounds ([15 x i8]* @.str217, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([16 x i8]* @.str218, i32 0, i32 0), i8 83, i32 1, i8* getelementptr inbounds ([15 x i8]* @.str219, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([11 x i8]* @.str220, i32 0, i32 0), i8 72, i32 1, i8* getelementptr inbounds ([10 x i8]* @.str221, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([7 x i8]* @.str222, i32 0, i32 0), i8 0, i32 1, i8* getelementptr inbounds ([7 x i8]* @.str222, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([16 x i8]* @.str223, i32 0, i32 0), i8 0, i32 1, i8* getelementptr inbounds ([15 x i8]* @.str224, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([8 x i8]* @.str225, i32 0, i32 0), i8 84, i32 0, i8* getelementptr inbounds ([8 x i8]* @.str225, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([13 x i8]* @.str226, i32 0, i32 0), i8 78, i32 1, i8* getelementptr inbounds ([13 x i8]* @.str226, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([6 x i8]* @.str227, i32 0, i32 0), i8 116, i32 0, i8* getelementptr inbounds ([6 x i8]* @.str227, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([5 x i8]* @.str228, i32 0, i32 0), i8 0, i32 0, i8* getelementptr inbounds ([5 x i8]* @.str228, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([11 x i8]* @.str229, i32 0, i32 0), i8 85, i32 0, i8* getelementptr inbounds ([10 x i8]* @.str230, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([8 x i8]* @.str5161, i32 0, i32 0), i8 118, i32 1, i8* getelementptr inbounds ([8 x i8]* @.str5161, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([8 x i8]* @.str5161, i32 0, i32 0), i8 0, i32 1, i8* getelementptr inbounds ([8 x i8]* @.str5161, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([8 x i8]* @.str231, i32 0, i32 0), i8 86, i32 2, i8* bitcast (void ()* @print_version to i8*), i32 0, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([5 x i8]* @.str232, i32 0, i32 0), i8 119, i32 0, i8* getelementptr inbounds ([5 x i8]* @.str232, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([10 x i8]* @.str233, i32 0, i32 0), i8 0, i32 0, i8* getelementptr inbounds ([10 x i8]* @.str233, i32 0, i32 0), i32 -1, [4 x i8] undef } }>, align 16
@.str234 = private unnamed_addr constant [9 x i8] c"Wgetrc: \00", align 1
@.str235 = private unnamed_addr constant [9 x i8] c"Locale: \00", align 1
@.str236 = private unnamed_addr constant [10 x i8] c"Compile: \00", align 1
@.str237 = private unnamed_addr constant [7 x i8] c"Link: \00", align 1
@.str238 = private unnamed_addr constant [27 x i8] c"GNU Wget %s built on %s.\0A\0A\00", align 1
@compiled_features = external global [0 x i8*]
@.str239 = private unnamed_addr constant [4 x i8] c"%s \00", align 1
@.str240 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str241 = private unnamed_addr constant [14 x i8] c"    %s (env)\0A\00", align 1
@.str242 = private unnamed_addr constant [15 x i8] c"    %s (user)\0A\00", align 1
@.str243 = private unnamed_addr constant [17 x i8] c"    %s (system)\0A\00", align 1
@.str244 = private unnamed_addr constant [22 x i8] c"/usr/local/etc/wgetrc\00", align 1
@.str245 = private unnamed_addr constant [24 x i8] c"/usr/local/share/locale\00", align 1
@compilation_string = external global i8*
@link_string = external global i8*
@.str246 = private unnamed_addr constant [51 x i8] c"Copyright (C) 2009 Free Software Foundation, Inc.\0A\00", align 1
@.str247 = private unnamed_addr constant [205 x i8] c"License GPLv3+: GNU GPL version 3 or later\0A<http://www.gnu.org/licenses/gpl.html>.\0AThis is free software: you are free to change and redistribute it.\0AThere is NO WARRANTY, to the extent permitted by law.\0A\00", align 1
@.str248 = private unnamed_addr constant [60 x i8] c"\0AOriginally written by Hrvoje Niksic <hniksic@xemacs.org>.\0A\00", align 1
@.str249 = private unnamed_addr constant [57 x i8] c"Currently maintained by Micah Cowan <micah@cowan.name>.\0A\00", align 1
@.str250 = private unnamed_addr constant [62 x i8] c"Please send bug reports and questions to <bug-wget@gnu.org>.\0A\00", align 1
@__func__.format_and_print_line = private unnamed_addr constant [22 x i8] c"format_and_print_line\00", align 1
@.str251 = private unnamed_addr constant [7 x i8] c"main.c\00", align 1
@.str252 = private unnamed_addr constant [15 x i8] c"prefix != NULL\00", align 1
@.str253 = private unnamed_addr constant [13 x i8] c"line != NULL\00", align 1
@.str254 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str255 = private unnamed_addr constant [5 x i8] c"\0A%*c\00", align 1
@print_help.help = internal unnamed_addr constant [130 x i8*] [i8* getelementptr inbounds ([2 x i8]* @.str156, i32 0, i32 0), i8* getelementptr inbounds ([75 x i8]* @.str256, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8]* @.str257, i32 0, i32 0), i8* getelementptr inbounds ([66 x i8]* @.str258, i32 0, i32 0), i8* getelementptr inbounds ([45 x i8]* @.str259, i32 0, i32 0), i8* getelementptr inbounds ([60 x i8]* @.str260, i32 0, i32 0), i8* getelementptr inbounds ([63 x i8]* @.str261, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str156, i32 0, i32 0), i8* getelementptr inbounds ([25 x i8]* @.str262, i32 0, i32 0), i8* getelementptr inbounds ([52 x i8]* @.str263, i32 0, i32 0), i8* getelementptr inbounds ([55 x i8]* @.str264, i32 0, i32 0), i8* getelementptr inbounds ([67 x i8]* @.str265, i32 0, i32 0), i8* getelementptr inbounds ([49 x i8]* @.str266, i32 0, i32 0), i8* getelementptr inbounds ([64 x i8]* @.str267, i32 0, i32 0), i8* getelementptr inbounds ([73 x i8]* @.str268, i32 0, i32 0), i8* getelementptr inbounds ([77 x i8]* @.str269, i32 0, i32 0), i8* getelementptr inbounds ([56 x i8]* @.str270, i32 0, i32 0), i8* getelementptr inbounds ([115 x i8]* @.str271, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str156, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str272, i32 0, i32 0), i8* getelementptr inbounds ([80 x i8]* @.str273, i32 0, i32 0), i8* getelementptr inbounds ([71 x i8]* @.str274, i32 0, i32 0), i8* getelementptr inbounds ([59 x i8]* @.str275, i32 0, i32 0), i8* getelementptr inbounds ([121 x i8]* @.str276, i32 0, i32 0), i8* getelementptr inbounds ([78 x i8]* @.str277, i32 0, i32 0), i8* getelementptr inbounds ([62 x i8]* @.str278, i32 0, i32 0), i8* getelementptr inbounds ([116 x i8]* @.str279, i32 0, i32 0), i8* getelementptr inbounds ([57 x i8]* @.str280, i32 0, i32 0), i8* getelementptr inbounds ([59 x i8]* @.str281, i32 0, i32 0), i8* getelementptr inbounds ([69 x i8]* @.str282, i32 0, i32 0), i8* getelementptr inbounds ([70 x i8]* @.str283, i32 0, i32 0), i8* getelementptr inbounds ([67 x i8]* @.str284, i32 0, i32 0), i8* getelementptr inbounds ([64 x i8]* @.str285, i32 0, i32 0), i8* getelementptr inbounds ([67 x i8]* @.str286, i32 0, i32 0), i8* getelementptr inbounds ([82 x i8]* @.str287, i32 0, i32 0), i8* getelementptr inbounds ([80 x i8]* @.str288, i32 0, i32 0), i8* getelementptr inbounds ([61 x i8]* @.str289, i32 0, i32 0), i8* getelementptr inbounds ([65 x i8]* @.str290, i32 0, i32 0), i8* getelementptr inbounds ([82 x i8]* @.str291, i32 0, i32 0), i8* getelementptr inbounds ([63 x i8]* @.str292, i32 0, i32 0), i8* getelementptr inbounds ([63 x i8]* @.str293, i32 0, i32 0), i8* getelementptr inbounds ([82 x i8]* @.str294, i32 0, i32 0), i8* getelementptr inbounds ([79 x i8]* @.str295, i32 0, i32 0), i8* getelementptr inbounds ([66 x i8]* @.str296, i32 0, i32 0), i8* getelementptr inbounds ([66 x i8]* @.str297, i32 0, i32 0), i8* getelementptr inbounds ([143 x i8]* @.str298, i32 0, i32 0), i8* getelementptr inbounds ([70 x i8]* @.str299, i32 0, i32 0), i8* getelementptr inbounds ([74 x i8]* @.str300, i32 0, i32 0), i8* getelementptr inbounds ([56 x i8]* @.str301, i32 0, i32 0), i8* getelementptr inbounds ([56 x i8]* @.str302, i32 0, i32 0), i8* getelementptr inbounds ([74 x i8]* @.str303, i32 0, i32 0), i8* getelementptr inbounds ([74 x i8]* @.str304, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str156, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str305, i32 0, i32 0), i8* getelementptr inbounds ([61 x i8]* @.str306, i32 0, i32 0), i8* getelementptr inbounds ([66 x i8]* @.str307, i32 0, i32 0), i8* getelementptr inbounds ([66 x i8]* @.str308, i32 0, i32 0), i8* getelementptr inbounds ([69 x i8]* @.str309, i32 0, i32 0), i8* getelementptr inbounds ([60 x i8]* @.str310, i32 0, i32 0), i8* getelementptr inbounds ([78 x i8]* @.str311, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str156, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8]* @.str312, i32 0, i32 0), i8* getelementptr inbounds ([55 x i8]* @.str313, i32 0, i32 0), i8* getelementptr inbounds ([59 x i8]* @.str314, i32 0, i32 0), i8* getelementptr inbounds ([61 x i8]* @.str315, i32 0, i32 0), i8* getelementptr inbounds ([126 x i8]* @.str316, i32 0, i32 0), i8* getelementptr inbounds ([80 x i8]* @.str317, i32 0, i32 0), i8* getelementptr inbounds ([70 x i8]* @.str318, i32 0, i32 0), i8* getelementptr inbounds ([65 x i8]* @.str319, i32 0, i32 0), i8* getelementptr inbounds ([71 x i8]* @.str320, i32 0, i32 0), i8* getelementptr inbounds ([60 x i8]* @.str321, i32 0, i32 0), i8* getelementptr inbounds ([60 x i8]* @.str322, i32 0, i32 0), i8* getelementptr inbounds ([79 x i8]* @.str323, i32 0, i32 0), i8* getelementptr inbounds ([63 x i8]* @.str324, i32 0, i32 0), i8* getelementptr inbounds ([75 x i8]* @.str325, i32 0, i32 0), i8* getelementptr inbounds ([82 x i8]* @.str326, i32 0, i32 0), i8* getelementptr inbounds ([51 x i8]* @.str327, i32 0, i32 0), i8* getelementptr inbounds ([71 x i8]* @.str328, i32 0, i32 0), i8* getelementptr inbounds ([68 x i8]* @.str329, i32 0, i32 0), i8* getelementptr inbounds ([79 x i8]* @.str330, i32 0, i32 0), i8* getelementptr inbounds ([78 x i8]* @.str331, i32 0, i32 0), i8* getelementptr inbounds ([76 x i8]* @.str332, i32 0, i32 0), i8* getelementptr inbounds ([147 x i8]* @.str333, i32 0, i32 0), i8* getelementptr inbounds ([187 x i8]* @.str334, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str156, i32 0, i32 0), i8* getelementptr inbounds ([26 x i8]* @.str335, i32 0, i32 0), i8* getelementptr inbounds ([127 x i8]* @.str336, i32 0, i32 0), i8* getelementptr inbounds ([74 x i8]* @.str337, i32 0, i32 0), i8* getelementptr inbounds ([58 x i8]* @.str338, i32 0, i32 0), i8* getelementptr inbounds ([70 x i8]* @.str339, i32 0, i32 0), i8* getelementptr inbounds ([51 x i8]* @.str340, i32 0, i32 0), i8* getelementptr inbounds ([63 x i8]* @.str341, i32 0, i32 0), i8* getelementptr inbounds ([63 x i8]* @.str342, i32 0, i32 0), i8* getelementptr inbounds ([78 x i8]* @.str343, i32 0, i32 0), i8* getelementptr inbounds ([81 x i8]* @.str344, i32 0, i32 0), i8* getelementptr inbounds ([78 x i8]* @.str345, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str156, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str346, i32 0, i32 0), i8* getelementptr inbounds ([54 x i8]* @.str347, i32 0, i32 0), i8* getelementptr inbounds ([58 x i8]* @.str348, i32 0, i32 0), i8* getelementptr inbounds ([63 x i8]* @.str349, i32 0, i32 0), i8* getelementptr inbounds ([65 x i8]* @.str350, i32 0, i32 0), i8* getelementptr inbounds ([69 x i8]* @.str351, i32 0, i32 0), i8* getelementptr inbounds ([79 x i8]* @.str352, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str156, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8]* @.str353, i32 0, i32 0), i8* getelementptr inbounds ([57 x i8]* @.str354, i32 0, i32 0), i8* getelementptr inbounds ([78 x i8]* @.str355, i32 0, i32 0), i8* getelementptr inbounds ([74 x i8]* @.str356, i32 0, i32 0), i8* getelementptr inbounds ([116 x i8]* @.str357, i32 0, i32 0), i8* getelementptr inbounds ([74 x i8]* @.str358, i32 0, i32 0), i8* getelementptr inbounds ([76 x i8]* @.str359, i32 0, i32 0), i8* getelementptr inbounds ([79 x i8]* @.str360, i32 0, i32 0), i8* getelementptr inbounds ([78 x i8]* @.str361, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str156, i32 0, i32 0), i8* getelementptr inbounds ([26 x i8]* @.str362, i32 0, i32 0), i8* getelementptr inbounds ([81 x i8]* @.str363, i32 0, i32 0), i8* getelementptr inbounds ([81 x i8]* @.str364, i32 0, i32 0), i8* getelementptr inbounds ([78 x i8]* @.str365, i32 0, i32 0), i8* getelementptr inbounds ([78 x i8]* @.str366, i32 0, i32 0), i8* getelementptr inbounds ([74 x i8]* @.str367, i32 0, i32 0), i8* getelementptr inbounds ([80 x i8]* @.str368, i32 0, i32 0), i8* getelementptr inbounds ([79 x i8]* @.str369, i32 0, i32 0), i8* getelementptr inbounds ([72 x i8]* @.str370, i32 0, i32 0), i8* getelementptr inbounds ([64 x i8]* @.str371, i32 0, i32 0), i8* getelementptr inbounds ([65 x i8]* @.str372, i32 0, i32 0), i8* getelementptr inbounds ([66 x i8]* @.str373, i32 0, i32 0), i8* getelementptr inbounds ([74 x i8]* @.str374, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str156, i32 0, i32 0), i8* getelementptr inbounds ([57 x i8]* @.str375, i32 0, i32 0)], align 16
@.str256 = private unnamed_addr constant [75 x i8] c"Mandatory arguments to long options are mandatory for short options too.\0A\0A\00", align 1
@.str257 = private unnamed_addr constant [10 x i8] c"Startup:\0A\00", align 1
@.str258 = private unnamed_addr constant [66 x i8] c"  -V,  --version           display the version of Wget and exit.\0A\00", align 1
@.str259 = private unnamed_addr constant [45 x i8] c"  -h,  --help              print this help.\0A\00", align 1
@.str260 = private unnamed_addr constant [60 x i8] c"  -b,  --background        go to background after startup.\0A\00", align 1
@.str261 = private unnamed_addr constant [63 x i8] c"  -e,  --execute=COMMAND   execute a `.wgetrc'-style command.\0A\00", align 1
@.str262 = private unnamed_addr constant [25 x i8] c"Logging and input file:\0A\00", align 1
@.str263 = private unnamed_addr constant [52 x i8] c"  -o,  --output-file=FILE    log messages to FILE.\0A\00", align 1
@.str264 = private unnamed_addr constant [55 x i8] c"  -a,  --append-output=FILE  append messages to FILE.\0A\00", align 1
@.str265 = private unnamed_addr constant [67 x i8] c"  -d,  --debug               print lots of debugging information.\0A\00", align 1
@.str266 = private unnamed_addr constant [49 x i8] c"  -q,  --quiet               quiet (no output).\0A\00", align 1
@.str267 = private unnamed_addr constant [64 x i8] c"  -v,  --verbose             be verbose (this is the default).\0A\00", align 1
@.str268 = private unnamed_addr constant [73 x i8] c"  -nv, --no-verbose          turn off verboseness, without being quiet.\0A\00", align 1
@.str269 = private unnamed_addr constant [77 x i8] c"  -i,  --input-file=FILE     download URLs found in local or external FILE.\0A\00", align 1
@.str270 = private unnamed_addr constant [56 x i8] c"  -F,  --force-html          treat input file as HTML.\0A\00", align 1
@.str271 = private unnamed_addr constant [115 x i8] c"  -B,  --base=URL            resolves HTML input-file links (-i -F)\0A                             relative to URL.\0A\00", align 1
@.str272 = private unnamed_addr constant [11 x i8] c"Download:\0A\00", align 1
@.str273 = private unnamed_addr constant [80 x i8] c"  -t,  --tries=NUMBER            set number of retries to NUMBER (0 unlimits).\0A\00", align 1
@.str274 = private unnamed_addr constant [71 x i8] c"       --retry-connrefused       retry even if connection is refused.\0A\00", align 1
@.str275 = private unnamed_addr constant [59 x i8] c"  -O,  --output-document=FILE    write documents to FILE.\0A\00", align 1
@.str276 = private unnamed_addr constant [121 x i8] c"  -nc, --no-clobber              skip downloads that would download to\0A                                 existing files.\0A\00", align 1
@.str277 = private unnamed_addr constant [78 x i8] c"  -c,  --continue                resume getting a partially-downloaded file.\0A\00", align 1
@.str278 = private unnamed_addr constant [62 x i8] c"       --progress=TYPE           select progress gauge type.\0A\00", align 1
@.str279 = private unnamed_addr constant [116 x i8] c"  -N,  --timestamping            don't re-retrieve files unless newer than\0A                                 local.\0A\00", align 1
@.str280 = private unnamed_addr constant [57 x i8] c"  -S,  --server-response         print server response.\0A\00", align 1
@.str281 = private unnamed_addr constant [59 x i8] c"       --spider                  don't download anything.\0A\00", align 1
@.str282 = private unnamed_addr constant [69 x i8] c"  -T,  --timeout=SECONDS         set all timeout values to SECONDS.\0A\00", align 1
@.str283 = private unnamed_addr constant [70 x i8] c"       --dns-timeout=SECS        set the DNS lookup timeout to SECS.\0A\00", align 1
@.str284 = private unnamed_addr constant [67 x i8] c"       --connect-timeout=SECS    set the connect timeout to SECS.\0A\00", align 1
@.str285 = private unnamed_addr constant [64 x i8] c"       --read-timeout=SECS       set the read timeout to SECS.\0A\00", align 1
@.str286 = private unnamed_addr constant [67 x i8] c"  -w,  --wait=SECONDS            wait SECONDS between retrievals.\0A\00", align 1
@.str287 = private unnamed_addr constant [82 x i8] c"       --waitretry=SECONDS       wait 1..SECONDS between retries of a retrieval.\0A\00", align 1
@.str288 = private unnamed_addr constant [80 x i8] c"       --random-wait             wait from 0...2*WAIT secs between retrievals.\0A\00", align 1
@.str289 = private unnamed_addr constant [61 x i8] c"       --no-proxy                explicitly turn off proxy.\0A\00", align 1
@.str290 = private unnamed_addr constant [65 x i8] c"  -Q,  --quota=NUMBER            set retrieval quota to NUMBER.\0A\00", align 1
@.str291 = private unnamed_addr constant [82 x i8] c"       --bind-address=ADDRESS    bind to ADDRESS (hostname or IP) on local host.\0A\00", align 1
@.str292 = private unnamed_addr constant [63 x i8] c"       --limit-rate=RATE         limit download rate to RATE.\0A\00", align 1
@.str293 = private unnamed_addr constant [63 x i8] c"       --no-dns-cache            disable caching DNS lookups.\0A\00", align 1
@.str294 = private unnamed_addr constant [82 x i8] c"       --restrict-file-names=OS  restrict chars in file names to ones OS allows.\0A\00", align 1
@.str295 = private unnamed_addr constant [79 x i8] c"       --ignore-case             ignore case when matching files/directories.\0A\00", align 1
@.str296 = private unnamed_addr constant [66 x i8] c"  -4,  --inet4-only              connect only to IPv4 addresses.\0A\00", align 1
@.str297 = private unnamed_addr constant [66 x i8] c"  -6,  --inet6-only              connect only to IPv6 addresses.\0A\00", align 1
@.str298 = private unnamed_addr constant [143 x i8] c"       --prefer-family=FAMILY    connect first to addresses of specified family,\0A                                 one of IPv6, IPv4, or none.\0A\00", align 1
@.str299 = private unnamed_addr constant [70 x i8] c"       --user=USER               set both ftp and http user to USER.\0A\00", align 1
@.str300 = private unnamed_addr constant [74 x i8] c"       --password=PASS           set both ftp and http password to PASS.\0A\00", align 1
@.str301 = private unnamed_addr constant [56 x i8] c"       --ask-password            prompt for passwords.\0A\00", align 1
@.str302 = private unnamed_addr constant [56 x i8] c"       --no-iri                  turn off IRI support.\0A\00", align 1
@.str303 = private unnamed_addr constant [74 x i8] c"       --local-encoding=ENC      use ENC as the local encoding for IRIs.\0A\00", align 1
@.str304 = private unnamed_addr constant [74 x i8] c"       --remote-encoding=ENC     use ENC as the default remote encoding.\0A\00", align 1
@.str305 = private unnamed_addr constant [14 x i8] c"Directories:\0A\00", align 1
@.str306 = private unnamed_addr constant [61 x i8] c"  -nd, --no-directories           don't create directories.\0A\00", align 1
@.str307 = private unnamed_addr constant [66 x i8] c"  -x,  --force-directories        force creation of directories.\0A\00", align 1
@.str308 = private unnamed_addr constant [66 x i8] c"  -nH, --no-host-directories      don't create host directories.\0A\00", align 1
@.str309 = private unnamed_addr constant [69 x i8] c"       --protocol-directories     use protocol name in directories.\0A\00", align 1
@.str310 = private unnamed_addr constant [60 x i8] c"  -P,  --directory-prefix=PREFIX  save files to PREFIX/...\0A\00", align 1
@.str311 = private unnamed_addr constant [78 x i8] c"       --cut-dirs=NUMBER          ignore NUMBER remote directory components.\0A\00", align 1
@.str312 = private unnamed_addr constant [15 x i8] c"HTTP options:\0A\00", align 1
@.str313 = private unnamed_addr constant [55 x i8] c"       --http-user=USER        set http user to USER.\0A\00", align 1
@.str314 = private unnamed_addr constant [59 x i8] c"       --http-password=PASS    set http password to PASS.\0A\00", align 1
@.str315 = private unnamed_addr constant [61 x i8] c"       --no-cache              disallow server-cached data.\0A\00", align 1
@.str316 = private unnamed_addr constant [126 x i8] c"       --default-page=NAME     Change the default page name (normally\0A                               this is `index.html'.).\0A\00", align 1
@.str317 = private unnamed_addr constant [80 x i8] c"  -E,  --adjust-extension      save HTML/CSS documents with proper extensions.\0A\00", align 1
@.str318 = private unnamed_addr constant [70 x i8] c"       --ignore-length         ignore `Content-Length' header field.\0A\00", align 1
@.str319 = private unnamed_addr constant [65 x i8] c"       --header=STRING         insert STRING among the headers.\0A\00", align 1
@.str320 = private unnamed_addr constant [71 x i8] c"       --max-redirect          maximum redirections allowed per page.\0A\00", align 1
@.str321 = private unnamed_addr constant [60 x i8] c"       --proxy-user=USER       set USER as proxy username.\0A\00", align 1
@.str322 = private unnamed_addr constant [60 x i8] c"       --proxy-password=PASS   set PASS as proxy password.\0A\00", align 1
@.str323 = private unnamed_addr constant [79 x i8] c"       --referer=URL           include `Referer: URL' header in HTTP request.\0A\00", align 1
@.str324 = private unnamed_addr constant [63 x i8] c"       --save-headers          save the HTTP headers to file.\0A\00", align 1
@.str325 = private unnamed_addr constant [75 x i8] c"  -U,  --user-agent=AGENT      identify as AGENT instead of Wget/VERSION.\0A\00", align 1
@.str326 = private unnamed_addr constant [82 x i8] c"       --no-http-keep-alive    disable HTTP keep-alive (persistent connections).\0A\00", align 1
@.str327 = private unnamed_addr constant [51 x i8] c"       --no-cookies            don't use cookies.\0A\00", align 1
@.str328 = private unnamed_addr constant [71 x i8] c"       --load-cookies=FILE     load cookies from FILE before session.\0A\00", align 1
@.str329 = private unnamed_addr constant [68 x i8] c"       --save-cookies=FILE     save cookies to FILE after session.\0A\00", align 1
@.str330 = private unnamed_addr constant [79 x i8] c"       --keep-session-cookies  load and save session (non-permanent) cookies.\0A\00", align 1
@.str331 = private unnamed_addr constant [78 x i8] c"       --post-data=STRING      use the POST method; send STRING as the data.\0A\00", align 1
@.str332 = private unnamed_addr constant [76 x i8] c"       --post-file=FILE        use the POST method; send contents of FILE.\0A\00", align 1
@.str333 = private unnamed_addr constant [147 x i8] c"       --content-disposition   honor the Content-Disposition header when\0A                               choosing local file names (EXPERIMENTAL).\0A\00", align 1
@.str334 = private unnamed_addr constant [187 x i8] c"       --auth-no-challenge     send Basic HTTP authentication information\0A                               without first waiting for the server's\0A                               challenge.\0A\00", align 1
@.str335 = private unnamed_addr constant [26 x i8] c"HTTPS (SSL/TLS) options:\0A\00", align 1
@.str336 = private unnamed_addr constant [127 x i8] c"       --secure-protocol=PR     choose secure protocol, one of auto, SSLv2,\0A                                SSLv3, and TLSv1.\0A\00", align 1
@.str337 = private unnamed_addr constant [74 x i8] c"       --no-check-certificate   don't validate the server's certificate.\0A\00", align 1
@.str338 = private unnamed_addr constant [58 x i8] c"       --certificate=FILE       client certificate file.\0A\00", align 1
@.str339 = private unnamed_addr constant [70 x i8] c"       --certificate-type=TYPE  client certificate type, PEM or DER.\0A\00", align 1
@.str340 = private unnamed_addr constant [51 x i8] c"       --private-key=FILE       private key file.\0A\00", align 1
@.str341 = private unnamed_addr constant [63 x i8] c"       --private-key-type=TYPE  private key type, PEM or DER.\0A\00", align 1
@.str342 = private unnamed_addr constant [63 x i8] c"       --ca-certificate=FILE    file with the bundle of CA's.\0A\00", align 1
@.str343 = private unnamed_addr constant [78 x i8] c"       --ca-directory=DIR       directory where hash list of CA's is stored.\0A\00", align 1
@.str344 = private unnamed_addr constant [81 x i8] c"       --random-file=FILE       file with random data for seeding the SSL PRNG.\0A\00", align 1
@.str345 = private unnamed_addr constant [78 x i8] c"       --egd-file=FILE          file naming the EGD socket with random data.\0A\00", align 1
@.str346 = private unnamed_addr constant [14 x i8] c"FTP options:\0A\00", align 1
@.str347 = private unnamed_addr constant [54 x i8] c"       --ftp-user=USER         set ftp user to USER.\0A\00", align 1
@.str348 = private unnamed_addr constant [58 x i8] c"       --ftp-password=PASS     set ftp password to PASS.\0A\00", align 1
@.str349 = private unnamed_addr constant [63 x i8] c"       --no-remove-listing     don't remove `.listing' files.\0A\00", align 1
@.str350 = private unnamed_addr constant [65 x i8] c"       --no-glob               turn off FTP file name globbing.\0A\00", align 1
@.str351 = private unnamed_addr constant [69 x i8] c"       --no-passive-ftp        disable the \22passive\22 transfer mode.\0A\00", align 1
@.str352 = private unnamed_addr constant [79 x i8] c"       --retr-symlinks         when recursing, get linked-to files (not dir).\0A\00", align 1
@.str353 = private unnamed_addr constant [21 x i8] c"Recursive download:\0A\00", align 1
@.str354 = private unnamed_addr constant [57 x i8] c"  -r,  --recursive          specify recursive download.\0A\00", align 1
@.str355 = private unnamed_addr constant [78 x i8] c"  -l,  --level=NUMBER       maximum recursion depth (inf or 0 for infinite).\0A\00", align 1
@.str356 = private unnamed_addr constant [74 x i8] c"       --delete-after       delete files locally after downloading them.\0A\00", align 1
@.str357 = private unnamed_addr constant [116 x i8] c"  -k,  --convert-links      make links in downloaded HTML or CSS point to\0A                            local files.\0A\00", align 1
@.str358 = private unnamed_addr constant [74 x i8] c"  -K,  --backup-converted   before converting file X, back up as X.orig.\0A\00", align 1
@.str359 = private unnamed_addr constant [76 x i8] c"  -m,  --mirror             shortcut for -N -r -l inf --no-remove-listing.\0A\00", align 1
@.str360 = private unnamed_addr constant [79 x i8] c"  -p,  --page-requisites    get all images, etc. needed to display HTML page.\0A\00", align 1
@.str361 = private unnamed_addr constant [78 x i8] c"       --strict-comments    turn on strict (SGML) handling of HTML comments.\0A\00", align 1
@.str362 = private unnamed_addr constant [26 x i8] c"Recursive accept/reject:\0A\00", align 1
@.str363 = private unnamed_addr constant [81 x i8] c"  -A,  --accept=LIST               comma-separated list of accepted extensions.\0A\00", align 1
@.str364 = private unnamed_addr constant [81 x i8] c"  -R,  --reject=LIST               comma-separated list of rejected extensions.\0A\00", align 1
@.str365 = private unnamed_addr constant [78 x i8] c"  -D,  --domains=LIST              comma-separated list of accepted domains.\0A\00", align 1
@.str366 = private unnamed_addr constant [78 x i8] c"       --exclude-domains=LIST      comma-separated list of rejected domains.\0A\00", align 1
@.str367 = private unnamed_addr constant [74 x i8] c"       --follow-ftp                follow FTP links from HTML documents.\0A\00", align 1
@.str368 = private unnamed_addr constant [80 x i8] c"       --follow-tags=LIST          comma-separated list of followed HTML tags.\0A\00", align 1
@.str369 = private unnamed_addr constant [79 x i8] c"       --ignore-tags=LIST          comma-separated list of ignored HTML tags.\0A\00", align 1
@.str370 = private unnamed_addr constant [72 x i8] c"  -H,  --span-hosts                go to foreign hosts when recursive.\0A\00", align 1
@.str371 = private unnamed_addr constant [64 x i8] c"  -L,  --relative                  follow relative links only.\0A\00", align 1
@.str372 = private unnamed_addr constant [65 x i8] c"  -I,  --include-directories=LIST  list of allowed directories.\0A\00", align 1
@.str373 = private unnamed_addr constant [66 x i8] c"  -X,  --exclude-directories=LIST  list of excluded directories.\0A\00", align 1
@.str374 = private unnamed_addr constant [74 x i8] c"  -np, --no-parent                 don't ascend to the parent directory.\0A\00", align 1
@.str375 = private unnamed_addr constant [57 x i8] c"Mail bug reports and suggestions to <bug-wget@gnu.org>.\0A\00", align 1
@.str376 = private unnamed_addr constant [51 x i8] c"GNU Wget %s, a non-interactive network retriever.\0A\00", align 1
@.str377 = private unnamed_addr constant [32 x i8] c"Usage: %s [OPTION]... [URL]...\0A\00", align 1
@__func__.init_switches = private unnamed_addr constant [14 x i8] c"init_switches\00", align 1
@.str378 = private unnamed_addr constant [19 x i8] c"opt->argtype != -1\00", align 1
@.str379 = private unnamed_addr constant [28 x i8] c"o <= countof (long_options)\00", align 1
@no_prefix.buffer = internal global [1024 x i8] zeroinitializer, align 16
@no_prefix.p = internal unnamed_addr global i8* getelementptr inbounds ([1024 x i8]* @no_prefix.buffer, i64 0, i64 0), align 8
@.str380 = private unnamed_addr constant [5 x i8] c"wget\00", align 1

define zeroext i1 @extract_param(i8** nocapture %source, %struct.param_token* nocapture %name, %struct.param_token* nocapture %value, i8 signext %separator) nounwind uwtable {
  %1 = load i8** %source, align 8, !tbaa !0
  br label %2

; <label>:2                                       ; preds = %switch.edge, %0
  %p.0 = phi i8* [ %1, %0 ], [ %4, %switch.edge ]
  %3 = load i8* %p.0, align 1, !tbaa !1
  switch i8 %3, label %6 [
    i8 32, label %switch.edge
    i8 12, label %switch.edge
    i8 11, label %switch.edge
    i8 10, label %switch.edge
    i8 9, label %switch.edge
    i8 13, label %switch.edge
    i8 0, label %5
  ]

switch.edge:                                      ; preds = %2, %2, %2, %2, %2, %2
  %4 = getelementptr inbounds i8* %p.0, i64 1
  br label %2

; <label>:5                                       ; preds = %2
  store i8* %p.0, i8** %source, align 8, !tbaa !0
  br label %65

; <label>:6                                       ; preds = %2
  %7 = getelementptr inbounds %struct.param_token* %name, i64 0, i32 0
  store i8* %p.0, i8** %7, align 8, !tbaa !0
  br label %8

; <label>:8                                       ; preds = %.critedge, %6
  %p.1 = phi i8* [ %p.0, %6 ], [ %11, %.critedge ]
  %9 = load i8* %p.1, align 1, !tbaa !1
  switch i8 %9, label %.critedge [
    i8 0, label %.critedge64
    i8 32, label %.critedge64
    i8 13, label %.critedge64
    i8 12, label %.critedge64
    i8 11, label %.critedge64
    i8 10, label %.critedge64
    i8 9, label %.critedge64
    i8 61, label %.critedge64
  ]

.critedge:                                        ; preds = %8
  %10 = icmp eq i8 %9, %separator
  %11 = getelementptr inbounds i8* %p.1, i64 1
  br i1 %10, label %.critedge64, label %8

.critedge64:                                      ; preds = %.critedge, %8, %8, %8, %8, %8, %8, %8, %8
  %12 = getelementptr inbounds %struct.param_token* %name, i64 0, i32 1
  store i8* %p.1, i8** %12, align 8, !tbaa !0
  %13 = load i8** %7, align 8, !tbaa !0
  %14 = icmp eq i8* %13, %p.1
  br i1 %14, label %65, label %.preheader80

.preheader80:                                     ; preds = %switch.edge66, %.critedge64
  %p.2 = phi i8* [ %18, %switch.edge66 ], [ %p.1, %.critedge64 ]
  %15 = load i8* %p.2, align 1, !tbaa !1
  switch i8 %15, label %.critedge68 [
    i8 32, label %switch.edge66
    i8 12, label %switch.edge66
    i8 11, label %switch.edge66
    i8 10, label %switch.edge66
    i8 9, label %switch.edge66
    i8 13, label %switch.edge66
  ]

.critedge68:                                      ; preds = %.preheader80
  %16 = icmp eq i8 %15, %separator
  %17 = icmp eq i8 %15, 0
  %or.cond = or i1 %16, %17
  br i1 %or.cond, label %19, label %24

switch.edge66:                                    ; preds = %.preheader80, %.preheader80, %.preheader80, %.preheader80, %.preheader80, %.preheader80
  %18 = getelementptr inbounds i8* %p.2, i64 1
  br label %.preheader80

; <label>:19                                      ; preds = %.critedge68
  %20 = bitcast %struct.param_token* %value to i8*
  tail call void @llvm.memset.p0i8.i64(i8* %20, i8 0, i64 16, i32 8, i1 false)
  %21 = load i8* %p.2, align 1, !tbaa !1
  %22 = icmp eq i8 %21, %separator
  %23 = getelementptr inbounds i8* %p.2, i64 1
  %.p.2 = select i1 %22, i8* %23, i8* %p.2
  store i8* %.p.2, i8** %source, align 8, !tbaa !0
  br label %65

; <label>:24                                      ; preds = %.critedge68
  %25 = icmp eq i8 %15, 61
  br i1 %25, label %switch.edge69, label %65

switch.edge69:                                    ; preds = %switch.edge69, %switch.edge69, %switch.edge69, %switch.edge69, %switch.edge69, %switch.edge69, %24
  %p.2.pn = phi i8* [ %p.2, %24 ], [ %p.4, %switch.edge69 ], [ %p.4, %switch.edge69 ], [ %p.4, %switch.edge69 ], [ %p.4, %switch.edge69 ], [ %p.4, %switch.edge69 ], [ %p.4, %switch.edge69 ]
  %p.4 = getelementptr inbounds i8* %p.2.pn, i64 1
  %26 = load i8* %p.4, align 1, !tbaa !1
  switch i8 %26, label %48 [
    i8 32, label %switch.edge69
    i8 12, label %switch.edge69
    i8 11, label %switch.edge69
    i8 10, label %switch.edge69
    i8 9, label %switch.edge69
    i8 13, label %switch.edge69
    i8 34, label %27
  ]

; <label>:27                                      ; preds = %switch.edge69
  %28 = getelementptr inbounds i8* %p.2.pn, i64 2
  %29 = getelementptr inbounds %struct.param_token* %value, i64 0, i32 0
  store i8* %28, i8** %29, align 8, !tbaa !0
  br label %30

; <label>:30                                      ; preds = %30, %27
  %p.5 = phi i8* [ %28, %27 ], [ %34, %30 ]
  %31 = load i8* %p.5, align 1, !tbaa !1
  %32 = icmp eq i8 %31, 0
  %33 = icmp ne i8 %31, 34
  %not. = xor i1 %32, true
  %. = and i1 %33, %not.
  %34 = getelementptr inbounds i8* %p.5, i64 1
  br i1 %., label %30, label %35

; <label>:35                                      ; preds = %30
  br i1 %32, label %65, label %36

; <label>:36                                      ; preds = %35
  %37 = getelementptr inbounds %struct.param_token* %value, i64 0, i32 1
  store i8* %p.5, i8** %37, align 8, !tbaa !0
  br label %.critedge45

.critedge45:                                      ; preds = %.critedge45, %.critedge45, %.critedge45, %.critedge45, %.critedge45, %.critedge45, %36
  %p.5.pn = phi i8* [ %p.5, %36 ], [ %p.6, %.critedge45 ], [ %p.6, %.critedge45 ], [ %p.6, %.critedge45 ], [ %p.6, %.critedge45 ], [ %p.6, %.critedge45 ], [ %p.6, %.critedge45 ]
  %p.6 = getelementptr inbounds i8* %p.5.pn, i64 1
  %38 = load i8* %p.6, align 1, !tbaa !1
  switch i8 %38, label %.preheader [
    i8 32, label %.critedge45
    i8 13, label %.critedge45
    i8 12, label %.critedge45
    i8 11, label %.critedge45
    i8 10, label %.critedge45
    i8 9, label %.critedge45
  ]

.preheader:                                       ; preds = %.preheader, %.critedge45
  %p.7 = phi i8* [ %42, %.preheader ], [ %p.6, %.critedge45 ]
  %39 = load i8* %p.7, align 1, !tbaa !1
  %40 = icmp eq i8 %39, 0
  %41 = icmp ne i8 %39, %separator
  %not.74 = xor i1 %40, true
  %.72 = and i1 %41, %not.74
  %42 = getelementptr inbounds i8* %p.7, i64 1
  br i1 %.72, label %.preheader, label %43

; <label>:43                                      ; preds = %.preheader
  %44 = icmp eq i8 %39, %separator
  br i1 %44, label %45, label %47

; <label>:45                                      ; preds = %43
  %46 = getelementptr inbounds i8* %p.7, i64 1
  br label %64

; <label>:47                                      ; preds = %43
  br i1 %40, label %64, label %65

; <label>:48                                      ; preds = %switch.edge69
  %49 = getelementptr inbounds %struct.param_token* %value, i64 0, i32 0
  store i8* %p.4, i8** %49, align 8, !tbaa !0
  br label %50

; <label>:50                                      ; preds = %50, %48
  %p.8 = phi i8* [ %p.4, %48 ], [ %53, %50 ]
  %51 = load i8* %p.8, align 1, !tbaa !1
  %52 = icmp ne i8 %51, %separator
  %not.75 = icmp ne i8 %51, 0
  %.73 = and i1 %52, %not.75
  %53 = getelementptr inbounds i8* %p.8, i64 1
  br i1 %.73, label %50, label %54

; <label>:54                                      ; preds = %50
  %55 = getelementptr inbounds %struct.param_token* %value, i64 0, i32 1
  br label %.critedge55

.critedge55:                                      ; preds = %58, %58, %58, %58, %58, %58, %54
  %storemerge = phi i8* [ %p.8, %54 ], [ %59, %58 ], [ %59, %58 ], [ %59, %58 ], [ %59, %58 ], [ %59, %58 ], [ %59, %58 ]
  store i8* %storemerge, i8** %55, align 8
  %56 = load i8** %49, align 8, !tbaa !0
  %57 = icmp eq i8* %storemerge, %56
  br i1 %57, label %.critedge54, label %58

; <label>:58                                      ; preds = %.critedge55
  %59 = getelementptr inbounds i8* %storemerge, i64 -1
  %60 = load i8* %59, align 1, !tbaa !1
  switch i8 %60, label %.critedge54 [
    i8 32, label %.critedge55
    i8 13, label %.critedge55
    i8 12, label %.critedge55
    i8 11, label %.critedge55
    i8 10, label %.critedge55
    i8 9, label %.critedge55
  ]

.critedge54:                                      ; preds = %58, %.critedge55
  %61 = load i8* %p.8, align 1, !tbaa !1
  %62 = icmp eq i8 %61, %separator
  %63 = getelementptr inbounds i8* %p.8, i64 1
  %.p.8 = select i1 %62, i8* %63, i8* %p.8
  br label %64

; <label>:64                                      ; preds = %.critedge54, %47, %45
  %p.9 = phi i8* [ %46, %45 ], [ %p.7, %47 ], [ %.p.8, %.critedge54 ]
  store i8* %p.9, i8** %source, align 8, !tbaa !0
  br label %65

; <label>:65                                      ; preds = %64, %47, %35, %24, %19, %.critedge64, %5
  %.0 = phi i1 [ true, %19 ], [ true, %64 ], [ false, %5 ], [ false, %.critedge64 ], [ false, %24 ], [ false, %35 ], [ false, %47 ]
  ret i1 %.0
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define i32 @http_loop(%struct.url* %u, i8** nocapture %newloc, i8** %local_file, i8* %referer, i32* %dt, %struct.url* %proxy, %struct.iri* nocapture %iri) nounwind uwtable {
  %hstat = alloca %struct.http_stat, align 8
  %st = alloca %struct.stat, align 8
  %tmp = alloca [256 x i8], align 16
  %fl = alloca i8*, align 8
  %1 = icmp eq i8** %local_file, null
  br i1 %1, label %.thread, label %2

; <label>:2                                       ; preds = %0
  %3 = load i8** %local_file, align 8, !tbaa !0
  %4 = icmp eq i8* %3, null
  br i1 %4, label %6, label %5

; <label>:5                                       ; preds = %2
  call void @__assert(i8* getelementptr inbounds ([10 x i8]* @__func__.http_loop, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8]* @.str, i64 0, i64 0), i32 2433, i8* getelementptr inbounds ([42 x i8]* @.str1, i64 0, i64 0)) nounwind
  br label %6

; <label>:6                                       ; preds = %5, %2
  %7 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 36), align 8, !tbaa !0
  %8 = icmp eq i8* %7, null
  br i1 %8, label %.thread, label %9

; <label>:9                                       ; preds = %6
  %10 = load i8* %7, align 1, !tbaa !1
  %11 = icmp eq i8 %10, 45
  br i1 %11, label %12, label %16

; <label>:12                                      ; preds = %9
  %13 = getelementptr inbounds i8* %7, i64 1
  %14 = load i8* %13, align 1, !tbaa !1
  %15 = icmp eq i8 %14, 0
  br i1 %15, label %19, label %16

; <label>:16                                      ; preds = %12, %9
  %17 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 36), align 8, !tbaa !0
  %18 = call noalias i8* @xstrdup(i8* %17) nounwind
  br label %19

; <label>:19                                      ; preds = %16, %12
  %20 = phi i8* [ %18, %16 ], [ null, %12 ]
  store i8* %20, i8** %local_file, align 8, !tbaa !0
  br label %.thread

.thread:                                          ; preds = %19, %6, %0
  store i8* null, i8** %newloc, align 8, !tbaa !0
  %21 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 98), align 8, !tbaa !3, !range !4
  %22 = icmp eq i8 %21, 0
  br i1 %22, label %24, label %23

; <label>:23                                      ; preds = %.thread
  call fastcc void @load_cookies()
  br label %24

; <label>:24                                      ; preds = %23, %.thread
  %25 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 44), align 1, !tbaa !3, !range !4
  %26 = icmp eq i8 %25, 0
  br i1 %26, label %33, label %27

; <label>:27                                      ; preds = %24
  %28 = getelementptr inbounds %struct.url* %u, i64 0, i32 4
  %29 = load i8** %28, align 8, !tbaa !0
  %30 = call zeroext i1 @has_wildcards_p(i8* %29) nounwind
  br i1 %30, label %31, label %33

; <label>:31                                      ; preds = %27
  %32 = call i8* @libintl_gettext(i8* getelementptr inbounds ([43 x i8]* @.str2, i64 0, i64 0)) nounwind
  call void @logputs(i32 0, i8* %32) nounwind
  br label %33

; <label>:33                                      ; preds = %31, %27, %24
  %34 = bitcast %struct.http_stat* %hstat to i8*
  call void @llvm.memset.p0i8.i64(i8* %34, i8 0, i64 144, i32 8, i1 false)
  %35 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 12
  store i8* %referer, i8** %35, align 8, !tbaa !0
  %36 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 36), align 8, !tbaa !0
  %37 = icmp eq i8* %36, null
  br i1 %37, label %41, label %38

; <label>:38                                      ; preds = %33
  %39 = call noalias i8* @xstrdup(i8* %36) nounwind
  %40 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 13
  store i8* %39, i8** %40, align 8, !tbaa !0
  br label %47

; <label>:41                                      ; preds = %33
  %42 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 113), align 4, !tbaa !3, !range !4
  %43 = icmp eq i8 %42, 0
  br i1 %43, label %44, label %.thread21

; <label>:44                                      ; preds = %41
  %45 = call i8* @url_file_name(%struct.url* %u) nounwind
  %46 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 13
  store i8* %45, i8** %46, align 8, !tbaa !0
  br label %47

; <label>:47                                      ; preds = %44, %38
  %48 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 13
  %49 = load i8** %48, align 8, !tbaa !0
  %50 = call zeroext i1 @file_exists_p(i8* %49) nounwind
  br i1 %50, label %51, label %.thread21

; <label>:51                                      ; preds = %47
  %52 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 17), align 2, !tbaa !3, !range !4
  %.not = icmp eq i8 %52, 0
  %53 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 36), align 8, !tbaa !0
  %54 = icmp ne i8* %53, null
  %or.cond5 = or i1 %.not, %54
  br i1 %or.cond5, label %.thread21, label %55

; <label>:55                                      ; preds = %51
  %56 = call i8* @libintl_gettext(i8* getelementptr inbounds ([41 x i8]* @.str3, i64 0, i64 0)) nounwind
  %57 = load i8** %48, align 8, !tbaa !0
  %58 = call i8* @quote(i8* %57) nounwind
  call void (i32, i8*, ...)* @logprintf(i32 0, i8* %56, i8* %58) nounwind
  %59 = load i32* %dt, align 4, !tbaa !5
  %60 = or i32 %59, 2
  store i32 %60, i32* %dt, align 4, !tbaa !5
  %61 = load i8** %48, align 8, !tbaa !0
  %62 = call zeroext i1 @has_html_suffix_p(i8* %61) nounwind
  br i1 %62, label %63, label %.thread35

; <label>:63                                      ; preds = %55
  %64 = load i32* %dt, align 4, !tbaa !5
  %65 = or i32 %64, 1
  store i32 %65, i32* %dt, align 4, !tbaa !5
  br label %.thread35

.thread21:                                        ; preds = %51, %47, %41
  %66 = phi i1 [ true, %51 ], [ true, %47 ], [ false, %41 ]
  %got_name.019 = phi i8 [ 1, %51 ], [ 1, %47 ], [ 0, %41 ]
  store i32 0, i32* %dt, align 4, !tbaa !5
  %67 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 23), align 8, !tbaa !3, !range !4
  %68 = icmp eq i8 %67, 0
  br i1 %68, label %69, label %73

; <label>:69                                      ; preds = %.thread21
  %70 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 113), align 4, !tbaa !3, !range !4
  %71 = icmp eq i8 %70, 0
  %or.cond8 = or i1 %66, %71
  %72 = zext i1 %or.cond8 to i8
  %. = xor i8 %72, 1
  br label %73

; <label>:73                                      ; preds = %69, %.thread21
  %send_head_first.0 = phi i8 [ 1, %.thread21 ], [ %., %69 ]
  %74 = call i8* @url_file_name(%struct.url* %u) nounwind
  %75 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 72), align 1, !tbaa !3, !range !4
  %76 = icmp ne i8 %75, 0
  %77 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 113), align 4, !tbaa !3, !range !4
  %78 = icmp eq i8 %77, 0
  %or.cond10 = and i1 %76, %78
  br i1 %or.cond10, label %79, label %81

; <label>:79                                      ; preds = %73
  %80 = call zeroext i1 @file_exists_p(i8* %74) nounwind
  %.send_head_first.0 = select i1 %80, i8 1, i8 %send_head_first.0
  br label %81

; <label>:81                                      ; preds = %79, %73
  %send_head_first.1 = phi i8 [ %send_head_first.0, %73 ], [ %.send_head_first.0, %79 ]
  call void @free(i8* %74)
  %82 = and i8 %send_head_first.1, 1
  %83 = icmp ne i8 %82, 0
  %84 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 0
  %85 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 2
  %86 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 2
  %87 = icmp ne %struct.url* %proxy, null
  %88 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 5
  %89 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 8
  %90 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 6
  %91 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 16
  %92 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 15
  %93 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 6
  %94 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 18
  %95 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 1
  %96 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 17
  %97 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 6
  %98 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 10
  %99 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 11
  %100 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 0
  %101 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 1
  %102 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 3
  %103 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 4
  %104 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 4
  %105 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 0
  %106 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 1
  %107 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 13
  %108 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 6
  %109 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 3
  %110 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 13
  %111 = getelementptr inbounds %struct.stat* %st, i64 0, i32 2
  %112 = getelementptr inbounds %struct.stat* %st, i64 0, i32 10
  %113 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 2
  %114 = getelementptr inbounds [256 x i8]* %tmp, i64 0, i64 0
  br label %.critedge

.critedge:                                        ; preds = %493, %81
  %got_name.1 = phi i8 [ %got_name.019, %81 ], [ %got_name.2, %493 ]
  %time_came_from_head.0 = phi i8 [ 0, %81 ], [ %time_came_from_head.3, %493 ]
  %got_head.0 = phi i8 [ 0, %81 ], [ %got_head.2, %493 ]
  %count.0 = phi i32 [ 0, %81 ], [ %count.1, %493 ]
  %tmr.0 = phi i64 [ -1, %81 ], [ %tmr.5, %493 ]
  %115 = add nsw i32 %count.0, 1
  call void @sleep_between_retrievals(i32 %115) nounwind
  %116 = call i64 @time(i64* null) nounwind
  %117 = call i8* @datetime_str(i64 %116) nounwind
  %118 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 23), align 8, !tbaa !3, !range !4
  %119 = icmp eq i8 %118, 0
  br i1 %119, label %125, label %120

; <label>:120                                     ; preds = %.critedge
  %121 = and i8 %got_head.0, 1
  %122 = icmp eq i8 %121, 0
  br i1 %122, label %123, label %125

; <label>:123                                     ; preds = %120
  %124 = call i8* @libintl_gettext(i8* getelementptr inbounds ([51 x i8]* @.str4, i64 0, i64 0)) nounwind
  call void (i32, i8*, ...)* @logprintf(i32 0, i8* %124) nounwind
  br label %125

; <label>:125                                     ; preds = %123, %120, %.critedge
  %126 = load i32* getelementptr inbounds (%struct.options* @opt, i64 0, i32 0), align 8, !tbaa !5
  %127 = icmp eq i32 %126, 0
  br i1 %127, label %136, label %128

; <label>:128                                     ; preds = %125
  %129 = call i8* @url_string(%struct.url* %u, i32 1) nounwind
  %130 = icmp sgt i32 %count.0, 0
  br i1 %130, label %131, label %134

; <label>:131                                     ; preds = %128
  %132 = call i8* @libintl_gettext(i8* getelementptr inbounds ([10 x i8]* @.str5, i64 0, i64 0)) nounwind
  %133 = call i32 (i8*, i8*, ...)* @sprintf(i8* %114, i8* %132, i32 %115) nounwind
  call void (i32, i8*, ...)* @logprintf(i32 1, i8* getelementptr inbounds ([16 x i8]* @.str6, i64 0, i64 0), i8* %117, i8* %114, i8* %129) nounwind
  br label %135

; <label>:134                                     ; preds = %128
  call void (i32, i8*, ...)* @logprintf(i32 1, i8* getelementptr inbounds ([12 x i8]* @.str7, i64 0, i64 0), i8* %117, i8* %129) nounwind
  br label %135

; <label>:135                                     ; preds = %134, %131
  call void @free(i8* %129)
  br label %136

; <label>:136                                     ; preds = %135, %125
  br i1 %83, label %137, label %143

; <label>:137                                     ; preds = %136
  %138 = and i8 %got_head.0, 1
  %139 = icmp eq i8 %138, 0
  br i1 %139, label %140, label %143

; <label>:140                                     ; preds = %137
  %141 = load i32* %dt, align 4, !tbaa !5
  %142 = or i32 %141, 4
  br label %146

; <label>:143                                     ; preds = %137, %136
  %144 = load i32* %dt, align 4, !tbaa !5
  %145 = and i32 %144, -5
  br label %146

; <label>:146                                     ; preds = %143, %140
  %storemerge = phi i32 [ %145, %143 ], [ %142, %140 ]
  store i32 %storemerge, i32* %dt, align 4
  %147 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 40), align 1, !tbaa !3, !range !4
  %148 = icmp eq i8 %147, 0
  br i1 %148, label %162, label %149

; <label>:149                                     ; preds = %146
  %150 = and i8 %got_name.1, 1
  %151 = icmp eq i8 %150, 0
  br i1 %151, label %162, label %152

; <label>:152                                     ; preds = %149
  %153 = load i8** %110, align 8, !tbaa !0
  %154 = call i32 @stat(i8* %153, %struct.stat* %st) nounwind
  %155 = icmp eq i32 %154, 0
  br i1 %155, label %156, label %162

; <label>:156                                     ; preds = %152
  %157 = load i16* %111, align 8, !tbaa !6
  %158 = and i16 %157, -4096
  %159 = icmp eq i16 %158, -32768
  br i1 %159, label %160, label %162

; <label>:160                                     ; preds = %156
  %161 = load i64* %112, align 8, !tbaa !7
  store i64 %161, i64* %113, align 8, !tbaa !8
  br label %167

; <label>:162                                     ; preds = %156, %152, %149, %146
  %163 = icmp sgt i32 %count.0, 0
  br i1 %163, label %164, label %166

; <label>:164                                     ; preds = %162
  %165 = load i64* %84, align 8, !tbaa !8
  store i64 %165, i64* %85, align 8, !tbaa !8
  br label %167

; <label>:166                                     ; preds = %162
  store i64 0, i64* %86, align 8, !tbaa !8
  br label %167

; <label>:167                                     ; preds = %166, %164, %160
  %168 = icmp sgt i32 %count.0, 0
  %or.cond11 = and i1 %87, %168
  %169 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 51), align 2, !tbaa !3, !range !4
  %170 = icmp eq i8 %169, 0
  %or.cond13 = or i1 %or.cond11, %170
  %171 = load i32* %dt, align 4, !tbaa !5
  %172 = or i32 %171, 8
  %173 = and i32 %171, -9
  %storemerge6 = select i1 %or.cond13, i32 %172, i32 %173
  store i32 %storemerge6, i32* %dt, align 4
  %174 = call fastcc i32 @gethttp(%struct.url* %u, %struct.http_stat* %hstat, i32* %dt, %struct.url* %proxy)
  %175 = call i64 @time(i64* null) nounwind
  %176 = call i8* @datetime_str(i64 %175) nounwind
  %177 = load i8** %88, align 8, !tbaa !0
  %178 = icmp eq i8* %177, null
  br i1 %178, label %181, label %179

; <label>:179                                     ; preds = %167
  %180 = call noalias i8* @xstrdup(i8* %177) nounwind
  store i8* %180, i8** %newloc, align 8, !tbaa !0
  br label %181

; <label>:181                                     ; preds = %179, %167
  switch i32 %174, label %201 [
    i32 30, label %182
    i32 29, label %182
    i32 2, label %182
    i32 9, label %182
    i32 3, label %182
    i32 40, label %182
    i32 52, label %182
    i32 44, label %182
    i32 25, label %182
    i32 26, label %.loopexit
    i32 24, label %.loopexit
    i32 39, label %202
    i32 38, label %.thread35
    i32 6, label %194
    i32 4, label %192
    i32 1, label %.thread39
    i32 5, label %.thread39
    i32 37, label %.thread39
    i32 49, label %.thread39
    i32 50, label %.thread39
    i32 53, label %.thread39
    i32 54, label %.thread39
  ]

; <label>:182                                     ; preds = %181, %181, %181, %181, %181, %181, %181, %181, %181
  %183 = load i32* getelementptr inbounds (%struct.options* @opt, i64 0, i32 2), align 8, !tbaa !5
  call void @printwhat(i32 %115, i32 %183) nounwind
  br label %493

.loopexit:                                        ; preds = %181, %181
  call void @logputs(i32 0, i8* getelementptr inbounds ([2 x i8]* @.str8, i64 0, i64 0)) nounwind
  %184 = call i8* @libintl_gettext(i8* getelementptr inbounds ([26 x i8]* @.str9, i64 0, i64 0)) nounwind
  %185 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 13
  %186 = load i8** %185, align 8, !tbaa !0
  %187 = call i8* @quote(i8* %186) nounwind
  %188 = call i32* @__error() nounwind
  %189 = load i32* %188, align 4, !tbaa !5
  %190 = call i8* @strerror(i32 %189) nounwind
  call void (i32, i8*, ...)* @logprintf(i32 1, i8* %184, i8* %187, i8* %190) nounwind
  %191 = icmp eq i32 %174, 31
  br i1 %191, label %.thread35, label %.thread39

; <label>:192                                     ; preds = %181
  %193 = call i8* @libintl_gettext(i8* getelementptr inbounds ([37 x i8]* @.str10, i64 0, i64 0)) nounwind
  call void (i32, i8*, ...)* @logprintf(i32 1, i8* %193) nounwind
  br label %.thread39

; <label>:194                                     ; preds = %181
  %195 = load i8** %newloc, align 8, !tbaa !0
  %196 = icmp eq i8* %195, null
  br i1 %196, label %197, label %.thread39

; <label>:197                                     ; preds = %194
  %198 = call i8* @libintl_gettext(i8* getelementptr inbounds ([43 x i8]* @.str11, i64 0, i64 0)) nounwind
  %199 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 8
  %200 = load i32* %199, align 8, !tbaa !5
  call void (i32, i8*, ...)* @logprintf(i32 1, i8* %198, i32 %200) nounwind
  br label %.thread39

; <label>:201                                     ; preds = %181
  call void @abort() noreturn nounwind
  unreachable

; <label>:202                                     ; preds = %181
  %203 = load i32* %dt, align 4, !tbaa !5
  %204 = and i32 %203, 2
  %205 = icmp eq i32 %204, 0
  br i1 %205, label %206, label %240

; <label>:206                                     ; preds = %202
  %207 = load i32* getelementptr inbounds (%struct.options* @opt, i64 0, i32 0), align 8, !tbaa !5
  %208 = icmp eq i32 %207, 0
  br i1 %208, label %209, label %211

; <label>:209                                     ; preds = %206
  %210 = call i8* @url_string(%struct.url* %u, i32 1) nounwind
  call void (i32, i8*, ...)* @logprintf(i32 2, i8* getelementptr inbounds ([5 x i8]* @.str12, i64 0, i64 0), i8* %210) nounwind
  br label %211

; <label>:211                                     ; preds = %209, %206
  %hurl1.0 = phi i8* [ null, %206 ], [ %210, %209 ]
  %212 = load i32* %dt, align 4, !tbaa !5
  %213 = and i32 %212, 4
  %214 = icmp eq i32 %213, 0
  br i1 %214, label %217, label %215

; <label>:215                                     ; preds = %211
  %216 = load i32* %89, align 8, !tbaa !5
  %.off = add i32 %216, -500
  %switch = icmp ult i32 %.off, 2
  br i1 %switch, label %493, label %217

; <label>:217                                     ; preds = %215, %211
  %218 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 23), align 8, !tbaa !3, !range !4
  %219 = icmp eq i8 %218, 0
  br i1 %219, label %230, label %220

; <label>:220                                     ; preds = %217
  %221 = getelementptr inbounds %struct.iri* %iri, i64 0, i32 3
  %222 = load i8* %221, align 1, !tbaa !3, !range !4
  %223 = icmp eq i8 %222, 0
  br i1 %223, label %224, label %230

; <label>:224                                     ; preds = %220
  %225 = icmp eq i8* %hurl1.0, null
  br i1 %225, label %226, label %228

; <label>:226                                     ; preds = %224
  %227 = call i8* @url_string(%struct.url* %u, i32 1) nounwind
  br label %228

; <label>:228                                     ; preds = %226, %224
  %hurl1.1 = phi i8* [ %hurl1.0, %224 ], [ %227, %226 ]
  call void @nonexisting_url(i8* %hurl1.1) nounwind
  %229 = call i8* @libintl_gettext(i8* getelementptr inbounds ([46 x i8]* @.str13, i64 0, i64 0)) nounwind
  call void (i32, i8*, ...)* @logprintf(i32 1, i8* %229) nounwind
  br label %237

; <label>:230                                     ; preds = %220, %217
  %231 = call i8* @libintl_gettext(i8* getelementptr inbounds ([18 x i8]* @.str14, i64 0, i64 0)) nounwind
  %232 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 8
  %233 = load i32* %232, align 8, !tbaa !5
  %234 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 7
  %235 = load i8** %234, align 8, !tbaa !0
  %236 = call i8* @quotearg_style(i32 5, i8* %235) nounwind
  call void (i32, i8*, ...)* @logprintf(i32 1, i8* %231, i8* %176, i32 %233, i8* %236) nounwind
  br label %237

; <label>:237                                     ; preds = %230, %228
  %hurl1.2 = phi i8* [ %hurl1.0, %230 ], [ %hurl1.1, %228 ]
  call void @logputs(i32 0, i8* getelementptr inbounds ([2 x i8]* @.str8, i64 0, i64 0)) nounwind
  %238 = icmp eq i8* %hurl1.2, null
  br i1 %238, label %.thread39, label %239

; <label>:239                                     ; preds = %237
  call void @free(i8* %hurl1.2)
  br label %.thread39

; <label>:240                                     ; preds = %202
  %241 = and i8 %got_head.0, 1
  %242 = icmp eq i8 %241, 0
  br i1 %242, label %243, label %329

; <label>:243                                     ; preds = %240
  %244 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 72), align 1, !tbaa !3, !range !4
  %245 = icmp eq i8 %244, 0
  br i1 %245, label %251, label %246

; <label>:246                                     ; preds = %243
  %247 = load i8** %97, align 8, !tbaa !0
  %248 = icmp eq i8* %247, null
  br i1 %248, label %249, label %.thread131

; <label>:249                                     ; preds = %246
  %250 = call i8* @libintl_gettext(i8* getelementptr inbounds ([57 x i8]* @.str15, i64 0, i64 0)) nounwind
  call void @logputs(i32 1, i8* %250) nounwind
  br label %262

; <label>:251                                     ; preds = %243
  %.pr = load i8** %90, align 8, !tbaa !0
  %252 = icmp eq i8* %.pr, null
  br i1 %252, label %262, label %.thread131

.thread131:                                       ; preds = %251, %246
  %253 = phi i8* [ %.pr, %251 ], [ %247, %246 ]
  %254 = call i64 @http_atotm(i8* %253)
  %255 = icmp eq i64 %254, -1
  br i1 %255, label %256, label %258

; <label>:256                                     ; preds = %.thread131
  %257 = call i8* @libintl_gettext(i8* getelementptr inbounds ([53 x i8]* @.str16, i64 0, i64 0)) nounwind
  call void @logputs(i32 0, i8* %257) nounwind
  br label %258

; <label>:258                                     ; preds = %256, %.thread131
  %259 = load i32* %dt, align 4, !tbaa !5
  %260 = and i32 %259, 4
  %261 = icmp eq i32 %260, 0
  %time_came_from_head.0. = select i1 %261, i8 %time_came_from_head.0, i8 1
  br label %262

; <label>:262                                     ; preds = %258, %251, %249
  %time_came_from_head.1 = phi i8 [ %time_came_from_head.0, %251 ], [ %time_came_from_head.0, %249 ], [ %time_came_from_head.0., %258 ]
  %tmr.1 = phi i64 [ %tmr.0, %251 ], [ %tmr.0, %249 ], [ %254, %258 ]
  br i1 %83, label %263, label %329

; <label>:263                                     ; preds = %262
  %264 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 72), align 1, !tbaa !3, !range !4
  %265 = icmp eq i8 %264, 0
  br i1 %265, label %294, label %266

; <label>:266                                     ; preds = %263
  %267 = load i8** %91, align 8, !tbaa !0
  %268 = icmp eq i8* %267, null
  br i1 %268, label %293, label %269

; <label>:269                                     ; preds = %266
  %270 = load i8** %93, align 8, !tbaa !0
  %271 = icmp eq i8* %270, null
  %272 = icmp eq i64 %tmr.1, -1
  %or.cond14 = or i1 %271, %272
  br i1 %or.cond14, label %293, label %273

; <label>:273                                     ; preds = %269
  %274 = load i64* %94, align 8, !tbaa !7
  %275 = icmp slt i64 %274, %tmr.1
  br i1 %275, label %290, label %276

; <label>:276                                     ; preds = %273
  %277 = load i64* %95, align 8, !tbaa !8
  %278 = icmp eq i64 %277, -1
  br i1 %278, label %282, label %279

; <label>:279                                     ; preds = %276
  %280 = load i64* %96, align 8, !tbaa !8
  %281 = icmp eq i64 %280, %277
  br i1 %281, label %282, label %286

; <label>:282                                     ; preds = %279, %276
  %283 = call i8* @libintl_gettext(i8* getelementptr inbounds ([61 x i8]* @.str17, i64 0, i64 0)) nounwind
  %284 = load i8** %91, align 8, !tbaa !0
  %285 = call i8* @quote(i8* %284) nounwind
  call void (i32, i8*, ...)* @logprintf(i32 0, i8* %283, i8* %285) nounwind
  br label %.thread35

; <label>:286                                     ; preds = %279
  %287 = call i8* @libintl_gettext(i8* getelementptr inbounds ([50 x i8]* @.str18, i64 0, i64 0)) nounwind
  %288 = load i64* %96, align 8, !tbaa !8
  %289 = call i8* @number_to_static_string(i64 %288) nounwind
  call void (i32, i8*, ...)* @logprintf(i32 0, i8* %287, i8* %289) nounwind
  br label %292

; <label>:290                                     ; preds = %273
  %291 = call i8* @libintl_gettext(i8* getelementptr inbounds ([35 x i8]* @.str19, i64 0, i64 0)) nounwind
  call void @logputs(i32 0, i8* %291) nounwind
  br label %292

; <label>:292                                     ; preds = %290, %286
  call void @logputs(i32 0, i8* getelementptr inbounds ([2 x i8]* @.str8, i64 0, i64 0)) nounwind
  br label %293

; <label>:293                                     ; preds = %292, %269, %266
  store i8 1, i8* %92, align 1, !tbaa !3
  br label %294

; <label>:294                                     ; preds = %293, %263
  %295 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 23), align 8, !tbaa !3, !range !4
  %296 = icmp eq i8 %295, 0
  br i1 %296, label %326, label %297

; <label>:297                                     ; preds = %294
  %298 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 6), align 1, !tbaa !3, !range !4
  %299 = icmp eq i8 %298, 0
  %300 = load i32* %dt, align 4, !tbaa !5
  %301 = and i32 %300, 1
  %302 = icmp ne i32 %301, 0
  br i1 %299, label %306, label %303

; <label>:303                                     ; preds = %297
  br i1 %302, label %311, label %304

; <label>:304                                     ; preds = %303
  %305 = call i8* @libintl_gettext(i8* getelementptr inbounds ([70 x i8]* @.str21, i64 0, i64 0)) nounwind
  call void (i32, i8*, ...)* @logprintf(i32 0, i8* %305) nounwind
  br label %313

; <label>:306                                     ; preds = %297
  br i1 %302, label %307, label %309

; <label>:307                                     ; preds = %306
  %308 = call i8* @libintl_gettext(i8* getelementptr inbounds ([99 x i8]* @.str22, i64 0, i64 0)) nounwind
  call void (i32, i8*, ...)* @logprintf(i32 0, i8* %308) nounwind
  br label %313

; <label>:309                                     ; preds = %306
  %310 = call i8* @libintl_gettext(i8* getelementptr inbounds ([22 x i8]* @.str23, i64 0, i64 0)) nounwind
  call void (i32, i8*, ...)* @logprintf(i32 0, i8* %310) nounwind
  br label %313

; <label>:311                                     ; preds = %303
  %312 = call i8* @libintl_gettext(i8* getelementptr inbounds ([79 x i8]* @.str20, i64 0, i64 0)) nounwind
  call void @logputs(i32 0, i8* %312) nounwind
  br label %326

; <label>:313                                     ; preds = %309, %307, %304
  %314 = call i8* @libintl_gettext(i8* getelementptr inbounds ([19 x i8]* @.str24, i64 0, i64 0)) nounwind
  %315 = getelementptr inbounds %struct.url* %u, i64 0, i32 0
  %316 = load i8** %315, align 8, !tbaa !0
  %317 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 8
  %318 = load i32* %317, align 8, !tbaa !5
  %319 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 9
  %320 = load i8** %319, align 8, !tbaa !0
  %321 = icmp eq i8* %320, null
  br i1 %321, label %324, label %322

; <label>:322                                     ; preds = %313
  %323 = call i8* @quotearg_style(i32 5, i8* %320) nounwind
  br label %324

; <label>:324                                     ; preds = %322, %313
  %325 = phi i8* [ %323, %322 ], [ getelementptr inbounds ([1 x i8]* @.str25, i64 0, i64 0), %313 ]
  call void (i32, i8*, ...)* @logprintf(i32 2, i8* %314, i8* %176, i8* %316, i32 %318, i8* %325) nounwind
  br label %.thread35

; <label>:326                                     ; preds = %311, %294
  %327 = load i32* %dt, align 4, !tbaa !5
  %328 = and i32 %327, -5
  store i32 %328, i32* %dt, align 4, !tbaa !5
  br label %493

; <label>:329                                     ; preds = %262, %240
  %time_came_from_head.2 = phi i8 [ %time_came_from_head.0, %240 ], [ %time_came_from_head.1, %262 ]
  %got_head.1 = phi i8 [ %got_head.0, %240 ], [ 1, %262 ]
  %tmr.2 = phi i64 [ %tmr.0, %240 ], [ %tmr.1, %262 ]
  %330 = icmp eq i64 %tmr.2, -1
  br i1 %330, label %357, label %331

; <label>:331                                     ; preds = %329
  %332 = load i64* %105, align 8, !tbaa !8
  %333 = load i64* %106, align 8, !tbaa !8
  %334 = icmp eq i64 %332, %333
  br i1 %334, label %339, label %335

; <label>:335                                     ; preds = %331
  %336 = load i32* %109, align 8, !tbaa !5
  %337 = icmp eq i32 %336, 0
  %338 = icmp eq i64 %333, -1
  %or.cond15 = and i1 %337, %338
  br i1 %or.cond15, label %339, label %357

; <label>:339                                     ; preds = %335, %331
  store i8* null, i8** %fl, align 8, !tbaa !0
  %340 = load i8** %107, align 8, !tbaa !0
  call void @set_local_file(i8** %fl, i8* %340) nounwind
  %341 = load i8** %fl, align 8, !tbaa !0
  %342 = icmp eq i8* %341, null
  br i1 %342, label %357, label %343

; <label>:343                                     ; preds = %339
  %344 = and i8 %time_came_from_head.2, 1
  %345 = icmp eq i8 %344, 0
  br i1 %345, label %355, label %346

; <label>:346                                     ; preds = %343
  %347 = load i8** %108, align 8, !tbaa !0
  %348 = icmp eq i8* %347, null
  br i1 %348, label %355, label %349

; <label>:349                                     ; preds = %346
  %350 = load i8* %347, align 1, !tbaa !1
  %351 = icmp eq i8 %350, 0
  br i1 %351, label %355, label %352

; <label>:352                                     ; preds = %349
  %353 = call i64 @http_atotm(i8* %347)
  %354 = icmp eq i64 %353, -1
  %tmr.2. = select i1 %354, i64 %tmr.2, i64 %353
  br label %355

; <label>:355                                     ; preds = %352, %349, %346, %343
  %tmr.3 = phi i64 [ %tmr.2, %349 ], [ %tmr.2, %346 ], [ %tmr.2, %343 ], [ %tmr.2., %352 ]
  %356 = load i8** %fl, align 8, !tbaa !0
  call void @touch(i8* %356, i64 %tmr.3) nounwind
  br label %357

; <label>:357                                     ; preds = %355, %339, %335, %329
  %tmr.4 = phi i64 [ %tmr.3, %355 ], [ %tmr.2, %339 ], [ %tmr.2, %335 ], [ -1, %329 ]
  %358 = load i64* %98, align 8, !tbaa !8
  %359 = load double* %99, align 8, !tbaa !9
  %360 = call i8* @retr_rate(i64 %358, double %359) nounwind
  %361 = load double* %99, align 8, !tbaa !9
  %362 = load double* @total_download_time, align 8, !tbaa !9
  %363 = fadd double %362, %361
  store double %363, double* @total_download_time, align 8, !tbaa !9
  %364 = load i64* %100, align 8, !tbaa !8
  %365 = load i64* %101, align 8, !tbaa !8
  %366 = icmp eq i64 %364, %365
  br i1 %366, label %367, label %416

; <label>:367                                     ; preds = %357
  %368 = load i32* %dt, align 4, !tbaa !5
  %369 = and i32 %368, 2
  %370 = icmp eq i32 %369, 0
  br i1 %370, label %401, label %371

; <label>:371                                     ; preds = %367
  %372 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 36), align 8, !tbaa !0
  %373 = icmp eq i8* %372, null
  br i1 %373, label %.thread24, label %374

; <label>:374                                     ; preds = %371
  %375 = load i8* %372, align 1, !tbaa !1
  %376 = icmp eq i8 %375, 45
  br i1 %376, label %377, label %.thread24

; <label>:377                                     ; preds = %374
  %378 = getelementptr inbounds i8* %372, i64 1
  %379 = load i8* %378, align 1, !tbaa !1
  %380 = icmp eq i8 %379, 0
  br i1 %380, label %.thread25, label %.thread24

.thread25:                                        ; preds = %377
  %381 = call i8* @libintl_gettext(i8* getelementptr inbounds ([40 x i8]* @.str26, i64 0, i64 0)) nounwind
  br label %386

.thread24:                                        ; preds = %377, %374, %371
  %382 = call i8* @libintl_gettext(i8* getelementptr inbounds ([29 x i8]* @.str27, i64 0, i64 0)) nounwind
  %383 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 13
  %384 = load i8** %383, align 8, !tbaa !0
  %385 = call i8* @quote(i8* %384) nounwind
  br label %386

; <label>:386                                     ; preds = %.thread24, %.thread25
  %387 = phi i8* [ %382, %.thread24 ], [ %381, %.thread25 ]
  %388 = phi i8* [ %385, %.thread24 ], [ getelementptr inbounds ([1 x i8]* @.str25, i64 0, i64 0), %.thread25 ]
  %389 = load i64* %100, align 8, !tbaa !8
  %390 = call i8* @number_to_static_string(i64 %389) nounwind
  %391 = load i64* %101, align 8, !tbaa !8
  %392 = call i8* @number_to_static_string(i64 %391) nounwind
  call void (i32, i8*, ...)* @logprintf(i32 0, i8* %387, i8* %176, i8* %360, i8* %388, i8* %390, i8* %392) nounwind
  %393 = getelementptr inbounds %struct.url* %u, i64 0, i32 0
  %394 = load i8** %393, align 8, !tbaa !0
  %395 = load i64* %100, align 8, !tbaa !8
  %396 = call i8* @number_to_static_string(i64 %395) nounwind
  %397 = load i64* %101, align 8, !tbaa !8
  %398 = call i8* @number_to_static_string(i64 %397) nounwind
  %399 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 13
  %400 = load i8** %399, align 8, !tbaa !0
  call void (i32, i8*, ...)* @logprintf(i32 2, i8* getelementptr inbounds ([32 x i8]* @.str28, i64 0, i64 0), i8* %176, i8* %394, i8* %396, i8* %398, i8* %400, i32 %115) nounwind
  br label %401

; <label>:401                                     ; preds = %386, %367
  %402 = load i32* @numurls, align 4, !tbaa !5
  %403 = add nsw i32 %402, 1
  store i32 %403, i32* @numurls, align 4, !tbaa !5
  %404 = load i64* %100, align 8, !tbaa !8
  %405 = load i64* @total_downloaded_bytes, align 8, !tbaa !8
  %406 = add nsw i64 %405, %404
  store i64 %406, i64* @total_downloaded_bytes, align 8, !tbaa !8
  %407 = load i32* %dt, align 4, !tbaa !5
  %408 = and i32 %407, 32
  %409 = icmp eq i32 %408, 0
  %410 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 13
  %411 = load i8** %410, align 8, !tbaa !0
  br i1 %409, label %414, label %412

; <label>:412                                     ; preds = %401
  %413 = call i32 @downloaded_file(i32 2, i8* %411) nounwind
  br label %.thread35

; <label>:414                                     ; preds = %401
  %415 = call i32 @downloaded_file(i32 1, i8* %411) nounwind
  br label %.thread35

; <label>:416                                     ; preds = %357
  %417 = load i32* %102, align 8, !tbaa !5
  %418 = icmp eq i32 %417, 0
  %419 = icmp eq i64 %365, -1
  br i1 %418, label %420, label %478

; <label>:420                                     ; preds = %416
  br i1 %419, label %421, label %466

; <label>:421                                     ; preds = %420
  %422 = load i32* %dt, align 4, !tbaa !5
  %423 = and i32 %422, 2
  %424 = icmp eq i32 %423, 0
  br i1 %424, label %451, label %425

; <label>:425                                     ; preds = %421
  %426 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 36), align 8, !tbaa !0
  %427 = icmp eq i8* %426, null
  br i1 %427, label %.thread29, label %428

; <label>:428                                     ; preds = %425
  %429 = load i8* %426, align 1, !tbaa !1
  %430 = icmp eq i8 %429, 45
  br i1 %430, label %431, label %.thread29

; <label>:431                                     ; preds = %428
  %432 = getelementptr inbounds i8* %426, i64 1
  %433 = load i8* %432, align 1, !tbaa !1
  %434 = icmp eq i8 %433, 0
  br i1 %434, label %.thread30, label %.thread29

.thread30:                                        ; preds = %431
  %435 = call i8* @libintl_gettext(i8* getelementptr inbounds ([37 x i8]* @.str29, i64 0, i64 0)) nounwind
  br label %440

.thread29:                                        ; preds = %431, %428, %425
  %436 = call i8* @libintl_gettext(i8* getelementptr inbounds ([26 x i8]* @.str30, i64 0, i64 0)) nounwind
  %437 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 13
  %438 = load i8** %437, align 8, !tbaa !0
  %439 = call i8* @quote(i8* %438) nounwind
  br label %440

; <label>:440                                     ; preds = %.thread29, %.thread30
  %441 = phi i8* [ %436, %.thread29 ], [ %435, %.thread30 ]
  %442 = phi i8* [ %439, %.thread29 ], [ getelementptr inbounds ([1 x i8]* @.str25, i64 0, i64 0), %.thread30 ]
  %443 = load i64* %100, align 8, !tbaa !8
  %444 = call i8* @number_to_static_string(i64 %443) nounwind
  call void (i32, i8*, ...)* @logprintf(i32 0, i8* %441, i8* %176, i8* %360, i8* %442, i8* %444) nounwind
  %445 = getelementptr inbounds %struct.url* %u, i64 0, i32 0
  %446 = load i8** %445, align 8, !tbaa !0
  %447 = load i64* %100, align 8, !tbaa !8
  %448 = call i8* @number_to_static_string(i64 %447) nounwind
  %449 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 13
  %450 = load i8** %449, align 8, !tbaa !0
  call void (i32, i8*, ...)* @logprintf(i32 2, i8* getelementptr inbounds ([29 x i8]* @.str31, i64 0, i64 0), i8* %176, i8* %446, i8* %448, i8* %450, i32 %115) nounwind
  br label %451

; <label>:451                                     ; preds = %440, %421
  %452 = load i32* @numurls, align 4, !tbaa !5
  %453 = add nsw i32 %452, 1
  store i32 %453, i32* @numurls, align 4, !tbaa !5
  %454 = load i64* %100, align 8, !tbaa !8
  %455 = load i64* @total_downloaded_bytes, align 8, !tbaa !8
  %456 = add nsw i64 %455, %454
  store i64 %456, i64* @total_downloaded_bytes, align 8, !tbaa !8
  %457 = load i32* %dt, align 4, !tbaa !5
  %458 = and i32 %457, 32
  %459 = icmp eq i32 %458, 0
  %460 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 13
  %461 = load i8** %460, align 8, !tbaa !0
  br i1 %459, label %464, label %462

; <label>:462                                     ; preds = %451
  %463 = call i32 @downloaded_file(i32 2, i8* %461) nounwind
  br label %.thread35

; <label>:464                                     ; preds = %451
  %465 = call i32 @downloaded_file(i32 1, i8* %461) nounwind
  br label %.thread35

; <label>:466                                     ; preds = %420
  %467 = icmp slt i64 %364, %365
  br i1 %467, label %468, label %473

; <label>:468                                     ; preds = %466
  %469 = call i8* @libintl_gettext(i8* getelementptr inbounds ([41 x i8]* @.str32, i64 0, i64 0)) nounwind
  %470 = load i64* %100, align 8, !tbaa !8
  %471 = call i8* @number_to_static_string(i64 %470) nounwind
  call void (i32, i8*, ...)* @logprintf(i32 0, i8* %469, i8* %176, i8* %360, i8* %471) nounwind
  %472 = load i32* getelementptr inbounds (%struct.options* @opt, i64 0, i32 2), align 8, !tbaa !5
  call void @printwhat(i32 %115, i32 %472) nounwind
  br label %493

; <label>:473                                     ; preds = %466
  %474 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 2
  %475 = load i64* %474, align 8, !tbaa !8
  %476 = icmp eq i64 %364, %475
  br i1 %476, label %.thread35, label %477

; <label>:477                                     ; preds = %473
  call void @abort() noreturn nounwind
  unreachable

; <label>:478                                     ; preds = %416
  br i1 %419, label %479, label %485

; <label>:479                                     ; preds = %478
  %480 = call i8* @libintl_gettext(i8* getelementptr inbounds ([38 x i8]* @.str33, i64 0, i64 0)) nounwind
  %481 = load i64* %100, align 8, !tbaa !8
  %482 = call i8* @number_to_static_string(i64 %481) nounwind
  %483 = load i8** %103, align 8, !tbaa !0
  call void (i32, i8*, ...)* @logprintf(i32 0, i8* %480, i8* %176, i8* %360, i8* %482, i8* %483) nounwind
  %484 = load i32* getelementptr inbounds (%struct.options* @opt, i64 0, i32 2), align 8, !tbaa !5
  call void @printwhat(i32 %115, i32 %484) nounwind
  br label %493

; <label>:485                                     ; preds = %478
  %486 = call i8* @libintl_gettext(i8* getelementptr inbounds ([42 x i8]* @.str34, i64 0, i64 0)) nounwind
  %487 = load i64* %100, align 8, !tbaa !8
  %488 = call i8* @number_to_static_string(i64 %487) nounwind
  %489 = load i64* %101, align 8, !tbaa !8
  %490 = call i8* @number_to_static_string(i64 %489) nounwind
  %491 = load i8** %104, align 8, !tbaa !0
  call void (i32, i8*, ...)* @logprintf(i32 0, i8* %486, i8* %176, i8* %360, i8* %488, i8* %490, i8* %491) nounwind
  %492 = load i32* getelementptr inbounds (%struct.options* @opt, i64 0, i32 2), align 8, !tbaa !5
  call void @printwhat(i32 %115, i32 %492) nounwind
  br label %493

; <label>:493                                     ; preds = %485, %479, %468, %326, %215, %182
  %got_name.2 = phi i8 [ %got_name.1, %468 ], [ %got_name.1, %479 ], [ %got_name.1, %485 ], [ 1, %326 ], [ %got_name.1, %182 ], [ %got_name.1, %215 ]
  %time_came_from_head.3 = phi i8 [ %time_came_from_head.2, %468 ], [ %time_came_from_head.2, %479 ], [ %time_came_from_head.2, %485 ], [ %time_came_from_head.1, %326 ], [ %time_came_from_head.0, %182 ], [ %time_came_from_head.0, %215 ]
  %got_head.2 = phi i8 [ %got_head.1, %468 ], [ %got_head.1, %479 ], [ %got_head.1, %485 ], [ 1, %326 ], [ %got_head.0, %182 ], [ 1, %215 ]
  %count.1 = phi i32 [ %115, %468 ], [ %115, %479 ], [ %115, %485 ], [ 0, %326 ], [ %115, %182 ], [ %115, %215 ]
  %tmr.5 = phi i64 [ %tmr.4, %468 ], [ %tmr.4, %479 ], [ %tmr.4, %485 ], [ %tmr.1, %326 ], [ %tmr.0, %182 ], [ %tmr.0, %215 ]
  %494 = load i32* getelementptr inbounds (%struct.options* @opt, i64 0, i32 2), align 8, !tbaa !5
  %495 = icmp eq i32 %494, 0
  %496 = icmp slt i32 %count.1, %494
  %or.cond16 = or i1 %495, %496
  br i1 %or.cond16, label %.critedge, label %.thread39

.thread35:                                        ; preds = %473, %464, %462, %414, %412, %324, %282, %.loopexit, %181, %63, %55
  %497 = getelementptr inbounds %struct.http_stat* %hstat, i64 0, i32 13
  %498 = load i8** %497, align 8, !tbaa !0
  %499 = call noalias i8* @xstrdup(i8* %498) nounwind
  store i8* %499, i8** %local_file, align 8, !tbaa !0
  br label %.thread39

.thread39:                                        ; preds = %.thread35, %493, %239, %237, %197, %194, %192, %.loopexit, %181, %181, %181, %181, %181, %181, %181
  %ret.436 = phi i32 [ 31, %.thread35 ], [ %174, %.loopexit ], [ 34, %239 ], [ 34, %237 ], [ 34, %197 ], [ 4, %192 ], [ 6, %194 ], [ 41, %493 ], [ %174, %181 ], [ %174, %181 ], [ %174, %181 ], [ %174, %181 ], [ %174, %181 ], [ %174, %181 ], [ %174, %181 ]
  call fastcc void @free_hstat(%struct.http_stat* %hstat)
  ret i32 %ret.436
}

declare void @__assert(i8*, i8*, i32, i8*)

declare noalias i8* @xstrdup(i8*)

define internal fastcc void @load_cookies() nounwind uwtable {
  %1 = load %struct.cookie_jar** @wget_cookie_jar, align 8, !tbaa !0
  %2 = icmp eq %struct.cookie_jar* %1, null
  br i1 %2, label %3, label %5

; <label>:3                                       ; preds = %0
  %4 = tail call %struct.cookie_jar* @cookie_jar_new() nounwind
  store %struct.cookie_jar* %4, %struct.cookie_jar** @wget_cookie_jar, align 8, !tbaa !0
  br label %5

; <label>:5                                       ; preds = %3, %0
  %6 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 99), align 8, !tbaa !0
  %7 = icmp eq i8* %6, null
  br i1 %7, label %11, label %8

; <label>:8                                       ; preds = %5
  %.b = load i1* @cookies_loaded_p.b, align 1
  br i1 %.b, label %11, label %9

; <label>:9                                       ; preds = %8
  %10 = load %struct.cookie_jar** @wget_cookie_jar, align 8, !tbaa !0
  tail call void @cookie_jar_load(%struct.cookie_jar* %10, i8* %6) nounwind
  store i1 true, i1* @cookies_loaded_p.b, align 1
  br label %11

; <label>:11                                      ; preds = %9, %8, %5
  ret void
}

declare zeroext i1 @has_wildcards_p(i8*)

declare void @logputs(i32, i8*)

declare i8* @libintl_gettext(i8*)

declare i8* @url_file_name(%struct.url*)

declare zeroext i1 @file_exists_p(i8*)

declare void @logprintf(i32, i8*, ...)

declare i8* @quote(i8*)

declare zeroext i1 @has_html_suffix_p(i8*)

declare void @free(i8* nocapture) nounwind

declare void @sleep_between_retrievals(i32)

declare i8* @datetime_str(i64)

declare i64 @time(i64*)

declare i8* @url_string(%struct.url*, i32)

declare i32 @sprintf(i8* nocapture, i8* nocapture, ...) nounwind

declare i32 @stat(i8* nocapture, %struct.stat* nocapture) nounwind

define internal fastcc i32 @gethttp(%struct.url* %u, %struct.http_stat* %hs, i32* %dt, %struct.url* %proxy) nounwind uwtable {
  %user = alloca i8*, align 8
  %passwd = alloca i8*, align 8
  %auth_finished = alloca i8, align 1
  %hdrval = alloca [256 x i8], align 16
  %message = alloca i8*, align 8
  %host_lookup_failed = alloca i8, align 1
  %scbeg = alloca i8*, align 8
  %scend = alloca i8*, align 8
  %wabeg = alloca i8*, align 8
  %waend = alloca i8*, align 8
  %st = alloca %struct.stat, align 8
  %first_byte_pos = alloca i64, align 8
  %last_byte_pos = alloca i64, align 8
  %entity_length = alloca i64, align 8
  store i8 0, i8* %auth_finished, align 1, !tbaa !3
  %1 = load i32* %dt, align 4, !tbaa !5
  %2 = and i32 %1, 4
  %3 = icmp ne i32 %2, 0
  %4 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 49), align 8, !tbaa !3, !range !4
  %5 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 5), align 2, !tbaa !3, !range !4
  %6 = icmp ne %struct.url* %proxy, null
  %notlhs = icmp eq i8 %4, 0
  %notrhs = icmp ne i8 %5, 0
  %not.or.cond5 = or i1 %notrhs, %notlhs
  %.81 = or i1 %6, %not.or.cond5
  store i8 0, i8* %host_lookup_failed, align 1, !tbaa !3
  %7 = getelementptr inbounds %struct.url* %u, i64 0, i32 1
  %8 = load i32* %7, align 4, !tbaa !10
  %9 = icmp eq i32 %8, 1
  br i1 %9, label %10, label %14

; <label>:10                                      ; preds = %0
  %11 = call zeroext i1 @ssl_init() nounwind
  br i1 %11, label %14, label %12

; <label>:12                                      ; preds = %10
  call void @scheme_disable(i32 1) nounwind
  %13 = call i8* @libintl_gettext(i8* getelementptr inbounds ([42 x i8]* @.str40, i64 0, i64 0)) nounwind
  call void (i32, i8*, ...)* @logprintf(i32 1, i8* %13) nounwind
  br label %945

; <label>:14                                      ; preds = %10, %0
  %15 = getelementptr inbounds %struct.http_stat* %hs, i64 0, i32 0
  store i64 0, i64* %15, align 8, !tbaa !8
  %16 = getelementptr inbounds %struct.http_stat* %hs, i64 0, i32 1
  store i64 -1, i64* %16, align 8, !tbaa !8
  %17 = getelementptr inbounds %struct.http_stat* %hs, i64 0, i32 3
  store i32 -1, i32* %17, align 4, !tbaa !5
  %18 = getelementptr inbounds %struct.http_stat* %hs, i64 0, i32 4
  %19 = getelementptr inbounds %struct.http_stat* %hs, i64 0, i32 5
  %20 = getelementptr inbounds %struct.http_stat* %hs, i64 0, i32 6
  %21 = getelementptr inbounds %struct.http_stat* %hs, i64 0, i32 7
  %22 = getelementptr inbounds %struct.http_stat* %hs, i64 0, i32 9
  store i8* null, i8** %22, align 8, !tbaa !0
  %23 = bitcast i8** %18 to i8*
  call void @llvm.memset.p0i8.i64(i8* %23, i8 0, i64 32, i32 8, i1 false)
  %24 = call fastcc %struct.request* @request_new()
  br i1 %3, label %30, label %25

; <label>:25                                      ; preds = %14
  %26 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 103), align 8, !tbaa !0
  %27 = icmp ne i8* %26, null
  %28 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 102), align 8, !tbaa !0
  %29 = icmp ne i8* %28, null
  %or.cond = or i1 %27, %29
  %. = select i1 %or.cond, i8* getelementptr inbounds ([5 x i8]* @.str43, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8]* @.str41, i64 0, i64 0)
  br label %30

; <label>:30                                      ; preds = %25, %14
  %meth.0 = phi i8* [ getelementptr inbounds ([5 x i8]* @.str42, i64 0, i64 0), %14 ], [ %., %25 ]
  br i1 %6, label %31, label %38

; <label>:31                                      ; preds = %30
  %32 = load i32* %7, align 4, !tbaa !10
  %33 = icmp eq i32 %32, 1
  br i1 %33, label %38, label %34

; <label>:34                                      ; preds = %31
  %35 = getelementptr inbounds %struct.url* %u, i64 0, i32 0
  %36 = load i8** %35, align 8, !tbaa !0
  %37 = call noalias i8* @xstrdup(i8* %36) nounwind
  br label %40

; <label>:38                                      ; preds = %31, %30
  %39 = call i8* @url_full_path(%struct.url* %u) nounwind
  br label %40

; <label>:40                                      ; preds = %38, %34
  %meth_arg.0 = phi i8* [ %37, %34 ], [ %39, %38 ]
  call fastcc void @request_set_method(%struct.request* %24, i8* %meth.0, i8* %meth_arg.0)
  %41 = getelementptr inbounds %struct.http_stat* %hs, i64 0, i32 12
  %42 = load i8** %41, align 8, !tbaa !0
  call fastcc void @request_set_header(%struct.request* %24, i8* getelementptr inbounds ([8 x i8]* @.str44, i64 0, i64 0), i8* %42, i32 0)
  %43 = load i32* %dt, align 4, !tbaa !5
  %44 = and i32 %43, 8
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %47, label %46

; <label>:46                                      ; preds = %40
  call fastcc void @request_set_header(%struct.request* %24, i8* getelementptr inbounds ([7 x i8]* @.str45, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str46, i64 0, i64 0), i32 0)
  br label %47

; <label>:47                                      ; preds = %46, %40
  %48 = getelementptr inbounds %struct.http_stat* %hs, i64 0, i32 2
  %49 = load i64* %48, align 8, !tbaa !8
  %50 = icmp eq i64 %49, 0
  br i1 %50, label %54, label %51

; <label>:51                                      ; preds = %47
  %52 = call i8* @number_to_static_string(i64 %49) nounwind
  %53 = call i8* (i8*, ...)* @aprintf(i8* getelementptr inbounds ([10 x i8]* @.str48, i64 0, i64 0), i8* %52) nounwind
  call fastcc void @request_set_header(%struct.request* %24, i8* getelementptr inbounds ([6 x i8]* @.str47, i64 0, i64 0), i8* %53, i32 2)
  br label %54

; <label>:54                                      ; preds = %51, %47
  %55 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 75), align 8, !tbaa !0
  %56 = icmp eq i8* %55, null
  br i1 %56, label %57, label %60

; <label>:57                                      ; preds = %54
  %58 = load i8** @version_string, align 8, !tbaa !0
  %59 = call i8* (i8*, ...)* @aprintf(i8* getelementptr inbounds ([13 x i8]* @.str50, i64 0, i64 0), i8* %58, i8* getelementptr inbounds ([11 x i8]* @.str51, i64 0, i64 0)) nounwind
  call fastcc void @request_set_header(%struct.request* %24, i8* getelementptr inbounds ([11 x i8]* @.str49, i64 0, i64 0), i8* %59, i32 2)
  br label %64

; <label>:60                                      ; preds = %54
  %61 = load i8* %55, align 1, !tbaa !1
  %62 = icmp eq i8 %61, 0
  br i1 %62, label %64, label %63

; <label>:63                                      ; preds = %60
  call fastcc void @request_set_header(%struct.request* %24, i8* getelementptr inbounds ([11 x i8]* @.str49, i64 0, i64 0), i8* %55, i32 0)
  br label %64

; <label>:64                                      ; preds = %63, %60, %57
  call fastcc void @request_set_header(%struct.request* %24, i8* getelementptr inbounds ([7 x i8]* @.str52, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8]* @.str53, i64 0, i64 0), i32 0)
  %65 = getelementptr inbounds %struct.url* %u, i64 0, i32 10
  %66 = load i8** %65, align 8, !tbaa !0
  store i8* %66, i8** %user, align 8, !tbaa !0
  %67 = getelementptr inbounds %struct.url* %u, i64 0, i32 11
  %68 = load i8** %67, align 8, !tbaa !0
  store i8* %68, i8** %passwd, align 8, !tbaa !0
  %69 = getelementptr inbounds %struct.url* %u, i64 0, i32 2
  %70 = load i8** %69, align 8, !tbaa !0
  call void @search_netrc(i8* %70, i8** %user, i8** %passwd, i32 0) nounwind
  %71 = load i8** %user, align 8, !tbaa !0
  %72 = icmp eq i8* %71, null
  br i1 %72, label %73, label %78

; <label>:73                                      ; preds = %64
  %74 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 46), align 8, !tbaa !0
  %75 = icmp ne i8* %74, null
  %76 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 37), align 8, !tbaa !0
  %77 = select i1 %75, i8* %74, i8* %76
  br label %78

; <label>:78                                      ; preds = %73, %64
  %79 = phi i8* [ %77, %73 ], [ %71, %64 ]
  store i8* %79, i8** %user, align 8, !tbaa !0
  %80 = load i8** %passwd, align 8, !tbaa !0
  %81 = icmp eq i8* %80, null
  br i1 %81, label %82, label %87

; <label>:82                                      ; preds = %78
  %83 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 47), align 8, !tbaa !0
  %84 = icmp ne i8* %83, null
  %85 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 38), align 8, !tbaa !0
  %86 = select i1 %84, i8* %83, i8* %85
  br label %87

; <label>:87                                      ; preds = %82, %78
  %88 = phi i8* [ %86, %82 ], [ %80, %78 ]
  store i8* %88, i8** %passwd, align 8, !tbaa !0
  %89 = load i8** %user, align 8, !tbaa !0
  %90 = icmp eq i8* %89, null
  %91 = icmp eq i8* %88, null
  %or.cond6 = or i1 %90, %91
  br i1 %or.cond6, label %100, label %92

; <label>:92                                      ; preds = %87
  %93 = load i8** %65, align 8, !tbaa !0
  %94 = icmp ne i8* %93, null
  %95 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 114), align 1, !tbaa !3, !range !4
  %96 = icmp eq i8 %95, 0
  %or.cond8 = and i1 %94, %96
  br i1 %or.cond8, label %100, label %97

; <label>:97                                      ; preds = %92
  %98 = load i8** %69, align 8, !tbaa !0
  %99 = call fastcc zeroext i1 @maybe_send_basic_creds(i8* %98, i8* %89, i8* %88, %struct.request* %24)
  br label %100

; <label>:100                                     ; preds = %97, %92, %87
  %basic_auth_finished.0 = phi i1 [ %99, %97 ], [ false, %87 ], [ false, %92 ]
  %101 = getelementptr inbounds %struct.url* %u, i64 0, i32 3
  %102 = load i32* %101, align 4, !tbaa !5
  %103 = load i32* %7, align 4, !tbaa !10
  %104 = call i32 @scheme_default_port(i32 %103) nounwind
  %105 = icmp ne i32 %102, %104
  %106 = load i8** %69, align 8, !tbaa !0
  %107 = call i8* @strchr(i8* %106, i32 58) nounwind readonly
  %108 = icmp ne i8* %107, null
  %109 = zext i1 %108 to i64
  %110 = zext i1 %105 to i64
  %111 = getelementptr inbounds [2 x [2 x i8*]]* @gethttp.hfmt, i64 0, i64 %110, i64 %109
  %112 = load i8** %111, align 8, !tbaa !0
  %113 = load i32* %101, align 4, !tbaa !5
  %114 = call i8* (i8*, ...)* @aprintf(i8* %112, i8* %106, i32 %113) nounwind
  call fastcc void @request_set_header(%struct.request* %24, i8* getelementptr inbounds ([5 x i8]* @.str58, i64 0, i64 0), i8* %114, i32 2)
  br i1 %.81, label %116, label %115

; <label>:115                                     ; preds = %100
  call fastcc void @request_set_header(%struct.request* %24, i8* getelementptr inbounds ([11 x i8]* @.str59, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8]* @.str60, i64 0, i64 0), i32 0)
  br label %116

; <label>:116                                     ; preds = %115, %100
  %117 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 98), align 8, !tbaa !3, !range !4
  %118 = icmp eq i8 %117, 0
  br i1 %118, label %128, label %119

; <label>:119                                     ; preds = %116
  %120 = load %struct.cookie_jar** @wget_cookie_jar, align 8, !tbaa !0
  %121 = load i8** %69, align 8, !tbaa !0
  %122 = load i32* %101, align 4, !tbaa !5
  %123 = getelementptr inbounds %struct.url* %u, i64 0, i32 4
  %124 = load i8** %123, align 8, !tbaa !0
  %125 = load i32* %7, align 4, !tbaa !10
  %126 = icmp eq i32 %125, 1
  %127 = call i8* @cookie_header(%struct.cookie_jar* %120, i8* %121, i32 %122, i8* %124, i1 zeroext %126) nounwind
  call fastcc void @request_set_header(%struct.request* %24, i8* getelementptr inbounds ([7 x i8]* @.str61, i64 0, i64 0), i8* %127, i32 2)
  br label %128

; <label>:128                                     ; preds = %119, %116
  %129 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 102), align 8, !tbaa !0
  %130 = icmp ne i8* %129, null
  %131 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 103), align 8, !tbaa !0
  %132 = icmp ne i8* %131, null
  %or.cond9 = or i1 %130, %132
  br i1 %or.cond9, label %133, label %152

; <label>:133                                     ; preds = %128
  call fastcc void @request_set_header(%struct.request* %24, i8* getelementptr inbounds ([13 x i8]* @.str62, i64 0, i64 0), i8* getelementptr inbounds ([34 x i8]* @.str63, i64 0, i64 0), i32 0)
  %134 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 102), align 8, !tbaa !0
  %135 = icmp eq i8* %134, null
  br i1 %135, label %138, label %136

; <label>:136                                     ; preds = %133
  %137 = call i64 @strlen(i8* %134) nounwind readonly
  br label %149

; <label>:138                                     ; preds = %133
  %139 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 103), align 8, !tbaa !0
  %140 = call i64 @file_size(i8* %139) nounwind
  %141 = icmp eq i64 %140, -1
  br i1 %141, label %142, label %149

; <label>:142                                     ; preds = %138
  %143 = call i8* @libintl_gettext(i8* getelementptr inbounds ([31 x i8]* @.str64, i64 0, i64 0)) nounwind
  %144 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 103), align 8, !tbaa !0
  %145 = call i8* @quote(i8* %144) nounwind
  %146 = call i32* @__error() nounwind
  %147 = load i32* %146, align 4, !tbaa !5
  %148 = call i8* @strerror(i32 %147) nounwind
  call void (i32, i8*, ...)* @logprintf(i32 1, i8* %143, i8* %145, i8* %148) nounwind
  br label %149

; <label>:149                                     ; preds = %142, %138, %136
  %post_data_size.0 = phi i64 [ %137, %136 ], [ 0, %142 ], [ %140, %138 ]
  %150 = call i8* @number_to_static_string(i64 %post_data_size.0) nounwind
  %151 = call noalias i8* @xstrdup(i8* %150) nounwind
  call fastcc void @request_set_header(%struct.request* %24, i8* getelementptr inbounds ([15 x i8]* @.str65, i64 0, i64 0), i8* %151, i32 2)
  br label %152

; <label>:152                                     ; preds = %149, %128
  %post_data_size.1 = phi i64 [ %post_data_size.0, %149 ], [ 0, %128 ]
  %153 = load i8*** getelementptr inbounds (%struct.options* @opt, i64 0, i32 48), align 8, !tbaa !0
  %154 = icmp eq i8** %153, null
  br i1 %154, label %.preheader102, label %.preheader

.preheader:                                       ; preds = %152
  %155 = load i8*** getelementptr inbounds (%struct.options* @opt, i64 0, i32 48), align 8, !tbaa !0
  %156 = load i8** %155, align 8, !tbaa !0
  %157 = icmp eq i8* %156, null
  br i1 %157, label %.preheader102, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.preheader ]
  %158 = phi i8* [ %161, %.lr.ph ], [ %156, %.preheader ]
  call fastcc void @request_set_user_header(%struct.request* %24, i8* %158)
  %indvars.iv.next = add i64 %indvars.iv, 1
  %159 = load i8*** getelementptr inbounds (%struct.options* @opt, i64 0, i32 48), align 8, !tbaa !0
  %160 = getelementptr inbounds i8** %159, i64 %indvars.iv.next
  %161 = load i8** %160, align 8, !tbaa !0
  %162 = icmp eq i8* %161, null
  br i1 %162, label %.preheader102, label %.lr.ph

.preheader102:                                    ; preds = %.lr.ph, %.preheader, %152
  %163 = getelementptr inbounds %struct.url* %proxy, i64 0, i32 10
  %164 = getelementptr inbounds %struct.url* %proxy, i64 0, i32 11
  %165 = icmp eq i64 %post_data_size.1, 0
  %166 = select i1 %6, i8* getelementptr inbounds ([6 x i8]* @.str78, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str79, i64 0, i64 0)
  %167 = getelementptr inbounds [256 x i8]* %hdrval, i64 0, i64 0
  %168 = getelementptr inbounds [256 x i8]* %hdrval, i64 0, i64 0
  %169 = getelementptr inbounds %struct.url* %u, i64 0, i32 4
  %170 = trunc i64 %post_data_size.1 to i32
  br label %171

; <label>:171                                     ; preds = %517, %.preheader102
  %using_ssl.0 = phi i8 [ %using_ssl.2, %517 ], [ 0, %.preheader102 ]
  %ntlm_seen.0 = phi i8 [ %ntlm_seen.1, %517 ], [ 0, %.preheader102 ]
  %sock.0 = phi i32 [ %sock.3, %517 ], [ -1, %.preheader102 ]
  %conn.0 = phi %struct.url* [ %conn.3, %517 ], [ %u, %.preheader102 ]
  br i1 %6, label %172, label %189

; <label>:172                                     ; preds = %171
  %173 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 58), align 8, !tbaa !0
  %174 = icmp ne i8* %173, null
  %175 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 59), align 8, !tbaa !0
  %176 = icmp ne i8* %175, null
  %or.cond11 = and i1 %174, %176
  br i1 %or.cond11, label %180, label %177

; <label>:177                                     ; preds = %172
  %178 = load i8** %163, align 8, !tbaa !0
  %179 = load i8** %164, align 8, !tbaa !0
  br label %180

; <label>:180                                     ; preds = %177, %172
  %proxy_user.0 = phi i8* [ %178, %177 ], [ %173, %172 ]
  %proxy_passwd.0 = phi i8* [ %179, %177 ], [ %175, %172 ]
  %181 = icmp eq i8* %proxy_user.0, null
  %182 = icmp eq i8* %proxy_passwd.0, null
  %or.cond10 = or i1 %181, %182
  br i1 %or.cond10, label %185, label %183

; <label>:183                                     ; preds = %180
  %184 = call fastcc i8* @basic_authentication_encode(i8* %proxy_user.0, i8* %proxy_passwd.0)
  br label %185

; <label>:185                                     ; preds = %183, %180
  %proxyauth.0 = phi i8* [ %184, %183 ], [ null, %180 ]
  %186 = load i32* %7, align 4, !tbaa !10
  %187 = icmp eq i32 %186, 1
  br i1 %187, label %189, label %188

; <label>:188                                     ; preds = %185
  call fastcc void @request_set_header(%struct.request* %24, i8* getelementptr inbounds ([20 x i8]* @.str66, i64 0, i64 0), i8* %proxyauth.0, i32 2)
  br label %189

; <label>:189                                     ; preds = %188, %185, %171
  %conn.1 = phi %struct.url* [ %proxy, %188 ], [ %proxy, %185 ], [ %conn.0, %171 ]
  %proxyauth.1 = phi i8* [ %proxyauth.0, %188 ], [ %proxyauth.0, %185 ], [ null, %171 ]
  br i1 %.81, label %223, label %190

; <label>:190                                     ; preds = %189
  %191 = load i32* %7, align 4, !tbaa !10
  %192 = icmp eq i32 %191, 1
  %u.conn.1 = select i1 %192, %struct.url* %u, %struct.url* %conn.1
  %193 = getelementptr inbounds %struct.url* %u.conn.1, i64 0, i32 2
  %194 = load i8** %193, align 8, !tbaa !0
  %195 = getelementptr inbounds %struct.url* %u.conn.1, i64 0, i32 3
  %196 = load i32* %195, align 4, !tbaa !5
  %197 = getelementptr inbounds %struct.url* %u.conn.1, i64 0, i32 1
  %198 = load i32* %197, align 4, !tbaa !10
  %199 = icmp eq i32 %198, 1
  %200 = call fastcc zeroext i1 @persistent_available_p(i8* %194, i32 %196, i1 zeroext %199, i8* %host_lookup_failed)
  br i1 %200, label %201, label %215

; <label>:201                                     ; preds = %190
  %202 = load i32* getelementptr inbounds (%struct.anon* @pconn, i64 0, i32 0), align 8, !tbaa !5
  %203 = load i8* getelementptr inbounds (%struct.anon* @pconn, i64 0, i32 3), align 4, !tbaa !3, !range !4
  %204 = call i8* @libintl_gettext(i8* getelementptr inbounds ([39 x i8]* @.str67, i64 0, i64 0)) nounwind
  %205 = load i8** getelementptr inbounds (%struct.anon* @pconn, i64 0, i32 1), align 8, !tbaa !0
  %206 = call i8* @quotearg_style(i32 5, i8* %205) nounwind
  %207 = load i32* getelementptr inbounds (%struct.anon* @pconn, i64 0, i32 2), align 8, !tbaa !5
  call void (i32, i8*, ...)* @logprintf(i32 0, i8* %204, i8* %206, i32 %207) nounwind
  %208 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 71), align 2, !tbaa !3, !range !4
  %209 = icmp eq i8 %208, 0
  br i1 %209, label %211, label %210, !prof !11

; <label>:210                                     ; preds = %201
  call void (i8*, ...)* @debug_logprintf(i8* getelementptr inbounds ([16 x i8]* @.str68, i64 0, i64 0), i32 %202) nounwind
  br label %211

; <label>:211                                     ; preds = %210, %201
  %212 = load i8* getelementptr inbounds (%struct.anon* @pconn, i64 0, i32 4), align 1, !tbaa !3, !range !4
  %213 = icmp eq i8 %212, 0
  br i1 %213, label %223, label %214

; <label>:214                                     ; preds = %211
  call fastcc void @request_remove_header(%struct.request* %24)
  br label %223

; <label>:215                                     ; preds = %190
  %216 = load i8* %host_lookup_failed, align 1, !tbaa !3, !range !4
  %217 = icmp eq i8 %216, 0
  br i1 %217, label %223, label %218

; <label>:218                                     ; preds = %215
  call fastcc void @request_free(%struct.request* %24)
  %219 = call i8* @libintl_gettext(i8* getelementptr inbounds ([39 x i8]* @.str70, i64 0, i64 0)) nounwind
  %220 = load i8** @exec_name, align 8, !tbaa !0
  %221 = load i8** %193, align 8, !tbaa !0
  %222 = call i8* @quote(i8* %221) nounwind
  call void (i32, i8*, ...)* @logprintf(i32 1, i8* %219, i8* %220, i8* %222) nounwind
  br label %945

; <label>:223                                     ; preds = %215, %214, %211, %189
  %using_ssl.1 = phi i8 [ %using_ssl.0, %189 ], [ %203, %214 ], [ %203, %211 ], [ %using_ssl.0, %215 ]
  %sock.1 = phi i32 [ %sock.0, %189 ], [ %202, %214 ], [ %202, %211 ], [ %sock.0, %215 ]
  %224 = icmp slt i32 %sock.1, 0
  br i1 %224, label %225, label %318

; <label>:225                                     ; preds = %223
  %226 = getelementptr inbounds %struct.url* %conn.1, i64 0, i32 2
  %227 = load i8** %226, align 8, !tbaa !0
  %228 = getelementptr inbounds %struct.url* %conn.1, i64 0, i32 3
  %229 = load i32* %228, align 4, !tbaa !5
  %230 = call i32 @connect_to_host(i8* %227, i32 %229) nounwind
  %231 = icmp eq i32 %230, -100
  br i1 %231, label %232, label %233

; <label>:232                                     ; preds = %225
  call fastcc void @request_free(%struct.request* %24)
  br label %945

; <label>:233                                     ; preds = %225
  %234 = icmp slt i32 %230, 0
  br i1 %234, label %235, label %240

; <label>:235                                     ; preds = %233
  call fastcc void @request_free(%struct.request* %24)
  %236 = call i32* @__error() nounwind
  %237 = load i32* %236, align 4, !tbaa !5
  %238 = call zeroext i1 @retryable_socket_connect_error(i32 %237) nounwind
  %239 = select i1 %238, i32 3, i32 5
  br label %945

; <label>:240                                     ; preds = %233
  br i1 %6, label %241, label %307

; <label>:241                                     ; preds = %240
  %242 = load i32* %7, align 4, !tbaa !10
  %243 = icmp eq i32 %242, 1
  br i1 %243, label %244, label %307

; <label>:244                                     ; preds = %241
  %245 = call fastcc %struct.request* @request_new()
  %246 = load i8** %69, align 8, !tbaa !0
  %247 = load i32* %101, align 4, !tbaa !5
  %248 = call i8* (i8*, ...)* @aprintf(i8* getelementptr inbounds ([6 x i8]* @.str56, i64 0, i64 0), i8* %246, i32 %247) nounwind
  call fastcc void @request_set_method(%struct.request* %245, i8* getelementptr inbounds ([8 x i8]* @.str71, i64 0, i64 0), i8* %248)
  %249 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 75), align 8, !tbaa !0
  %250 = icmp eq i8* %249, null
  br i1 %250, label %251, label %254

; <label>:251                                     ; preds = %244
  %252 = load i8** @version_string, align 8, !tbaa !0
  %253 = call i8* (i8*, ...)* @aprintf(i8* getelementptr inbounds ([13 x i8]* @.str50, i64 0, i64 0), i8* %252, i8* getelementptr inbounds ([11 x i8]* @.str51, i64 0, i64 0)) nounwind
  call fastcc void @request_set_header(%struct.request* %245, i8* getelementptr inbounds ([11 x i8]* @.str49, i64 0, i64 0), i8* %253, i32 2)
  br label %258

; <label>:254                                     ; preds = %244
  %255 = load i8* %249, align 1, !tbaa !1
  %256 = icmp eq i8 %255, 0
  br i1 %256, label %258, label %257

; <label>:257                                     ; preds = %254
  call fastcc void @request_set_header(%struct.request* %245, i8* getelementptr inbounds ([11 x i8]* @.str49, i64 0, i64 0), i8* %249, i32 0)
  br label %258

; <label>:258                                     ; preds = %257, %254, %251
  %259 = icmp eq i8* %proxyauth.1, null
  br i1 %259, label %261, label %260

; <label>:260                                     ; preds = %258
  call fastcc void @request_set_header(%struct.request* %245, i8* getelementptr inbounds ([20 x i8]* @.str66, i64 0, i64 0), i8* %proxyauth.1, i32 2)
  br label %261

; <label>:261                                     ; preds = %260, %258
  %262 = call fastcc i32 @request_send(%struct.request* %245, i32 %230)
  call fastcc void @request_free(%struct.request* %245)
  %263 = icmp slt i32 %262, 0
  br i1 %263, label %264, label %269

; <label>:264                                     ; preds = %261
  %.b87 = load i1* @pconn_active.b, align 1
  %265 = load i32* getelementptr inbounds (%struct.anon* @pconn, i64 0, i32 0), align 8, !tbaa !5
  %266 = icmp eq i32 %230, %265
  %or.cond12 = and i1 %.b87, %266
  br i1 %or.cond12, label %267, label %268

; <label>:267                                     ; preds = %264
  call fastcc void @invalidate_persistent()
  br label %945

; <label>:268                                     ; preds = %264
  call void @fd_close(i32 %230) nounwind
  br label %945

; <label>:269                                     ; preds = %261
  %270 = call fastcc i8* @read_http_response_head(i32 %230)
  %271 = icmp eq i8* %270, null
  br i1 %271, label %272, label %279

; <label>:272                                     ; preds = %269
  %273 = call i8* @libintl_gettext(i8* getelementptr inbounds ([35 x i8]* @.str72, i64 0, i64 0)) nounwind
  %274 = call i8* @fd_errstr(i32 %230) nounwind
  call void (i32, i8*, ...)* @logprintf(i32 0, i8* %273, i8* %274) nounwind
  %.b86 = load i1* @pconn_active.b, align 1
  %275 = load i32* getelementptr inbounds (%struct.anon* @pconn, i64 0, i32 0), align 8, !tbaa !5
  %276 = icmp eq i32 %230, %275
  %or.cond14 = and i1 %.b86, %276
  br i1 %or.cond14, label %277, label %278

; <label>:277                                     ; preds = %272
  call fastcc void @invalidate_persistent()
  br label %945

; <label>:278                                     ; preds = %272
  call void @fd_close(i32 %230) nounwind
  br label %945

; <label>:279                                     ; preds = %269
  store i8* null, i8** %message, align 8, !tbaa !0
  %280 = load i8* %270, align 1, !tbaa !1
  %281 = icmp eq i8 %280, 0
  br i1 %281, label %282, label %283

; <label>:282                                     ; preds = %279
  call void @free(i8* %270)
  br label %.loopexit103

; <label>:283                                     ; preds = %279
  %284 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 71), align 2, !tbaa !3, !range !4
  %285 = icmp eq i8 %284, 0
  br i1 %285, label %287, label %286, !prof !11

; <label>:286                                     ; preds = %283
  call void (i8*, ...)* @debug_logprintf(i8* getelementptr inbounds ([28 x i8]* @.str73, i64 0, i64 0), i8* %270) nounwind
  br label %287

; <label>:287                                     ; preds = %286, %283
  %288 = call fastcc %struct.response* @resp_new(i8* %270)
  %289 = call fastcc i32 @resp_status(%struct.response* %288, i8** %message)
  %290 = load i8** %message, align 8, !tbaa !0
  %291 = call noalias i8* @xstrdup(i8* %290) nounwind
  store i8* %291, i8** %22, align 8, !tbaa !0
  call fastcc void @resp_free(%struct.response* %288)
  call void @free(i8* %270)
  %292 = icmp eq i32 %289, 200
  br i1 %292, label %303, label %.loopexit103

.loopexit103:                                     ; preds = %287, %282
  %293 = call i8* @libintl_gettext(i8* getelementptr inbounds ([27 x i8]* @.str74, i64 0, i64 0)) nounwind
  %294 = load i8** %message, align 8, !tbaa !0
  %295 = icmp eq i8* %294, null
  br i1 %295, label %298, label %296

; <label>:296                                     ; preds = %.loopexit103
  %297 = call i8* @quotearg_style(i32 5, i8* %294) nounwind
  br label %298

; <label>:298                                     ; preds = %296, %.loopexit103
  %299 = phi i8* [ %297, %296 ], [ getelementptr inbounds ([2 x i8]* @.str75, i64 0, i64 0), %.loopexit103 ]
  call void (i32, i8*, ...)* @logprintf(i32 1, i8* %293, i8* %299) nounwind
  %300 = load i8** %message, align 8, !tbaa !0
  %301 = icmp eq i8* %300, null
  br i1 %301, label %945, label %302

; <label>:302                                     ; preds = %298
  call void @free(i8* %300)
  br label %945

; <label>:303                                     ; preds = %287
  %304 = load i8** %message, align 8, !tbaa !0
  %305 = icmp eq i8* %304, null
  br i1 %305, label %307, label %306

; <label>:306                                     ; preds = %303
  call void @free(i8* %304)
  br label %307

; <label>:307                                     ; preds = %306, %303, %241, %240
  %conn.2 = phi %struct.url* [ %conn.1, %241 ], [ %conn.1, %240 ], [ %u, %303 ], [ %u, %306 ]
  %308 = getelementptr inbounds %struct.url* %conn.2, i64 0, i32 1
  %309 = load i32* %308, align 4, !tbaa !10
  %310 = icmp eq i32 %309, 1
  br i1 %310, label %311, label %318

; <label>:311                                     ; preds = %307
  %312 = call zeroext i1 @ssl_connect_wget(i32 %230) nounwind
  br i1 %312, label %314, label %313

; <label>:313                                     ; preds = %311
  call void @fd_close(i32 %230) nounwind
  br label %945

; <label>:314                                     ; preds = %311
  %315 = load i8** %69, align 8, !tbaa !0
  %316 = call zeroext i1 @ssl_check_certificate(i32 %230, i8* %315) nounwind
  br i1 %316, label %318, label %317

; <label>:317                                     ; preds = %314
  call void @fd_close(i32 %230) nounwind
  br label %945

; <label>:318                                     ; preds = %314, %307, %223
  %using_ssl.2 = phi i8 [ %using_ssl.1, %307 ], [ %using_ssl.1, %223 ], [ 1, %314 ]
  %sock.2 = phi i32 [ %230, %307 ], [ %sock.1, %223 ], [ %230, %314 ]
  %conn.3 = phi %struct.url* [ %conn.2, %307 ], [ %conn.1, %223 ], [ %conn.2, %314 ]
  %319 = call fastcc i32 @request_send(%struct.request* %24, i32 %sock.2)
  %320 = icmp sgt i32 %319, -1
  br i1 %320, label %321, label %.thread

; <label>:321                                     ; preds = %318
  %322 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 102), align 8, !tbaa !0
  %323 = icmp eq i8* %322, null
  br i1 %323, label %331, label %324

; <label>:324                                     ; preds = %321
  %325 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 71), align 2, !tbaa !3, !range !4
  %326 = icmp eq i8 %325, 0
  br i1 %326, label %328, label %327, !prof !11

; <label>:327                                     ; preds = %324
  call void (i8*, ...)* @debug_logprintf(i8* getelementptr inbounds ([17 x i8]* @.str76, i64 0, i64 0), i8* %322) nounwind
  br label %328

; <label>:328                                     ; preds = %327, %324
  %329 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 102), align 8, !tbaa !0
  %330 = call i32 @fd_write(i32 %sock.2, i8* %329, i32 %170, double -1.000000e+00) nounwind
  br label %336

; <label>:331                                     ; preds = %321
  %332 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 103), align 8, !tbaa !0
  %333 = icmp eq i8* %332, null
  %or.cond16 = or i1 %333, %165
  br i1 %or.cond16, label %336, label %334

; <label>:334                                     ; preds = %331
  %335 = call fastcc i32 @post_file(i32 %sock.2, i8* %332, i64 %post_data_size.1)
  br label %336

; <label>:336                                     ; preds = %334, %331, %328
  %write_error.0 = phi i32 [ %330, %328 ], [ %335, %334 ], [ %319, %331 ]
  %337 = icmp slt i32 %write_error.0, 0
  br i1 %337, label %.thread, label %343

.thread:                                          ; preds = %336, %318
  %.b85 = load i1* @pconn_active.b, align 1
  %338 = load i32* getelementptr inbounds (%struct.anon* @pconn, i64 0, i32 0), align 8, !tbaa !5
  %339 = icmp eq i32 %sock.2, %338
  %or.cond18 = and i1 %.b85, %339
  br i1 %or.cond18, label %340, label %341

; <label>:340                                     ; preds = %.thread
  call fastcc void @invalidate_persistent()
  br label %342

; <label>:341                                     ; preds = %.thread
  call void @fd_close(i32 %sock.2) nounwind
  br label %342

; <label>:342                                     ; preds = %341, %340
  call fastcc void @request_free(%struct.request* %24)
  br label %945

; <label>:343                                     ; preds = %336
  %344 = call i8* @libintl_gettext(i8* getelementptr inbounds ([39 x i8]* @.str77, i64 0, i64 0)) nounwind
  call void (i32, i8*, ...)* @logprintf(i32 0, i8* %344, i8* %166) nounwind
  %345 = load i32* %dt, align 4, !tbaa !5
  %346 = and i32 %345, -3
  store i32 %346, i32* %dt, align 4, !tbaa !5
  %347 = call fastcc i8* @read_http_response_head(i32 %sock.2)
  %348 = icmp eq i8* %347, null
  br i1 %348, label %349, label %368

; <label>:349                                     ; preds = %343
  %350 = call i32* @__error() nounwind
  %351 = load i32* %350, align 4, !tbaa !5
  %352 = icmp eq i32 %351, 0
  br i1 %352, label %353, label %360

; <label>:353                                     ; preds = %349
  %354 = call i8* @libintl_gettext(i8* getelementptr inbounds ([19 x i8]* @.str80, i64 0, i64 0)) nounwind
  call void @logputs(i32 1, i8* %354) nounwind
  %.b84 = load i1* @pconn_active.b, align 1
  %355 = load i32* getelementptr inbounds (%struct.anon* @pconn, i64 0, i32 0), align 8, !tbaa !5
  %356 = icmp eq i32 %sock.2, %355
  %or.cond20 = and i1 %.b84, %356
  br i1 %or.cond20, label %357, label %358

; <label>:357                                     ; preds = %353
  call fastcc void @invalidate_persistent()
  br label %359

; <label>:358                                     ; preds = %353
  call void @fd_close(i32 %sock.2) nounwind
  br label %359

; <label>:359                                     ; preds = %358, %357
  call fastcc void @request_free(%struct.request* %24)
  br label %945

; <label>:360                                     ; preds = %349
  %361 = call i8* @libintl_gettext(i8* getelementptr inbounds ([29 x i8]* @.str81, i64 0, i64 0)) nounwind
  %362 = call i8* @fd_errstr(i32 %sock.2) nounwind
  call void (i32, i8*, ...)* @logprintf(i32 1, i8* %361, i8* %362) nounwind
  %.b83 = load i1* @pconn_active.b, align 1
  %363 = load i32* getelementptr inbounds (%struct.anon* @pconn, i64 0, i32 0), align 8, !tbaa !5
  %364 = icmp eq i32 %sock.2, %363
  %or.cond22 = and i1 %.b83, %364
  br i1 %or.cond22, label %365, label %366

; <label>:365                                     ; preds = %360
  call fastcc void @invalidate_persistent()
  br label %367

; <label>:366                                     ; preds = %360
  call void @fd_close(i32 %sock.2) nounwind
  br label %367

; <label>:367                                     ; preds = %366, %365
  call fastcc void @request_free(%struct.request* %24)
  br label %945

; <label>:368                                     ; preds = %343
  %369 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 71), align 2, !tbaa !3, !range !4
  %370 = icmp eq i8 %369, 0
  br i1 %370, label %372, label %371, !prof !11

; <label>:371                                     ; preds = %368
  call void (i8*, ...)* @debug_logprintf(i8* getelementptr inbounds ([44 x i8]* @.str82, i64 0, i64 0), i8* %347) nounwind
  br label %372

; <label>:372                                     ; preds = %371, %368
  %373 = call fastcc %struct.response* @resp_new(i8* %347)
  store i8* null, i8** %message, align 8, !tbaa !0
  %374 = call fastcc i32 @resp_status(%struct.response* %373, i8** %message)
  %375 = load i8** %message, align 8, !tbaa !0
  %376 = call noalias i8* @xstrdup(i8* %375) nounwind
  store i8* %376, i8** %22, align 8, !tbaa !0
  %377 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 69), align 8, !tbaa !3, !range !4
  %378 = icmp eq i8 %377, 0
  br i1 %378, label %379, label %386

; <label>:379                                     ; preds = %372
  %380 = load i8** %message, align 8, !tbaa !0
  %381 = icmp eq i8* %380, null
  br i1 %381, label %384, label %382

; <label>:382                                     ; preds = %379
  %383 = call i8* @quotearg_style(i32 5, i8* %380) nounwind
  br label %384

; <label>:384                                     ; preds = %382, %379
  %385 = phi i8* [ %383, %382 ], [ getelementptr inbounds ([1 x i8]* @.str25, i64 0, i64 0), %379 ]
  call void (i32, i8*, ...)* @logprintf(i32 0, i8* getelementptr inbounds ([8 x i8]* @.str83, i64 0, i64 0), i32 %374, i8* %385) nounwind
  br label %387

; <label>:386                                     ; preds = %372
  call void (i32, i8*, ...)* @logprintf(i32 0, i8* getelementptr inbounds ([2 x i8]* @.str8, i64 0, i64 0)) nounwind
  call fastcc void @print_server_response(%struct.response* %373)
  br label %387

; <label>:387                                     ; preds = %386, %384
  %388 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 5), align 2, !tbaa !3, !range !4
  %389 = icmp eq i8 %388, 0
  br i1 %389, label %390, label %.thread82

; <label>:390                                     ; preds = %387
  %391 = call fastcc zeroext i1 @resp_header_copy(%struct.response* %373, i8* getelementptr inbounds ([15 x i8]* @.str65, i64 0, i64 0), i8* %167, i32 256)
  br i1 %391, label %392, label %.thread82

; <label>:392                                     ; preds = %390
  %393 = call i32* @__error() nounwind
  store i32 0, i32* %393, align 4, !tbaa !5
  %394 = call i64 @strtoll(i8* nocapture %167, i8** null, i32 10) nounwind
  %395 = icmp eq i64 %394, 9223372036854775807
  br i1 %395, label %396, label %400

; <label>:396                                     ; preds = %392
  %397 = call i32* @__error() nounwind
  %398 = load i32* %397, align 4, !tbaa !5
  %399 = icmp eq i32 %398, 34
  br i1 %399, label %.thread82, label %400

; <label>:400                                     ; preds = %396, %392
  %401 = icmp sgt i64 %394, -1
  %.23 = select i1 %401, i64 %394, i64 -1
  %402 = icmp eq i64 %.23, -1
  %or.cond24 = or i1 %.81, %402
  br i1 %or.cond24, label %.thread82, label %403

; <label>:403                                     ; preds = %400
  %404 = call fastcc zeroext i1 @resp_header_copy(%struct.response* %373, i8* getelementptr inbounds ([11 x i8]* @.str60, i64 0, i64 0), i8* null, i32 0)
  br i1 %404, label %.thread82, label %405

; <label>:405                                     ; preds = %403
  %406 = call fastcc zeroext i1 @resp_header_copy(%struct.response* %373, i8* getelementptr inbounds ([11 x i8]* @.str59, i64 0, i64 0), i8* %168, i32 256)
  br i1 %406, label %407, label %.thread82

; <label>:407                                     ; preds = %405
  %408 = call i32 @strcasecmp(i8* %168, i8* getelementptr inbounds ([11 x i8]* @.str60, i64 0, i64 0)) nounwind readonly
  %409 = icmp eq i32 %408, 0
  br label %.thread82

.thread82:                                        ; preds = %407, %405, %403, %400, %396, %390, %387
  %contlen.084 = phi i64 [ %.23, %400 ], [ %.23, %405 ], [ %.23, %403 ], [ %.23, %407 ], [ -1, %387 ], [ -1, %390 ], [ -1, %396 ]
  %keep_alive.0 = phi i1 [ false, %400 ], [ false, %405 ], [ true, %403 ], [ %409, %407 ], [ false, %387 ], [ false, %390 ], [ false, %396 ]
  %410 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 98), align 8, !tbaa !3, !range !4
  %411 = icmp eq i8 %410, 0
  br i1 %411, label %.loopexit98, label %412

; <label>:412                                     ; preds = %.thread82
  %413 = load %struct.cookie_jar** @wget_cookie_jar, align 8, !tbaa !0
  %414 = icmp eq %struct.cookie_jar* %413, null
  br i1 %414, label %415, label %.preheader97

; <label>:415                                     ; preds = %412
  call void @__assert(i8* getelementptr inbounds ([8 x i8]* @__func__.gethttp, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8]* @.str, i64 0, i64 0), i32 1887, i8* getelementptr inbounds ([24 x i8]* @.str85, i64 0, i64 0)) nounwind
  br label %.preheader97

.preheader97:                                     ; preds = %415, %412
  %416 = call fastcc i32 @resp_header_locate(%struct.response* %373, i8* getelementptr inbounds ([11 x i8]* @.str86, i64 0, i64 0), i32 0, i8** %scbeg, i8** %scend)
  %417 = icmp eq i32 %416, -1
  br i1 %417, label %.loopexit98, label %.lr.ph99

.lr.ph99:                                         ; preds = %.lr.ph99, %.preheader97
  %418 = phi i32 [ %435, %.lr.ph99 ], [ %416, %.preheader97 ]
  %419 = load i8** %scbeg, align 8, !tbaa !0
  %420 = load i8** %scend, align 8, !tbaa !0
  %421 = ptrtoint i8* %420 to i64
  %422 = ptrtoint i8* %419 to i64
  %423 = sub i64 %421, %422
  %424 = trunc i64 %423 to i32
  %425 = add nsw i32 %424, 1
  %426 = sext i32 %425 to i64
  %427 = alloca i8, i64 %426, align 1
  %428 = sext i32 %424 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %427, i8* %419, i64 %428, i32 1, i1 false)
  %429 = getelementptr inbounds i8* %427, i64 %428
  store i8 0, i8* %429, align 1, !tbaa !1
  %430 = load %struct.cookie_jar** @wget_cookie_jar, align 8, !tbaa !0
  %431 = load i8** %69, align 8, !tbaa !0
  %432 = load i32* %101, align 4, !tbaa !5
  %433 = load i8** %169, align 8, !tbaa !0
  call void @cookie_handle_set_cookie(%struct.cookie_jar* %430, i8* %431, i32 %432, i8* %433, i8* %427) nounwind
  %434 = add nsw i32 %418, 1
  %435 = call fastcc i32 @resp_header_locate(%struct.response* %373, i8* getelementptr inbounds ([11 x i8]* @.str86, i64 0, i64 0), i32 %434, i8** %scbeg, i8** %scend)
  %436 = icmp eq i32 %435, -1
  br i1 %436, label %.loopexit98, label %.lr.ph99

.loopexit98:                                      ; preds = %.lr.ph99, %.preheader97, %.thread82
  br i1 %keep_alive.0, label %437, label %444

; <label>:437                                     ; preds = %.loopexit98
  %438 = getelementptr inbounds %struct.url* %conn.3, i64 0, i32 2
  %439 = load i8** %438, align 8, !tbaa !0
  %440 = getelementptr inbounds %struct.url* %conn.3, i64 0, i32 3
  %441 = load i32* %440, align 4, !tbaa !5
  %442 = and i8 %using_ssl.2, 1
  %443 = icmp ne i8 %442, 0
  call fastcc void @register_persistent(i8* %439, i32 %441, i32 %sock.2, i1 zeroext %443)
  br label %444

; <label>:444                                     ; preds = %437, %.loopexit98
  %445 = icmp eq i32 %374, 401
  br i1 %445, label %446, label %523

; <label>:446                                     ; preds = %444
  %keep_alive.0.not = xor i1 %keep_alive.0, true
  %brmerge = or i1 %3, %keep_alive.0.not
  br i1 %brmerge, label %455, label %447

; <label>:447                                     ; preds = %446
  %448 = call fastcc zeroext i1 @skip_short_body(i32 %sock.2, i64 %contlen.084)
  br i1 %448, label %449, label %455

; <label>:449                                     ; preds = %447
  br i1 %keep_alive.0, label %460, label %450

; <label>:450                                     ; preds = %449
  %.b82 = load i1* @pconn_active.b, align 1
  %451 = load i32* getelementptr inbounds (%struct.anon* @pconn, i64 0, i32 0), align 8, !tbaa !5
  %452 = icmp eq i32 %sock.2, %451
  %or.cond28 = and i1 %.b82, %452
  br i1 %or.cond28, label %453, label %454

; <label>:453                                     ; preds = %450
  call fastcc void @invalidate_persistent()
  br label %460

; <label>:454                                     ; preds = %450
  call void @fd_close(i32 %sock.2) nounwind
  br label %460

; <label>:455                                     ; preds = %447, %446
  %.b81 = load i1* @pconn_active.b, align 1
  %456 = load i32* getelementptr inbounds (%struct.anon* @pconn, i64 0, i32 0), align 8, !tbaa !5
  %457 = icmp eq i32 %sock.2, %456
  %or.cond31 = and i1 %.b81, %457
  br i1 %or.cond31, label %458, label %459

; <label>:458                                     ; preds = %455
  call fastcc void @invalidate_persistent()
  br label %460

; <label>:459                                     ; preds = %455
  call void @fd_close(i32 %sock.2) nounwind
  br label %460

; <label>:460                                     ; preds = %459, %458, %454, %453, %449
  %sock.3 = phi i32 [ %sock.2, %449 ], [ %sock.2, %453 ], [ -1, %454 ], [ -1, %459 ], [ -1, %458 ]
  store i8 0, i8* getelementptr inbounds (%struct.anon* @pconn, i64 0, i32 4), align 1, !tbaa !3
  %461 = load i8* %auth_finished, align 1, !tbaa !3, !range !4
  %462 = icmp eq i8 %461, 0
  br i1 %462, label %463, label %.critedge

; <label>:463                                     ; preds = %460
  %464 = load i8** %user, align 8, !tbaa !0
  %465 = icmp eq i8* %464, null
  br i1 %465, label %.critedge, label %466

; <label>:466                                     ; preds = %463
  %467 = load i8** %passwd, align 8, !tbaa !0
  %468 = icmp eq i8* %467, null
  br i1 %468, label %.critedge, label %.preheader100

.preheader100:                                    ; preds = %471, %466
  %wapos.0 = phi i32 [ %475, %471 ], [ 0, %466 ]
  %469 = call fastcc i32 @resp_header_locate(%struct.response* %373, i8* getelementptr inbounds ([17 x i8]* @.str87, i64 0, i64 0), i32 %wapos.0, i8** %wabeg, i8** %waend)
  %470 = icmp eq i32 %469, -1
  br i1 %470, label %.thread85, label %471

; <label>:471                                     ; preds = %.preheader100
  %472 = load i8** %wabeg, align 8, !tbaa !0
  %473 = load i8** %waend, align 8, !tbaa !0
  %474 = call fastcc zeroext i1 @known_authentication_scheme_p(i8* %472, i8* %473)
  %475 = add nsw i32 %469, 1
  br i1 %474, label %476, label %.preheader100

; <label>:476                                     ; preds = %471
  %477 = ptrtoint i8* %473 to i64
  %478 = ptrtoint i8* %472 to i64
  %479 = sub i64 %477, %478
  %480 = trunc i64 %479 to i32
  %481 = add nsw i32 %480, 1
  %482 = sext i32 %481 to i64
  %483 = alloca i8, i64 %482, align 1
  %484 = sext i32 %480 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %483, i8* %472, i64 %484, i32 1, i1 false)
  %485 = getelementptr inbounds i8* %483, i64 %484
  store i8 0, i8* %485, align 1, !tbaa !1
  br i1 %basic_auth_finished.0, label %487, label %493

.thread85:                                        ; preds = %.preheader100
  %486 = call i8* @libintl_gettext(i8* getelementptr inbounds ([32 x i8]* @.str88, i64 0, i64 0)) nounwind
  call void @logputs(i32 1, i8* %486) nounwind
  br label %.critedge

; <label>:487                                     ; preds = %476
  %488 = call i32 @strncasecmp(i8* %483, i8* getelementptr inbounds ([6 x i8]* @.str89, i64 0, i64 0), i64 5) nounwind readonly
  %489 = icmp eq i32 %488, 0
  br i1 %489, label %490, label %493

; <label>:490                                     ; preds = %487
  %491 = getelementptr inbounds i8* %483, i64 5
  %492 = load i8* %491, align 1, !tbaa !1
  switch i8 %492, label %493 [
    i8 32, label %.critedge
    i8 13, label %.critedge
    i8 12, label %.critedge
    i8 11, label %.critedge
    i8 10, label %.critedge
    i8 9, label %.critedge
    i8 0, label %.critedge
  ]

; <label>:493                                     ; preds = %490, %487, %476
  %494 = call i8* @url_full_path(%struct.url* %u) nounwind
  %495 = load i8** %user, align 8, !tbaa !0
  %496 = load i8** %passwd, align 8, !tbaa !0
  %497 = call fastcc i8* @request_method(%struct.request* %24)
  %498 = call fastcc i8* @create_authorization_line(i8* %483, i8* %495, i8* %496, i8* %497, i8* %494, i8* %auth_finished)
  call fastcc void @request_set_header(%struct.request* %24, i8* getelementptr inbounds ([14 x i8]* @.str69, i64 0, i64 0), i8* %498, i32 2)
  %499 = call i32 @strncasecmp(i8* %483, i8* getelementptr inbounds ([5 x i8]* @.str90, i64 0, i64 0), i64 4) nounwind readonly
  %500 = icmp eq i32 %499, 0
  br i1 %500, label %501, label %504

; <label>:501                                     ; preds = %493
  %502 = getelementptr inbounds i8* %483, i64 4
  %503 = load i8* %502, align 1, !tbaa !1
  switch i8 %503, label %504 [
    i8 32, label %.critedge28
    i8 13, label %.critedge28
    i8 12, label %.critedge28
    i8 11, label %.critedge28
    i8 10, label %.critedge28
    i8 9, label %.critedge28
    i8 0, label %.critedge28
  ]

; <label>:504                                     ; preds = %501, %493
  %505 = load i8** %65, align 8, !tbaa !0
  %506 = icmp eq i8* %505, null
  br i1 %506, label %507, label %.critedge28

; <label>:507                                     ; preds = %504
  %508 = call i32 @strncasecmp(i8* %483, i8* getelementptr inbounds ([6 x i8]* @.str89, i64 0, i64 0), i64 5) nounwind readonly
  %509 = icmp eq i32 %508, 0
  br i1 %509, label %510, label %.critedge28

; <label>:510                                     ; preds = %507
  %511 = getelementptr inbounds i8* %483, i64 5
  %512 = load i8* %511, align 1, !tbaa !1
  switch i8 %512, label %.critedge28 [
    i8 32, label %.critedge37
    i8 13, label %.critedge37
    i8 12, label %.critedge37
    i8 11, label %.critedge37
    i8 10, label %.critedge37
    i8 9, label %.critedge37
    i8 0, label %.critedge37
  ]

.critedge37:                                      ; preds = %510, %510, %510, %510, %510, %510, %510
  %513 = load i8** %69, align 8, !tbaa !0
  call fastcc void @register_basic_auth_host(i8* %513)
  br label %.critedge28

.critedge28:                                      ; preds = %.critedge37, %510, %507, %504, %501, %501, %501, %501, %501, %501, %501
  %ntlm_seen.1 = phi i8 [ %ntlm_seen.0, %504 ], [ %ntlm_seen.0, %507 ], [ %ntlm_seen.0, %.critedge37 ], [ 1, %501 ], [ 1, %501 ], [ 1, %501 ], [ 1, %501 ], [ 1, %501 ], [ 1, %501 ], [ 1, %501 ], [ %ntlm_seen.0, %510 ]
  call void @free(i8* %494)
  %514 = load i8** %message, align 8, !tbaa !0
  %515 = icmp eq i8* %514, null
  br i1 %515, label %517, label %516

; <label>:516                                     ; preds = %.critedge28
  call void @free(i8* %514)
  br label %517

; <label>:517                                     ; preds = %516, %.critedge28
  call fastcc void @resp_free(%struct.response* %373)
  call void @free(i8* %347)
  br label %171

.critedge:                                        ; preds = %490, %490, %490, %490, %490, %490, %490, %.thread85, %466, %463, %460
  %518 = call i8* @libintl_gettext(i8* getelementptr inbounds ([23 x i8]* @.str91, i64 0, i64 0)) nounwind
  call void @logputs(i32 1, i8* %518) nounwind
  call fastcc void @request_free(%struct.request* %24)
  %519 = load i8** %message, align 8, !tbaa !0
  %520 = icmp eq i8* %519, null
  br i1 %520, label %522, label %521

; <label>:521                                     ; preds = %.critedge
  call void @free(i8* %519)
  br label %522

; <label>:522                                     ; preds = %521, %.critedge
  call fastcc void @resp_free(%struct.response* %373)
  call void @free(i8* %347)
  br label %945

; <label>:523                                     ; preds = %444
  %524 = and i8 %ntlm_seen.0, 1
  %525 = icmp eq i8 %524, 0
  br i1 %525, label %527, label %526

; <label>:526                                     ; preds = %523
  store i8 1, i8* getelementptr inbounds (%struct.anon* @pconn, i64 0, i32 4), align 1, !tbaa !3
  br label %527

; <label>:527                                     ; preds = %526, %523
  %528 = getelementptr inbounds %struct.http_stat* %hs, i64 0, i32 13
  %529 = load i8** %528, align 8, !tbaa !0
  %530 = icmp eq i8* %529, null
  br i1 %530, label %531, label %541

; <label>:531                                     ; preds = %527
  %532 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 113), align 4, !tbaa !3, !range !4
  %533 = icmp eq i8 %532, 0
  br i1 %533, label %539, label %534

; <label>:534                                     ; preds = %531
  %535 = getelementptr inbounds [256 x i8]* %hdrval, i64 0, i64 0
  %536 = call fastcc zeroext i1 @resp_header_copy(%struct.response* %373, i8* getelementptr inbounds ([20 x i8]* @.str92, i64 0, i64 0), i8* %535, i32 256)
  br i1 %536, label %537, label %539

; <label>:537                                     ; preds = %534
  %538 = call fastcc zeroext i1 @parse_content_disposition(i8* %535, i8** %528)
  br i1 %538, label %541, label %539

; <label>:539                                     ; preds = %537, %534, %531
  %540 = call i8* @url_file_name(%struct.url* %u) nounwind
  store i8* %540, i8** %528, align 8, !tbaa !0
  br label %541

; <label>:541                                     ; preds = %539, %537, %527
  %542 = getelementptr inbounds %struct.http_stat* %hs, i64 0, i32 14
  %543 = load i8* %542, align 1, !tbaa !3, !range !4
  %544 = icmp eq i8 %543, 0
  br i1 %544, label %545, label %583

; <label>:545                                     ; preds = %541
  %546 = load i8** %528, align 8, !tbaa !0
  %547 = call zeroext i1 @file_exists_p(i8* %546) nounwind
  br i1 %547, label %548, label %583

; <label>:548                                     ; preds = %545
  %549 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 17), align 2, !tbaa !3, !range !4
  %.not = icmp eq i8 %549, 0
  %550 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 36), align 8, !tbaa !0
  %551 = icmp ne i8* %550, null
  %or.cond39 = or i1 %551, %.not
  br i1 %or.cond39, label %567, label %552

; <label>:552                                     ; preds = %548
  %553 = call i8* @libintl_gettext(i8* getelementptr inbounds ([41 x i8]* @.str3, i64 0, i64 0)) nounwind
  %554 = load i8** %528, align 8, !tbaa !0
  %555 = call i8* @quote(i8* %554) nounwind
  call void (i32, i8*, ...)* @logprintf(i32 0, i8* %553, i8* %555) nounwind
  %556 = load i32* %dt, align 4, !tbaa !5
  %557 = or i32 %556, 2
  store i32 %557, i32* %dt, align 4, !tbaa !5
  %558 = load i8** %528, align 8, !tbaa !0
  %559 = call zeroext i1 @has_html_suffix_p(i8* %558) nounwind
  br i1 %559, label %560, label %563

; <label>:560                                     ; preds = %552
  %561 = load i32* %dt, align 4, !tbaa !5
  %562 = or i32 %561, 1
  store i32 %562, i32* %dt, align 4, !tbaa !5
  br label %563

; <label>:563                                     ; preds = %560, %552
  call void @free(i8* %347)
  %564 = load i8** %message, align 8, !tbaa !0
  %565 = icmp eq i8* %564, null
  br i1 %565, label %945, label %566

; <label>:566                                     ; preds = %563
  call void @free(i8* %564)
  br label %945

; <label>:567                                     ; preds = %548
  %568 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 40), align 1, !tbaa !3, !range !4
  %569 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 72), align 1, !tbaa !3, !range !4
  %570 = or i8 %568, %549
  %571 = or i8 %570, %569
  %572 = icmp eq i8 %571, 0
  br i1 %572, label %573, label %583

; <label>:573                                     ; preds = %567
  %574 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 12), align 8, !tbaa !3, !range !4
  %575 = icmp ne i8 %574, 0
  %or.cond41 = or i1 %575, %551
  br i1 %or.cond41, label %583, label %576

; <label>:576                                     ; preds = %573
  %577 = load i8** %528, align 8, !tbaa !0
  %578 = call i8* @unique_name(i8* %577, i1 zeroext true) nounwind
  %579 = load i8** %528, align 8, !tbaa !0
  %580 = icmp eq i8* %578, %579
  br i1 %580, label %582, label %581

; <label>:581                                     ; preds = %576
  call void @free(i8* %579)
  br label %582

; <label>:582                                     ; preds = %581, %576
  store i8* %578, i8** %528, align 8, !tbaa !0
  br label %583

; <label>:583                                     ; preds = %582, %573, %567, %545, %541
  store i8 1, i8* %542, align 1, !tbaa !3
  %584 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 72), align 1, !tbaa !3, !range !4
  %585 = icmp eq i8 %584, 0
  br i1 %585, label %617, label %586

; <label>:586                                     ; preds = %583
  %587 = getelementptr inbounds %struct.http_stat* %hs, i64 0, i32 15
  %588 = load i8* %587, align 1, !tbaa !3, !range !4
  %589 = icmp eq i8 %588, 0
  br i1 %589, label %590, label %617

; <label>:590                                     ; preds = %586
  %591 = load i8** %528, align 8, !tbaa !0
  %592 = call i64 @strlen(i8* %591) nounwind readonly
  %593 = add i64 %592, 6
  %594 = alloca i8, i64 %593, align 1
  %595 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 73), align 4, !tbaa !3, !range !4
  %596 = icmp eq i8 %595, 0
  br i1 %596, label %.thread86, label %597

; <label>:597                                     ; preds = %590
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %594, i8* %591, i64 %592, i32 1, i1 false)
  %598 = getelementptr inbounds i8* %594, i64 %592
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %598, i8* getelementptr inbounds ([6 x i8]* @.str93, i64 0, i64 0), i64 6, i32 1, i1 false)
  %599 = call i32 @stat(i8* %594, %struct.stat* %st) nounwind
  %600 = icmp eq i32 %599, 0
  %.38 = select i1 %600, i8* %594, i8* null
  br i1 %600, label %606, label %.thread86

.thread86:                                        ; preds = %597, %590
  %local_filename.087 = phi i8* [ %.38, %597 ], [ null, %590 ]
  %601 = load i8** %528, align 8, !tbaa !0
  %602 = call i32 @stat(i8* %601, %struct.stat* %st) nounwind
  %603 = icmp eq i32 %602, 0
  br i1 %603, label %604, label %606

; <label>:604                                     ; preds = %.thread86
  %605 = load i8** %528, align 8, !tbaa !0
  br label %606

; <label>:606                                     ; preds = %604, %.thread86, %597
  %local_filename.1 = phi i8* [ %.38, %597 ], [ %605, %604 ], [ %local_filename.087, %.thread86 ]
  %607 = icmp eq i8* %local_filename.1, null
  br i1 %607, label %617, label %608

; <label>:608                                     ; preds = %606
  %609 = call noalias i8* @xstrdup(i8* %local_filename.1) nounwind
  %610 = getelementptr inbounds %struct.http_stat* %hs, i64 0, i32 16
  store i8* %609, i8** %610, align 8, !tbaa !0
  %611 = getelementptr inbounds %struct.stat* %st, i64 0, i32 10
  %612 = load i64* %611, align 8, !tbaa !7
  %613 = getelementptr inbounds %struct.http_stat* %hs, i64 0, i32 17
  store i64 %612, i64* %613, align 8, !tbaa !8
  %614 = getelementptr inbounds %struct.stat* %st, i64 0, i32 8, i32 0
  %615 = load i64* %614, align 8, !tbaa !7
  %616 = getelementptr inbounds %struct.http_stat* %hs, i64 0, i32 18
  store i64 %615, i64* %616, align 8, !tbaa !7
  br label %617

; <label>:617                                     ; preds = %608, %606, %586, %583
  call fastcc void @request_free(%struct.request* %24)
  %618 = getelementptr inbounds %struct.http_stat* %hs, i64 0, i32 8
  store i32 %374, i32* %618, align 4, !tbaa !5
  %619 = icmp eq i32 %374, -1
  br i1 %619, label %620, label %623

; <label>:620                                     ; preds = %617
  %621 = call i8* @libintl_gettext(i8* getelementptr inbounds ([22 x i8]* @.str94, i64 0, i64 0)) nounwind
  %622 = call noalias i8* @xstrdup(i8* %621) nounwind
  store i8* %622, i8** %21, align 8, !tbaa !0
  br label %632

; <label>:623                                     ; preds = %617
  %624 = load i8** %message, align 8, !tbaa !0
  %625 = load i8* %624, align 1, !tbaa !1
  %626 = icmp eq i8 %625, 0
  br i1 %626, label %627, label %630

; <label>:627                                     ; preds = %623
  %628 = call i8* @libintl_gettext(i8* getelementptr inbounds ([17 x i8]* @.str95, i64 0, i64 0)) nounwind
  %629 = call noalias i8* @xstrdup(i8* %628) nounwind
  store i8* %629, i8** %21, align 8, !tbaa !0
  br label %632

; <label>:630                                     ; preds = %623
  %631 = call noalias i8* @xstrdup(i8* %624) nounwind
  store i8* %631, i8** %21, align 8, !tbaa !0
  br label %632

; <label>:632                                     ; preds = %630, %627, %620
  %633 = load i8** %message, align 8, !tbaa !0
  %634 = icmp eq i8* %633, null
  br i1 %634, label %636, label %635

; <label>:635                                     ; preds = %632
  call void @free(i8* %633)
  br label %636

; <label>:636                                     ; preds = %635, %632
  %637 = call fastcc i8* @resp_header_strdup(%struct.response* %373, i8* getelementptr inbounds ([13 x i8]* @.str62, i64 0, i64 0))
  %638 = icmp ne i8* %637, null
  br i1 %638, label %639, label %646

; <label>:639                                     ; preds = %636
  %640 = call i8* @strchr(i8* %637, i32 59) nounwind readonly
  %641 = icmp eq i8* %640, null
  br i1 %641, label %646, label %switch.edge

switch.edge:                                      ; preds = %643, %643, %643, %643, %643, %643, %639
  %tmp.0 = phi i8* [ %640, %639 ], [ %644, %643 ], [ %644, %643 ], [ %644, %643 ], [ %644, %643 ], [ %644, %643 ], [ %644, %643 ]
  %642 = icmp ugt i8* %tmp.0, %637
  br i1 %642, label %643, label %.critedge39

; <label>:643                                     ; preds = %switch.edge
  %644 = getelementptr inbounds i8* %tmp.0, i64 -1
  %645 = load i8* %644, align 1, !tbaa !1
  switch i8 %645, label %.critedge39 [
    i8 32, label %switch.edge
    i8 12, label %switch.edge
    i8 11, label %switch.edge
    i8 10, label %switch.edge
    i8 9, label %switch.edge
    i8 13, label %switch.edge
  ]

.critedge39:                                      ; preds = %643, %switch.edge
  store i8 0, i8* %tmp.0, align 1, !tbaa !1
  br label %646

; <label>:646                                     ; preds = %.critedge39, %639, %636
  %647 = call fastcc i8* @resp_header_strdup(%struct.response* %373, i8* getelementptr inbounds ([9 x i8]* @.str96, i64 0, i64 0))
  store i8* %647, i8** %19, align 8, !tbaa !0
  %648 = call fastcc i8* @resp_header_strdup(%struct.response* %373, i8* getelementptr inbounds ([14 x i8]* @.str97, i64 0, i64 0))
  store i8* %648, i8** %20, align 8, !tbaa !0
  %649 = getelementptr inbounds [256 x i8]* %hdrval, i64 0, i64 0
  %650 = call fastcc zeroext i1 @resp_header_copy(%struct.response* %373, i8* getelementptr inbounds ([14 x i8]* @.str98, i64 0, i64 0), i8* %649, i32 256)
  br i1 %650, label %651, label %658

; <label>:651                                     ; preds = %646
  %652 = call fastcc zeroext i1 @parse_content_range(i8* %649, i64* %first_byte_pos, i64* %last_byte_pos, i64* %entity_length)
  br i1 %652, label %653, label %658

; <label>:653                                     ; preds = %651
  %654 = load i64* %first_byte_pos, align 8, !tbaa !8
  %655 = load i64* %last_byte_pos, align 8, !tbaa !8
  %656 = sub i64 1, %654
  %657 = add i64 %656, %655
  br label %658

; <label>:658                                     ; preds = %653, %651, %646
  %contrange.0 = phi i64 [ %654, %653 ], [ 0, %651 ], [ 0, %646 ]
  %contlen.1 = phi i64 [ %657, %653 ], [ %contlen.084, %651 ], [ %contlen.084, %646 ]
  call fastcc void @resp_free(%struct.response* %373)
  %.off = add i32 %374, -200
  %659 = icmp ult i32 %.off, 100
  br i1 %659, label %660, label %663

; <label>:660                                     ; preds = %658
  %661 = load i32* %dt, align 4, !tbaa !5
  %662 = or i32 %661, 2
  store i32 %662, i32* %dt, align 4, !tbaa !5
  br label %663

; <label>:663                                     ; preds = %660, %658
  %.off1 = add i32 %374, -301
  %664 = icmp ult i32 %.off1, 3
  %665 = icmp eq i32 %374, 307
  %or.cond60 = or i1 %664, %665
  %666 = icmp eq i32 %374, 300
  %or.cond62 = or i1 %or.cond60, %666
  br i1 %or.cond62, label %667, label %706

; <label>:667                                     ; preds = %663
  call void @cw_act(i32 0) nounwind
  br i1 %666, label %668, label %674

; <label>:668                                     ; preds = %667
  %669 = load i8** %19, align 8, !tbaa !0
  %670 = icmp eq i8* %669, null
  br i1 %670, label %671, label %674

; <label>:671                                     ; preds = %668
  %672 = load i32* %dt, align 4, !tbaa !5
  %673 = or i32 %672, 2
  store i32 %673, i32* %dt, align 4, !tbaa !5
  br label %706

; <label>:674                                     ; preds = %668, %667
  %675 = call i8* @libintl_gettext(i8* getelementptr inbounds ([16 x i8]* @.str99, i64 0, i64 0)) nounwind
  %676 = load i8** %19, align 8, !tbaa !0
  %677 = icmp eq i8* %676, null
  br i1 %677, label %680, label %678

; <label>:678                                     ; preds = %674
  %679 = call i8* @escnonprint_uri(i8* %676) nounwind
  br label %682

; <label>:680                                     ; preds = %674
  %681 = call i8* @libintl_gettext(i8* getelementptr inbounds ([12 x i8]* @.str100, i64 0, i64 0)) nounwind
  br label %682

; <label>:682                                     ; preds = %680, %678
  %683 = phi i8* [ %679, %678 ], [ %681, %680 ]
  %684 = load i8** %19, align 8, !tbaa !0
  %685 = icmp eq i8* %684, null
  br i1 %685, label %688, label %686

; <label>:686                                     ; preds = %682
  %687 = call i8* @libintl_gettext(i8* getelementptr inbounds ([13 x i8]* @.str101, i64 0, i64 0)) nounwind
  br label %688

; <label>:688                                     ; preds = %686, %682
  %689 = phi i8* [ %687, %686 ], [ getelementptr inbounds ([1 x i8]* @.str25, i64 0, i64 0), %682 ]
  call void (i32, i8*, ...)* @logprintf(i32 0, i8* %675, i8* %683, i8* %689) nounwind
  %keep_alive.0.not42 = xor i1 %keep_alive.0, true
  %brmerge43 = or i1 %3, %keep_alive.0.not42
  br i1 %brmerge43, label %698, label %690

; <label>:690                                     ; preds = %688
  %691 = call fastcc zeroext i1 @skip_short_body(i32 %sock.2, i64 %contlen.1)
  br i1 %691, label %692, label %698

; <label>:692                                     ; preds = %690
  br i1 %keep_alive.0, label %703, label %693

; <label>:693                                     ; preds = %692
  %.b80 = load i1* @pconn_active.b, align 1
  %694 = load i32* getelementptr inbounds (%struct.anon* @pconn, i64 0, i32 0), align 8, !tbaa !5
  %695 = icmp eq i32 %sock.2, %694
  %or.cond45 = and i1 %.b80, %695
  br i1 %or.cond45, label %696, label %697

; <label>:696                                     ; preds = %693
  call fastcc void @invalidate_persistent()
  br label %703

; <label>:697                                     ; preds = %693
  call void @fd_close(i32 %sock.2) nounwind
  br label %703

; <label>:698                                     ; preds = %690, %688
  %.b79 = load i1* @pconn_active.b, align 1
  %699 = load i32* getelementptr inbounds (%struct.anon* @pconn, i64 0, i32 0), align 8, !tbaa !5
  %700 = icmp eq i32 %sock.2, %699
  %or.cond47 = and i1 %.b79, %700
  br i1 %or.cond47, label %701, label %702

; <label>:701                                     ; preds = %698
  call fastcc void @invalidate_persistent()
  br label %703

; <label>:702                                     ; preds = %698
  call void @fd_close(i32 %sock.2) nounwind
  br label %703

; <label>:703                                     ; preds = %702, %701, %697, %696, %692
  br i1 %638, label %704, label %705

; <label>:704                                     ; preds = %703
  call void @free(i8* %637)
  br label %705

; <label>:705                                     ; preds = %704, %703
  call void @free(i8* %347)
  br label %945

; <label>:706                                     ; preds = %671, %663
  br i1 %638, label %707, label %713

; <label>:707                                     ; preds = %706
  %708 = call i32 @strncasecmp(i8* %637, i8* getelementptr inbounds ([10 x i8]* @.str102, i64 0, i64 0), i64 9) nounwind readonly
  %709 = icmp eq i32 %708, 0
  br i1 %709, label %713, label %710

; <label>:710                                     ; preds = %707
  %711 = call i32 @strncasecmp(i8* %637, i8* getelementptr inbounds ([22 x i8]* @.str103, i64 0, i64 0), i64 21) nounwind readonly
  %712 = icmp eq i32 %711, 0
  br i1 %712, label %713, label %716

; <label>:713                                     ; preds = %710, %707, %706
  %714 = load i32* %dt, align 4, !tbaa !5
  %715 = or i32 %714, 1
  br label %719

; <label>:716                                     ; preds = %710
  %717 = load i32* %dt, align 4, !tbaa !5
  %718 = and i32 %717, -2
  br label %719

; <label>:719                                     ; preds = %716, %713
  %storemerge = phi i32 [ %715, %713 ], [ %718, %716 ]
  store i32 %storemerge, i32* %dt, align 4
  br i1 %638, label %720, label %725

; <label>:720                                     ; preds = %719
  %721 = call i32 @strncasecmp(i8* %637, i8* getelementptr inbounds ([9 x i8]* @.str104, i64 0, i64 0), i64 8) nounwind readonly
  %722 = icmp eq i32 %721, 0
  br i1 %722, label %723, label %725

; <label>:723                                     ; preds = %720
  %724 = or i32 %storemerge, 64
  br label %728

; <label>:725                                     ; preds = %720, %719
  %726 = load i32* %dt, align 4, !tbaa !5
  %727 = and i32 %726, -65
  br label %728

; <label>:728                                     ; preds = %725, %723
  %storemerge2 = phi i32 [ %727, %725 ], [ %724, %723 ]
  store i32 %storemerge2, i32* %dt, align 4
  %729 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 85), align 1, !tbaa !3, !range !4
  %730 = icmp eq i8 %729, 0
  br i1 %730, label %739, label %731

; <label>:731                                     ; preds = %728
  %732 = and i32 %storemerge2, 1
  %733 = icmp eq i32 %732, 0
  br i1 %733, label %735, label %734

; <label>:734                                     ; preds = %731
  call fastcc void @ensure_extension(%struct.http_stat* %hs, i8* getelementptr inbounds ([6 x i8]* @.str105, i64 0, i64 0), i32* %dt)
  br label %739

; <label>:735                                     ; preds = %731
  %736 = and i32 %storemerge2, 64
  %737 = icmp eq i32 %736, 0
  br i1 %737, label %739, label %738

; <label>:738                                     ; preds = %735
  call fastcc void @ensure_extension(%struct.http_stat* %hs, i8* getelementptr inbounds ([5 x i8]* @.str106, i64 0, i64 0), i32* %dt)
  br label %739

; <label>:739                                     ; preds = %738, %735, %734, %728
  %740 = icmp eq i32 %374, 416
  br i1 %740, label %747, label %741

; <label>:741                                     ; preds = %739
  %742 = load i64* %48, align 8, !tbaa !8
  %743 = icmp sgt i64 %742, 0
  %744 = icmp eq i32 %374, 200
  %or.cond48 = and i1 %743, %744
  %745 = icmp eq i64 %contrange.0, 0
  %or.cond49 = and i1 %or.cond48, %745
  %or.cond49.not = xor i1 %or.cond49, true
  %746 = icmp slt i64 %742, %contlen.1
  %or.cond50 = or i1 %746, %or.cond49.not
  br i1 %or.cond50, label %758, label %747

; <label>:747                                     ; preds = %741, %739
  %748 = call i8* @libintl_gettext(i8* getelementptr inbounds ([59 x i8]* @.str107, i64 0, i64 0)) nounwind
  call void @logputs(i32 0, i8* %748) nounwind
  store i64 %contlen.1, i64* %15, align 8, !tbaa !8
  store i32 0, i32* %17, align 4, !tbaa !5
  %749 = load i32* %dt, align 4, !tbaa !5
  %750 = or i32 %749, 2
  store i32 %750, i32* %dt, align 4, !tbaa !5
  br i1 %638, label %751, label %752

; <label>:751                                     ; preds = %747
  call void @free(i8* %637)
  br label %752

; <label>:752                                     ; preds = %751, %747
  %.b78 = load i1* @pconn_active.b, align 1
  %753 = load i32* getelementptr inbounds (%struct.anon* @pconn, i64 0, i32 0), align 8, !tbaa !5
  %754 = icmp eq i32 %sock.2, %753
  %or.cond53 = and i1 %.b78, %754
  br i1 %or.cond53, label %755, label %756

; <label>:755                                     ; preds = %752
  call fastcc void @invalidate_persistent()
  br label %757

; <label>:756                                     ; preds = %752
  call void @fd_close(i32 %sock.2) nounwind
  br label %757

; <label>:757                                     ; preds = %756, %755
  call void @free(i8* %347)
  br label %945

; <label>:758                                     ; preds = %741
  %759 = icmp ne i64 %contrange.0, 0
  br i1 %759, label %760, label %762

; <label>:760                                     ; preds = %758
  %761 = icmp eq i64 %contrange.0, %742
  br i1 %761, label %.thread88, label %763

; <label>:762                                     ; preds = %758
  %.not54 = icmp ne i32 %374, 206
  %brmerge55 = or i1 %.not54, %759
  br i1 %brmerge55, label %.thread88, label %763

; <label>:763                                     ; preds = %762, %760
  br i1 %638, label %764, label %765

; <label>:764                                     ; preds = %763
  call void @free(i8* %637)
  br label %765

; <label>:765                                     ; preds = %764, %763
  %.b77 = load i1* @pconn_active.b, align 1
  %766 = load i32* getelementptr inbounds (%struct.anon* @pconn, i64 0, i32 0), align 8, !tbaa !5
  %767 = icmp eq i32 %sock.2, %766
  %or.cond57 = and i1 %.b77, %767
  br i1 %or.cond57, label %768, label %769

; <label>:768                                     ; preds = %765
  call fastcc void @invalidate_persistent()
  br label %770

; <label>:769                                     ; preds = %765
  call void @fd_close(i32 %sock.2) nounwind
  br label %770

; <label>:770                                     ; preds = %769, %768
  call void @free(i8* %347)
  br label %945

.thread88:                                        ; preds = %762, %760
  %771 = icmp eq i64 %contlen.1, -1
  %772 = add nsw i64 %contlen.1, %contrange.0
  %storemerge3 = select i1 %771, i64 -1, i64 %772
  store i64 %storemerge3, i64* %16, align 8
  %773 = load i32* getelementptr inbounds (%struct.options* @opt, i64 0, i32 0), align 8, !tbaa !5
  %774 = icmp eq i32 %773, 0
  br i1 %774, label %807, label %775

; <label>:775                                     ; preds = %.thread88
  %776 = load i32* %dt, align 4, !tbaa !5
  %777 = and i32 %776, 2
  %778 = icmp eq i32 %777, 0
  br i1 %778, label %807, label %779

; <label>:779                                     ; preds = %775
  %780 = call i8* @libintl_gettext(i8* getelementptr inbounds ([9 x i8]* @.str108, i64 0, i64 0)) nounwind
  call void @logputs(i32 0, i8* %780) nounwind
  br i1 %771, label %796, label %781

; <label>:781                                     ; preds = %779
  %782 = call i8* @number_to_static_string(i64 %772) nounwind
  call void @logputs(i32 0, i8* %782) nounwind
  %783 = icmp sgt i64 %772, 1023
  br i1 %783, label %784, label %786

; <label>:784                                     ; preds = %781
  %785 = call i8* @human_readable(i64 %772) nounwind
  call void (i32, i8*, ...)* @logprintf(i32 0, i8* getelementptr inbounds ([6 x i8]* @.str109, i64 0, i64 0), i8* %785) nounwind
  br label %786

; <label>:786                                     ; preds = %784, %781
  br i1 %759, label %787, label %805

; <label>:787                                     ; preds = %786
  %788 = icmp sgt i64 %contlen.1, 1023
  br i1 %788, label %789, label %793

; <label>:789                                     ; preds = %787
  %790 = call i8* @libintl_gettext(i8* getelementptr inbounds ([20 x i8]* @.str110, i64 0, i64 0)) nounwind
  %791 = call i8* @number_to_static_string(i64 %contlen.1) nounwind
  %792 = call i8* @human_readable(i64 %contlen.1) nounwind
  call void (i32, i8*, ...)* @logprintf(i32 0, i8* %790, i8* %791, i8* %792) nounwind
  br label %805

; <label>:793                                     ; preds = %787
  %794 = call i8* @libintl_gettext(i8* getelementptr inbounds ([15 x i8]* @.str111, i64 0, i64 0)) nounwind
  %795 = call i8* @number_to_static_string(i64 %contlen.1) nounwind
  call void (i32, i8*, ...)* @logprintf(i32 0, i8* %794, i8* %795) nounwind
  br label %805

; <label>:796                                     ; preds = %779
  %797 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 5), align 2, !tbaa !3, !range !4
  %798 = icmp eq i8 %797, 0
  br i1 %798, label %801, label %799

; <label>:799                                     ; preds = %796
  %800 = call i8* @libintl_gettext(i8* getelementptr inbounds ([8 x i8]* @.str112, i64 0, i64 0)) nounwind
  br label %803

; <label>:801                                     ; preds = %796
  %802 = call i8* @libintl_gettext(i8* getelementptr inbounds ([12 x i8]* @.str100, i64 0, i64 0)) nounwind
  br label %803

; <label>:803                                     ; preds = %801, %799
  %804 = phi i8* [ %800, %799 ], [ %802, %801 ]
  call void @logputs(i32 0, i8* %804) nounwind
  br label %805

; <label>:805                                     ; preds = %803, %793, %789, %786
  br i1 %638, label %.thread91, label %.thread92

.thread91:                                        ; preds = %805
  %806 = call i8* @quotearg_style(i32 5, i8* %637) nounwind
  call void (i32, i8*, ...)* @logprintf(i32 0, i8* getelementptr inbounds ([7 x i8]* @.str113, i64 0, i64 0), i8* %806) nounwind
  br label %808

.thread92:                                        ; preds = %805
  call void @logputs(i32 0, i8* getelementptr inbounds ([2 x i8]* @.str8, i64 0, i64 0)) nounwind
  br label %809

; <label>:807                                     ; preds = %775, %.thread88
  br i1 %638, label %808, label %809

; <label>:808                                     ; preds = %807, %.thread91
  call void @free(i8* %637)
  br label %809

; <label>:809                                     ; preds = %808, %807, %.thread92
  %810 = load i32* %dt, align 4, !tbaa !5
  %811 = and i32 %810, 2
  %812 = icmp eq i32 %811, 0
  %brmerge58 = or i1 %812, %3
  br i1 %brmerge58, label %813, label %828

; <label>:813                                     ; preds = %809
  store i64 0, i64* %15, align 8, !tbaa !8
  store i32 0, i32* %17, align 4, !tbaa !5
  br i1 %3, label %814, label %820

; <label>:814                                     ; preds = %813
  br i1 %keep_alive.0, label %.thread93, label %815

; <label>:815                                     ; preds = %814
  %.b76 = load i1* @pconn_active.b, align 1
  %816 = load i32* getelementptr inbounds (%struct.anon* @pconn, i64 0, i32 0), align 8, !tbaa !5
  %817 = icmp eq i32 %sock.2, %816
  %or.cond61 = and i1 %.b76, %817
  br i1 %or.cond61, label %818, label %819

; <label>:818                                     ; preds = %815
  call fastcc void @invalidate_persistent()
  br label %.thread93

; <label>:819                                     ; preds = %815
  call void @fd_close(i32 %sock.2) nounwind
  br label %.thread93

; <label>:820                                     ; preds = %813
  br i1 %keep_alive.0, label %821, label %823

; <label>:821                                     ; preds = %820
  %822 = call fastcc zeroext i1 @skip_short_body(i32 %sock.2, i64 %contlen.1)
  br i1 %822, label %.thread93, label %823

; <label>:823                                     ; preds = %821, %820
  %.b74 = load i1* @pconn_active.b, align 1
  %824 = load i32* getelementptr inbounds (%struct.anon* @pconn, i64 0, i32 0), align 8, !tbaa !5
  %825 = icmp eq i32 %sock.2, %824
  %or.cond65 = and i1 %.b74, %825
  br i1 %or.cond65, label %826, label %827

; <label>:826                                     ; preds = %823
  call fastcc void @invalidate_persistent()
  br label %.thread93

; <label>:827                                     ; preds = %823
  call void @fd_close(i32 %sock.2) nounwind
  br label %.thread93

.thread93:                                        ; preds = %827, %826, %821, %819, %818, %814
  call void @free(i8* %347)
  br label %945

; <label>:828                                     ; preds = %809
  %829 = load %struct.__sFILE** @output_stream, align 8, !tbaa !0
  %830 = icmp eq %struct.__sFILE* %829, null
  br i1 %830, label %831, label %.thread95

; <label>:831                                     ; preds = %828
  %832 = load i8** %528, align 8, !tbaa !0
  %833 = call i32 @mkalldirs(i8* %832) nounwind
  %834 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 74), align 1, !tbaa !3, !range !4
  %835 = icmp eq i8 %834, 0
  br i1 %835, label %838, label %836

; <label>:836                                     ; preds = %831
  %837 = load i8** %528, align 8, !tbaa !0
  call void @rotate_backups(i8* %837) nounwind
  br label %838

; <label>:838                                     ; preds = %836, %831
  %839 = load i64* %48, align 8, !tbaa !8
  %840 = icmp eq i64 %839, 0
  br i1 %840, label %844, label %841

; <label>:841                                     ; preds = %838
  %842 = load i8** %528, align 8, !tbaa !0
  %843 = call %struct.__sFILE* @fopen(i8* %842, i8* getelementptr inbounds ([3 x i8]* @.str114, i64 0, i64 0)) nounwind
  br label %875

; <label>:844                                     ; preds = %838
  %845 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 17), align 2, !tbaa !3, !range !4
  %846 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 40), align 1, !tbaa !3, !range !4
  %847 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 72), align 1, !tbaa !3, !range !4
  %848 = or i8 %846, %845
  %849 = or i8 %848, %847
  %850 = icmp eq i8 %849, 0
  br i1 %850, label %851, label %856

; <label>:851                                     ; preds = %844
  %852 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 12), align 8, !tbaa !3, !range !4
  %853 = icmp ne i8 %852, 0
  %854 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 36), align 8, !tbaa !0
  %855 = icmp ne i8* %854, null
  %or.cond64 = or i1 %853, %855
  br i1 %or.cond64, label %856, label %859

; <label>:856                                     ; preds = %851, %844
  %857 = load i8** %528, align 8, !tbaa !0
  %858 = call %struct.__sFILE* @fopen(i8* %857, i8* getelementptr inbounds ([3 x i8]* @.str115, i64 0, i64 0)) nounwind
  br label %875

; <label>:859                                     ; preds = %851
  %860 = load i8** %528, align 8, !tbaa !0
  %861 = call %struct.__sFILE* @fopen_excl(i8* %860, i32 1) nounwind
  %862 = icmp eq %struct.__sFILE* %861, null
  br i1 %862, label %863, label %.thread95

; <label>:863                                     ; preds = %859
  %864 = call i32* @__error() nounwind
  %865 = load i32* %864, align 4, !tbaa !5
  %866 = icmp eq i32 %865, 17
  br i1 %866, label %867, label %.thread94

; <label>:867                                     ; preds = %863
  %868 = call i8* @libintl_gettext(i8* getelementptr inbounds ([31 x i8]* @.str116, i64 0, i64 0)) nounwind
  %869 = load i8** %528, align 8, !tbaa !0
  call void (i32, i8*, ...)* @logprintf(i32 1, i8* %868, i8* %869) nounwind
  %.b73 = load i1* @pconn_active.b, align 1
  %870 = load i32* getelementptr inbounds (%struct.anon* @pconn, i64 0, i32 0), align 8, !tbaa !5
  %871 = icmp eq i32 %sock.2, %870
  %or.cond71 = and i1 %.b73, %871
  br i1 %or.cond71, label %872, label %873

; <label>:872                                     ; preds = %867
  call fastcc void @invalidate_persistent()
  br label %874

; <label>:873                                     ; preds = %867
  call void @fd_close(i32 %sock.2) nounwind
  br label %874

; <label>:874                                     ; preds = %873, %872
  call void @free(i8* %347)
  br label %945

; <label>:875                                     ; preds = %856, %841
  %fp.0 = phi %struct.__sFILE* [ %843, %841 ], [ %858, %856 ]
  %876 = icmp eq %struct.__sFILE* %fp.0, null
  br i1 %876, label %.thread94, label %.thread95

.thread94:                                        ; preds = %875, %863
  %877 = load i8** %528, align 8, !tbaa !0
  %878 = call i32* @__error() nounwind
  %879 = load i32* %878, align 4, !tbaa !5
  %880 = call i8* @strerror(i32 %879) nounwind
  call void (i32, i8*, ...)* @logprintf(i32 1, i8* getelementptr inbounds ([8 x i8]* @.str117, i64 0, i64 0), i8* %877, i8* %880) nounwind
  %.b72 = load i1* @pconn_active.b, align 1
  %881 = load i32* getelementptr inbounds (%struct.anon* @pconn, i64 0, i32 0), align 8, !tbaa !5
  %882 = icmp eq i32 %sock.2, %881
  %or.cond73 = and i1 %.b72, %882
  br i1 %or.cond73, label %883, label %884

; <label>:883                                     ; preds = %.thread94
  call fastcc void @invalidate_persistent()
  br label %885

; <label>:884                                     ; preds = %.thread94
  call void @fd_close(i32 %sock.2) nounwind
  br label %885

; <label>:885                                     ; preds = %884, %883
  call void @free(i8* %347)
  br label %945

.thread95:                                        ; preds = %875, %859, %828
  %fp.1 = phi %struct.__sFILE* [ %fp.0, %875 ], [ %829, %828 ], [ %861, %859 ]
  %886 = load i32* getelementptr inbounds (%struct.options* @opt, i64 0, i32 0), align 8, !tbaa !5
  %887 = icmp eq i32 %886, 0
  br i1 %887, label %904, label %888

; <label>:888                                     ; preds = %.thread95
  %889 = call i8* @libintl_gettext(i8* getelementptr inbounds ([15 x i8]* @.str118, i64 0, i64 0)) nounwind
  %890 = load i8** %528, align 8, !tbaa !0
  %891 = load i8* %890, align 1, !tbaa !1
  %892 = icmp eq i8 %891, 45
  br i1 %892, label %893, label %899

; <label>:893                                     ; preds = %888
  %894 = getelementptr inbounds i8* %890, i64 1
  %895 = load i8* %894, align 1, !tbaa !1
  %896 = icmp eq i8 %895, 0
  br i1 %896, label %897, label %899

; <label>:897                                     ; preds = %893
  %898 = call i8* @quote(i8* getelementptr inbounds ([7 x i8]* @.str119, i64 0, i64 0)) nounwind
  br label %902

; <label>:899                                     ; preds = %893, %888
  %900 = load i8** %528, align 8, !tbaa !0
  %901 = call i8* @quote(i8* %900) nounwind
  br label %902

; <label>:902                                     ; preds = %899, %897
  %903 = phi i8* [ %898, %897 ], [ %901, %899 ]
  call void (i32, i8*, ...)* @logprintf(i32 1, i8* %889, i8* %903) nounwind
  br label %904

; <label>:904                                     ; preds = %902, %.thread95
  %905 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 70), align 1, !tbaa !3, !range !4
  %906 = icmp eq i8 %905, 0
  br i1 %906, label %913, label %907

; <label>:907                                     ; preds = %904
  %908 = load i64* %48, align 8, !tbaa !8
  %909 = icmp eq i64 %908, 0
  br i1 %909, label %910, label %913

; <label>:910                                     ; preds = %907
  %911 = call i64 @strlen(i8* %347) nounwind readonly
  %912 = call i64 @fwrite(i8* %347, i64 1, i64 %911, %struct.__sFILE* %fp.1) nounwind
  br label %913

; <label>:913                                     ; preds = %910, %907, %904
  call void @free(i8* %347)
  %914 = icmp ne i64 %contlen.1, -1
  %.74 = zext i1 %914 to i32
  %915 = load i64* %48, align 8, !tbaa !8
  %916 = icmp sgt i64 %915, 0
  %or.cond75 = and i1 %916, %745
  %917 = or i32 %.74, 2
  %flags.1 = select i1 %or.cond75, i32 %917, i32 %.74
  store i64 %915, i64* %15, align 8, !tbaa !8
  %918 = getelementptr inbounds %struct.http_stat* %hs, i64 0, i32 10
  store i64 0, i64* %918, align 8, !tbaa !8
  %919 = select i1 %914, i64 %contlen.1, i64 0
  %920 = load i64* %48, align 8, !tbaa !8
  %921 = getelementptr inbounds %struct.http_stat* %hs, i64 0, i32 11
  %922 = call i32 @fd_read_body(i32 %sock.2, %struct.__sFILE* %fp.1, i64 %919, i64 %920, i64* %918, i64* %15, double* %921, i32 %flags.1) nounwind
  store i32 %922, i32* %17, align 4, !tbaa !5
  %923 = icmp sgt i32 %922, -1
  br i1 %923, label %924, label %930

; <label>:924                                     ; preds = %913
  br i1 %keep_alive.0, label %937, label %925

; <label>:925                                     ; preds = %924
  %.b71 = load i1* @pconn_active.b, align 1
  %926 = load i32* getelementptr inbounds (%struct.anon* @pconn, i64 0, i32 0), align 8, !tbaa !5
  %927 = icmp eq i32 %sock.2, %926
  %or.cond77 = and i1 %.b71, %927
  br i1 %or.cond77, label %928, label %929

; <label>:928                                     ; preds = %925
  call fastcc void @invalidate_persistent()
  br label %937

; <label>:929                                     ; preds = %925
  call void @fd_close(i32 %sock.2) nounwind
  br label %937

; <label>:930                                     ; preds = %913
  %931 = call i8* @fd_errstr(i32 %sock.2) nounwind
  %932 = call noalias i8* @xstrdup(i8* %931) nounwind
  store i8* %932, i8** %18, align 8, !tbaa !0
  %.b = load i1* @pconn_active.b, align 1
  %933 = load i32* getelementptr inbounds (%struct.anon* @pconn, i64 0, i32 0), align 8, !tbaa !5
  %934 = icmp eq i32 %sock.2, %933
  %or.cond79 = and i1 %.b, %934
  br i1 %or.cond79, label %935, label %936

; <label>:935                                     ; preds = %930
  call fastcc void @invalidate_persistent()
  br label %937

; <label>:936                                     ; preds = %930
  call void @fd_close(i32 %sock.2) nounwind
  br label %937

; <label>:937                                     ; preds = %936, %935, %929, %928, %924
  %938 = load %struct.__sFILE** @output_stream, align 8, !tbaa !0
  %939 = icmp eq %struct.__sFILE* %938, null
  br i1 %939, label %940, label %942

; <label>:940                                     ; preds = %937
  %941 = call i32 @fclose(%struct.__sFILE* %fp.1) nounwind
  br label %942

; <label>:942                                     ; preds = %940, %937
  %943 = load i32* %17, align 4, !tbaa !5
  %944 = icmp eq i32 %943, -2
  %.80 = select i1 %944, i32 26, i32 39
  br label %945

; <label>:945                                     ; preds = %942, %885, %874, %.thread93, %770, %757, %705, %566, %563, %522, %367, %359, %342, %317, %313, %302, %298, %278, %277, %268, %267, %235, %232, %218, %12
  %.0 = phi i32 [ 1, %232 ], [ %239, %235 ], [ 52, %342 ], [ 50, %522 ], [ 6, %705 ], [ 38, %757 ], [ 44, %770 ], [ 39, %.thread93 ], [ 24, %885 ], [ 25, %874 ], [ 29, %359 ], [ 30, %367 ], [ 54, %317 ], [ 4, %313 ], [ 1, %218 ], [ 53, %12 ], [ 52, %268 ], [ 52, %267 ], [ 30, %278 ], [ 30, %277 ], [ 4, %298 ], [ 4, %302 ], [ 38, %563 ], [ 38, %566 ], [ %.80, %942 ]
  ret i32 %.0
}

declare void @printwhat(i32, i32)

declare i8* @strerror(i32)

declare i32* @__error()

declare void @abort() noreturn

declare void @nonexisting_url(i8*)

declare i8* @quotearg_style(i32, i8*)

define i64 @http_atotm(i8* %time_string) nounwind uwtable {
  %savedlocale = alloca [256 x i8], align 16
  %t = alloca %struct.tm, align 8
  %1 = call i8* @setlocale(i32 5, i8* null) nounwind
  %2 = icmp eq i8* %1, null
  br i1 %2, label %9, label %3

; <label>:3                                       ; preds = %0
  %4 = call i64 @strlen(i8* %1) nounwind readonly
  %5 = icmp ugt i64 %4, 255
  %6 = getelementptr inbounds [256 x i8]* %savedlocale, i64 0, i64 0
  br i1 %5, label %7, label %8

; <label>:7                                       ; preds = %3
  store i8 0, i8* %6, align 16, !tbaa !1
  br label %11

; <label>:8                                       ; preds = %3
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* %1, i64 %4, i32 1, i1 false)
  br label %11

; <label>:9                                       ; preds = %0
  %10 = getelementptr inbounds [256 x i8]* %savedlocale, i64 0, i64 0
  store i8 0, i8* %10, align 16, !tbaa !1
  br label %11

; <label>:11                                      ; preds = %9, %8, %7
  %12 = call i8* @setlocale(i32 5, i8* getelementptr inbounds ([2 x i8]* @.str39, i64 0, i64 0)) nounwind
  %13 = bitcast %struct.tm* %t to i8*
  br label %14

; <label>:14                                      ; preds = %16, %11
  %i.0 = phi i64 [ 0, %11 ], [ %21, %16 ]
  %15 = icmp ult i64 %i.0, 4
  br i1 %15, label %16, label %.loopexit

; <label>:16                                      ; preds = %14
  call void @llvm.memset.p0i8.i64(i8* %13, i8 0, i64 56, i32 8, i1 false)
  %17 = getelementptr inbounds [4 x i8*]* @http_atotm.time_formats, i64 0, i64 %i.0
  %18 = load i8** %17, align 8, !tbaa !0
  %19 = call i8* @strptime(i8* %time_string, i8* %18, %struct.tm* %t) nounwind
  %20 = call fastcc zeroext i1 @check_end(i8* %19)
  %21 = add i64 %i.0, 1
  br i1 %20, label %22, label %14

; <label>:22                                      ; preds = %16
  %23 = call i64 @timegm(%struct.tm* %t) nounwind
  br label %.loopexit

.loopexit:                                        ; preds = %22, %14
  %ret.0 = phi i64 [ %23, %22 ], [ -1, %14 ]
  %24 = getelementptr inbounds [256 x i8]* %savedlocale, i64 0, i64 0
  %25 = load i8* %24, align 16, !tbaa !1
  %26 = icmp eq i8 %25, 0
  br i1 %26, label %29, label %27

; <label>:27                                      ; preds = %.loopexit
  %28 = call i8* @setlocale(i32 5, i8* %24) nounwind
  br label %29

; <label>:29                                      ; preds = %27, %.loopexit
  ret i64 %ret.0
}

declare i8* @number_to_static_string(i64)

declare void @set_local_file(i8**, i8*)

declare void @touch(i8*, i64)

declare i8* @retr_rate(i64, double)

declare i32 @downloaded_file(i32, i8*)

define internal fastcc void @free_hstat(%struct.http_stat* nocapture %hs) nounwind uwtable {
  %1 = getelementptr inbounds %struct.http_stat* %hs, i64 0, i32 5
  %2 = load i8** %1, align 8, !tbaa !0
  %3 = icmp eq i8* %2, null
  br i1 %3, label %5, label %4

; <label>:4                                       ; preds = %0
  tail call void @free(i8* %2)
  br label %5

; <label>:5                                       ; preds = %4, %0
  %6 = getelementptr inbounds %struct.http_stat* %hs, i64 0, i32 6
  %7 = load i8** %6, align 8, !tbaa !0
  %8 = icmp eq i8* %7, null
  br i1 %8, label %10, label %9

; <label>:9                                       ; preds = %5
  tail call void @free(i8* %7)
  br label %10

; <label>:10                                      ; preds = %9, %5
  %11 = getelementptr inbounds %struct.http_stat* %hs, i64 0, i32 7
  %12 = load i8** %11, align 8, !tbaa !0
  %13 = icmp eq i8* %12, null
  br i1 %13, label %15, label %14

; <label>:14                                      ; preds = %10
  tail call void @free(i8* %12)
  br label %15

; <label>:15                                      ; preds = %14, %10
  %16 = getelementptr inbounds %struct.http_stat* %hs, i64 0, i32 4
  %17 = load i8** %16, align 8, !tbaa !0
  %18 = icmp eq i8* %17, null
  br i1 %18, label %20, label %19

; <label>:19                                      ; preds = %15
  tail call void @free(i8* %17)
  br label %20

; <label>:20                                      ; preds = %19, %15
  %21 = getelementptr inbounds %struct.http_stat* %hs, i64 0, i32 13
  %22 = load i8** %21, align 8, !tbaa !0
  %23 = icmp eq i8* %22, null
  br i1 %23, label %25, label %24

; <label>:24                                      ; preds = %20
  tail call void @free(i8* %22)
  br label %25

; <label>:25                                      ; preds = %24, %20
  %26 = getelementptr inbounds %struct.http_stat* %hs, i64 0, i32 16
  %27 = load i8** %26, align 8, !tbaa !0
  %28 = icmp eq i8* %27, null
  br i1 %28, label %30, label %29

; <label>:29                                      ; preds = %25
  tail call void @free(i8* %27)
  br label %30

; <label>:30                                      ; preds = %29, %25
  %31 = getelementptr inbounds %struct.http_stat* %hs, i64 0, i32 9
  %32 = load i8** %31, align 8, !tbaa !0
  %33 = icmp eq i8* %32, null
  br i1 %33, label %35, label %34

; <label>:34                                      ; preds = %30
  tail call void @free(i8* %32)
  br label %35

; <label>:35                                      ; preds = %34, %30
  %36 = bitcast i8** %1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %36, i8 0, i64 24, i32 8, i1 false)
  ret void
}

declare i8* @setlocale(i32, i8*)

declare i64 @strlen(i8* nocapture) nounwind readonly

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define internal fastcc zeroext i1 @check_end(i8* %p) nounwind uwtable readonly {
  %1 = icmp eq i8* %p, null
  br i1 %1, label %.loopexit14, label %.preheader

.preheader:                                       ; preds = %switch.edge, %0
  %.011 = phi i8* [ %3, %switch.edge ], [ %p, %0 ]
  %2 = load i8* %.011, align 1, !tbaa !1
  switch i8 %2, label %.loopexit [
    i8 32, label %switch.edge
    i8 12, label %switch.edge
    i8 11, label %switch.edge
    i8 10, label %switch.edge
    i8 9, label %switch.edge
    i8 13, label %switch.edge
    i8 0, label %.loopexit14
    i8 71, label %4
  ]

switch.edge:                                      ; preds = %.preheader, %.preheader, %.preheader, %.preheader, %.preheader, %.preheader
  %3 = getelementptr inbounds i8* %.011, i64 1
  br label %.preheader

; <label>:4                                       ; preds = %.preheader
  %5 = getelementptr inbounds i8* %.011, i64 1
  %6 = load i8* %5, align 1, !tbaa !1
  %7 = icmp eq i8 %6, 77
  br i1 %7, label %8, label %.loopexitthread-pre-split

; <label>:8                                       ; preds = %4
  %9 = getelementptr inbounds i8* %.011, i64 2
  %10 = load i8* %9, align 1, !tbaa !1
  %11 = icmp eq i8 %10, 84
  br i1 %11, label %.loopexit14, label %.loopexitthread-pre-split

.loopexitthread-pre-split:                        ; preds = %8, %4
  %.pr = load i8* %.011, align 1, !tbaa !1
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexitthread-pre-split, %.preheader
  %12 = phi i8 [ %.pr, %.loopexitthread-pre-split ], [ %2, %.preheader ]
  switch i8 %12, label %.critedge [
    i8 43, label %13
    i8 45, label %13
  ]

; <label>:13                                      ; preds = %.loopexit, %.loopexit
  %14 = getelementptr inbounds i8* %.011, i64 1
  %15 = load i8* %14, align 1, !tbaa !1
  %.off = add i8 %15, -48
  %16 = icmp ult i8 %.off, 10
  br i1 %16, label %.loopexit14, label %.critedge

.critedge:                                        ; preds = %13, %.loopexit
  br label %.loopexit14

.loopexit14:                                      ; preds = %.critedge, %13, %8, %.preheader, %0
  %.0 = phi i1 [ false, %.critedge ], [ false, %0 ], [ true, %13 ], [ true, %8 ], [ true, %.preheader ]
  ret i1 %.0
}

declare i8* @strptime(i8*, i8*, %struct.tm*)

declare i64 @timegm(%struct.tm*)

define void @save_cookies() nounwind uwtable {
  %1 = load %struct.cookie_jar** @wget_cookie_jar, align 8, !tbaa !0
  %2 = icmp eq %struct.cookie_jar* %1, null
  br i1 %2, label %5, label %3

; <label>:3                                       ; preds = %0
  %4 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 100), align 8, !tbaa !0
  tail call void @cookie_jar_save(%struct.cookie_jar* %1, i8* %4) nounwind
  br label %5

; <label>:5                                       ; preds = %3, %0
  ret void
}

declare void @cookie_jar_save(%struct.cookie_jar*, i8*)

define void @http_cleanup() nounwind uwtable {
  %1 = load i8** getelementptr inbounds (%struct.anon* @pconn, i64 0, i32 1), align 8, !tbaa !0
  %2 = icmp eq i8* %1, null
  br i1 %2, label %4, label %3

; <label>:3                                       ; preds = %0
  tail call void @free(i8* %1)
  br label %4

; <label>:4                                       ; preds = %3, %0
  %5 = load %struct.cookie_jar** @wget_cookie_jar, align 8, !tbaa !0
  %6 = icmp eq %struct.cookie_jar* %5, null
  br i1 %6, label %8, label %7

; <label>:7                                       ; preds = %4
  tail call void @cookie_jar_delete(%struct.cookie_jar* %5) nounwind
  br label %8

; <label>:8                                       ; preds = %7, %4
  ret void
}

declare void @cookie_jar_delete(%struct.cookie_jar*)

declare %struct.cookie_jar* @cookie_jar_new()

declare void @cookie_jar_load(%struct.cookie_jar*, i8*)

declare zeroext i1 @ssl_init()

declare void @scheme_disable(i32)

define internal fastcc noalias %struct.request* @request_new() nounwind uwtable {
  %1 = tail call noalias i8* @xcalloc(i64 1, i64 32) nounwind
  %2 = bitcast i8* %1 to %struct.request*
  %3 = getelementptr inbounds i8* %1, i64 28
  %4 = bitcast i8* %3 to i32*
  store i32 8, i32* %4, align 4, !tbaa !5
  %5 = tail call noalias i8* @xmalloc(i64 192) nounwind
  %6 = bitcast i8* %5 to %struct.request_header*
  %7 = getelementptr inbounds i8* %1, i64 16
  %8 = bitcast i8* %7 to %struct.request_header**
  store %struct.request_header* %6, %struct.request_header** %8, align 8, !tbaa !0
  ret %struct.request* %2
}

declare i8* @url_full_path(%struct.url*)

define internal fastcc void @request_set_method(%struct.request* nocapture %req, i8* %meth, i8* %arg) nounwind uwtable {
  %1 = getelementptr inbounds %struct.request* %req, i64 0, i32 0
  store i8* %meth, i8** %1, align 8, !tbaa !0
  %2 = getelementptr inbounds %struct.request* %req, i64 0, i32 1
  store i8* %arg, i8** %2, align 8, !tbaa !0
  ret void
}

define internal fastcc void @request_set_header(%struct.request* nocapture %req, i8* %name, i8* %value, i32 %release_policy) nounwind uwtable {
  %1 = icmp eq i8* %value, null
  br i1 %1, label %5, label %.preheader

.preheader:                                       ; preds = %0
  %2 = getelementptr inbounds %struct.request* %req, i64 0, i32 3
  %3 = load i32* %2, align 4, !tbaa !5
  %4 = getelementptr inbounds %struct.request* %req, i64 0, i32 2
  br label %7

; <label>:5                                       ; preds = %0
  switch i32 %release_policy, label %42 [
    i32 3, label %6
    i32 1, label %6
  ]

; <label>:6                                       ; preds = %5, %5
  tail call void @free(i8* %name)
  br label %42

; <label>:7                                       ; preds = %10, %.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %10 ], [ 0, %.preheader ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = icmp slt i32 %8, %3
  br i1 %9, label %10, label %20

; <label>:10                                      ; preds = %7
  %11 = load %struct.request_header** %4, align 8, !tbaa !0
  %12 = getelementptr inbounds %struct.request_header* %11, i64 %indvars.iv
  %13 = getelementptr inbounds %struct.request_header* %12, i64 0, i32 0
  %14 = load i8** %13, align 8, !tbaa !0
  %15 = tail call i32 @strcasecmp(i8* %name, i8* %14) nounwind readonly
  %16 = icmp eq i32 %15, 0
  %indvars.iv.next = add i64 %indvars.iv, 1
  br i1 %16, label %17, label %7

; <label>:17                                      ; preds = %10
  tail call fastcc void @release_header(%struct.request_header* %12)
  store i8* %name, i8** %13, align 8, !tbaa !0
  %18 = getelementptr inbounds %struct.request_header* %11, i64 %indvars.iv, i32 1
  store i8* %value, i8** %18, align 8, !tbaa !0
  %19 = getelementptr inbounds %struct.request_header* %11, i64 %indvars.iv, i32 2
  store i32 %release_policy, i32* %19, align 4, !tbaa !12
  br label %42

; <label>:20                                      ; preds = %7
  %21 = getelementptr inbounds %struct.request* %req, i64 0, i32 4
  %22 = load i32* %21, align 4, !tbaa !5
  %23 = icmp slt i32 %3, %22
  br i1 %23, label %33, label %24

; <label>:24                                      ; preds = %20
  %25 = shl i32 %22, 1
  store i32 %25, i32* %21, align 4, !tbaa !5
  %26 = getelementptr inbounds %struct.request* %req, i64 0, i32 2
  %27 = load %struct.request_header** %26, align 8, !tbaa !0
  %28 = bitcast %struct.request_header* %27 to i8*
  %29 = sext i32 %25 to i64
  %30 = mul i64 %29, 24
  %31 = tail call i8* @xrealloc(i8* %28, i64 %30) nounwind
  %32 = bitcast i8* %31 to %struct.request_header*
  store %struct.request_header* %32, %struct.request_header** %26, align 8, !tbaa !0
  br label %33

; <label>:33                                      ; preds = %24, %20
  %34 = load i32* %2, align 4, !tbaa !5
  %35 = add nsw i32 %34, 1
  store i32 %35, i32* %2, align 4, !tbaa !5
  %36 = sext i32 %34 to i64
  %37 = getelementptr inbounds %struct.request* %req, i64 0, i32 2
  %38 = load %struct.request_header** %37, align 8, !tbaa !0
  %39 = getelementptr inbounds %struct.request_header* %38, i64 %36, i32 0
  store i8* %name, i8** %39, align 8, !tbaa !0
  %40 = getelementptr inbounds %struct.request_header* %38, i64 %36, i32 1
  store i8* %value, i8** %40, align 8, !tbaa !0
  %41 = getelementptr inbounds %struct.request_header* %38, i64 %36, i32 2
  store i32 %release_policy, i32* %41, align 4, !tbaa !12
  br label %42

; <label>:42                                      ; preds = %33, %17, %6, %5
  ret void
}

declare i8* @aprintf(i8*, ...)

declare void @search_netrc(i8*, i8**, i8**, i32)

define internal fastcc zeroext i1 @maybe_send_basic_creds(i8* %hostname, i8* %user, i8* %passwd, %struct.request* nocapture %req) nounwind uwtable {
  %1 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 114), align 1, !tbaa !3, !range !4
  %2 = icmp eq i8 %1, 0
  br i1 %2, label %7, label %3

; <label>:3                                       ; preds = %0
  %4 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 71), align 2, !tbaa !3, !range !4
  %5 = icmp eq i8 %4, 0
  br i1 %5, label %23, label %6, !prof !11

; <label>:6                                       ; preds = %3
  tail call void (i8*, ...)* @debug_logprintf(i8* getelementptr inbounds ([56 x i8]* @.str153, i64 0, i64 0)) nounwind
  br label %23

; <label>:7                                       ; preds = %0
  %8 = load %struct.hash_table** @basic_authed_hosts, align 8, !tbaa !0
  %9 = icmp eq %struct.hash_table* %8, null
  br i1 %9, label %18, label %10

; <label>:10                                      ; preds = %7
  %11 = tail call i32 @hash_table_contains(%struct.hash_table* %8, i8* %hostname) nounwind
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %18, label %13

; <label>:13                                      ; preds = %10
  %14 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 71), align 2, !tbaa !3, !range !4
  %15 = icmp eq i8 %14, 0
  br i1 %15, label %23, label %16, !prof !11

; <label>:16                                      ; preds = %13
  %17 = tail call i8* @quote(i8* %hostname) nounwind
  tail call void (i8*, ...)* @debug_logprintf(i8* getelementptr inbounds ([33 x i8]* @.str154, i64 0, i64 0), i8* %17) nounwind
  br label %23

; <label>:18                                      ; preds = %10, %7
  %19 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 71), align 2, !tbaa !3, !range !4
  %20 = icmp eq i8 %19, 0
  br i1 %20, label %25, label %21, !prof !11

; <label>:21                                      ; preds = %18
  %22 = tail call i8* @quote(i8* %hostname) nounwind
  tail call void (i8*, ...)* @debug_logprintf(i8* getelementptr inbounds ([51 x i8]* @.str155, i64 0, i64 0), i8* %22) nounwind
  br label %25

; <label>:23                                      ; preds = %16, %13, %6, %3
  %24 = tail call fastcc i8* @basic_authentication_encode(i8* %user, i8* %passwd)
  tail call fastcc void @request_set_header(%struct.request* %req, i8* getelementptr inbounds ([14 x i8]* @.str69, i64 0, i64 0), i8* %24, i32 2)
  br label %25

; <label>:25                                      ; preds = %23, %21, %18
  %do_challenge.01 = phi i1 [ true, %23 ], [ false, %18 ], [ false, %21 ]
  ret i1 %do_challenge.01
}

declare i32 @scheme_default_port(i32)

declare i8* @strchr(i8*, i32) nounwind readonly

declare i8* @cookie_header(%struct.cookie_jar*, i8*, i32, i8*, i1 zeroext)

declare i64 @file_size(i8*)

define internal fastcc void @request_set_user_header(%struct.request* nocapture %req, i8* %header) nounwind uwtable {
  %1 = call i8* @strchr(i8* %header, i32 58) nounwind readonly
  %2 = icmp eq i8* %1, null
  br i1 %2, label %16, label %3

; <label>:3                                       ; preds = %0
  %4 = ptrtoint i8* %1 to i64
  %5 = ptrtoint i8* %header to i64
  %6 = sub i64 %4, %5
  %7 = trunc i64 %6 to i32
  %8 = add nsw i32 %7, 1
  %9 = sext i32 %8 to i64
  %10 = alloca i8, i64 %9, align 1
  %11 = sext i32 %7 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %10, i8* %header, i64 %11, i32 1, i1 false)
  %12 = getelementptr inbounds i8* %10, i64 %11
  store i8 0, i8* %12, align 1, !tbaa !1
  br label %.critedge

.critedge:                                        ; preds = %.critedge, %.critedge, %.critedge, %.critedge, %.critedge, %.critedge, %3
  %.pn = phi i8* [ %1, %3 ], [ %p.0, %.critedge ], [ %p.0, %.critedge ], [ %p.0, %.critedge ], [ %p.0, %.critedge ], [ %p.0, %.critedge ], [ %p.0, %.critedge ]
  %p.0 = getelementptr inbounds i8* %.pn, i64 1
  %13 = load i8* %p.0, align 1, !tbaa !1
  switch i8 %13, label %14 [
    i8 32, label %.critedge
    i8 13, label %.critedge
    i8 12, label %.critedge
    i8 11, label %.critedge
    i8 10, label %.critedge
    i8 9, label %.critedge
  ]

; <label>:14                                      ; preds = %.critedge
  %15 = call noalias i8* @xstrdup(i8* %10) nounwind
  call fastcc void @request_set_header(%struct.request* %req, i8* %15, i8* %p.0, i32 1)
  br label %16

; <label>:16                                      ; preds = %14, %0
  ret void
}

define internal fastcc i8* @basic_authentication_encode(i8* %user, i8* %passwd) nounwind uwtable {
  %1 = call i64 @strlen(i8* %user) nounwind readonly
  %2 = call i64 @strlen(i8* %passwd) nounwind readonly
  %3 = add i64 %1, 1
  %4 = add i64 %3, %2
  %5 = trunc i64 %4 to i32
  %6 = add nsw i32 %5, 1
  %7 = sext i32 %6 to i64
  %8 = alloca i8, i64 %7, align 1
  %9 = call i32 (i8*, i8*, ...)* @sprintf(i8* %8, i8* getelementptr inbounds ([6 x i8]* @.str151, i64 0, i64 0), i8* %user, i8* %passwd) nounwind
  %10 = add nsw i32 %5, 2
  %11 = sdiv i32 %10, 3
  %12 = shl nsw i32 %11, 2
  %13 = or i32 %12, 1
  %14 = sext i32 %13 to i64
  %15 = alloca i8, i64 %14, align 1
  %16 = call i32 @base64_encode(i8* %8, i32 %5, i8* %15) nounwind
  %17 = call i8* (i8*, ...)* @concat_strings(i8* getelementptr inbounds ([7 x i8]* @.str152, i64 0, i64 0), i8* %15, i8* null) nounwind
  ret i8* %17
}

define internal fastcc zeroext i1 @persistent_available_p(i8* %host, i32 %port, i1 zeroext %ssl, i8* nocapture %host_lookup_failed) nounwind uwtable {
  %ip = alloca %struct.ip_address, align 4
  %.b = load i1* @pconn_active.b, align 1
  br i1 %.b, label %1, label %27

; <label>:1                                       ; preds = %0
  %2 = zext i1 %ssl to i32
  %3 = load i8* getelementptr inbounds (%struct.anon* @pconn, i64 0, i32 3), align 4, !tbaa !3, !range !4
  %4 = zext i8 %3 to i32
  %5 = icmp eq i32 %2, %4
  %6 = load i32* getelementptr inbounds (%struct.anon* @pconn, i64 0, i32 2), align 8, !tbaa !5
  %7 = icmp eq i32 %6, %port
  %or.cond = and i1 %5, %7
  br i1 %or.cond, label %8, label %27

; <label>:8                                       ; preds = %1
  %9 = load i8** getelementptr inbounds (%struct.anon* @pconn, i64 0, i32 1), align 8, !tbaa !0
  %10 = call i32 @strcasecmp(i8* %host, i8* %9) nounwind readonly
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %23, label %12

; <label>:12                                      ; preds = %8
  br i1 %ssl, label %27, label %13

; <label>:13                                      ; preds = %12
  %14 = load i32* getelementptr inbounds (%struct.anon* @pconn, i64 0, i32 0), align 8, !tbaa !5
  %15 = call zeroext i1 @socket_ip_address(i32 %14, %struct.ip_address* %ip, i32 1) nounwind
  br i1 %15, label %17, label %16

; <label>:16                                      ; preds = %13
  call fastcc void @invalidate_persistent()
  br label %27

; <label>:17                                      ; preds = %13
  %18 = call %struct.address_list* @lookup_host(i8* %host, i32 0) nounwind
  %19 = icmp eq %struct.address_list* %18, null
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %17
  store i8 1, i8* %host_lookup_failed, align 1, !tbaa !3
  br label %27

; <label>:21                                      ; preds = %17
  %22 = call zeroext i1 @address_list_contains(%struct.address_list* %18, %struct.ip_address* %ip) nounwind
  call void @address_list_release(%struct.address_list* %18) nounwind
  br i1 %22, label %23, label %27

; <label>:23                                      ; preds = %21, %8
  %24 = load i32* getelementptr inbounds (%struct.anon* @pconn, i64 0, i32 0), align 8, !tbaa !5
  %25 = call zeroext i1 @test_socket_open(i32 %24) nounwind
  br i1 %25, label %27, label %26

; <label>:26                                      ; preds = %23
  call fastcc void @invalidate_persistent()
  br label %27

; <label>:27                                      ; preds = %26, %23, %21, %20, %16, %12, %1, %0
  %.0 = phi i1 [ false, %26 ], [ false, %20 ], [ false, %16 ], [ false, %0 ], [ false, %1 ], [ false, %12 ], [ false, %21 ], [ true, %23 ]
  ret i1 %.0
}

declare void @debug_logprintf(i8*, ...)

define internal fastcc void @request_remove_header(%struct.request* nocapture %req) nounwind uwtable {
  %1 = getelementptr inbounds %struct.request* %req, i64 0, i32 3
  %2 = load i32* %1, align 4, !tbaa !5
  %3 = getelementptr inbounds %struct.request* %req, i64 0, i32 2
  br label %4

; <label>:4                                       ; preds = %7, %0
  %indvars.iv = phi i64 [ %indvars.iv.next, %7 ], [ 0, %0 ]
  %i.0 = phi i32 [ %14, %7 ], [ 0, %0 ]
  %5 = trunc i64 %indvars.iv to i32
  %6 = icmp slt i32 %5, %2
  br i1 %6, label %7, label %.loopexit

; <label>:7                                       ; preds = %4
  %8 = load %struct.request_header** %3, align 8, !tbaa !0
  %9 = getelementptr inbounds %struct.request_header* %8, i64 %indvars.iv
  %10 = getelementptr inbounds %struct.request_header* %9, i64 0, i32 0
  %11 = load i8** %10, align 8, !tbaa !0
  %12 = tail call i32 @strcasecmp(i8* getelementptr inbounds ([14 x i8]* @.str69, i64 0, i64 0), i8* %11) nounwind readonly
  %13 = icmp eq i32 %12, 0
  %indvars.iv.next = add i64 %indvars.iv, 1
  %14 = add nsw i32 %i.0, 1
  br i1 %13, label %15, label %4

; <label>:15                                      ; preds = %7
  tail call fastcc void @release_header(%struct.request_header* %9)
  %16 = load i32* %1, align 4, !tbaa !5
  %17 = add nsw i32 %16, -1
  %18 = icmp slt i32 %i.0, %17
  br i1 %18, label %19, label %27

; <label>:19                                      ; preds = %15
  %20 = bitcast %struct.request_header* %9 to i8*
  %.sum = add i64 %indvars.iv, 1
  %21 = getelementptr inbounds %struct.request_header* %8, i64 %.sum
  %22 = bitcast %struct.request_header* %21 to i8*
  %23 = xor i32 %i.0, -1
  %24 = add i32 %16, %23
  %25 = sext i32 %24 to i64
  %26 = mul i64 %25, 24
  tail call void @llvm.memmove.p0i8.p0i8.i64(i8* %20, i8* %22, i64 %26, i32 8, i1 false)
  br label %27

; <label>:27                                      ; preds = %19, %15
  %28 = load i32* %1, align 4, !tbaa !5
  %29 = add nsw i32 %28, -1
  store i32 %29, i32* %1, align 4, !tbaa !5
  br label %.loopexit

.loopexit:                                        ; preds = %27, %4
  ret void
}

define internal fastcc void @request_free(%struct.request* nocapture %req) nounwind uwtable {
  %1 = getelementptr inbounds %struct.request* %req, i64 0, i32 1
  %2 = load i8** %1, align 8, !tbaa !0
  %3 = icmp eq i8* %2, null
  br i1 %3, label %.preheader, label %4

; <label>:4                                       ; preds = %0
  tail call void @free(i8* %2)
  br label %.preheader

.preheader:                                       ; preds = %4, %0
  %5 = getelementptr inbounds %struct.request* %req, i64 0, i32 3
  %6 = load i32* %5, align 4, !tbaa !5
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %8 = getelementptr inbounds %struct.request* %req, i64 0, i32 2
  br label %9

; <label>:9                                       ; preds = %9, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %9 ]
  %10 = load %struct.request_header** %8, align 8, !tbaa !0
  %11 = getelementptr inbounds %struct.request_header* %10, i64 %indvars.iv
  tail call fastcc void @release_header(%struct.request_header* %11)
  %indvars.iv.next = add i64 %indvars.iv, 1
  %12 = load i32* %5, align 4, !tbaa !5
  %13 = trunc i64 %indvars.iv.next to i32
  %14 = icmp slt i32 %13, %12
  br i1 %14, label %9, label %._crit_edge

._crit_edge:                                      ; preds = %9, %.preheader
  %15 = getelementptr inbounds %struct.request* %req, i64 0, i32 2
  %16 = load %struct.request_header** %15, align 8, !tbaa !0
  %17 = icmp eq %struct.request_header* %16, null
  br i1 %17, label %20, label %18

; <label>:18                                      ; preds = %._crit_edge
  %19 = bitcast %struct.request_header* %16 to i8*
  tail call void @free(i8* %19)
  br label %20

; <label>:20                                      ; preds = %18, %._crit_edge
  %21 = bitcast %struct.request* %req to i8*
  tail call void @free(i8* %21)
  ret void
}

declare i32 @connect_to_host(i8*, i32)

declare zeroext i1 @retryable_socket_connect_error(i32)

define internal fastcc i32 @request_send(%struct.request* nocapture %req, i32 %fd) nounwind uwtable {
  %1 = getelementptr inbounds %struct.request* %req, i64 0, i32 0
  %2 = load i8** %1, align 8, !tbaa !0
  %3 = call i64 @strlen(i8* %2) nounwind readonly
  %4 = getelementptr inbounds %struct.request* %req, i64 0, i32 1
  %5 = load i8** %4, align 8, !tbaa !0
  %6 = call i64 @strlen(i8* %5) nounwind readonly
  %7 = add i64 %3, 12
  %8 = add i64 %7, %6
  %size.018 = trunc i64 %8 to i32
  %9 = getelementptr inbounds %struct.request* %req, i64 0, i32 3
  %10 = load i32* %9, align 4, !tbaa !5
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %.lr.ph22, label %._crit_edge23

.lr.ph22:                                         ; preds = %0
  %12 = getelementptr inbounds %struct.request* %req, i64 0, i32 2
  %13 = load %struct.request_header** %12, align 8, !tbaa !0
  %14 = load i32* %9, align 4, !tbaa !5
  br label %15

; <label>:15                                      ; preds = %15, %.lr.ph22
  %indvars.iv27 = phi i64 [ 0, %.lr.ph22 ], [ %indvars.iv.next28, %15 ]
  %size.020 = phi i32 [ %size.018, %.lr.ph22 ], [ %size.0, %15 ]
  %16 = getelementptr inbounds %struct.request_header* %13, i64 %indvars.iv27, i32 0
  %17 = load i8** %16, align 8, !tbaa !0
  %18 = call i64 @strlen(i8* %17) nounwind readonly
  %19 = getelementptr inbounds %struct.request_header* %13, i64 %indvars.iv27, i32 1
  %20 = load i8** %19, align 8, !tbaa !0
  %21 = call i64 @strlen(i8* %20) nounwind readonly
  %22 = zext i32 %size.020 to i64
  %23 = add i64 %22, 4
  %24 = add i64 %23, %18
  %25 = add i64 %24, %21
  %indvars.iv.next28 = add i64 %indvars.iv27, 1
  %size.0 = trunc i64 %25 to i32
  %26 = trunc i64 %indvars.iv.next28 to i32
  %27 = icmp slt i32 %26, %14
  br i1 %27, label %15, label %._crit_edge23

._crit_edge23:                                    ; preds = %15, %0
  %size.0.lcssa = phi i32 [ %size.018, %0 ], [ %size.0, %15 ]
  %28 = add nsw i32 %size.0.lcssa, 3
  %29 = sext i32 %28 to i64
  %30 = alloca i8, i64 %29, align 1
  %31 = load i8** %1, align 8, !tbaa !0
  %32 = call i64 @strlen(i8* %31) nounwind readonly
  %sext = shl i64 %32, 32
  %33 = ashr exact i64 %sext, 32
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %30, i8* %31, i64 %33, i32 1, i1 false)
  %34 = getelementptr inbounds i8* %30, i64 %33
  %.sum = add i64 %33, 1
  %35 = getelementptr inbounds i8* %30, i64 %.sum
  store i8 32, i8* %34, align 1, !tbaa !1
  %36 = load i8** %4, align 8, !tbaa !0
  %37 = call i64 @strlen(i8* %36) nounwind readonly
  %sext5 = shl i64 %37, 32
  %38 = ashr exact i64 %sext5, 32
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %35, i8* %36, i64 %38, i32 1, i1 false)
  %.sum6 = add i64 %38, %.sum
  %39 = getelementptr inbounds i8* %30, i64 %.sum6
  %.sum7 = add i64 %.sum6, 1
  %40 = getelementptr inbounds i8* %30, i64 %.sum7
  store i8 32, i8* %39, align 1, !tbaa !1
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %40, i8* getelementptr inbounds ([11 x i8]* @.str147, i64 0, i64 0), i64 10, i32 1, i1 false)
  %.sum8 = add i64 %.sum6, 11
  %41 = getelementptr inbounds i8* %30, i64 %.sum8
  %42 = load i32* %9, align 4, !tbaa !5
  %43 = icmp sgt i32 %42, 0
  br i1 %43, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %._crit_edge23
  %44 = getelementptr inbounds %struct.request* %req, i64 0, i32 2
  br label %45

; <label>:45                                      ; preds = %45, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %45 ]
  %p.016 = phi i8* [ %41, %.lr.ph ], [ %60, %45 ]
  %46 = load %struct.request_header** %44, align 8, !tbaa !0
  %47 = getelementptr inbounds %struct.request_header* %46, i64 %indvars.iv, i32 0
  %48 = load i8** %47, align 8, !tbaa !0
  %49 = call i64 @strlen(i8* %48) nounwind readonly
  %sext9 = shl i64 %49, 32
  %50 = ashr exact i64 %sext9, 32
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %p.016, i8* %48, i64 %50, i32 1, i1 false)
  %51 = getelementptr inbounds i8* %p.016, i64 %50
  %.sum10 = add i64 %50, 1
  %52 = getelementptr inbounds i8* %p.016, i64 %.sum10
  store i8 58, i8* %51, align 1, !tbaa !1
  %.sum11 = add i64 %50, 2
  %53 = getelementptr inbounds i8* %p.016, i64 %.sum11
  store i8 32, i8* %52, align 1, !tbaa !1
  %54 = getelementptr inbounds %struct.request_header* %46, i64 %indvars.iv, i32 1
  %55 = load i8** %54, align 8, !tbaa !0
  %56 = call i64 @strlen(i8* %55) nounwind readonly
  %sext12 = shl i64 %56, 32
  %57 = ashr exact i64 %sext12, 32
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %53, i8* %55, i64 %57, i32 1, i1 false)
  %.sum13 = add i64 %57, %.sum11
  %58 = getelementptr inbounds i8* %p.016, i64 %.sum13
  %.sum14 = add i64 %.sum13, 1
  %59 = getelementptr inbounds i8* %p.016, i64 %.sum14
  store i8 13, i8* %58, align 1, !tbaa !1
  %.sum15 = add i64 %.sum13, 2
  %60 = getelementptr inbounds i8* %p.016, i64 %.sum15
  store i8 10, i8* %59, align 1, !tbaa !1
  %indvars.iv.next = add i64 %indvars.iv, 1
  %61 = load i32* %9, align 4, !tbaa !5
  %62 = trunc i64 %indvars.iv.next to i32
  %63 = icmp slt i32 %62, %61
  br i1 %63, label %45, label %._crit_edge

._crit_edge:                                      ; preds = %45, %._crit_edge23
  %p.0.lcssa = phi i8* [ %41, %._crit_edge23 ], [ %60, %45 ]
  %64 = getelementptr inbounds i8* %p.0.lcssa, i64 1
  store i8 13, i8* %p.0.lcssa, align 1, !tbaa !1
  %65 = getelementptr inbounds i8* %p.0.lcssa, i64 2
  store i8 10, i8* %64, align 1, !tbaa !1
  %66 = getelementptr inbounds i8* %p.0.lcssa, i64 3
  store i8 0, i8* %65, align 1, !tbaa !1
  %67 = ptrtoint i8* %66 to i64
  %68 = ptrtoint i8* %30 to i64
  %69 = sub i64 %67, %68
  %70 = icmp eq i64 %69, %29
  br i1 %70, label %72, label %71

; <label>:71                                      ; preds = %._crit_edge
  call void @__assert(i8* getelementptr inbounds ([13 x i8]* @__func__.request_send, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8]* @.str, i64 0, i64 0), i32 367, i8* getelementptr inbounds ([27 x i8]* @.str148, i64 0, i64 0)) nounwind
  br label %72

; <label>:72                                      ; preds = %71, %._crit_edge
  %73 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 71), align 2, !tbaa !3, !range !4
  %74 = icmp eq i8 %73, 0
  br i1 %74, label %76, label %75, !prof !11

; <label>:75                                      ; preds = %72
  call void (i8*, ...)* @debug_logprintf(i8* getelementptr inbounds ([42 x i8]* @.str149, i64 0, i64 0), i8* %30) nounwind
  br label %76

; <label>:76                                      ; preds = %75, %72
  %77 = add nsw i32 %size.0.lcssa, 2
  %78 = call i32 @fd_write(i32 %fd, i8* %30, i32 %77, double -1.000000e+00) nounwind
  %79 = icmp slt i32 %78, 0
  br i1 %79, label %80, label %83

; <label>:80                                      ; preds = %76
  %81 = call i8* @libintl_gettext(i8* getelementptr inbounds ([34 x i8]* @.str150, i64 0, i64 0)) nounwind
  %82 = call i8* @fd_errstr(i32 %fd) nounwind
  call void (i32, i8*, ...)* @logprintf(i32 0, i8* %81, i8* %82) nounwind
  br label %83

; <label>:83                                      ; preds = %80, %76
  ret i32 %78
}

define internal fastcc void @invalidate_persistent() nounwind uwtable {
  %1 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 71), align 2, !tbaa !3, !range !4
  %2 = icmp eq i8 %1, 0
  br i1 %2, label %5, label %3, !prof !11

; <label>:3                                       ; preds = %0
  %4 = load i32* getelementptr inbounds (%struct.anon* @pconn, i64 0, i32 0), align 8, !tbaa !5
  tail call void (i8*, ...)* @debug_logprintf(i8* getelementptr inbounds ([39 x i8]* @.str146, i64 0, i64 0), i32 %4) nounwind
  br label %5

; <label>:5                                       ; preds = %3, %0
  store i1 false, i1* @pconn_active.b, align 1
  %6 = load i32* getelementptr inbounds (%struct.anon* @pconn, i64 0, i32 0), align 8, !tbaa !5
  tail call void @fd_close(i32 %6) nounwind
  %7 = load i8** getelementptr inbounds (%struct.anon* @pconn, i64 0, i32 1), align 8, !tbaa !0
  tail call void @free(i8* %7)
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.anon* @pconn to i8*), i8 0, i64 40, i32 8, i1 false)
  ret void
}

declare void @fd_close(i32)

define internal fastcc i8* @read_http_response_head(i32 %fd) nounwind uwtable {
  %1 = tail call i8* @fd_read_hunk(i32 %fd, i8* (i8*, i8*, i32)* @response_head_terminator, i64 512, i64 65536) nounwind
  ret i8* %1
}

declare i8* @fd_errstr(i32)

define internal fastcc noalias %struct.response* @resp_new(i8* %head) nounwind uwtable {
  %1 = tail call noalias i8* @xcalloc(i64 1, i64 16) nounwind
  %2 = bitcast i8* %1 to %struct.response*
  %3 = bitcast i8* %1 to i8**
  store i8* %head, i8** %3, align 8, !tbaa !0
  %4 = load i8* %head, align 1, !tbaa !1
  %5 = icmp eq i8 %4, 0
  br i1 %5, label %62, label %.preheader

.preheader:                                       ; preds = %0
  %6 = getelementptr inbounds i8* %1, i64 8
  %7 = bitcast i8* %6 to i8***
  %8 = getelementptr inbounds i8* %1, i64 8
  %9 = bitcast i8* %8 to i8***
  br label %.loopexit

.loopexit:                                        ; preds = %43, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %43 ]
  %size.0 = phi i32 [ 0, %.preheader ], [ %size.1.lcssa13, %43 ]
  %count.0 = phi i32 [ 0, %.preheader ], [ %10, %43 ]
  %hdr.0 = phi i8* [ %head, %.preheader ], [ %hdr.2, %43 ]
  %indvars.iv.next = add i64 %indvars.iv, 1
  %10 = add nsw i32 %count.0, 1
  %11 = trunc i64 %indvars.iv.next to i32
  %12 = icmp slt i32 %size.0, %11
  br i1 %12, label %.lr.ph7, label %._crit_edge8.thread

.lr.ph7:                                          ; preds = %.lr.ph7, %.loopexit
  %size.15 = phi i32 [ %16, %.lr.ph7 ], [ %size.0, %.loopexit ]
  %13 = shl i32 %size.15, 1
  %14 = sext i32 %13 to i64
  %15 = icmp slt i32 %13, 16
  %. = select i1 %15, i64 16, i64 %14
  %16 = trunc i64 %. to i32
  %17 = trunc i64 %indvars.iv.next to i32
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %.lr.ph7, label %._crit_edge8

._crit_edge8:                                     ; preds = %.lr.ph7
  %19 = icmp eq i64 %., 0
  br i1 %19, label %._crit_edge8.thread, label %20

; <label>:20                                      ; preds = %._crit_edge8
  %21 = load i8*** %9, align 8, !tbaa !0
  %22 = bitcast i8** %21 to i8*
  %23 = shl nsw i64 %., 3
  %24 = tail call i8* @xrealloc(i8* %22, i64 %23) nounwind
  %25 = bitcast i8* %24 to i8**
  store i8** %25, i8*** %9, align 8, !tbaa !0
  br label %._crit_edge8.thread

._crit_edge8.thread:                              ; preds = %20, %._crit_edge8, %.loopexit
  %size.1.lcssa13 = phi i32 [ %16, %._crit_edge8 ], [ %16, %20 ], [ %size.0, %.loopexit ]
  %26 = load i8*** %7, align 8, !tbaa !0
  %27 = getelementptr inbounds i8** %26, i64 %indvars.iv
  store i8* %hdr.0, i8** %27, align 8, !tbaa !0
  %28 = load i8* %hdr.0, align 1, !tbaa !1
  switch i8 %28, label %33 [
    i8 0, label %45
    i8 13, label %29
  ]

; <label>:29                                      ; preds = %._crit_edge8.thread
  %30 = getelementptr inbounds i8* %hdr.0, i64 1
  %31 = load i8* %30, align 1, !tbaa !1
  %32 = icmp eq i8 %31, 10
  br i1 %32, label %45, label %thread-pre-split

thread-pre-split:                                 ; preds = %29
  %.pr = load i8* %hdr.0, align 1, !tbaa !1
  br label %33

; <label>:33                                      ; preds = %thread-pre-split, %._crit_edge8.thread
  %34 = phi i8 [ %.pr, %thread-pre-split ], [ %28, %._crit_edge8.thread ]
  %35 = icmp eq i8 %34, 10
  br i1 %35, label %45, label %.critedge

.critedge:                                        ; preds = %43, %43, %33
  %hdr.1 = phi i8* [ %hdr.0, %33 ], [ %hdr.2, %43 ], [ %hdr.2, %43 ]
  %36 = tail call i8* @strchr(i8* %hdr.1, i32 10) nounwind readonly
  %37 = icmp eq i8* %36, null
  br i1 %37, label %40, label %38

; <label>:38                                      ; preds = %.critedge
  %39 = getelementptr inbounds i8* %36, i64 1
  br label %43

; <label>:40                                      ; preds = %.critedge
  %41 = tail call i64 @strlen(i8* %hdr.1) nounwind readonly
  %42 = getelementptr inbounds i8* %hdr.1, i64 %41
  br label %43

; <label>:43                                      ; preds = %40, %38
  %hdr.2 = phi i8* [ %39, %38 ], [ %42, %40 ]
  %44 = load i8* %hdr.2, align 1, !tbaa !1
  switch i8 %44, label %.loopexit [
    i8 32, label %.critedge
    i8 9, label %.critedge
  ]

; <label>:45                                      ; preds = %33, %29, %._crit_edge8.thread
  %46 = add nsw i32 %count.0, 2
  %47 = icmp slt i32 %size.1.lcssa13, %46
  br i1 %47, label %.lr.ph, label %._crit_edge.thread

.lr.ph:                                           ; preds = %.lr.ph, %45
  %size.24 = phi i32 [ %51, %.lr.ph ], [ %size.1.lcssa13, %45 ]
  %48 = shl i32 %size.24, 1
  %49 = sext i32 %48 to i64
  %50 = icmp slt i32 %48, 16
  %.3 = select i1 %50, i64 16, i64 %49
  %51 = trunc i64 %.3 to i32
  %52 = icmp slt i32 %51, %46
  br i1 %52, label %.lr.ph, label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph
  %53 = icmp eq i64 %.3, 0
  br i1 %53, label %._crit_edge.thread, label %54

; <label>:54                                      ; preds = %._crit_edge
  %55 = load i8*** %7, align 8, !tbaa !0
  %56 = bitcast i8** %55 to i8*
  %57 = shl nsw i64 %.3, 3
  %58 = tail call i8* @xrealloc(i8* %56, i64 %57) nounwind
  %59 = bitcast i8* %58 to i8**
  store i8** %59, i8*** %7, align 8, !tbaa !0
  br label %._crit_edge.thread

._crit_edge.thread:                               ; preds = %54, %._crit_edge, %45
  %60 = load i8*** %7, align 8, !tbaa !0
  %61 = getelementptr inbounds i8** %60, i64 %indvars.iv.next
  store i8* null, i8** %61, align 8, !tbaa !0
  br label %62

; <label>:62                                      ; preds = %._crit_edge.thread, %0
  ret %struct.response* %2
}

define internal fastcc i32 @resp_status(%struct.response* nocapture %resp, i8** %message) nounwind uwtable {
  %1 = getelementptr inbounds %struct.response* %resp, i64 0, i32 1
  %2 = load i8*** %1, align 8, !tbaa !0
  %3 = icmp eq i8** %2, null
  br i1 %3, label %4, label %9

; <label>:4                                       ; preds = %0
  %5 = icmp eq i8** %message, null
  br i1 %5, label %.critedge18, label %6

; <label>:6                                       ; preds = %4
  %7 = tail call i8* @libintl_gettext(i8* getelementptr inbounds ([30 x i8]* @.str145, i64 0, i64 0)) nounwind
  %8 = tail call noalias i8* @xstrdup(i8* %7) nounwind
  store i8* %8, i8** %message, align 8, !tbaa !0
  br label %.critedge18

; <label>:9                                       ; preds = %0
  %10 = load i8** %2, align 8, !tbaa !0
  %11 = getelementptr inbounds i8** %2, i64 1
  %12 = load i8** %11, align 8, !tbaa !0
  %13 = icmp eq i8* %12, null
  br i1 %13, label %.critedge18, label %14

; <label>:14                                      ; preds = %9
  %15 = ptrtoint i8* %12 to i64
  %16 = ptrtoint i8* %10 to i64
  %17 = sub i64 %15, %16
  %18 = icmp slt i64 %17, 4
  br i1 %18, label %.critedge18, label %19

; <label>:19                                      ; preds = %14
  %20 = tail call i32 @strncmp(i8* %10, i8* getelementptr inbounds ([5 x i8]* @.str79, i64 0, i64 0), i64 4) nounwind readonly
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %.critedge18

; <label>:22                                      ; preds = %19
  %23 = getelementptr inbounds i8* %10, i64 4
  %24 = icmp ult i8* %23, %12
  br i1 %24, label %25, label %.critedge

; <label>:25                                      ; preds = %22
  %26 = load i8* %23, align 1, !tbaa !1
  %27 = icmp eq i8 %26, 47
  br i1 %27, label %28, label %.critedge

; <label>:28                                      ; preds = %25
  %29 = getelementptr inbounds i8* %10, i64 5
  br label %30

; <label>:30                                      ; preds = %32, %28
  %p.0 = phi i8* [ %29, %28 ], [ %35, %32 ]
  %31 = icmp ult i8* %p.0, %12
  br i1 %31, label %32, label %.critedge59

; <label>:32                                      ; preds = %30
  %33 = load i8* %p.0, align 1, !tbaa !1
  %.off60 = add i8 %33, -48
  %34 = icmp ult i8 %.off60, 10
  %35 = getelementptr inbounds i8* %p.0, i64 1
  br i1 %34, label %30, label %36

; <label>:36                                      ; preds = %32
  %37 = icmp eq i8 %33, 46
  %38 = getelementptr inbounds i8* %p.0, i64 1
  %.p.0 = select i1 %37, i8* %38, i8* %p.0
  br label %.critedge59

.critedge59:                                      ; preds = %40, %36, %30
  %p.1 = phi i8* [ %43, %40 ], [ %.p.0, %36 ], [ %p.0, %30 ]
  %39 = icmp ult i8* %p.1, %12
  br i1 %39, label %40, label %.critedge

; <label>:40                                      ; preds = %.critedge59
  %41 = load i8* %p.1, align 1, !tbaa !1
  %.off57 = add i8 %41, -48
  %42 = icmp ult i8 %.off57, 10
  %43 = getelementptr inbounds i8* %p.1, i64 1
  br i1 %42, label %.critedge59, label %.critedge

.critedge:                                        ; preds = %.critedge17, %40, %.critedge59, %25, %22
  %p.2 = phi i8* [ %47, %.critedge17 ], [ %23, %22 ], [ %23, %25 ], [ %p.1, %40 ], [ %p.1, %.critedge59 ]
  %44 = icmp ult i8* %p.2, %12
  br i1 %44, label %45, label %.critedge16

; <label>:45                                      ; preds = %.critedge
  %46 = load i8* %p.2, align 1, !tbaa !1
  switch i8 %46, label %.critedge16 [
    i8 32, label %.critedge17
    i8 13, label %.critedge17
    i8 12, label %.critedge17
    i8 11, label %.critedge17
    i8 10, label %.critedge17
    i8 9, label %.critedge17
  ]

.critedge17:                                      ; preds = %45, %45, %45, %45, %45, %45
  %47 = getelementptr inbounds i8* %p.2, i64 1
  br label %.critedge

.critedge16:                                      ; preds = %45, %.critedge
  %48 = ptrtoint i8* %p.2 to i64
  %49 = sub i64 %15, %48
  %50 = icmp slt i64 %49, 3
  br i1 %50, label %.critedge18, label %51

; <label>:51                                      ; preds = %.critedge16
  %52 = load i8* %p.2, align 1, !tbaa !1
  %53 = sext i8 %52 to i32
  %.off = add i8 %52, -48
  %54 = icmp ult i8 %.off, 10
  br i1 %54, label %55, label %.critedge18

; <label>:55                                      ; preds = %51
  %56 = getelementptr inbounds i8* %p.2, i64 1
  %57 = load i8* %56, align 1, !tbaa !1
  %58 = sext i8 %57 to i32
  %.off55 = add i8 %57, -48
  %59 = icmp ult i8 %.off55, 10
  br i1 %59, label %60, label %.critedge18

; <label>:60                                      ; preds = %55
  %61 = getelementptr inbounds i8* %p.2, i64 2
  %62 = load i8* %61, align 1, !tbaa !1
  %.off56 = add i8 %62, -48
  %63 = icmp ult i8 %.off56, 10
  br i1 %63, label %64, label %.critedge18

; <label>:64                                      ; preds = %60
  %65 = sext i8 %62 to i32
  %66 = mul i32 %53, 100
  %67 = mul i32 %58, 10
  %68 = add i32 %66, -5328
  %69 = add i32 %68, %67
  %70 = add i32 %69, %65
  %71 = icmp eq i8** %message, null
  br i1 %71, label %.critedge18, label %.preheader

.preheader:                                       ; preds = %64
  %72 = getelementptr inbounds i8* %p.2, i64 3
  br label %73

; <label>:73                                      ; preds = %.critedge30, %.preheader
  %p.3 = phi i8* [ %77, %.critedge30 ], [ %72, %.preheader ]
  %74 = icmp ult i8* %p.3, %12
  br i1 %74, label %75, label %.critedge29

; <label>:75                                      ; preds = %73
  %76 = load i8* %p.3, align 1, !tbaa !1
  switch i8 %76, label %.critedge29 [
    i8 32, label %.critedge30
    i8 13, label %.critedge30
    i8 12, label %.critedge30
    i8 11, label %.critedge30
    i8 10, label %.critedge30
    i8 9, label %.critedge30
  ]

.critedge30:                                      ; preds = %75, %75, %75, %75, %75, %75
  %77 = getelementptr inbounds i8* %p.3, i64 1
  br label %73

.critedge29:                                      ; preds = %79, %79, %79, %79, %79, %79, %75, %73
  %end.0 = phi i8* [ %12, %73 ], [ %12, %75 ], [ %80, %79 ], [ %80, %79 ], [ %80, %79 ], [ %80, %79 ], [ %80, %79 ], [ %80, %79 ]
  %78 = icmp ult i8* %p.3, %end.0
  br i1 %78, label %79, label %.critedge39

; <label>:79                                      ; preds = %.critedge29
  %80 = getelementptr inbounds i8* %end.0, i64 -1
  %81 = load i8* %80, align 1, !tbaa !1
  switch i8 %81, label %.critedge39 [
    i8 32, label %.critedge29
    i8 13, label %.critedge29
    i8 12, label %.critedge29
    i8 11, label %.critedge29
    i8 10, label %.critedge29
    i8 9, label %.critedge29
  ]

.critedge39:                                      ; preds = %79, %.critedge29
  %82 = tail call i8* @strdupdelim(i8* %p.3, i8* %end.0) nounwind
  store i8* %82, i8** %message, align 8, !tbaa !0
  br label %.critedge18

.critedge18:                                      ; preds = %.critedge39, %64, %60, %55, %51, %.critedge16, %19, %14, %9, %6, %4
  %.0 = phi i32 [ 200, %4 ], [ 200, %6 ], [ -1, %9 ], [ -1, %19 ], [ -1, %14 ], [ -1, %60 ], [ -1, %55 ], [ -1, %51 ], [ -1, %.critedge16 ], [ %70, %64 ], [ %70, %.critedge39 ]
  ret i32 %.0
}

define internal fastcc void @resp_free(%struct.response* nocapture %resp) nounwind uwtable {
  %1 = getelementptr inbounds %struct.response* %resp, i64 0, i32 1
  %2 = load i8*** %1, align 8, !tbaa !0
  %3 = icmp eq i8** %2, null
  br i1 %3, label %6, label %4

; <label>:4                                       ; preds = %0
  %5 = bitcast i8** %2 to i8*
  tail call void @free(i8* %5)
  br label %6

; <label>:6                                       ; preds = %4, %0
  %7 = bitcast %struct.response* %resp to i8*
  tail call void @free(i8* %7)
  ret void
}

declare zeroext i1 @ssl_connect_wget(i32)

declare zeroext i1 @ssl_check_certificate(i32, i8*)

declare i32 @fd_write(i32, i8*, i32, double)

define internal fastcc i32 @post_file(i32 %sock, i8* %file_name, i64 %promised_size) nounwind uwtable {
  %1 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 71), align 2, !tbaa !3, !range !4
  %2 = icmp eq i8 %1, 0
  br i1 %2, label %4, label %3, !prof !11

; <label>:3                                       ; preds = %0
  tail call void (i8*, ...)* @debug_logprintf(i8* getelementptr inbounds ([27 x i8]* @.str141, i64 0, i64 0), i8* %file_name) nounwind
  br label %4

; <label>:4                                       ; preds = %3, %0
  %5 = tail call %struct.__sFILE* @fopen(i8* %file_name, i8* getelementptr inbounds ([3 x i8]* @.str142, i64 0, i64 0)) nounwind
  %6 = icmp eq %struct.__sFILE* %5, null
  br i1 %6, label %45, label %.preheader

.preheader:                                       ; preds = %4
  %7 = getelementptr inbounds %struct.__sFILE* %5, i64 0, i32 3
  br label %8

; <label>:8                                       ; preds = %23, %.preheader
  %written.0 = phi i64 [ %31, %23 ], [ 0, %.preheader ]
  %9 = load i32* @__isthreaded, align 4, !tbaa !5
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %15

; <label>:11                                      ; preds = %8
  %12 = load i16* %7, align 2, !tbaa !6
  %13 = and i16 %12, 32
  %14 = icmp eq i16 %13, 0
  %.old = icmp slt i64 %written.0, %promised_size
  %or.cond2 = and i1 %14, %.old
  br i1 %or.cond2, label %19, label %.critedge

; <label>:15                                      ; preds = %8
  %16 = tail call i32 @feof(%struct.__sFILE* %5) nounwind
  %17 = icmp eq i32 %16, 0
  %18 = icmp slt i64 %written.0, %promised_size
  %or.cond = and i1 %17, %18
  br i1 %or.cond, label %19, label %.critedge

; <label>:19                                      ; preds = %15, %11
  %20 = tail call i64 @fread(i8* getelementptr inbounds ([8192 x i8]* @post_file.chunk, i64 0, i64 0), i64 1, i64 8192, %struct.__sFILE* %5) nounwind
  %21 = trunc i64 %20 to i32
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %.critedge, label %23

; <label>:23                                      ; preds = %19
  %24 = sub nsw i64 %promised_size, %written.0
  %25 = sext i32 %21 to i64
  %26 = icmp sgt i64 %24, %25
  %. = select i1 %26, i64 %25, i64 %24
  %27 = trunc i64 %. to i32
  %28 = tail call i32 @fd_write(i32 %sock, i8* getelementptr inbounds ([8192 x i8]* @post_file.chunk, i64 0, i64 0), i32 %27, double -1.000000e+00) nounwind
  %29 = icmp slt i32 %28, 0
  %30 = sext i32 %27 to i64
  %31 = add nsw i64 %30, %written.0
  br i1 %29, label %32, label %8

; <label>:32                                      ; preds = %23
  %33 = tail call i32 @fclose(%struct.__sFILE* %5) nounwind
  br label %45

.critedge:                                        ; preds = %19, %15, %11
  %34 = tail call i32 @fclose(%struct.__sFILE* %5) nounwind
  %35 = icmp slt i64 %written.0, %promised_size
  br i1 %35, label %36, label %38

; <label>:36                                      ; preds = %.critedge
  %37 = tail call i32* @__error() nounwind
  store i32 22, i32* %37, align 4, !tbaa !5
  br label %45

; <label>:38                                      ; preds = %.critedge
  %39 = icmp eq i64 %written.0, %promised_size
  br i1 %39, label %41, label %40

; <label>:40                                      ; preds = %38
  tail call void @__assert(i8* getelementptr inbounds ([10 x i8]* @__func__.post_file, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8]* @.str, i64 0, i64 0), i32 489, i8* getelementptr inbounds ([25 x i8]* @.str143, i64 0, i64 0)) nounwind
  br label %41

; <label>:41                                      ; preds = %40, %38
  %42 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 71), align 2, !tbaa !3, !range !4
  %43 = icmp eq i8 %42, 0
  br i1 %43, label %45, label %44, !prof !11

; <label>:44                                      ; preds = %41
  tail call void (i8*, ...)* @debug_logprintf(i8* getelementptr inbounds ([7 x i8]* @.str144, i64 0, i64 0)) nounwind
  br label %45

; <label>:45                                      ; preds = %44, %41, %36, %32, %4
  %.0 = phi i32 [ -1, %36 ], [ -1, %32 ], [ -1, %4 ], [ 0, %41 ], [ 0, %44 ]
  ret i32 %.0
}

define internal fastcc void @print_server_response(%struct.response* nocapture %resp) nounwind uwtable {
  %1 = getelementptr inbounds %struct.response* %resp, i64 0, i32 1
  %2 = load i8*** %1, align 8, !tbaa !0
  %3 = icmp eq i8** %2, null
  br i1 %3, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %0
  %4 = load i8*** %1, align 8, !tbaa !0
  %5 = getelementptr inbounds i8** %4, i64 1
  %6 = load i8** %5, align 8, !tbaa !0
  %7 = icmp eq i8* %6, null
  br i1 %7, label %.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %24, %.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %24 ], [ 1, %.preheader ]
  %8 = phi i8* [ %27, %24 ], [ %6, %.preheader ]
  %9 = phi i8** [ %25, %24 ], [ %4, %.preheader ]
  %i.01 = phi i64 [ %indvars.iv, %24 ], [ 0, %.preheader ]
  %sext = shl i64 %i.01, 32
  %10 = ashr exact i64 %sext, 32
  %11 = getelementptr inbounds i8** %9, i64 %10
  %12 = load i8** %11, align 8, !tbaa !0
  %13 = icmp ult i8* %12, %8
  br i1 %13, label %14, label %18

; <label>:14                                      ; preds = %.lr.ph
  %15 = getelementptr inbounds i8* %8, i64 -1
  %16 = load i8* %15, align 1, !tbaa !1
  %17 = icmp eq i8 %16, 10
  %. = select i1 %17, i8* %15, i8* %8
  br label %18

; <label>:18                                      ; preds = %14, %.lr.ph
  %e.0 = phi i8* [ %8, %.lr.ph ], [ %., %14 ]
  %19 = icmp ult i8* %12, %e.0
  br i1 %19, label %20, label %24

; <label>:20                                      ; preds = %18
  %21 = getelementptr inbounds i8* %e.0, i64 -1
  %22 = load i8* %21, align 1, !tbaa !1
  %23 = icmp eq i8 %22, 13
  %.e.0 = select i1 %23, i8* %21, i8* %e.0
  br label %24

; <label>:24                                      ; preds = %20, %18
  %e.1 = phi i8* [ %e.0, %18 ], [ %.e.0, %20 ]
  tail call fastcc void @print_response_line(i8* %12, i8* %e.1)
  %indvars.iv.next = add i64 %indvars.iv, 1
  %25 = load i8*** %1, align 8, !tbaa !0
  %26 = getelementptr inbounds i8** %25, i64 %indvars.iv.next
  %27 = load i8** %26, align 8, !tbaa !0
  %28 = icmp eq i8* %27, null
  br i1 %28, label %.loopexit, label %.lr.ph

.loopexit:                                        ; preds = %24, %.preheader, %0
  ret void
}

define internal fastcc zeroext i1 @resp_header_copy(%struct.response* nocapture %resp, i8* nocapture %name, i8* nocapture %buf, i32 %bufsize) nounwind uwtable {
  %b = alloca i8*, align 8
  %e = alloca i8*, align 8
  %1 = call fastcc zeroext i1 @resp_header_get(%struct.response* %resp, i8* %name, i8** %b, i8** %e)
  br i1 %1, label %2, label %15

; <label>:2                                       ; preds = %0
  %3 = icmp eq i32 %bufsize, 0
  br i1 %3, label %15, label %4

; <label>:4                                       ; preds = %2
  %5 = load i8** %e, align 8, !tbaa !0
  %6 = load i8** %b, align 8, !tbaa !0
  %7 = ptrtoint i8* %5 to i64
  %8 = ptrtoint i8* %6 to i64
  %9 = sub i64 %7, %8
  %10 = add nsw i32 %bufsize, -1
  %11 = sext i32 %10 to i64
  %12 = icmp sgt i64 %9, %11
  %. = select i1 %12, i64 %11, i64 %9
  %sext = shl i64 %., 32
  %13 = ashr exact i64 %sext, 32
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %buf, i8* %6, i64 %13, i32 1, i1 false)
  %14 = getelementptr inbounds i8* %buf, i64 %13
  store i8 0, i8* %14, align 1, !tbaa !1
  br label %15

; <label>:15                                      ; preds = %4, %2, %0
  %.0 = phi i1 [ false, %0 ], [ true, %2 ], [ true, %4 ]
  ret i1 %.0
}

declare i64 @strtoll(i8*, i8** nocapture, i32) nounwind

declare i32 @strcasecmp(i8* nocapture, i8* nocapture) nounwind readonly

define internal fastcc i32 @resp_header_locate(%struct.response* nocapture %resp, i8* nocapture %name, i32 %start, i8** nocapture %begptr, i8** nocapture %endptr) nounwind uwtable {
  %1 = getelementptr inbounds %struct.response* %resp, i64 0, i32 1
  %2 = load i8*** %1, align 8, !tbaa !0
  %3 = icmp eq i8** %2, null
  br i1 %3, label %.loopexit, label %4

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8** %2, i64 1
  %6 = load i8** %5, align 8, !tbaa !0
  %7 = icmp eq i8* %6, null
  br i1 %7, label %.loopexit, label %8

; <label>:8                                       ; preds = %4
  %9 = tail call i64 @strlen(i8* %name) nounwind readonly
  %10 = trunc i64 %9 to i32
  %11 = icmp slt i32 %start, 1
  %start. = select i1 %11, i32 1, i32 %start
  %12 = sext i32 %10 to i64
  %13 = icmp sgt i32 %start, 1
  %14 = zext i32 %start to i64
  %15 = select i1 %13, i64 %14, i64 1
  br label %.backedge

.backedge:                                        ; preds = %31, %27, %20, %8
  %indvars.iv = phi i64 [ %15, %8 ], [ %indvars.iv.next, %20 ], [ %indvars.iv.next, %27 ], [ %indvars.iv.next, %31 ]
  %i.0 = phi i32 [ %start., %8 ], [ %16, %20 ], [ %16, %27 ], [ %16, %31 ]
  %indvars.iv.next = add i64 %indvars.iv, 1
  %16 = add nsw i32 %i.0, 1
  %17 = getelementptr inbounds i8** %2, i64 %indvars.iv.next
  %18 = load i8** %17, align 8, !tbaa !0
  %19 = icmp eq i8* %18, null
  br i1 %19, label %.loopexit, label %20

; <label>:20                                      ; preds = %.backedge
  %21 = getelementptr inbounds i8** %2, i64 %indvars.iv
  %22 = load i8** %21, align 8, !tbaa !0
  %23 = ptrtoint i8* %18 to i64
  %24 = ptrtoint i8* %22 to i64
  %25 = sub i64 %23, %24
  %26 = icmp sgt i64 %25, %12
  br i1 %26, label %27, label %.backedge

; <label>:27                                      ; preds = %20
  %28 = getelementptr inbounds i8* %22, i64 %12
  %29 = load i8* %28, align 1, !tbaa !1
  %30 = icmp eq i8 %29, 58
  br i1 %30, label %31, label %.backedge

; <label>:31                                      ; preds = %27
  %32 = tail call i32 @strncasecmp(i8* %22, i8* %name, i64 %12) nounwind readonly
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %.backedge

; <label>:34                                      ; preds = %31
  %35 = add nsw i32 %10, 1
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i8* %22, i64 %36
  br label %38

; <label>:38                                      ; preds = %.critedge9, %34
  %b.0 = phi i8* [ %37, %34 ], [ %42, %.critedge9 ]
  %39 = icmp ult i8* %b.0, %18
  br i1 %39, label %40, label %.critedge

; <label>:40                                      ; preds = %38
  %41 = load i8* %b.0, align 1, !tbaa !1
  switch i8 %41, label %.critedge [
    i8 32, label %.critedge9
    i8 13, label %.critedge9
    i8 12, label %.critedge9
    i8 11, label %.critedge9
    i8 10, label %.critedge9
    i8 9, label %.critedge9
  ]

.critedge9:                                       ; preds = %40, %40, %40, %40, %40, %40
  %42 = getelementptr inbounds i8* %b.0, i64 1
  br label %38

.critedge:                                        ; preds = %44, %44, %44, %44, %44, %44, %40, %38
  %e.0 = phi i8* [ %18, %38 ], [ %18, %40 ], [ %45, %44 ], [ %45, %44 ], [ %45, %44 ], [ %45, %44 ], [ %45, %44 ], [ %45, %44 ]
  %43 = icmp ult i8* %b.0, %e.0
  br i1 %43, label %44, label %.critedge18

; <label>:44                                      ; preds = %.critedge
  %45 = getelementptr inbounds i8* %e.0, i64 -1
  %46 = load i8* %45, align 1, !tbaa !1
  switch i8 %46, label %.critedge18 [
    i8 32, label %.critedge
    i8 13, label %.critedge
    i8 12, label %.critedge
    i8 11, label %.critedge
    i8 10, label %.critedge
    i8 9, label %.critedge
  ]

.critedge18:                                      ; preds = %44, %.critedge
  store i8* %b.0, i8** %begptr, align 8, !tbaa !0
  store i8* %e.0, i8** %endptr, align 8, !tbaa !0
  br label %.loopexit

.loopexit:                                        ; preds = %.critedge18, %.backedge, %4, %0
  %.0 = phi i32 [ %i.0, %.critedge18 ], [ -1, %4 ], [ -1, %0 ], [ -1, %.backedge ]
  ret i32 %.0
}

declare void @cookie_handle_set_cookie(%struct.cookie_jar*, i8*, i32, i8*, i8*)

define internal fastcc void @register_persistent(i8* %host, i32 %port, i32 %fd, i1 zeroext %ssl) nounwind uwtable {
  %.b = load i1* @pconn_active.b, align 1
  br i1 %.b, label %1, label %5

; <label>:1                                       ; preds = %0
  %2 = load i32* getelementptr inbounds (%struct.anon* @pconn, i64 0, i32 0), align 8, !tbaa !5
  %3 = icmp eq i32 %2, %fd
  br i1 %3, label %11, label %4

; <label>:4                                       ; preds = %1
  tail call fastcc void @invalidate_persistent()
  br label %5

; <label>:5                                       ; preds = %4, %0
  store i1 true, i1* @pconn_active.b, align 1
  store i32 %fd, i32* getelementptr inbounds (%struct.anon* @pconn, i64 0, i32 0), align 8, !tbaa !5
  %6 = tail call noalias i8* @xstrdup(i8* %host) nounwind
  store i8* %6, i8** getelementptr inbounds (%struct.anon* @pconn, i64 0, i32 1), align 8, !tbaa !0
  store i32 %port, i32* getelementptr inbounds (%struct.anon* @pconn, i64 0, i32 2), align 8, !tbaa !5
  %7 = zext i1 %ssl to i8
  store i8 %7, i8* getelementptr inbounds (%struct.anon* @pconn, i64 0, i32 3), align 4, !tbaa !3
  store i8 0, i8* getelementptr inbounds (%struct.anon* @pconn, i64 0, i32 4), align 1, !tbaa !3
  %8 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 71), align 2, !tbaa !3, !range !4
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %11, label %10, !prof !11

; <label>:10                                      ; preds = %5
  tail call void (i8*, ...)* @debug_logprintf(i8* getelementptr inbounds ([44 x i8]* @.str139, i64 0, i64 0), i32 %fd) nounwind
  br label %11

; <label>:11                                      ; preds = %10, %5, %1
  ret void
}

define internal fastcc zeroext i1 @skip_short_body(i32 %fd, i64 %contlen) nounwind uwtable {
  %dlbuf = alloca [513 x i8], align 16
  %1 = getelementptr inbounds [513 x i8]* %dlbuf, i64 0, i64 512
  store i8 0, i8* %1, align 16, !tbaa !1
  %2 = icmp eq i64 %contlen, -1
  br i1 %2, label %.thread, label %3

.thread:                                          ; preds = %0
  call void @__assert(i8* getelementptr inbounds ([16 x i8]* @__func__.skip_short_body, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8]* @.str, i64 0, i64 0), i32 915, i8* getelementptr inbounds ([14 x i8]* @.str133, i64 0, i64 0)) nounwind
  br label %5

; <label>:3                                       ; preds = %0
  %4 = icmp sgt i64 %contlen, 4096
  br i1 %4, label %37, label %5

; <label>:5                                       ; preds = %3, %.thread
  %6 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 71), align 2, !tbaa !3, !range !4
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %.preheader, label %8, !prof !11

; <label>:8                                       ; preds = %5
  %9 = call i8* @number_to_static_string(i64 %contlen) nounwind
  call void (i8*, ...)* @debug_logprintf(i8* getelementptr inbounds ([29 x i8]* @.str134, i64 0, i64 0), i8* %9) nounwind
  br label %.preheader

.preheader:                                       ; preds = %8, %5
  %10 = getelementptr inbounds [513 x i8]* %dlbuf, i64 0, i64 0
  br label %.backedge

.backedge:                                        ; preds = %32, %27, %.preheader
  %.01 = phi i64 [ %contlen, %.preheader ], [ %29, %32 ], [ %29, %27 ]
  %11 = icmp sgt i64 %.01, 0
  br i1 %11, label %12, label %33

; <label>:12                                      ; preds = %.backedge
  %13 = icmp sgt i64 %.01, 512
  %14 = trunc i64 %.01 to i32
  %15 = select i1 %13, i32 512, i32 %14
  %16 = call i32 @fd_read(i32 %fd, i8* %10, i32 %15, double -1.000000e+00) nounwind
  %17 = icmp slt i32 %16, 1
  br i1 %17, label %18, label %27

; <label>:18                                      ; preds = %12
  %19 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 71), align 2, !tbaa !3, !range !4
  %20 = icmp eq i8 %19, 0
  br i1 %20, label %37, label %21, !prof !11

; <label>:21                                      ; preds = %18
  %22 = icmp slt i32 %16, 0
  br i1 %22, label %23, label %25

; <label>:23                                      ; preds = %21
  %24 = call i8* @fd_errstr(i32 %fd) nounwind
  br label %25

; <label>:25                                      ; preds = %23, %21
  %26 = phi i8* [ %24, %23 ], [ getelementptr inbounds ([13 x i8]* @.str136, i64 0, i64 0), %21 ]
  call void (i8*, ...)* @debug_logprintf(i8* getelementptr inbounds ([18 x i8]* @.str135, i64 0, i64 0), i8* %26) nounwind
  br label %37

; <label>:27                                      ; preds = %12
  %28 = sext i32 %16 to i64
  %29 = sub nsw i64 %.01, %28
  %30 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 71), align 2, !tbaa !3, !range !4
  %31 = icmp eq i8 %30, 0
  br i1 %31, label %.backedge, label %32, !prof !11

; <label>:32                                      ; preds = %27
  call void (i8*, ...)* @debug_logprintf(i8* getelementptr inbounds ([5 x i8]* @.str137, i64 0, i64 0), i32 %16, i8* %10) nounwind
  br label %.backedge

; <label>:33                                      ; preds = %.backedge
  %34 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 71), align 2, !tbaa !3, !range !4
  %35 = icmp eq i8 %34, 0
  br i1 %35, label %37, label %36, !prof !11

; <label>:36                                      ; preds = %33
  call void (i8*, ...)* @debug_logprintf(i8* getelementptr inbounds ([9 x i8]* @.str138, i64 0, i64 0)) nounwind
  br label %37

; <label>:37                                      ; preds = %36, %33, %25, %18, %3
  %.0 = phi i1 [ false, %3 ], [ false, %18 ], [ false, %25 ], [ true, %33 ], [ true, %36 ]
  ret i1 %.0
}

define internal fastcc zeroext i1 @known_authentication_scheme_p(i8* %hdrbeg, i8* %hdrend) nounwind uwtable readonly {
  %1 = icmp ugt i8* %hdrend, %hdrbeg
  br i1 %1, label %2, label %.critedge

; <label>:2                                       ; preds = %0
  %3 = ptrtoint i8* %hdrend to i64
  %4 = ptrtoint i8* %hdrbeg to i64
  %5 = sub i64 %3, %4
  %6 = icmp ugt i64 %5, 4
  br i1 %6, label %7, label %.critedge31.thread

; <label>:7                                       ; preds = %2
  %8 = tail call i32 @strncasecmp(i8* %hdrbeg, i8* getelementptr inbounds ([6 x i8]* @.str89, i64 0, i64 0), i64 5) nounwind readonly
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %15

; <label>:10                                      ; preds = %7
  %11 = icmp eq i64 %5, 5
  br i1 %11, label %.critedge, label %12

; <label>:12                                      ; preds = %10
  %13 = getelementptr inbounds i8* %hdrbeg, i64 5
  %14 = load i8* %13, align 1, !tbaa !1
  switch i8 %14, label %15 [
    i8 32, label %.critedge
    i8 13, label %.critedge
    i8 12, label %.critedge
    i8 11, label %.critedge
    i8 10, label %.critedge
    i8 9, label %.critedge
  ]

; <label>:15                                      ; preds = %12, %7
  br i1 %1, label %16, label %.critedge

; <label>:16                                      ; preds = %15
  %17 = icmp ugt i64 %5, 5
  br i1 %17, label %18, label %.critedge31.thread

; <label>:18                                      ; preds = %16
  %19 = tail call i32 @strncasecmp(i8* %hdrbeg, i8* getelementptr inbounds ([7 x i8]* @.str132, i64 0, i64 0), i64 6) nounwind readonly
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %.critedge31

; <label>:21                                      ; preds = %18
  %22 = icmp eq i64 %5, 6
  br i1 %22, label %.critedge, label %23

; <label>:23                                      ; preds = %21
  %24 = getelementptr inbounds i8* %hdrbeg, i64 6
  %25 = load i8* %24, align 1, !tbaa !1
  switch i8 %25, label %.critedge31 [
    i8 32, label %.critedge
    i8 13, label %.critedge
    i8 12, label %.critedge
    i8 11, label %.critedge
    i8 10, label %.critedge
    i8 9, label %.critedge
  ]

.critedge31:                                      ; preds = %23, %18
  %26 = icmp ugt i64 %5, 3
  %or.cond = and i1 %1, %26
  br i1 %or.cond, label %27, label %.critedge

.critedge31.thread:                               ; preds = %16, %2
  %.old = icmp ugt i64 %5, 3
  br i1 %.old, label %27, label %.critedge

; <label>:27                                      ; preds = %.critedge31.thread, %.critedge31
  %28 = tail call i32 @strncasecmp(i8* %hdrbeg, i8* getelementptr inbounds ([5 x i8]* @.str90, i64 0, i64 0), i64 4) nounwind readonly
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %.critedge

; <label>:30                                      ; preds = %27
  %31 = icmp eq i64 %5, 4
  br i1 %31, label %.critedge, label %32

; <label>:32                                      ; preds = %30
  %33 = getelementptr inbounds i8* %hdrbeg, i64 4
  %34 = load i8* %33, align 1, !tbaa !1
  switch i8 %34, label %35 [
    i8 32, label %.critedge
    i8 12, label %.critedge
    i8 11, label %.critedge
    i8 10, label %.critedge
    i8 9, label %.critedge
    i8 13, label %.critedge
  ]

; <label>:35                                      ; preds = %32
  br label %.critedge

.critedge:                                        ; preds = %35, %32, %32, %32, %32, %32, %32, %30, %27, %.critedge31.thread, %.critedge31, %23, %23, %23, %23, %23, %23, %21, %15, %12, %12, %12, %12, %12, %12, %10, %0
  %36 = phi i1 [ true, %21 ], [ true, %10 ], [ false, %27 ], [ false, %.critedge31.thread ], [ false, %.critedge31 ], [ true, %30 ], [ true, %32 ], [ false, %35 ], [ true, %12 ], [ true, %23 ], [ true, %12 ], [ true, %12 ], [ true, %12 ], [ true, %12 ], [ true, %12 ], [ true, %23 ], [ true, %23 ], [ true, %23 ], [ true, %23 ], [ true, %23 ], [ true, %32 ], [ true, %32 ], [ true, %32 ], [ true, %32 ], [ false, %0 ], [ false, %15 ], [ true, %32 ]
  ret i1 %36
}

declare i32 @strncasecmp(i8* nocapture, i8* nocapture, i64) nounwind readonly

define internal fastcc i8* @create_authorization_line(i8* %au, i8* %user, i8* %passwd, i8* %method, i8* %path, i8* %finished) nounwind uwtable {
  %1 = load i8* %au, align 1, !tbaa !1
  %2 = sext i8 %1 to i32
  %.off = add i8 %1, -97
  %3 = icmp ult i8 %.off, 26
  %4 = add nsw i32 %2, -32
  %5 = select i1 %3, i32 %4, i32 %2
  switch i32 %5, label %15 [
    i32 66, label %6
    i32 68, label %8
    i32 78, label %10
  ]

; <label>:6                                       ; preds = %0
  store i8 1, i8* %finished, align 1, !tbaa !3
  %7 = tail call fastcc i8* @basic_authentication_encode(i8* %user, i8* %passwd)
  br label %16

; <label>:8                                       ; preds = %0
  store i8 1, i8* %finished, align 1, !tbaa !3
  %9 = tail call fastcc i8* @digest_authentication_encode(i8* %au, i8* %user, i8* %passwd, i8* %method, i8* %path)
  br label %16

; <label>:10                                      ; preds = %0
  %11 = tail call zeroext i1 @ntlm_input(%struct.ntlmdata* getelementptr inbounds (%struct.anon* @pconn, i64 0, i32 5), i8* %au) nounwind
  br i1 %11, label %13, label %12

; <label>:12                                      ; preds = %10
  store i8 1, i8* %finished, align 1, !tbaa !3
  br label %16

; <label>:13                                      ; preds = %10
  %14 = tail call i8* @ntlm_output(%struct.ntlmdata* getelementptr inbounds (%struct.anon* @pconn, i64 0, i32 5), i8* %user, i8* %passwd, i8* %finished) nounwind
  br label %16

; <label>:15                                      ; preds = %0
  tail call void @abort() noreturn nounwind
  unreachable

; <label>:16                                      ; preds = %13, %12, %8, %6
  %.0 = phi i8* [ %14, %13 ], [ null, %12 ], [ %9, %8 ], [ %7, %6 ]
  ret i8* %.0
}

define internal fastcc i8* @request_method(%struct.request* nocapture %req) nounwind uwtable readonly {
  %1 = getelementptr inbounds %struct.request* %req, i64 0, i32 0
  %2 = load i8** %1, align 8, !tbaa !0
  ret i8* %2
}

define internal fastcc void @register_basic_auth_host(i8* %hostname) nounwind uwtable {
  %1 = load %struct.hash_table** @basic_authed_hosts, align 8, !tbaa !0
  %2 = icmp eq %struct.hash_table* %1, null
  br i1 %2, label %3, label %5

; <label>:3                                       ; preds = %0
  %4 = tail call %struct.hash_table* @make_nocase_string_hash_table(i32 1) nounwind
  store %struct.hash_table* %4, %struct.hash_table** @basic_authed_hosts, align 8, !tbaa !0
  br label %5

; <label>:5                                       ; preds = %3, %0
  %6 = load %struct.hash_table** @basic_authed_hosts, align 8, !tbaa !0
  %7 = tail call i32 @hash_table_contains(%struct.hash_table* %6, i8* %hostname) nounwind
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %16

; <label>:9                                       ; preds = %5
  %10 = load %struct.hash_table** @basic_authed_hosts, align 8, !tbaa !0
  %11 = tail call noalias i8* @xstrdup(i8* %hostname) nounwind
  tail call void @hash_table_put(%struct.hash_table* %10, i8* %11, i8* null) nounwind
  %12 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 71), align 2, !tbaa !3, !range !4
  %13 = icmp eq i8 %12, 0
  br i1 %13, label %16, label %14, !prof !11

; <label>:14                                      ; preds = %9
  %15 = tail call i8* @quote(i8* %hostname) nounwind
  tail call void (i8*, ...)* @debug_logprintf(i8* getelementptr inbounds ([37 x i8]* @.str123, i64 0, i64 0), i8* %15) nounwind
  br label %16

; <label>:16                                      ; preds = %14, %9, %5
  ret void
}

define internal fastcc zeroext i1 @parse_content_disposition(i8* %hdr, i8** nocapture %filename) nounwind uwtable {
  %1 = alloca i8*, align 8
  %name = alloca %struct.param_token, align 8
  %value = alloca %struct.param_token, align 8
  store i8* %hdr, i8** %1, align 8, !tbaa !0
  %2 = getelementptr inbounds %struct.param_token* %name, i64 0, i32 1
  %3 = getelementptr inbounds %struct.param_token* %name, i64 0, i32 0
  %4 = getelementptr inbounds %struct.param_token* %value, i64 0, i32 0
  %5 = getelementptr inbounds %struct.param_token* %value, i64 0, i32 1
  br label %.backedge

.backedge:                                        ; preds = %37, %17, %14, %7, %0
  %6 = call zeroext i1 @extract_param(i8** %1, %struct.param_token* %name, %struct.param_token* %value, i8 signext 59)
  br i1 %6, label %7, label %.loopexit

; <label>:7                                       ; preds = %.backedge
  %8 = load i8** %2, align 8, !tbaa !0
  %9 = load i8** %3, align 8, !tbaa !0
  %10 = ptrtoint i8* %8 to i64
  %11 = ptrtoint i8* %9 to i64
  %12 = sub i64 %10, %11
  %13 = icmp eq i64 %12, 8
  br i1 %13, label %14, label %.backedge

; <label>:14                                      ; preds = %7
  %15 = call i32 @strncasecmp(i8* %9, i8* getelementptr inbounds ([9 x i8]* @.str122, i64 0, i64 0), i64 8) nounwind readonly
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %.backedge

; <label>:17                                      ; preds = %14
  %18 = load i8** %4, align 8, !tbaa !0
  %19 = icmp eq i8* %18, null
  br i1 %19, label %.backedge, label %20

; <label>:20                                      ; preds = %17
  %21 = load i8** %5, align 8, !tbaa !0
  %22 = ptrtoint i8* %21 to i64
  %23 = ptrtoint i8* %18 to i64
  %24 = sub i64 %22, %23
  %25 = call i8* @memrchr(i8* %18, i32 47, i64 %24) nounwind readonly
  %26 = call i8* @memrchr(i8* %18, i32 92, i64 %24) nounwind readonly
  %27 = icmp ne i8* %25, null
  %.not = xor i1 %27, true
  %28 = icmp eq i8* %26, null
  %or.cond = or i1 %28, %.not
  br i1 %or.cond, label %33, label %29

; <label>:29                                      ; preds = %20
  %30 = icmp ugt i8* %25, %26
  %31 = select i1 %30, i8* %25, i8* %26
  %32 = getelementptr inbounds i8* %31, i64 1
  store i8* %32, i8** %4, align 8, !tbaa !0
  br label %37

; <label>:33                                      ; preds = %20
  %or.cond2 = and i1 %28, %.not
  br i1 %or.cond2, label %37, label %34

; <label>:34                                      ; preds = %33
  %35 = select i1 %27, i8* %25, i8* %26
  %36 = getelementptr inbounds i8* %35, i64 1
  store i8* %36, i8** %4, align 8, !tbaa !0
  br label %37

; <label>:37                                      ; preds = %34, %33, %29
  %38 = load i8** %4, align 8, !tbaa !0
  %39 = load i8** %5, align 8, !tbaa !0
  %40 = icmp eq i8* %38, %39
  br i1 %40, label %.backedge, label %41

; <label>:41                                      ; preds = %37
  %42 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 18), align 8, !tbaa !0
  %43 = icmp eq i8* %42, null
  br i1 %43, label %80, label %44

; <label>:44                                      ; preds = %41
  %45 = call i64 @strlen(i8* %42) nounwind readonly
  %46 = trunc i64 %45 to i32
  %47 = add nsw i32 %46, -1
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i8* %42, i64 %48
  %50 = load i8* %49, align 1, !tbaa !1
  %51 = icmp ne i8 %50, 47
  %52 = zext i1 %51 to i32
  %. = add nsw i32 %52, %46
  %53 = sext i32 %. to i64
  %54 = ptrtoint i8* %39 to i64
  %55 = ptrtoint i8* %38 to i64
  %56 = sub i64 %54, %55
  %57 = add i64 %56, %53
  %58 = trunc i64 %57 to i32
  %59 = add nsw i32 %58, 1
  %60 = sext i32 %59 to i64
  %61 = call noalias i8* @xmalloc(i64 %60) nounwind
  store i8* %61, i8** %filename, align 8, !tbaa !0
  %62 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 18), align 8, !tbaa !0
  %63 = call i8* @strcpy(i8* %61, i8* %62) nounwind
  br i1 %51, label %64, label %69

; <label>:64                                      ; preds = %44
  %65 = add nsw i32 %., -1
  %66 = sext i32 %65 to i64
  %67 = load i8** %filename, align 8, !tbaa !0
  %68 = getelementptr inbounds i8* %67, i64 %66
  store i8 47, i8* %68, align 1, !tbaa !1
  br label %69

; <label>:69                                      ; preds = %64, %44
  %70 = load i8** %filename, align 8, !tbaa !0
  %71 = getelementptr inbounds i8* %70, i64 %53
  %72 = load i8** %4, align 8, !tbaa !0
  %73 = load i8** %5, align 8, !tbaa !0
  %74 = ptrtoint i8* %73 to i64
  %75 = ptrtoint i8* %72 to i64
  %76 = sub i64 %74, %75
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %71, i8* %72, i64 %76, i32 1, i1 false)
  %77 = sext i32 %58 to i64
  %78 = load i8** %filename, align 8, !tbaa !0
  %79 = getelementptr inbounds i8* %78, i64 %77
  store i8 0, i8* %79, align 1, !tbaa !1
  br label %.loopexit

; <label>:80                                      ; preds = %41
  %81 = call i8* @strdupdelim(i8* %38, i8* %39) nounwind
  store i8* %81, i8** %filename, align 8, !tbaa !0
  br label %.loopexit

.loopexit:                                        ; preds = %80, %69, %.backedge
  %.0 = phi i1 [ true, %80 ], [ true, %69 ], [ false, %.backedge ]
  ret i1 %.0
}

declare i8* @unique_name(i8*, i1 zeroext)

define internal fastcc i8* @resp_header_strdup(%struct.response* nocapture %resp, i8* nocapture %name) nounwind uwtable {
  %b = alloca i8*, align 8
  %e = alloca i8*, align 8
  %1 = call fastcc zeroext i1 @resp_header_get(%struct.response* %resp, i8* %name, i8** %b, i8** %e)
  br i1 %1, label %2, label %6

; <label>:2                                       ; preds = %0
  %3 = load i8** %b, align 8, !tbaa !0
  %4 = load i8** %e, align 8, !tbaa !0
  %5 = call i8* @strdupdelim(i8* %3, i8* %4) nounwind
  br label %6

; <label>:6                                       ; preds = %2, %0
  %.0 = phi i8* [ %5, %2 ], [ null, %0 ]
  ret i8* %.0
}

define internal fastcc zeroext i1 @parse_content_range(i8* nocapture %hdr, i64* nocapture %first_byte_ptr, i64* nocapture %last_byte_ptr, i64* nocapture %entity_length_ptr) nounwind uwtable {
  %1 = tail call i32 @strncasecmp(i8* %hdr, i8* getelementptr inbounds ([6 x i8]* @.str121, i64 0, i64 0), i64 5) nounwind readonly
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %3, label %.loopexit

; <label>:3                                       ; preds = %0
  %4 = getelementptr inbounds i8* %hdr, i64 5
  %5 = load i8* %4, align 1, !tbaa !1
  %6 = icmp eq i8 %5, 58
  %7 = getelementptr inbounds i8* %hdr, i64 6
  %. = select i1 %6, i8* %7, i8* %4
  br label %8

; <label>:8                                       ; preds = %switch.edge, %3
  %.031 = phi i8* [ %10, %switch.edge ], [ %., %3 ]
  %9 = load i8* %.031, align 1, !tbaa !1
  switch i8 %9, label %.loopexit [
    i8 32, label %switch.edge
    i8 12, label %switch.edge
    i8 11, label %switch.edge
    i8 10, label %switch.edge
    i8 9, label %switch.edge
    i8 13, label %switch.edge
    i8 0, label %.critedge
  ]

switch.edge:                                      ; preds = %8, %8, %8, %8, %8, %8
  %10 = getelementptr inbounds i8* %.031, i64 1
  br label %8

.loopexit:                                        ; preds = %8, %0
  %.1 = phi i8* [ %hdr, %0 ], [ %.031, %8 ]
  %11 = load i8* %.1, align 1, !tbaa !1
  %.off = add i8 %11, -48
  %12 = icmp ult i8 %.off, 10
  br i1 %12, label %.preheader50, label %.critedge

.preheader50:                                     ; preds = %.loopexit
  %13 = load i8* %.1, align 1, !tbaa !1
  %.off3252 = add i8 %13, -48
  %14 = icmp ult i8 %.off3252, 10
  br i1 %14, label %.lr.ph55, label %.critedge14

.lr.ph55:                                         ; preds = %.lr.ph55, %.preheader50
  %15 = phi i8 [ %21, %.lr.ph55 ], [ %13, %.preheader50 ]
  %.254 = phi i8* [ %20, %.lr.ph55 ], [ %.1, %.preheader50 ]
  %num.053 = phi i64 [ %19, %.lr.ph55 ], [ 0, %.preheader50 ]
  %16 = sext i8 %15 to i64
  %17 = mul nsw i64 %num.053, 10
  %18 = add i64 %17, -48
  %19 = add i64 %18, %16
  %20 = getelementptr inbounds i8* %.254, i64 1
  %21 = load i8* %20, align 1, !tbaa !1
  %.off32 = add i8 %21, -48
  %22 = icmp ult i8 %.off32, 10
  br i1 %22, label %.lr.ph55, label %.critedge14

.critedge14:                                      ; preds = %.lr.ph55, %.preheader50
  %.lcssa51 = phi i8 [ %13, %.preheader50 ], [ %21, %.lr.ph55 ]
  %.2.lcssa = phi i8* [ %.1, %.preheader50 ], [ %20, %.lr.ph55 ]
  %num.0.lcssa = phi i64 [ 0, %.preheader50 ], [ %19, %.lr.ph55 ]
  %23 = icmp eq i8 %.lcssa51, 45
  br i1 %23, label %24, label %.critedge

; <label>:24                                      ; preds = %.critedge14
  %25 = getelementptr inbounds i8* %.2.lcssa, i64 1
  %26 = load i8* %25, align 1, !tbaa !1
  %.off33 = add i8 %26, -48
  %27 = icmp ult i8 %.off33, 10
  br i1 %27, label %28, label %.critedge

; <label>:28                                      ; preds = %24
  store i64 %num.0.lcssa, i64* %first_byte_ptr, align 8, !tbaa !8
  %.342 = getelementptr inbounds i8* %.2.lcssa, i64 1
  %29 = load i8* %.342, align 1, !tbaa !1
  %.off3443 = add i8 %29, -48
  %30 = icmp ult i8 %.off3443, 10
  br i1 %30, label %.lr.ph46, label %.critedge16

.lr.ph46:                                         ; preds = %.lr.ph46, %28
  %31 = phi i8 [ %36, %.lr.ph46 ], [ %29, %28 ]
  %.345 = phi i8* [ %.3, %.lr.ph46 ], [ %.342, %28 ]
  %num.144 = phi i64 [ %35, %.lr.ph46 ], [ 0, %28 ]
  %32 = sext i8 %31 to i64
  %33 = mul nsw i64 %num.144, 10
  %34 = add i64 %33, -48
  %35 = add i64 %34, %32
  %.3 = getelementptr inbounds i8* %.345, i64 1
  %36 = load i8* %.3, align 1, !tbaa !1
  %.off34 = add i8 %36, -48
  %37 = icmp ult i8 %.off34, 10
  br i1 %37, label %.lr.ph46, label %.critedge16

.critedge16:                                      ; preds = %.lr.ph46, %28
  %.lcssa = phi i8 [ %29, %28 ], [ %36, %.lr.ph46 ]
  %.2.pn.lcssa = phi i8* [ %.2.lcssa, %28 ], [ %.345, %.lr.ph46 ]
  %num.1.lcssa = phi i64 [ 0, %28 ], [ %35, %.lr.ph46 ]
  %38 = icmp eq i8 %.lcssa, 47
  br i1 %38, label %39, label %.critedge

; <label>:39                                      ; preds = %.critedge16
  %40 = getelementptr inbounds i8* %.2.pn.lcssa, i64 2
  %41 = load i8* %40, align 1, !tbaa !1
  %.off35 = add i8 %41, -48
  %42 = icmp ult i8 %.off35, 10
  br i1 %42, label %43, label %.critedge

; <label>:43                                      ; preds = %39
  store i64 %num.1.lcssa, i64* %last_byte_ptr, align 8, !tbaa !8
  %44 = load i8* %40, align 1, !tbaa !1
  %45 = icmp eq i8 %44, 42
  br i1 %45, label %.critedge18, label %.preheader

.preheader:                                       ; preds = %43
  %46 = load i8* %40, align 1, !tbaa !1
  %.off3639 = add i8 %46, -48
  %47 = icmp ult i8 %.off3639, 10
  br i1 %47, label %.lr.ph, label %.critedge18

.lr.ph:                                           ; preds = %.lr.ph, %.preheader
  %48 = phi i8 [ %54, %.lr.ph ], [ %46, %.preheader ]
  %.441 = phi i8* [ %53, %.lr.ph ], [ %40, %.preheader ]
  %num.240 = phi i64 [ %52, %.lr.ph ], [ 0, %.preheader ]
  %49 = sext i8 %48 to i64
  %50 = mul nsw i64 %num.240, 10
  %51 = add i64 %50, -48
  %52 = add i64 %51, %49
  %53 = getelementptr inbounds i8* %.441, i64 1
  %54 = load i8* %53, align 1, !tbaa !1
  %.off36 = add i8 %54, -48
  %55 = icmp ult i8 %.off36, 10
  br i1 %55, label %.lr.ph, label %.critedge18

.critedge18:                                      ; preds = %.lr.ph, %.preheader, %43
  %num.3 = phi i64 [ -1, %43 ], [ 0, %.preheader ], [ %52, %.lr.ph ]
  store i64 %num.3, i64* %entity_length_ptr, align 8, !tbaa !8
  br label %.critedge

.critedge:                                        ; preds = %.critedge18, %39, %.critedge16, %24, %.critedge14, %.loopexit, %8
  %.0 = phi i1 [ true, %.critedge18 ], [ false, %.loopexit ], [ false, %.critedge14 ], [ false, %24 ], [ false, %.critedge16 ], [ false, %39 ], [ false, %8 ]
  ret i1 %.0
}

declare void @cw_act(i32)

declare i8* @escnonprint_uri(i8*)

define internal fastcc void @ensure_extension(%struct.http_stat* nocapture %hs, i8* %ext, i32* nocapture %dt) nounwind uwtable {
  %shortext = alloca [8 x i8], align 1
  %1 = getelementptr inbounds %struct.http_stat* %hs, i64 0, i32 13
  %2 = load i8** %1, align 8, !tbaa !0
  %3 = call i8* @strrchr(i8* %2, i32 46) nounwind readonly
  %4 = call i64 @strlen(i8* %ext) nounwind readonly
  %5 = trunc i64 %4 to i32
  %6 = icmp eq i32 %5, 5
  br i1 %6, label %7, label %15

; <label>:7                                       ; preds = %0
  %8 = getelementptr inbounds [8 x i8]* %shortext, i64 0, i64 0
  %9 = add nsw i32 %5, -1
  %10 = sext i32 %9 to i64
  %11 = call i8* @strncpy(i8* %8, i8* %ext, i64 %10) nounwind
  %12 = add nsw i32 %5, -2
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [8 x i8]* %shortext, i64 0, i64 %13
  store i8 0, i8* %14, align 1, !tbaa !1
  br label %15

; <label>:15                                      ; preds = %7, %0
  %16 = icmp eq i8* %3, null
  br i1 %16, label %24, label %17

; <label>:17                                      ; preds = %15
  %18 = getelementptr inbounds [8 x i8]* %shortext, i64 0, i64 0
  %19 = call i32 @strcasecmp(i8* %3, i8* %18) nounwind readonly
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %57, label %21

; <label>:21                                      ; preds = %17
  %22 = call i32 @strcasecmp(i8* %3, i8* %ext) nounwind readonly
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %57, label %24

; <label>:24                                      ; preds = %21, %15
  %25 = load i8** %1, align 8, !tbaa !0
  %26 = call i64 @strlen(i8* %25) nounwind readonly
  %27 = trunc i64 %26 to i32
  %28 = add i32 %5, 24
  %29 = add i32 %28, %27
  %30 = sext i32 %29 to i64
  %31 = call i8* @xrealloc(i8* %25, i64 %30) nounwind
  store i8* %31, i8** %1, align 8, !tbaa !0
  %32 = sext i32 %27 to i64
  %33 = getelementptr inbounds i8* %31, i64 %32
  %34 = call i8* @strcpy(i8* %33, i8* %ext) nounwind
  %35 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 17), align 2, !tbaa !3, !range !4
  %36 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 40), align 1, !tbaa !3, !range !4
  %37 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 72), align 1, !tbaa !3, !range !4
  %38 = or i8 %36, %35
  %39 = or i8 %38, %37
  %40 = icmp eq i8 %39, 0
  br i1 %40, label %41, label %.loopexit

; <label>:41                                      ; preds = %24
  %42 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 12), align 8, !tbaa !3, !range !4
  %43 = icmp ne i8 %42, 0
  %44 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 36), align 8, !tbaa !0
  %45 = icmp ne i8* %44, null
  %or.cond = or i1 %43, %45
  br i1 %or.cond, label %.loopexit, label %46

; <label>:46                                      ; preds = %41
  %47 = load i8** %1, align 8, !tbaa !0
  %48 = call zeroext i1 @file_exists_p(i8* %47) nounwind
  br i1 %48, label %.preheader, label %.loopexit

.preheader:                                       ; preds = %.preheader, %46
  %ext_num.0 = phi i32 [ %51, %.preheader ], [ 1, %46 ]
  %49 = load i8** %1, align 8, !tbaa !0
  %50 = getelementptr inbounds i8* %49, i64 %32
  %51 = add nsw i32 %ext_num.0, 1
  %52 = call i32 (i8*, i8*, ...)* @sprintf(i8* %50, i8* getelementptr inbounds ([6 x i8]* @.str120, i64 0, i64 0), i32 %ext_num.0, i8* %ext) nounwind
  %53 = load i8** %1, align 8, !tbaa !0
  %54 = call zeroext i1 @file_exists_p(i8* %53) nounwind
  br i1 %54, label %.preheader, label %.loopexit

.loopexit:                                        ; preds = %.preheader, %46, %41, %24
  %55 = load i32* %dt, align 4, !tbaa !5
  %56 = or i32 %55, 32
  store i32 %56, i32* %dt, align 4, !tbaa !5
  br label %57

; <label>:57                                      ; preds = %.loopexit, %21, %17
  ret void
}

declare i8* @human_readable(i64)

declare i32 @mkalldirs(i8*)

declare void @rotate_backups(i8*)

declare noalias %struct.__sFILE* @fopen(i8* nocapture, i8* nocapture) nounwind

declare %struct.__sFILE* @fopen_excl(i8*, i32)

declare i64 @fwrite(i8* nocapture, i64, i64, %struct.__sFILE* nocapture) nounwind

declare i32 @fd_read_body(i32, %struct.__sFILE*, i64, i64, i64*, i64*, double*, i32)

declare i32 @fclose(%struct.__sFILE* nocapture) nounwind

declare i8* @strrchr(i8*, i32) nounwind readonly

declare i8* @strncpy(i8*, i8* nocapture, i64) nounwind

declare i8* @xrealloc(i8*, i64)

declare i8* @strcpy(i8*, i8* nocapture) nounwind

define internal fastcc zeroext i1 @resp_header_get(%struct.response* nocapture %resp, i8* nocapture %name, i8** nocapture %begptr, i8** nocapture %endptr) nounwind uwtable {
  %1 = tail call fastcc i32 @resp_header_locate(%struct.response* %resp, i8* %name, i32 0, i8** %begptr, i8** %endptr)
  %2 = icmp ne i32 %1, -1
  ret i1 %2
}

declare i8* @strdupdelim(i8*, i8*)

declare i8* @memrchr(i8*, i32, i64) nounwind readonly

declare noalias i8* @xmalloc(i64)

declare %struct.hash_table* @make_nocase_string_hash_table(i32)

declare i32 @hash_table_contains(%struct.hash_table*, i8*)

declare void @hash_table_put(%struct.hash_table*, i8*, i8*)

define internal fastcc i8* @digest_authentication_encode(i8* %au, i8* %user, i8* %passwd, i8* %method, i8* %path) nounwind uwtable {
  %1 = alloca i8*, align 8
  %name = alloca %struct.param_token, align 8
  %value = alloca %struct.param_token, align 8
  %hash = alloca [16 x i8], align 16
  %a1buf = alloca [33 x i8], align 16
  %a2buf = alloca [33 x i8], align 16
  %response_digest = alloca [33 x i8], align 16
  store i8* null, i8** @digest_authentication_encode.nonce, align 8, !tbaa !0
  store i8* null, i8** @digest_authentication_encode.opaque, align 8, !tbaa !0
  store i8* null, i8** @digest_authentication_encode.realm, align 8, !tbaa !0
  %2 = getelementptr inbounds i8* %au, i64 6
  store i8* %2, i8** %1, align 8, !tbaa !0
  %3 = call zeroext i1 @extract_param(i8** %1, %struct.param_token* %name, %struct.param_token* %value, i8 signext 44)
  br i1 %3, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %0
  %4 = getelementptr inbounds %struct.param_token* %name, i64 0, i32 1
  %5 = getelementptr inbounds %struct.param_token* %name, i64 0, i32 0
  %6 = getelementptr inbounds %struct.param_token* %value, i64 0, i32 0
  %7 = getelementptr inbounds %struct.param_token* %value, i64 0, i32 1
  br label %8

; <label>:8                                       ; preds = %.backedge, %.lr.ph
  %9 = load i8** %4, align 8, !tbaa !0
  %10 = load i8** %5, align 8, !tbaa !0
  %11 = ptrtoint i8* %9 to i64
  %12 = ptrtoint i8* %10 to i64
  %13 = sub i64 %11, %12
  br label %14

; <label>:14                                      ; preds = %31, %8
  %i.0 = phi i64 [ 0, %8 ], [ %32, %31 ]
  %15 = icmp ult i64 %i.0, 3
  br i1 %15, label %16, label %.backedge

; <label>:16                                      ; preds = %14
  %17 = getelementptr inbounds [3 x %struct.anon.0]* @digest_authentication_encode.options, i64 0, i64 %i.0, i32 0
  %18 = load i8** %17, align 16, !tbaa !0
  %19 = call i64 @strlen(i8* %18) nounwind readonly
  %20 = icmp eq i64 %13, %19
  br i1 %20, label %21, label %31

; <label>:21                                      ; preds = %16
  %22 = call i32 @strncmp(i8* %10, i8* %18, i64 %13) nounwind readonly
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %31

; <label>:24                                      ; preds = %21
  %25 = load i8** %6, align 8, !tbaa !0
  %26 = load i8** %7, align 8, !tbaa !0
  %27 = call i8* @strdupdelim(i8* %25, i8* %26) nounwind
  %28 = getelementptr inbounds [3 x %struct.anon.0]* @digest_authentication_encode.options, i64 0, i64 %i.0, i32 1
  %29 = load i8*** %28, align 8, !tbaa !0
  store i8* %27, i8** %29, align 8, !tbaa !0
  br label %.backedge

.backedge:                                        ; preds = %24, %14
  %30 = call zeroext i1 @extract_param(i8** %1, %struct.param_token* %name, %struct.param_token* %value, i8 signext 44)
  br i1 %30, label %8, label %._crit_edge

; <label>:31                                      ; preds = %21, %16
  %32 = add i64 %i.0, 1
  br label %14

._crit_edge:                                      ; preds = %.backedge, %0
  %33 = load i8** @digest_authentication_encode.realm, align 8, !tbaa !0
  %34 = load i8** @digest_authentication_encode.nonce, align 8, !tbaa !0
  %notlhs = icmp eq i8* %33, null
  %notrhs = icmp eq i8* %34, null
  %or.cond.not = or i1 %notrhs, %notlhs
  %35 = icmp eq i8* %user, null
  %or.cond2 = or i1 %or.cond.not, %35
  %36 = icmp eq i8* %passwd, null
  %or.cond3 = or i1 %or.cond2, %36
  %37 = icmp eq i8* %path, null
  %or.cond4 = or i1 %or.cond3, %37
  %38 = icmp eq i8* %method, null
  %or.cond5 = or i1 %or.cond4, %38
  br i1 %or.cond5, label %39, label %50

; <label>:39                                      ; preds = %._crit_edge
  %40 = icmp eq i8* %33, null
  br i1 %40, label %42, label %41

; <label>:41                                      ; preds = %39
  call void @free(i8* %33)
  br label %42

; <label>:42                                      ; preds = %41, %39
  %43 = load i8** @digest_authentication_encode.opaque, align 8, !tbaa !0
  %44 = icmp eq i8* %43, null
  br i1 %44, label %46, label %45

; <label>:45                                      ; preds = %42
  call void @free(i8* %43)
  br label %46

; <label>:46                                      ; preds = %45, %42
  %47 = load i8** @digest_authentication_encode.nonce, align 8, !tbaa !0
  %48 = icmp eq i8* %47, null
  br i1 %48, label %103, label %49

; <label>:49                                      ; preds = %46
  call void @free(i8* %47)
  br label %103

; <label>:50                                      ; preds = %._crit_edge
  %51 = call i32 @gen_md5_context_size() nounwind
  %52 = sext i32 %51 to i64
  %53 = alloca i8, i64 %52, align 1
  %54 = bitcast i8* %53 to %struct.gen_md5_context*
  call void @gen_md5_init(%struct.gen_md5_context* %54) nounwind
  %55 = call i64 @strlen(i8* %user) nounwind readonly
  %56 = trunc i64 %55 to i32
  call void @gen_md5_update(i8* %user, i32 %56, %struct.gen_md5_context* %54) nounwind
  call void @gen_md5_update(i8* getelementptr inbounds ([2 x i8]* @.str127, i64 0, i64 0), i32 1, %struct.gen_md5_context* %54) nounwind
  %57 = load i8** @digest_authentication_encode.realm, align 8, !tbaa !0
  %58 = call i64 @strlen(i8* %57) nounwind readonly
  %59 = trunc i64 %58 to i32
  call void @gen_md5_update(i8* %57, i32 %59, %struct.gen_md5_context* %54) nounwind
  call void @gen_md5_update(i8* getelementptr inbounds ([2 x i8]* @.str127, i64 0, i64 0), i32 1, %struct.gen_md5_context* %54) nounwind
  %60 = call i64 @strlen(i8* %passwd) nounwind readonly
  %61 = trunc i64 %60 to i32
  call void @gen_md5_update(i8* %passwd, i32 %61, %struct.gen_md5_context* %54) nounwind
  %62 = getelementptr inbounds [16 x i8]* %hash, i64 0, i64 0
  call void @gen_md5_finish(%struct.gen_md5_context* %54, i8* %62) nounwind
  %63 = getelementptr inbounds [33 x i8]* %a1buf, i64 0, i64 0
  call fastcc void @dump_hash(i8* %63, i8* %62)
  call void @gen_md5_init(%struct.gen_md5_context* %54) nounwind
  %64 = call i64 @strlen(i8* %method) nounwind readonly
  %65 = trunc i64 %64 to i32
  call void @gen_md5_update(i8* %method, i32 %65, %struct.gen_md5_context* %54) nounwind
  call void @gen_md5_update(i8* getelementptr inbounds ([2 x i8]* @.str127, i64 0, i64 0), i32 1, %struct.gen_md5_context* %54) nounwind
  %66 = call i64 @strlen(i8* %path) nounwind readonly
  %67 = trunc i64 %66 to i32
  call void @gen_md5_update(i8* %path, i32 %67, %struct.gen_md5_context* %54) nounwind
  call void @gen_md5_finish(%struct.gen_md5_context* %54, i8* %62) nounwind
  %68 = getelementptr inbounds [33 x i8]* %a2buf, i64 0, i64 0
  call fastcc void @dump_hash(i8* %68, i8* %62)
  call void @gen_md5_init(%struct.gen_md5_context* %54) nounwind
  call void @gen_md5_update(i8* %63, i32 32, %struct.gen_md5_context* %54) nounwind
  call void @gen_md5_update(i8* getelementptr inbounds ([2 x i8]* @.str127, i64 0, i64 0), i32 1, %struct.gen_md5_context* %54) nounwind
  %69 = load i8** @digest_authentication_encode.nonce, align 8, !tbaa !0
  %70 = call i64 @strlen(i8* %69) nounwind readonly
  %71 = trunc i64 %70 to i32
  call void @gen_md5_update(i8* %69, i32 %71, %struct.gen_md5_context* %54) nounwind
  call void @gen_md5_update(i8* getelementptr inbounds ([2 x i8]* @.str127, i64 0, i64 0), i32 1, %struct.gen_md5_context* %54) nounwind
  call void @gen_md5_update(i8* %68, i32 32, %struct.gen_md5_context* %54) nounwind
  call void @gen_md5_finish(%struct.gen_md5_context* %54, i8* %62) nounwind
  %72 = getelementptr inbounds [33 x i8]* %response_digest, i64 0, i64 0
  call fastcc void @dump_hash(i8* %72, i8* %62)
  %73 = call i64 @strlen(i8* %user) nounwind readonly
  %74 = shl i64 %73, 1
  %75 = load i8** @digest_authentication_encode.realm, align 8, !tbaa !0
  %76 = call i64 @strlen(i8* %75) nounwind readonly
  %77 = load i8** @digest_authentication_encode.nonce, align 8, !tbaa !0
  %78 = call i64 @strlen(i8* %77) nounwind readonly
  %79 = call i64 @strlen(i8* %path) nounwind readonly
  %80 = load i8** @digest_authentication_encode.opaque, align 8, !tbaa !0
  %81 = icmp eq i8* %80, null
  br i1 %81, label %84, label %82

; <label>:82                                      ; preds = %50
  %83 = call i64 @strlen(i8* %80) nounwind readonly
  br label %84

; <label>:84                                      ; preds = %82, %50
  %85 = phi i64 [ %83, %82 ], [ 0, %50 ]
  %86 = add i64 %74, 160
  %87 = add i64 %86, %76
  %88 = add i64 %87, %78
  %89 = add i64 %88, %79
  %90 = add i64 %89, %85
  %91 = call noalias i8* @xmalloc(i64 %90) nounwind
  %92 = load i8** @digest_authentication_encode.realm, align 8, !tbaa !0
  %93 = load i8** @digest_authentication_encode.nonce, align 8, !tbaa !0
  %94 = call i32 (i8*, i8*, ...)* @sprintf(i8* %91, i8* getelementptr inbounds ([70 x i8]* @.str128, i64 0, i64 0), i8* %user, i8* %92, i8* %93, i8* %path, i8* %72) nounwind
  %95 = load i8** @digest_authentication_encode.opaque, align 8, !tbaa !0
  %96 = icmp eq i8* %95, null
  br i1 %96, label %103, label %97

; <label>:97                                      ; preds = %84
  %98 = call i64 @strlen(i8* %91) nounwind readonly
  %99 = getelementptr inbounds i8* %91, i64 %98
  %strlen = call i64 @strlen(i8* %99)
  %.sum = add i64 %strlen, %98
  %endptr = getelementptr i8* %91, i64 %.sum
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %endptr, i8* getelementptr inbounds ([11 x i8]* @.str129, i64 0, i64 0), i64 11, i32 1, i1 false)
  %100 = load i8** @digest_authentication_encode.opaque, align 8, !tbaa !0
  %101 = call i8* @strcat(i8* %99, i8* %100) nounwind
  %strlen6 = call i64 @strlen(i8* %99)
  %.sum8 = add i64 %strlen6, %98
  %endptr7 = getelementptr i8* %91, i64 %.sum8
  %102 = bitcast i8* %endptr7 to i16*
  store i16 34, i16* %102, align 1
  br label %103

; <label>:103                                     ; preds = %97, %84, %49, %46
  %.0 = phi i8* [ null, %46 ], [ null, %49 ], [ %91, %84 ], [ %91, %97 ]
  ret i8* %.0
}

declare zeroext i1 @ntlm_input(%struct.ntlmdata*, i8*)

declare i8* @ntlm_output(%struct.ntlmdata*, i8*, i8*, i8*)

declare i32 @strncmp(i8* nocapture, i8* nocapture, i64) nounwind readonly

declare i32 @gen_md5_context_size()

declare void @gen_md5_init(%struct.gen_md5_context*)

declare void @gen_md5_update(i8*, i32, %struct.gen_md5_context*)

declare void @gen_md5_finish(%struct.gen_md5_context*, i8*)

define internal fastcc void @dump_hash(i8* nocapture %buf, i8* nocapture %hash) nounwind uwtable {
  %lftr.limit = getelementptr i8* %hash, i64 16
  br label %1

; <label>:1                                       ; preds = %1, %0
  %.04 = phi i8* [ %buf, %0 ], [ %13, %1 ]
  %.013 = phi i8* [ %hash, %0 ], [ %14, %1 ]
  %2 = load i8* %.013, align 1, !tbaa !1
  %3 = zext i8 %2 to i64
  %4 = lshr i64 %3, 4
  %5 = getelementptr inbounds [17 x i8]* @.str131, i64 0, i64 %4
  %6 = load i8* %5, align 1, !tbaa !1
  %7 = getelementptr inbounds i8* %.04, i64 1
  store i8 %6, i8* %.04, align 1, !tbaa !1
  %8 = load i8* %.013, align 1, !tbaa !1
  %9 = zext i8 %8 to i64
  %10 = and i64 %9, 15
  %11 = getelementptr inbounds [17 x i8]* @.str131, i64 0, i64 %10
  %12 = load i8* %11, align 1, !tbaa !1
  %13 = getelementptr inbounds i8* %.04, i64 2
  store i8 %12, i8* %7, align 1, !tbaa !1
  %14 = getelementptr inbounds i8* %.013, i64 1
  %exitcond = icmp eq i8* %14, %lftr.limit
  br i1 %exitcond, label %15, label %1

; <label>:15                                      ; preds = %1
  %scevgep = getelementptr i8* %buf, i64 32
  store i8 0, i8* %scevgep, align 1, !tbaa !1
  ret void
}

declare i8* @strcat(i8*, i8* nocapture) nounwind

declare i32 @fd_read(i32, i8*, i32, double)

define internal fastcc void @print_response_line(i8* %b, i8* %e) nounwind uwtable {
  %1 = ptrtoint i8* %e to i64
  %2 = ptrtoint i8* %b to i64
  %3 = sub i64 %1, %2
  %4 = trunc i64 %3 to i32
  %5 = add nsw i32 %4, 1
  %6 = sext i32 %5 to i64
  %7 = alloca i8, i64 %6, align 1
  %8 = sext i32 %4 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %7, i8* %b, i64 %8, i32 1, i1 false)
  %9 = getelementptr inbounds i8* %7, i64 %8
  store i8 0, i8* %9, align 1, !tbaa !1
  %10 = call i8* @quotearg_style(i32 5, i8* %7) nounwind
  call void (i32, i8*, ...)* @logprintf(i32 3, i8* getelementptr inbounds ([6 x i8]* @.str140, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str84, i64 0, i64 0), i8* %10) nounwind
  ret void
}

declare i32 @feof(%struct.__sFILE* nocapture) nounwind

declare i64 @fread(i8* nocapture, i64, i64, %struct.__sFILE* nocapture) nounwind

declare noalias i8* @xcalloc(i64, i64)

declare i8* @fd_read_hunk(i32, i8* (i8*, i8*, i32)*, i64, i64)

define internal i8* @response_head_terminator(i8* %start, i8* %peeked, i32 %peeklen) nounwind uwtable readonly {
  %1 = icmp eq i8* %start, %peeked
  br i1 %1, label %2, label %8

; <label>:2                                       ; preds = %0
  %3 = icmp sgt i32 %peeklen, 4
  %4 = sext i32 %peeklen to i64
  %5 = select i1 %3, i64 4, i64 %4
  %6 = tail call i32 @memcmp(i8* %start, i8* getelementptr inbounds ([5 x i8]* @.str79, i64 0, i64 0), i64 %5) nounwind readonly
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %45

; <label>:8                                       ; preds = %2, %0
  %9 = ptrtoint i8* %peeked to i64
  %10 = ptrtoint i8* %start to i64
  %11 = sub i64 %9, %10
  %12 = icmp slt i64 %11, 2
  %13 = getelementptr inbounds i8* %peeked, i64 -2
  %14 = select i1 %12, i8* %start, i8* %13
  %15 = sext i32 %peeklen to i64
  %.sum = add i64 %15, -2
  %16 = getelementptr inbounds i8* %peeked, i64 %.sum
  br label %17

; <label>:17                                      ; preds = %37, %8
  %p.0 = phi i8* [ %14, %8 ], [ %38, %37 ]
  %18 = icmp ult i8* %p.0, %16
  %19 = load i8* %p.0, align 1, !tbaa !1
  %20 = icmp eq i8 %19, 10
  br i1 %18, label %21, label %39

; <label>:21                                      ; preds = %17
  br i1 %20, label %22, label %37

; <label>:22                                      ; preds = %21
  %23 = getelementptr inbounds i8* %p.0, i64 1
  %24 = load i8* %23, align 1, !tbaa !1
  %25 = icmp eq i8 %24, 13
  br i1 %25, label %26, label %32

; <label>:26                                      ; preds = %22
  %27 = getelementptr inbounds i8* %p.0, i64 2
  %28 = load i8* %27, align 1, !tbaa !1
  %29 = icmp eq i8 %28, 10
  br i1 %29, label %30, label %thread-pre-split

; <label>:30                                      ; preds = %26
  %31 = getelementptr inbounds i8* %p.0, i64 3
  br label %45

thread-pre-split:                                 ; preds = %26
  %.pr = load i8* %23, align 1, !tbaa !1
  br label %32

; <label>:32                                      ; preds = %thread-pre-split, %22
  %33 = phi i8 [ %.pr, %thread-pre-split ], [ %24, %22 ]
  %34 = icmp eq i8 %33, 10
  br i1 %34, label %35, label %37

; <label>:35                                      ; preds = %32
  %36 = getelementptr inbounds i8* %p.0, i64 2
  br label %45

; <label>:37                                      ; preds = %32, %21
  %38 = getelementptr inbounds i8* %p.0, i64 1
  br label %17

; <label>:39                                      ; preds = %17
  br i1 %20, label %40, label %45

; <label>:40                                      ; preds = %39
  %41 = getelementptr inbounds i8* %p.0, i64 1
  %42 = load i8* %41, align 1, !tbaa !1
  %43 = icmp eq i8 %42, 10
  %44 = getelementptr inbounds i8* %p.0, i64 2
  %. = select i1 %43, i8* %44, i8* null
  ret i8* %.

; <label>:45                                      ; preds = %39, %35, %30, %2
  %.0 = phi i8* [ %31, %30 ], [ %36, %35 ], [ %start, %2 ], [ null, %39 ]
  ret i8* %.0
}

declare i32 @memcmp(i8* nocapture, i8* nocapture, i64) nounwind readonly

define internal fastcc void @release_header(%struct.request_header* nocapture %hdr) nounwind uwtable {
  %1 = getelementptr inbounds %struct.request_header* %hdr, i64 0, i32 2
  %2 = load i32* %1, align 4, !tbaa !12
  switch i32 %2, label %14 [
    i32 3, label %9
    i32 1, label %3
    i32 2, label %6
  ]

; <label>:3                                       ; preds = %0
  %4 = getelementptr inbounds %struct.request_header* %hdr, i64 0, i32 0
  %5 = load i8** %4, align 8, !tbaa !0
  tail call void @free(i8* %5)
  br label %14

; <label>:6                                       ; preds = %0
  %7 = getelementptr inbounds %struct.request_header* %hdr, i64 0, i32 1
  %8 = load i8** %7, align 8, !tbaa !0
  tail call void @free(i8* %8)
  br label %14

; <label>:9                                       ; preds = %0
  %10 = getelementptr inbounds %struct.request_header* %hdr, i64 0, i32 0
  %11 = load i8** %10, align 8, !tbaa !0
  tail call void @free(i8* %11)
  %12 = getelementptr inbounds %struct.request_header* %hdr, i64 0, i32 1
  %13 = load i8** %12, align 8, !tbaa !0
  tail call void @free(i8* %13)
  br label %14

; <label>:14                                      ; preds = %9, %6, %3, %0
  ret void
}

declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare zeroext i1 @socket_ip_address(i32, %struct.ip_address*, i32)

declare %struct.address_list* @lookup_host(i8*, i32)

declare zeroext i1 @address_list_contains(%struct.address_list*, %struct.ip_address*)

declare void @address_list_release(%struct.address_list*)

declare zeroext i1 @test_socket_open(i32)

declare i32 @base64_encode(i8*, i32, i8*)

declare i8* @concat_strings(i8*, ...)

define i32 @fork_retrieve_from_file(i8* %file, i1 zeroext %html) nounwind uwtable {
  %count = alloca i32, align 4
  call void @cw_act(i32 1) nounwind
  %1 = call i32 @retrieve_from_file(i8* %file, i1 zeroext %html, i32* %count) nounwind
  %2 = load i32* %count, align 4, !tbaa !5
  ret i32 %2
}

declare i32 @retrieve_from_file(i8*, i1 zeroext, i32*)

define i32 @fork_retrieve_url(%struct.url* %orig_parsed, i8* %origurl, i8** %file, i8** %newloc, i8* %refurl, i32* %dt, i1 zeroext %recursive, %struct.iri* %iri, i1 zeroext %register_status) nounwind uwtable {
  %1 = load i32* @glob, align 4, !tbaa !5
  %2 = mul nsw i32 %1, %1
  store i32 %2, i32* @glob, align 4, !tbaa !5
  tail call void @cw_act(i32 2) nounwind
  %3 = tail call i32 @retrieve_url(%struct.url* %orig_parsed, i8* %origurl, i8** %file, i8** %newloc, i8* %refurl, i32* %dt, i1 zeroext %recursive, %struct.iri* %iri, i1 zeroext %register_status) nounwind
  ret i32 %3
}

declare i32 @retrieve_url(%struct.url*, i8*, i8**, i8**, i8*, i32*, i1 zeroext, %struct.iri*, i1 zeroext)

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %longindex = alloca i32, align 4
  %st = alloca %struct.stat, align 8
  %filename = alloca i8*, align 8
  %redirected_URL = alloca i8*, align 8
  %dt = alloca i32, align 4
  %url_err = alloca i32, align 4
  %1 = load i8** %argv, align 8, !tbaa !0
  store i8* %1, i8** @program_name, align 8, !tbaa !0
  call fastcc void @i18n_initialize()
  %2 = load i8** %argv, align 8, !tbaa !0
  %3 = call i8* @strrchr(i8* %2, i32 47) nounwind readonly
  store i8* %3, i8** @exec_name, align 8, !tbaa !0
  %4 = icmp eq i8* %3, null
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = load i8** %argv, align 8, !tbaa !0
  br label %9

; <label>:7                                       ; preds = %0
  %8 = getelementptr inbounds i8* %3, i64 1
  br label %9

; <label>:9                                       ; preds = %7, %5
  %storemerge = phi i8* [ %6, %5 ], [ %8, %7 ]
  store i8* %storemerge, i8** @exec_name, align 8
  call void @initialize() nounwind
  call fastcc void @init_switches()
  br label %.backedge

.backedge:                                        ; preds = %129, %123, %76, %67, %63, %59, %51, %46, %37, %27, %9
  %append_to_log.0 = phi i8 [ 0, %9 ], [ %append_to_log.0, %27 ], [ %append_to_log.0, %129 ], [ %append_to_log.0, %123 ], [ %append_to_log.0, %67 ], [ 1, %63 ], [ %append_to_log.0, %59 ], [ %append_to_log.0, %46 ], [ %append_to_log.0, %51 ], [ %append_to_log.0, %37 ], [ %append_to_log.0, %76 ]
  store i32 -1, i32* %longindex, align 4
  %10 = call i32 @rpl_getopt_long(i32 %argc, i8** %argv, i8* getelementptr inbounds ([128 x i8]* @short_options, i64 0, i64 0), %struct.option* getelementptr inbounds ([243 x %struct.option]* @long_options, i64 0, i64 0), i32* %longindex) nounwind
  %11 = icmp eq i32 %10, -1
  br i1 %11, label %132, label %12

; <label>:12                                      ; preds = %.backedge
  %13 = load i32* %longindex, align 4, !tbaa !5
  %14 = icmp eq i32 %13, -1
  br i1 %14, label %15, label %27

; <label>:15                                      ; preds = %12
  %16 = icmp eq i32 %10, 63
  br i1 %16, label %17, label %21

; <label>:17                                      ; preds = %15
  call fastcc void @print_usage()
  %putchar = call i32 @putchar(i32 10) nounwind
  %18 = call i8* @libintl_gettext(i8* getelementptr inbounds ([35 x i8]* @.str1157, i64 0, i64 0)) nounwind
  %19 = load i8** @exec_name, align 8, !tbaa !0
  %20 = call i32 (i8*, ...)* @printf(i8* %18, i8* %19) nounwind
  call void @exit(i32 2) noreturn nounwind
  unreachable

; <label>:21                                      ; preds = %15
  %22 = add nsw i32 %10, -32
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [96 x i8]* @optmap, i64 0, i64 %23
  %25 = load i8* %24, align 1, !tbaa !1
  %26 = zext i8 %25 to i32
  store i32 %26, i32* %longindex, align 4, !tbaa !5
  br label %27

; <label>:27                                      ; preds = %21, %12
  %28 = load i32* %longindex, align 4, !tbaa !5
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [243 x %struct.option]* @long_options, i64 0, i64 %29, i32 3
  %31 = load i32* %30, align 8, !tbaa !5
  %32 = and i32 %31, -1025
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [121 x %struct.cmdline_option]* bitcast (<{ { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] } }>* @option_data to [121 x %struct.cmdline_option]*), i64 0, i64 %33
  %35 = getelementptr inbounds [121 x %struct.cmdline_option]* bitcast (<{ { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] } }>* @option_data to [121 x %struct.cmdline_option]*), i64 0, i64 %33, i32 2
  %36 = load i32* %35, align 4, !tbaa !13
  switch i32 %36, label %.backedge [
    i32 0, label %37
    i32 1, label %43
    i32 2, label %59
    i32 3, label %63
    i32 6, label %67
    i32 7, label %69
    i32 8, label %102
    i32 4, label %102
    i32 5, label %129
  ]

; <label>:37                                      ; preds = %27
  %38 = getelementptr inbounds [121 x %struct.cmdline_option]* bitcast (<{ { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] } }>* @option_data to [121 x %struct.cmdline_option]*), i64 0, i64 %33, i32 3
  %39 = load i8** %38, align 16, !tbaa !0
  %40 = load i8** @rpl_optarg, align 8, !tbaa !0
  %41 = getelementptr inbounds %struct.cmdline_option* %34, i64 0, i32 0
  %42 = load i8** %41, align 16, !tbaa !0
  call void @setoptval(i8* %39, i8* %40, i8* %42) nounwind
  br label %.backedge

; <label>:43                                      ; preds = %27
  %44 = load i8** @rpl_optarg, align 8, !tbaa !0
  %45 = icmp eq i8* %44, null
  br i1 %45, label %51, label %46

; <label>:46                                      ; preds = %43
  %47 = getelementptr inbounds [121 x %struct.cmdline_option]* bitcast (<{ { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] } }>* @option_data to [121 x %struct.cmdline_option]*), i64 0, i64 %33, i32 3
  %48 = load i8** %47, align 16, !tbaa !0
  %49 = getelementptr inbounds %struct.cmdline_option* %34, i64 0, i32 0
  %50 = load i8** %49, align 16, !tbaa !0
  call void @setoptval(i8* %48, i8* %44, i8* %50) nounwind
  br label %.backedge

; <label>:51                                      ; preds = %43
  %52 = and i32 %31, 1024
  %53 = icmp ne i32 %52, 0
  %54 = getelementptr inbounds [121 x %struct.cmdline_option]* bitcast (<{ { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] } }>* @option_data to [121 x %struct.cmdline_option]*), i64 0, i64 %33, i32 3
  %55 = load i8** %54, align 16, !tbaa !0
  %56 = select i1 %53, i8* getelementptr inbounds ([2 x i8]* @.str2158, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8]* @.str3159, i64 0, i64 0)
  %57 = getelementptr inbounds %struct.cmdline_option* %34, i64 0, i32 0
  %58 = load i8** %57, align 16, !tbaa !0
  call void @setoptval(i8* %55, i8* %56, i8* %58) nounwind
  br label %.backedge

; <label>:59                                      ; preds = %27
  %60 = getelementptr inbounds [121 x %struct.cmdline_option]* bitcast (<{ { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] } }>* @option_data to [121 x %struct.cmdline_option]*), i64 0, i64 %33, i32 3
  %61 = load i8** %60, align 16, !tbaa !0
  %62 = bitcast i8* %61 to void ()*
  call void %62() nounwind
  br label %.backedge

; <label>:63                                      ; preds = %27
  %64 = load i8** @rpl_optarg, align 8, !tbaa !0
  %65 = getelementptr inbounds %struct.cmdline_option* %34, i64 0, i32 0
  %66 = load i8** %65, align 16, !tbaa !0
  call void @setoptval(i8* getelementptr inbounds ([8 x i8]* @.str4160, i64 0, i64 0), i8* %64, i8* %66) nounwind
  br label %.backedge

; <label>:67                                      ; preds = %27
  %68 = load i8** @rpl_optarg, align 8, !tbaa !0
  call void @run_command(i8* %68) nounwind
  br label %.backedge

; <label>:69                                      ; preds = %27
  %70 = load i8** @rpl_optarg, align 8, !tbaa !0
  %71 = getelementptr inbounds %struct.cmdline_option* %34, i64 0, i32 0
  %72 = getelementptr inbounds %struct.cmdline_option* %34, i64 0, i32 0
  %73 = getelementptr inbounds %struct.cmdline_option* %34, i64 0, i32 0
  %74 = getelementptr inbounds %struct.cmdline_option* %34, i64 0, i32 0
  %75 = getelementptr inbounds %struct.cmdline_option* %34, i64 0, i32 0
  br label %76

; <label>:76                                      ; preds = %100, %69
  %p.0 = phi i8* [ %70, %69 ], [ %101, %100 ]
  %77 = load i8* %p.0, align 1, !tbaa !1
  %78 = icmp eq i8 %77, 0
  br i1 %78, label %.backedge, label %79

; <label>:79                                      ; preds = %76
  %80 = sext i8 %77 to i32
  switch i32 %80, label %91 [
    i32 118, label %81
    i32 72, label %83
    i32 100, label %85
    i32 99, label %87
    i32 112, label %89
  ]

; <label>:81                                      ; preds = %79
  %82 = load i8** %71, align 16, !tbaa !0
  call void @setoptval(i8* getelementptr inbounds ([8 x i8]* @.str5161, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8]* @.str2158, i64 0, i64 0), i8* %82) nounwind
  br label %100

; <label>:83                                      ; preds = %79
  %84 = load i8** %72, align 16, !tbaa !0
  call void @setoptval(i8* getelementptr inbounds ([11 x i8]* @.str6162, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8]* @.str2158, i64 0, i64 0), i8* %84) nounwind
  br label %100

; <label>:85                                      ; preds = %79
  %86 = load i8** %73, align 16, !tbaa !0
  call void @setoptval(i8* getelementptr inbounds ([10 x i8]* @.str7163, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8]* @.str2158, i64 0, i64 0), i8* %86) nounwind
  br label %100

; <label>:87                                      ; preds = %79
  %88 = load i8** %74, align 16, !tbaa !0
  call void @setoptval(i8* getelementptr inbounds ([10 x i8]* @.str8164, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8]* @.str3159, i64 0, i64 0), i8* %88) nounwind
  br label %100

; <label>:89                                      ; preds = %79
  %90 = load i8** %75, align 16, !tbaa !0
  call void @setoptval(i8* getelementptr inbounds ([9 x i8]* @.str9165, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8]* @.str3159, i64 0, i64 0), i8* %90) nounwind
  br label %100

; <label>:91                                      ; preds = %79
  %92 = call i8* @libintl_gettext(i8* getelementptr inbounds ([30 x i8]* @.str10166, i64 0, i64 0)) nounwind
  %93 = load i8** @exec_name, align 8, !tbaa !0
  %94 = load i8* %p.0, align 1, !tbaa !1
  %95 = sext i8 %94 to i32
  %96 = call i32 (i8*, ...)* @printf(i8* %92, i8* %93, i32 %95) nounwind
  call fastcc void @print_usage()
  %putchar62 = call i32 @putchar(i32 10) nounwind
  %97 = call i8* @libintl_gettext(i8* getelementptr inbounds ([35 x i8]* @.str1157, i64 0, i64 0)) nounwind
  %98 = load i8** @exec_name, align 8, !tbaa !0
  %99 = call i32 (i8*, ...)* @printf(i8* %97, i8* %98) nounwind
  call void @exit(i32 1) noreturn nounwind
  unreachable

; <label>:100                                     ; preds = %89, %87, %85, %83, %81
  %101 = getelementptr inbounds i8* %p.0, i64 1
  br label %76

; <label>:102                                     ; preds = %27, %27
  %103 = load i8** @rpl_optarg, align 8, !tbaa !0
  %104 = icmp eq i8* %103, null
  br i1 %104, label %123, label %105

; <label>:105                                     ; preds = %102
  %106 = load i8* %103, align 1, !tbaa !1
  %107 = sext i8 %106 to i32
  %108 = icmp eq i8 %106, 49
  br i1 %108, label %123, label %109

; <label>:109                                     ; preds = %105
  %.off = add i8 %106, -65
  %110 = icmp ult i8 %.off, 26
  %111 = add nsw i32 %107, 32
  %. = select i1 %110, i32 %111, i32 %107
  %112 = icmp eq i32 %., 121
  br i1 %112, label %123, label %113

; <label>:113                                     ; preds = %109
  %114 = icmp eq i32 %., 111
  br i1 %114, label %115, label %123

; <label>:115                                     ; preds = %113
  %116 = getelementptr inbounds i8* %103, i64 1
  %117 = load i8* %116, align 1, !tbaa !1
  %118 = sext i8 %117 to i32
  %.off21 = add i8 %117, -65
  %119 = icmp ult i8 %.off21, 26
  %120 = add nsw i32 %118, 32
  %121 = select i1 %119, i32 %120, i32 %118
  %122 = icmp eq i32 %121, 110
  %phitmp = select i1 %122, i8* getelementptr inbounds ([2 x i8]* @.str2158, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8]* @.str3159, i64 0, i64 0)
  br label %123

; <label>:123                                     ; preds = %115, %113, %109, %105, %102
  %flag.0 = phi i8* [ getelementptr inbounds ([2 x i8]* @.str2158, i64 0, i64 0), %102 ], [ getelementptr inbounds ([2 x i8]* @.str2158, i64 0, i64 0), %109 ], [ getelementptr inbounds ([2 x i8]* @.str2158, i64 0, i64 0), %105 ], [ getelementptr inbounds ([2 x i8]* @.str3159, i64 0, i64 0), %113 ], [ %phitmp, %115 ]
  %124 = load i32* %35, align 4, !tbaa !13
  %125 = icmp eq i32 %124, 8
  %126 = select i1 %125, i8* getelementptr inbounds ([9 x i8]* @.str9165, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8]* @.str8164, i64 0, i64 0)
  %127 = getelementptr inbounds %struct.cmdline_option* %34, i64 0, i32 0
  %128 = load i8** %127, align 16, !tbaa !0
  call void @setoptval(i8* %126, i8* %flag.0, i8* %128) nounwind
  br label %.backedge

; <label>:129                                     ; preds = %27
  %130 = getelementptr inbounds %struct.cmdline_option* %34, i64 0, i32 0
  %131 = load i8** %130, align 16, !tbaa !0
  call void @setoptval(i8* getelementptr inbounds ([14 x i8]* @.str11167, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8]* @.str2158, i64 0, i64 0), i8* %131) nounwind
  br label %.backedge

; <label>:132                                     ; preds = %.backedge
  %133 = load i32* @rpl_optind, align 4, !tbaa !5
  %134 = sub nsw i32 %argc, %133
  %135 = load i32* getelementptr inbounds (%struct.options* @opt, i64 0, i32 11), align 4, !tbaa !5
  %136 = icmp eq i32 %135, 0
  br i1 %136, label %137, label %138

; <label>:137                                     ; preds = %132
  store i32 -1, i32* getelementptr inbounds (%struct.options* @opt, i64 0, i32 11), align 4, !tbaa !5
  br label %138

; <label>:138                                     ; preds = %137, %132
  %139 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 23), align 8, !tbaa !3, !range !4
  %140 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 84), align 8, !tbaa !3, !range !4
  %141 = or i8 %140, %139
  %142 = icmp eq i8 %141, 0
  br i1 %142, label %144, label %143

; <label>:143                                     ; preds = %138
  store i8 1, i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 13), align 1, !tbaa !3
  br label %144

; <label>:144                                     ; preds = %143, %138
  %145 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 86), align 2, !tbaa !3, !range !4
  %146 = icmp ne i8 %145, 0
  %147 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 6), align 1, !tbaa !3, !range !4
  %148 = icmp eq i8 %147, 0
  %or.cond26 = and i1 %146, %148
  br i1 %or.cond26, label %149, label %153

; <label>:149                                     ; preds = %144
  store i32 0, i32* getelementptr inbounds (%struct.options* @opt, i64 0, i32 11), align 4, !tbaa !5
  %150 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 13), align 1, !tbaa !3, !range !4
  %151 = icmp eq i8 %150, 0
  br i1 %151, label %152, label %153

; <label>:152                                     ; preds = %149
  store i8 1, i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 12), align 8, !tbaa !3
  br label %153

; <label>:153                                     ; preds = %152, %149, %144
  %154 = load i32* getelementptr inbounds (%struct.options* @opt, i64 0, i32 0), align 8, !tbaa !5
  %155 = icmp eq i32 %154, -1
  br i1 %155, label %156, label %160

; <label>:156                                     ; preds = %153
  %157 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 1), align 4, !tbaa !3, !range !4
  %158 = xor i8 %157, 1
  %159 = zext i8 %158 to i32
  store i32 %159, i32* getelementptr inbounds (%struct.options* @opt, i64 0, i32 0), align 8, !tbaa !5
  br label %160

; <label>:160                                     ; preds = %156, %153
  %161 = load i32* getelementptr inbounds (%struct.options* @opt, i64 0, i32 0), align 8, !tbaa !5
  %162 = icmp eq i32 %161, 0
  %163 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 1), align 4, !tbaa !3, !range !4
  %164 = icmp eq i8 %163, 0
  %or.cond29 = or i1 %162, %164
  br i1 %or.cond29, label %168, label %165

; <label>:165                                     ; preds = %160
  %166 = call i8* @libintl_gettext(i8* getelementptr inbounds ([46 x i8]* @.str12170, i64 0, i64 0)) nounwind
  %167 = call i32 (i8*, ...)* @printf(i8* %166) nounwind
  call fastcc void @print_usage()
  call void @exit(i32 1) noreturn nounwind
  unreachable

; <label>:168                                     ; preds = %160
  %169 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 72), align 1, !tbaa !3, !range !4
  %170 = icmp eq i8 %169, 0
  %171 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 17), align 2, !tbaa !3, !range !4
  %172 = icmp eq i8 %171, 0
  %or.cond32 = or i1 %170, %172
  br i1 %or.cond32, label %176, label %173

; <label>:173                                     ; preds = %168
  %174 = call i8* @libintl_gettext(i8* getelementptr inbounds ([61 x i8]* @.str13171, i64 0, i64 0)) nounwind
  %175 = call i32 (i8*, ...)* @printf(i8* %174) nounwind
  call fastcc void @print_usage()
  call void @exit(i32 1) noreturn nounwind
  unreachable

; <label>:176                                     ; preds = %168
  %177 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 110), align 2, !tbaa !3, !range !4
  %178 = icmp eq i8 %177, 0
  %179 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 111), align 1, !tbaa !3, !range !4
  %180 = icmp eq i8 %179, 0
  %or.cond35 = or i1 %178, %180
  br i1 %or.cond35, label %184, label %181

; <label>:181                                     ; preds = %176
  %182 = call i8* @libintl_gettext(i8* getelementptr inbounds ([52 x i8]* @.str14172, i64 0, i64 0)) nounwind
  %183 = call i32 (i8*, ...)* @printf(i8* %182) nounwind
  call fastcc void @print_usage()
  call void @exit(i32 1) noreturn nounwind
  unreachable

; <label>:184                                     ; preds = %176
  %185 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 36), align 8, !tbaa !0
  %186 = icmp eq i8* %185, null
  br i1 %186, label %221, label %187

; <label>:187                                     ; preds = %184
  %188 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 77), align 8, !tbaa !3, !range !4
  %189 = icmp eq i8 %188, 0
  br i1 %189, label %200, label %190

; <label>:190                                     ; preds = %187
  %191 = icmp slt i32 %134, 2
  %192 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 86), align 2, !tbaa !3, !range !4
  %193 = icmp eq i8 %192, 0
  %or.cond38 = and i1 %191, %193
  %194 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 6), align 1, !tbaa !3, !range !4
  %195 = icmp eq i8 %194, 0
  %or.cond41 = and i1 %or.cond38, %195
  br i1 %or.cond41, label %200, label %196

; <label>:196                                     ; preds = %190
  %197 = call i8* @libintl_gettext(i8* getelementptr inbounds ([121 x i8]* @.str15173, i64 0, i64 0)) nounwind
  %198 = load %struct.__sFILE** @__stdoutp, align 8, !tbaa !0
  %199 = call i32 @fputs(i8* %197, %struct.__sFILE* %198) nounwind
  call fastcc void @print_usage()
  call void @exit(i32 1) noreturn nounwind
  unreachable

; <label>:200                                     ; preds = %190, %187
  %201 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 86), align 2, !tbaa !3, !range !4
  %202 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 6), align 1, !tbaa !3, !range !4
  %203 = or i8 %202, %201
  %204 = icmp eq i8 %203, 0
  br i1 %204, label %207, label %205

; <label>:205                                     ; preds = %200
  %206 = call i8* @libintl_gettext(i8* getelementptr inbounds ([125 x i8]* @.str17175, i64 0, i64 0)) nounwind
  call void (i32, i8*, ...)* @logprintf(i32 1, i8* getelementptr inbounds ([3 x i8]* @.str16174, i64 0, i64 0), i8* %206) nounwind
  br label %207

; <label>:207                                     ; preds = %205, %200
  %208 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 72), align 1, !tbaa !3, !range !4
  %209 = icmp eq i8 %208, 0
  br i1 %209, label %212, label %210

; <label>:210                                     ; preds = %207
  %211 = call i8* @libintl_gettext(i8* getelementptr inbounds ([89 x i8]* @.str18176, i64 0, i64 0)) nounwind
  call void (i32, i8*, ...)* @logprintf(i32 1, i8* getelementptr inbounds ([3 x i8]* @.str16174, i64 0, i64 0), i8* %211) nounwind
  store i8 0, i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 72), align 1, !tbaa !3
  br label %212

; <label>:212                                     ; preds = %210, %207
  %213 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 17), align 2, !tbaa !3, !range !4
  %214 = icmp eq i8 %213, 0
  br i1 %214, label %221, label %215

; <label>:215                                     ; preds = %212
  %216 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 36), align 8, !tbaa !0
  %217 = call zeroext i1 @file_exists_p(i8* %216) nounwind
  br i1 %217, label %218, label %221

; <label>:218                                     ; preds = %215
  %219 = call i8* @libintl_gettext(i8* getelementptr inbounds ([42 x i8]* @.str19177, i64 0, i64 0)) nounwind
  %220 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 36), align 8, !tbaa !0
  call void (i32, i8*, ...)* @logprintf(i32 0, i8* %219, i8* %220) nounwind
  call void @exit(i32 1) noreturn nounwind
  unreachable

; <label>:221                                     ; preds = %215, %212, %184
  %222 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 39), align 8, !tbaa !3, !range !4
  %223 = icmp ne i8 %222, 0
  %224 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 38), align 8, !tbaa !0
  %225 = icmp ne i8* %224, null
  %or.cond9 = and i1 %223, %225
  br i1 %or.cond9, label %226, label %229

; <label>:226                                     ; preds = %221
  %227 = call i8* @libintl_gettext(i8* getelementptr inbounds ([52 x i8]* @.str20178, i64 0, i64 0)) nounwind
  %228 = call i32 (i8*, ...)* @printf(i8* %227) nounwind
  call fastcc void @print_usage()
  call void @exit(i32 1) noreturn nounwind
  unreachable

; <label>:229                                     ; preds = %221
  %230 = icmp ne i32 %133, %argc
  %231 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 20), align 8, !tbaa !0
  %232 = icmp ne i8* %231, null
  %or.cond11 = or i1 %230, %232
  br i1 %or.cond11, label %240, label %233

; <label>:233                                     ; preds = %229
  %234 = call i8* @libintl_gettext(i8* getelementptr inbounds ([17 x i8]* @.str21179, i64 0, i64 0)) nounwind
  %235 = load i8** @exec_name, align 8, !tbaa !0
  %236 = call i32 (i8*, ...)* @printf(i8* %234, i8* %235) nounwind
  call fastcc void @print_usage()
  %putchar63 = call i32 @putchar(i32 10) nounwind
  %237 = call i8* @libintl_gettext(i8* getelementptr inbounds ([35 x i8]* @.str1157, i64 0, i64 0)) nounwind
  %238 = load i8** @exec_name, align 8, !tbaa !0
  %239 = call i32 (i8*, ...)* @printf(i8* %237, i8* %238) nounwind
  call void @exit(i32 1) noreturn nounwind
  unreachable

; <label>:240                                     ; preds = %229
  %241 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 115), align 2, !tbaa !3, !range !4
  %242 = icmp ne i8 %241, 0
  %243 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 117), align 8, !tbaa !0
  %244 = icmp ne i8* %243, null
  %or.cond13 = or i1 %242, %244
  %245 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 116), align 8, !tbaa !0
  %246 = icmp ne i8* %245, null
  %or.cond15 = or i1 %or.cond13, %246
  br i1 %or.cond15, label %247, label %250

; <label>:247                                     ; preds = %240
  %248 = call i8* @libintl_gettext(i8* getelementptr inbounds ([45 x i8]* @.str22180, i64 0, i64 0)) nounwind
  %249 = call i32 (i8*, ...)* @printf(i8* %248) nounwind
  call void @exit(i32 1) noreturn nounwind
  unreachable

; <label>:250                                     ; preds = %240
  br i1 %223, label %251, label %258

; <label>:251                                     ; preds = %250
  %252 = call fastcc i8* @prompt_for_password()
  store i8* %252, i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 38), align 8, !tbaa !0
  %253 = icmp eq i8* %252, null
  br i1 %253, label %257, label %254

; <label>:254                                     ; preds = %251
  %255 = load i8* %252, align 1, !tbaa !1
  %256 = icmp eq i8 %255, 0
  br i1 %256, label %257, label %258

; <label>:257                                     ; preds = %254, %251
  call void @exit(i32 1) noreturn nounwind
  unreachable

; <label>:258                                     ; preds = %254, %250
  %259 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 4), align 1, !tbaa !3, !range !4
  %260 = icmp eq i8 %259, 0
  br i1 %260, label %262, label %261

; <label>:261                                     ; preds = %258
  call void @fork_to_background() nounwind
  br label %262

; <label>:262                                     ; preds = %261, %258
  %263 = load i32* getelementptr inbounds (%struct.options* @opt, i64 0, i32 0), align 8, !tbaa !5
  %264 = icmp eq i32 %263, 0
  br i1 %264, label %267, label %265

; <label>:265                                     ; preds = %262
  %266 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 57), align 8, !tbaa !0
  call void @set_progress_implementation(i8* %266) nounwind
  br label %267

; <label>:267                                     ; preds = %265, %262
  %268 = add nsw i32 %134, 1
  %269 = sext i32 %268 to i64
  %270 = shl nsw i64 %269, 3
  %271 = alloca i8, i64 %270, align 8
  %272 = bitcast i8* %271 to i8**
  %273 = icmp sgt i32 %134, 0
  br i1 %273, label %.lr.ph73, label %294

.lr.ph73:                                         ; preds = %267
  %274 = sub i32 %argc, %133
  br label %275

; <label>:275                                     ; preds = %291, %.lr.ph73
  %indvars.iv79 = phi i64 [ 0, %.lr.ph73 ], [ %indvars.iv.next80, %291 ]
  %276 = load i32* @rpl_optind, align 4, !tbaa !5
  %277 = sext i32 %276 to i64
  %278 = getelementptr inbounds i8** %argv, i64 %277
  %279 = load i8** %278, align 8, !tbaa !0
  %280 = call i8* @rewrite_shorthand_url(i8* %279) nounwind
  %281 = icmp eq i8* %280, null
  br i1 %281, label %284, label %282

; <label>:282                                     ; preds = %275
  %283 = getelementptr inbounds i8** %272, i64 %indvars.iv79
  store i8* %280, i8** %283, align 8, !tbaa !0
  br label %291

; <label>:284                                     ; preds = %275
  %285 = load i32* @rpl_optind, align 4, !tbaa !5
  %286 = sext i32 %285 to i64
  %287 = getelementptr inbounds i8** %argv, i64 %286
  %288 = load i8** %287, align 8, !tbaa !0
  %289 = call noalias i8* @xstrdup(i8* %288) nounwind
  %290 = getelementptr inbounds i8** %272, i64 %indvars.iv79
  store i8* %289, i8** %290, align 8, !tbaa !0
  br label %291

; <label>:291                                     ; preds = %284, %282
  %indvars.iv.next80 = add i64 %indvars.iv79, 1
  %292 = load i32* @rpl_optind, align 4, !tbaa !5
  %293 = add nsw i32 %292, 1
  store i32 %293, i32* @rpl_optind, align 4, !tbaa !5
  %lftr.wideiv81 = trunc i64 %indvars.iv.next80 to i32
  %exitcond82 = icmp eq i32 %lftr.wideiv81, %274
  br i1 %exitcond82, label %._crit_edge74, label %275

._crit_edge74:                                    ; preds = %291
  %phitmp78 = sext i32 %274 to i64
  br label %294

; <label>:294                                     ; preds = %._crit_edge74, %267
  %i.0.lcssa = phi i64 [ %phitmp78, %._crit_edge74 ], [ 0, %267 ]
  %295 = getelementptr inbounds i8** %272, i64 %i.0.lcssa
  store i8* null, i8** %295, align 8, !tbaa !0
  %296 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 19), align 8, !tbaa !0
  %297 = icmp ne i8 %append_to_log.0, 0
  call void @log_init(i8* %296, i1 zeroext %297) nounwind
  %298 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 71), align 2, !tbaa !3, !range !4
  %299 = icmp eq i8 %298, 0
  br i1 %299, label %302, label %300, !prof !11

; <label>:300                                     ; preds = %294
  %301 = load i8** @version_string, align 8, !tbaa !0
  call void (i8*, ...)* @debug_logprintf(i8* getelementptr inbounds ([41 x i8]* @.str23181, i64 0, i64 0), i8* %301, i8* getelementptr inbounds ([11 x i8]* @.str24182, i64 0, i64 0)) nounwind
  br label %302

; <label>:302                                     ; preds = %300, %294
  %303 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 36), align 8, !tbaa !0
  %304 = icmp eq i8* %303, null
  br i1 %304, label %342, label %305

; <label>:305                                     ; preds = %302
  %306 = load i8* %303, align 1, !tbaa !1
  %307 = icmp eq i8 %306, 45
  br i1 %307, label %308, label %314

; <label>:308                                     ; preds = %305
  %309 = getelementptr inbounds i8* %303, i64 1
  %310 = load i8* %309, align 1, !tbaa !1
  %311 = icmp eq i8 %310, 0
  br i1 %311, label %312, label %314

; <label>:312                                     ; preds = %308
  %313 = load %struct.__sFILE** @__stdoutp, align 8, !tbaa !0
  store %struct.__sFILE* %313, %struct.__sFILE** @output_stream, align 8, !tbaa !0
  br label %342

; <label>:314                                     ; preds = %308, %305
  %315 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 36), align 8, !tbaa !0
  %316 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 40), align 1, !tbaa !3, !range !4
  %317 = icmp ne i8 %316, 0
  %318 = select i1 %317, i8* getelementptr inbounds ([3 x i8]* @.str25183, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str26184, i64 0, i64 0)
  %319 = call %struct.__sFILE* @fopen(i8* %315, i8* %318) nounwind
  store %struct.__sFILE* %319, %struct.__sFILE** @output_stream, align 8, !tbaa !0
  %320 = icmp eq %struct.__sFILE* %319, null
  br i1 %320, label %321, label %323

; <label>:321                                     ; preds = %314
  %322 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 36), align 8, !tbaa !0
  call void @perror(i8* %322) nounwind
  call void @exit(i32 1) noreturn nounwind
  unreachable

; <label>:323                                     ; preds = %314
  %324 = load i32* @__isthreaded, align 4, !tbaa !5
  %325 = icmp eq i32 %324, 0
  br i1 %325, label %326, label %330

; <label>:326                                     ; preds = %323
  %327 = getelementptr inbounds %struct.__sFILE* %319, i64 0, i32 4
  %328 = load i16* %327, align 2, !tbaa !6
  %329 = sext i16 %328 to i32
  br label %332

; <label>:330                                     ; preds = %323
  %331 = call i32 @fileno(%struct.__sFILE* %319) nounwind
  br label %332

; <label>:332                                     ; preds = %330, %326
  %333 = phi i32 [ %329, %326 ], [ %331, %330 ]
  %334 = call i32 @virt_fstat(i32 %333, %struct.stat* %st) nounwind
  %335 = icmp eq i32 %334, 0
  br i1 %335, label %336, label %342

; <label>:336                                     ; preds = %332
  %337 = getelementptr inbounds %struct.stat* %st, i64 0, i32 2
  %338 = load i16* %337, align 8, !tbaa !6
  %339 = and i16 %338, -4096
  %340 = icmp eq i16 %339, -32768
  br i1 %340, label %341, label %342

; <label>:341                                     ; preds = %336
  store i8 1, i8* @output_stream_regular, align 1, !tbaa !3
  br label %342

; <label>:342                                     ; preds = %341, %336, %332, %312, %302
  %343 = call void (i32)* (i32, void (i32)*)* @signal(i32 1, void (i32)* inttoptr (i64 1 to void (i32)*)) nounwind
  %344 = icmp eq void (i32)* %343, inttoptr (i64 1 to void (i32)*)
  br i1 %344, label %347, label %345

; <label>:345                                     ; preds = %342
  %346 = call void (i32)* (i32, void (i32)*)* @signal(i32 1, void (i32)* @redirect_output_signal) nounwind
  br label %347

; <label>:347                                     ; preds = %345, %342
  %348 = call void (i32)* (i32, void (i32)*)* @signal(i32 30, void (i32)* @redirect_output_signal) nounwind
  %349 = call void (i32)* (i32, void (i32)*)* @signal(i32 13, void (i32)* inttoptr (i64 1 to void (i32)*)) nounwind
  %350 = call void (i32)* (i32, void (i32)*)* @signal(i32 28, void (i32)* @progress_handle_sigwinch) nounwind
  %351 = load i8** %272, align 8, !tbaa !0
  %352 = icmp eq i8* %351, null
  br i1 %352, label %._crit_edge70, label %.lr.ph69

.lr.ph69:                                         ; preds = %414, %347
  %t.065 = phi i8** [ %415, %414 ], [ %272, %347 ]
  store i8* null, i8** %filename, align 8, !tbaa !0
  store i8* null, i8** %redirected_URL, align 8, !tbaa !0
  %353 = load i8** %t.065, align 8, !tbaa !0
  %354 = call %struct.url* @url_parse(i8* %353, i32* %url_err, %struct.iri* @dummy_iri, i1 zeroext true) nounwind
  %355 = icmp eq %struct.url* %354, null
  br i1 %355, label %356, label %361

; <label>:356                                     ; preds = %.lr.ph69
  %357 = load i8** %t.065, align 8, !tbaa !0
  %358 = load i32* %url_err, align 4, !tbaa !5
  %359 = call i8* @url_error(i8* %357, i32 %358) nounwind
  %360 = load i8** %t.065, align 8, !tbaa !0
  call void (i32, i8*, ...)* @logprintf(i32 1, i8* getelementptr inbounds ([9 x i8]* @.str27185, i64 0, i64 0), i8* %360, i8* %359) nounwind
  call void @free(i8* %359)
  br label %414

; <label>:361                                     ; preds = %.lr.ph69
  %362 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 6), align 1, !tbaa !3, !range !4
  %363 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 86), align 2, !tbaa !3, !range !4
  %364 = or i8 %363, %362
  %365 = icmp eq i8 %364, 0
  br i1 %365, label %380, label %366

; <label>:366                                     ; preds = %361
  %367 = load i8** %t.065, align 8, !tbaa !0
  %368 = call i32 @url_scheme(i8* %367) nounwind
  %369 = icmp eq i32 %368, 2
  br i1 %369, label %370, label %372

; <label>:370                                     ; preds = %366
  %371 = call zeroext i1 @url_uses_proxy(%struct.url* %354) nounwind
  br i1 %371, label %372, label %380

; <label>:372                                     ; preds = %370, %366
  %373 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 34), align 8, !tbaa !3, !range !4
  %374 = load i8** %t.065, align 8, !tbaa !0
  %375 = call i32 @url_scheme(i8* %374) nounwind
  %376 = icmp eq i32 %375, 2
  br i1 %376, label %377, label %378

; <label>:377                                     ; preds = %372
  store i8 1, i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 34), align 8, !tbaa !3
  br label %378

; <label>:378                                     ; preds = %377, %372
  %379 = call i32 @retrieve_tree(%struct.url* %354, %struct.iri* null) nounwind
  store i8 %373, i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 34), align 8, !tbaa !3
  br label %385

; <label>:380                                     ; preds = %370, %361
  %381 = load i8** %t.065, align 8, !tbaa !0
  %382 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 6), align 1, !tbaa !3, !range !4
  %383 = icmp ne i8 %382, 0
  %384 = call i32 @fork_retrieve_url(%struct.url* %354, i8* %381, i8** %filename, i8** %redirected_URL, i8* null, i32* %dt, i1 zeroext %383, %struct.iri* @dummy_iri, i1 zeroext true)
  br label %385

; <label>:385                                     ; preds = %380, %378
  %386 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 84), align 8, !tbaa !3, !range !4
  %387 = icmp eq i8 %386, 0
  br i1 %387, label %405, label %388

; <label>:388                                     ; preds = %385
  %389 = load i8** %filename, align 8, !tbaa !0
  %390 = call zeroext i1 @file_exists_p(i8* %389) nounwind
  br i1 %390, label %391, label %405

; <label>:391                                     ; preds = %388
  %392 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 71), align 2, !tbaa !3, !range !4
  %393 = icmp eq i8 %392, 0
  br i1 %393, label %395, label %394, !prof !11

; <label>:394                                     ; preds = %391
  call void (i8*, ...)* @debug_logprintf(i8* getelementptr inbounds ([48 x i8]* @.str28186, i64 0, i64 0)) nounwind
  br label %395

; <label>:395                                     ; preds = %394, %391
  %396 = call i8* @libintl_gettext(i8* getelementptr inbounds ([14 x i8]* @.str29187, i64 0, i64 0)) nounwind
  %397 = load i8** %filename, align 8, !tbaa !0
  call void (i32, i8*, ...)* @logprintf(i32 0, i8* %396, i8* %397) nounwind
  %398 = load i8** %filename, align 8, !tbaa !0
  %399 = call i32 @unlink(i8* %398) nounwind
  %400 = icmp eq i32 %399, 0
  br i1 %400, label %405, label %401

; <label>:401                                     ; preds = %395
  %402 = call i32* @__error() nounwind
  %403 = load i32* %402, align 4, !tbaa !5
  %404 = call i8* @strerror(i32 %403) nounwind
  call void (i32, i8*, ...)* @logprintf(i32 1, i8* getelementptr inbounds ([12 x i8]* @.str30188, i64 0, i64 0), i8* %404) nounwind
  br label %405

; <label>:405                                     ; preds = %401, %395, %388, %385
  %406 = load i8** %redirected_URL, align 8, !tbaa !0
  %407 = icmp eq i8* %406, null
  br i1 %407, label %409, label %408

; <label>:408                                     ; preds = %405
  call void @free(i8* %406)
  br label %409

; <label>:409                                     ; preds = %408, %405
  %410 = load i8** %filename, align 8, !tbaa !0
  %411 = icmp eq i8* %410, null
  br i1 %411, label %413, label %412

; <label>:412                                     ; preds = %409
  call void @free(i8* %410)
  br label %413

; <label>:413                                     ; preds = %412, %409
  call void @url_free(%struct.url* %354) nounwind
  br label %414

; <label>:414                                     ; preds = %413, %356
  %415 = getelementptr inbounds i8** %t.065, i64 1
  %416 = load i8** %415, align 8, !tbaa !0
  %417 = icmp eq i8* %416, null
  br i1 %417, label %._crit_edge70, label %.lr.ph69

._crit_edge70:                                    ; preds = %414, %347
  %418 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 20), align 8, !tbaa !0
  %419 = icmp eq i8* %418, null
  br i1 %419, label %428, label %420

; <label>:420                                     ; preds = %._crit_edge70
  %421 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 21), align 8, !tbaa !3, !range !4
  %422 = icmp ne i8 %421, 0
  %423 = call i32 @fork_retrieve_from_file(i8* %418, i1 zeroext %422)
  %424 = icmp eq i32 %423, 0
  br i1 %424, label %425, label %428

; <label>:425                                     ; preds = %420
  %426 = call i8* @libintl_gettext(i8* getelementptr inbounds ([22 x i8]* @.str31189, i64 0, i64 0)) nounwind
  %427 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 20), align 8, !tbaa !0
  call void (i32, i8*, ...)* @logprintf(i32 1, i8* %426, i8* %427) nounwind
  br label %428

; <label>:428                                     ; preds = %425, %420, %._crit_edge70
  %429 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 6), align 1, !tbaa !3, !range !4
  %430 = icmp eq i8 %429, 0
  %431 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 23), align 8, !tbaa !3, !range !4
  %432 = icmp eq i8 %431, 0
  %or.cond50 = or i1 %430, %432
  br i1 %or.cond50, label %434, label %433

; <label>:433                                     ; preds = %428
  call void @print_broken_links() nounwind
  br label %434

; <label>:434                                     ; preds = %433, %428
  %435 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 6), align 1, !tbaa !3, !range !4
  %436 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 86), align 2, !tbaa !3, !range !4
  %437 = or i8 %436, %435
  %or.cond53.not = icmp ne i8 %437, 0
  %438 = icmp sgt i32 %134, 1
  %or.cond55 = or i1 %or.cond53.not, %438
  br i1 %or.cond55, label %444, label %439

; <label>:439                                     ; preds = %434
  %440 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 20), align 8, !tbaa !0
  %441 = icmp ne i8* %440, null
  %442 = load i64* @total_downloaded_bytes, align 8, !tbaa !8
  %443 = icmp ne i64 %442, 0
  %or.cond17 = and i1 %441, %443
  br i1 %or.cond17, label %445, label %464

; <label>:444                                     ; preds = %434
  %.old = load i64* @total_downloaded_bytes, align 8, !tbaa !8
  %.old18 = icmp eq i64 %.old, 0
  br i1 %.old18, label %464, label %445

; <label>:445                                     ; preds = %444, %439
  %446 = call i8* @libintl_gettext(i8* getelementptr inbounds ([53 x i8]* @.str32190, i64 0, i64 0)) nounwind
  %447 = call i64 @time(i64* null) nounwind
  %448 = call i8* @datetime_str(i64 %447) nounwind
  %449 = load i32* @numurls, align 4, !tbaa !5
  %450 = load i64* @total_downloaded_bytes, align 8, !tbaa !8
  %451 = call i8* @human_readable(i64 %450) nounwind
  %452 = load double* @total_download_time, align 8, !tbaa !9
  call fastcc void @secs_to_human_time(double %452)
  %453 = load i64* @total_downloaded_bytes, align 8, !tbaa !8
  %454 = load double* @total_download_time, align 8, !tbaa !9
  %455 = call i8* @retr_rate(i64 %453, double %454) nounwind
  call void (i32, i8*, ...)* @logprintf(i32 1, i8* %446, i8* %448, i32 %449, i8* %451, i8* getelementptr inbounds ([32 x i8]* @secs_to_human_time.buf, i64 0, i64 0), i8* %455) nounwind
  %456 = load i64* getelementptr inbounds (%struct.options* @opt, i64 0, i32 68), align 8, !tbaa !8
  %457 = icmp ne i64 %456, 0
  %458 = load i64* @total_downloaded_bytes, align 8, !tbaa !8
  %459 = icmp sgt i64 %458, %456
  %or.cond58 = and i1 %457, %459
  br i1 %or.cond58, label %460, label %464

; <label>:460                                     ; preds = %445
  %461 = call i8* @libintl_gettext(i8* getelementptr inbounds ([32 x i8]* @.str33191, i64 0, i64 0)) nounwind
  %462 = load i64* getelementptr inbounds (%struct.options* @opt, i64 0, i32 68), align 8, !tbaa !8
  %463 = call i8* @human_readable(i64 %462) nounwind
  call void (i32, i8*, ...)* @logprintf(i32 1, i8* %461, i8* %463) nounwind
  br label %464

; <label>:464                                     ; preds = %460, %445, %444, %439
  %465 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 100), align 8, !tbaa !0
  %466 = icmp eq i8* %465, null
  br i1 %466, label %468, label %467

; <label>:467                                     ; preds = %464
  call void @save_cookies() nounwind
  br label %468

; <label>:468                                     ; preds = %467, %464
  %469 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 77), align 8, !tbaa !3, !range !4
  %470 = icmp ne i8 %469, 0
  %471 = load i8* getelementptr inbounds (%struct.options* @opt, i64 0, i32 84), align 8, !tbaa !3, !range !4
  %472 = icmp eq i8 %471, 0
  %or.cond61 = and i1 %470, %472
  br i1 %or.cond61, label %473, label %474

; <label>:473                                     ; preds = %468
  call void @convert_all_links() nounwind
  br label %474

; <label>:474                                     ; preds = %473, %468
  call void @log_close() nounwind
  %475 = icmp sgt i32 %134, 0
  br i1 %475, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %474
  %476 = sub i32 %argc, %133
  br label %477

; <label>:477                                     ; preds = %477, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %477 ]
  %478 = getelementptr inbounds i8** %272, i64 %indvars.iv
  %479 = load i8** %478, align 8, !tbaa !0
  call void @free(i8* %479)
  %indvars.iv.next = add i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %476
  br i1 %exitcond, label %._crit_edge, label %477

._crit_edge:                                      ; preds = %477, %474
  call void @cleanup() nounwind
  %480 = call i32 @get_exit_status() nounwind
  ret i32 %480
}

define internal fastcc void @i18n_initialize() nounwind uwtable {
  %1 = tail call i8* @setlocale(i32 0, i8* getelementptr inbounds ([1 x i8]* @.str43201, i64 0, i64 0)) nounwind
  %2 = tail call i8* @libintl_bindtextdomain(i8* getelementptr inbounds ([5 x i8]* @.str380, i64 0, i64 0), i8* getelementptr inbounds ([24 x i8]* @.str245, i64 0, i64 0)) nounwind
  %3 = tail call i8* @libintl_textdomain(i8* getelementptr inbounds ([5 x i8]* @.str380, i64 0, i64 0)) nounwind
  ret void
}

declare void @initialize()

define internal fastcc void @init_switches() nounwind uwtable {
  br label %1

; <label>:1                                       ; preds = %52, %0
  %p.03 = phi i8* [ getelementptr inbounds ([128 x i8]* @short_options, i64 0, i64 0), %0 ], [ %p.2, %52 ]
  %i.02 = phi i64 [ 0, %0 ], [ %53, %52 ]
  %o.01 = phi i64 [ 0, %0 ], [ %o.1, %52 ]
  %2 = getelementptr inbounds [121 x %struct.cmdline_option]* bitcast (<{ { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] } }>* @option_data to [121 x %struct.cmdline_option]*), i64 0, i64 %i.02, i32 0
  %3 = load i8** %2, align 16, !tbaa !0
  %4 = icmp eq i8* %3, null
  br i1 %4, label %52, label %5

; <label>:5                                       ; preds = %1
  %6 = add i64 %o.01, 1
  %7 = getelementptr inbounds [243 x %struct.option]* @long_options, i64 0, i64 %o.01, i32 0
  store i8* %3, i8** %7, align 16, !tbaa !0
  %8 = trunc i64 %i.02 to i32
  %9 = getelementptr inbounds [243 x %struct.option]* @long_options, i64 0, i64 %o.01, i32 3
  store i32 %8, i32* %9, align 8, !tbaa !5
  %10 = getelementptr inbounds [121 x %struct.cmdline_option]* bitcast (<{ { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] } }>* @option_data to [121 x %struct.cmdline_option]*), i64 0, i64 %i.02, i32 1
  %11 = load i8* %10, align 8, !tbaa !1
  %12 = icmp eq i8 %11, 0
  br i1 %12, label %20, label %13

; <label>:13                                      ; preds = %5
  %14 = getelementptr inbounds i8* %p.03, i64 1
  store i8 %11, i8* %p.03, align 1, !tbaa !1
  %15 = trunc i64 %o.01 to i8
  %16 = load i8* %10, align 8, !tbaa !1
  %17 = sext i8 %16 to i64
  %18 = add i64 %17, -32
  %19 = getelementptr inbounds [96 x i8]* @optmap, i64 0, i64 %18
  store i8 %15, i8* %19, align 1, !tbaa !1
  br label %20

; <label>:20                                      ; preds = %13, %5
  %p.1 = phi i8* [ %14, %13 ], [ %p.03, %5 ]
  %21 = getelementptr inbounds [121 x %struct.cmdline_option]* bitcast (<{ { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] } }>* @option_data to [121 x %struct.cmdline_option]*), i64 0, i64 %i.02, i32 2
  %22 = load i32* %21, align 4, !tbaa !13
  switch i32 %22, label %39 [
    i32 0, label %23
    i32 1, label %29
  ]

; <label>:23                                      ; preds = %20
  %24 = getelementptr inbounds [243 x %struct.option]* @long_options, i64 0, i64 %o.01, i32 1
  store i32 1, i32* %24, align 8, !tbaa !5
  %25 = load i8* %10, align 8, !tbaa !1
  %26 = icmp eq i8 %25, 0
  br i1 %26, label %52, label %27

; <label>:27                                      ; preds = %23
  %28 = getelementptr inbounds i8* %p.1, i64 1
  store i8 58, i8* %p.1, align 1, !tbaa !1
  br label %52

; <label>:29                                      ; preds = %20
  %30 = getelementptr inbounds [243 x %struct.option]* @long_options, i64 0, i64 %o.01, i32 1
  store i32 2, i32* %30, align 8, !tbaa !5
  %31 = add i64 %o.01, 2
  %32 = load i8** %2, align 16, !tbaa !0
  %33 = tail call fastcc i8* @no_prefix(i8* %32)
  %34 = getelementptr inbounds [243 x %struct.option]* @long_options, i64 0, i64 %6, i32 0
  store i8* %33, i8** %34, align 16, !tbaa !0
  %35 = getelementptr inbounds [243 x %struct.option]* @long_options, i64 0, i64 %6, i32 1
  store i32 0, i32* %35, align 8, !tbaa !5
  %36 = or i64 %i.02, 1024
  %37 = trunc i64 %36 to i32
  %38 = getelementptr inbounds [243 x %struct.option]* @long_options, i64 0, i64 %6, i32 3
  store i32 %37, i32* %38, align 8, !tbaa !5
  br label %52

; <label>:39                                      ; preds = %20
  %40 = getelementptr inbounds [121 x %struct.cmdline_option]* bitcast (<{ { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] } }>* @option_data to [121 x %struct.cmdline_option]*), i64 0, i64 %i.02, i32 4
  %41 = load i32* %40, align 8, !tbaa !5
  %42 = icmp eq i32 %41, -1
  br i1 %42, label %43, label %44

; <label>:43                                      ; preds = %39
  tail call void @__assert(i8* getelementptr inbounds ([14 x i8]* @__func__.init_switches, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8]* @.str251, i64 0, i64 0), i32 365, i8* getelementptr inbounds ([19 x i8]* @.str378, i64 0, i64 0)) nounwind
  br label %44

; <label>:44                                      ; preds = %43, %39
  %45 = load i32* %40, align 8, !tbaa !5
  %46 = getelementptr inbounds [243 x %struct.option]* @long_options, i64 0, i64 %o.01, i32 1
  store i32 %45, i32* %46, align 8, !tbaa !5
  %47 = load i8* %10, align 8, !tbaa !1
  %48 = icmp ne i8 %47, 0
  %49 = icmp eq i32 %45, 1
  %or.cond = and i1 %48, %49
  br i1 %or.cond, label %50, label %52

; <label>:50                                      ; preds = %44
  %51 = getelementptr inbounds i8* %p.1, i64 1
  store i8 58, i8* %p.1, align 1, !tbaa !1
  br label %52

; <label>:52                                      ; preds = %50, %44, %29, %27, %23, %1
  %o.1 = phi i64 [ %6, %50 ], [ %6, %44 ], [ %31, %29 ], [ %6, %27 ], [ %6, %23 ], [ %o.01, %1 ]
  %p.2 = phi i8* [ %51, %50 ], [ %p.1, %44 ], [ %p.1, %29 ], [ %28, %27 ], [ %p.1, %23 ], [ %p.03, %1 ]
  %53 = add i64 %i.02, 1
  %exitcond = icmp eq i64 %53, 121
  br i1 %exitcond, label %54, label %1

; <label>:54                                      ; preds = %52
  store i8 0, i8* %p.2, align 1, !tbaa !1
  %55 = icmp ult i64 %o.1, 244
  br i1 %55, label %57, label %56

; <label>:56                                      ; preds = %54
  tail call void @__assert(i8* getelementptr inbounds ([14 x i8]* @__func__.init_switches, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8]* @.str251, i64 0, i64 0), i32 379, i8* getelementptr inbounds ([28 x i8]* @.str379, i64 0, i64 0)) nounwind
  br label %57

; <label>:57                                      ; preds = %56, %54
  ret void
}

declare i32 @rpl_getopt_long(i32, i8**, i8*, %struct.option*, i32*)

define internal fastcc void @print_usage() nounwind uwtable {
  %1 = tail call i8* @libintl_gettext(i8* getelementptr inbounds ([32 x i8]* @.str377, i64 0, i64 0)) nounwind
  %2 = load i8** @exec_name, align 8, !tbaa !0
  %3 = tail call i32 (i8*, ...)* @printf(i8* %1, i8* %2) nounwind
  ret void
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @exit(i32) noreturn

declare void @setoptval(i8*, i8*, i8*)

declare void @run_command(i8*)

declare i32 @fputs(i8* nocapture, %struct.__sFILE* nocapture) nounwind

define internal fastcc i8* @prompt_for_password() nounwind uwtable {
  %1 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 37), align 8, !tbaa !0
  %2 = icmp eq i8* %1, null
  br i1 %2, label %8, label %3

; <label>:3                                       ; preds = %0
  %4 = tail call i8* @libintl_gettext(i8* getelementptr inbounds ([23 x i8]* @.str41199, i64 0, i64 0)) nounwind
  %5 = load i8** getelementptr inbounds (%struct.options* @opt, i64 0, i32 37), align 8, !tbaa !0
  %6 = tail call i8* @quote(i8* %5) nounwind
  %7 = tail call i32 (i8*, ...)* @printf(i8* %4, i8* %6) nounwind
  br label %11

; <label>:8                                       ; preds = %0
  %9 = tail call i8* @libintl_gettext(i8* getelementptr inbounds ([11 x i8]* @.str42200, i64 0, i64 0)) nounwind
  %10 = tail call i32 (i8*, ...)* @printf(i8* %9) nounwind
  br label %11

; <label>:11                                      ; preds = %8, %3
  %12 = tail call i8* @gnu_getpass(i8* getelementptr inbounds ([1 x i8]* @.str43201, i64 0, i64 0)) nounwind
  ret i8* %12
}

declare void @fork_to_background()

declare void @set_progress_implementation(i8*)

declare i8* @rewrite_shorthand_url(i8*)

declare void @log_init(i8*, i1 zeroext)

declare void @perror(i8* nocapture) nounwind

declare i32 @fstat(i32, %struct.stat* nocapture) nounwind

declare i32 @fileno(%struct.__sFILE* nocapture) nounwind

declare void (i32)* @signal(i32, void (i32)*)

define internal void @redirect_output_signal(i32 %sig) nounwind uwtable {
  %1 = icmp eq i32 %sig, 1
  br i1 %1, label %5, label %2

; <label>:2                                       ; preds = %0
  %3 = icmp eq i32 %sig, 30
  %4 = select i1 %3, i8* getelementptr inbounds ([8 x i8]* @.str35193, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8]* @.str36194, i64 0, i64 0)
  br label %5

; <label>:5                                       ; preds = %2, %0
  %6 = phi i8* [ %4, %2 ], [ getelementptr inbounds ([7 x i8]* @.str34192, i64 0, i64 0), %0 ]
  tail call void @log_request_redirect_output(i8* %6) nounwind
  tail call void @progress_schedule_redirect() nounwind
  %7 = tail call void (i32)* (i32, void (i32)*)* @signal(i32 %sig, void (i32)* @redirect_output_signal) nounwind
  ret void
}

declare void @progress_handle_sigwinch(i32)

declare %struct.url* @url_parse(i8*, i32*, %struct.iri*, i1 zeroext)

declare i8* @url_error(i8*, i32)

declare i32 @url_scheme(i8*)

declare zeroext i1 @url_uses_proxy(%struct.url*)

declare i32 @retrieve_tree(%struct.url*, %struct.iri*)

declare i32 @unlink(i8* nocapture) nounwind

declare void @url_free(%struct.url*)

declare void @print_broken_links()

define internal fastcc void @secs_to_human_time(double %interval) nounwind uwtable {
  %1 = fadd double %interval, 5.000000e-01
  %2 = fptosi double %1 to i32
  %3 = srem i32 %2, 86400
  %4 = sdiv i32 %3, 3600
  %5 = srem i32 %3, 3600
  %6 = sdiv i32 %5, 60
  %7 = srem i32 %5, 60
  %.off = add i32 %2, 86399
  %8 = icmp ugt i32 %.off, 172798
  br i1 %8, label %9, label %12

; <label>:9                                       ; preds = %0
  %10 = sdiv i32 %2, 86400
  %11 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([32 x i8]* @secs_to_human_time.buf, i64 0, i64 0), i8* getelementptr inbounds ([16 x i8]* @.str37195, i64 0, i64 0), i32 %10, i32 %4, i32 %6, i32 %7) nounwind
  br label %23

; <label>:12                                      ; preds = %0
  %.off1 = add i32 %3, 3599
  %13 = icmp ugt i32 %.off1, 7198
  br i1 %13, label %14, label %16

; <label>:14                                      ; preds = %12
  %15 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([32 x i8]* @secs_to_human_time.buf, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8]* @.str38196, i64 0, i64 0), i32 %4, i32 %6, i32 %7) nounwind
  br label %23

; <label>:16                                      ; preds = %12
  %.off2 = add i32 %5, 59
  %17 = icmp ugt i32 %.off2, 118
  br i1 %17, label %18, label %20

; <label>:18                                      ; preds = %16
  %19 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([32 x i8]* @secs_to_human_time.buf, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8]* @.str39197, i64 0, i64 0), i32 %6, i32 %7) nounwind
  br label %23

; <label>:20                                      ; preds = %16
  %21 = tail call i8* @print_decimal(double %interval) nounwind
  %22 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* getelementptr inbounds ([32 x i8]* @secs_to_human_time.buf, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8]* @.str40198, i64 0, i64 0), i8* %21) nounwind
  br label %23

; <label>:23                                      ; preds = %20, %18, %14, %9
  ret void
}

declare void @convert_all_links()

declare void @log_close()

declare void @cleanup()

declare i32 @get_exit_status()

declare void @log_request_redirect_output(i8*)

declare void @progress_schedule_redirect()

declare i8* @print_decimal(double)

declare i8* @gnu_getpass(i8*)

define internal void @print_help() noreturn nounwind uwtable {
  %1 = tail call i8* @libintl_gettext(i8* getelementptr inbounds ([51 x i8]* @.str376, i64 0, i64 0)) nounwind
  %2 = load i8** @version_string, align 8, !tbaa !0
  %3 = tail call i32 (i8*, ...)* @printf(i8* %1, i8* %2) nounwind
  tail call fastcc void @print_usage()
  br label %4

; <label>:4                                       ; preds = %4, %0
  %i.01 = phi i64 [ 0, %0 ], [ %10, %4 ]
  %5 = getelementptr inbounds [130 x i8*]* @print_help.help, i64 0, i64 %i.01
  %6 = load i8** %5, align 8, !tbaa !0
  %7 = tail call i8* @libintl_gettext(i8* %6) nounwind
  %8 = load %struct.__sFILE** @__stdoutp, align 8, !tbaa !0
  %9 = tail call i32 @fputs(i8* %7, %struct.__sFILE* %8) nounwind
  %10 = add i64 %i.01, 1
  %exitcond = icmp eq i64 %10, 130
  br i1 %exitcond, label %11, label %4

; <label>:11                                      ; preds = %4
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

define internal void @print_version() noreturn nounwind uwtable {
  %1 = tail call i8* @libintl_gettext(i8* getelementptr inbounds ([9 x i8]* @.str234, i64 0, i64 0)) nounwind
  %2 = tail call i8* @libintl_gettext(i8* getelementptr inbounds ([9 x i8]* @.str235, i64 0, i64 0)) nounwind
  %3 = tail call i8* @libintl_gettext(i8* getelementptr inbounds ([10 x i8]* @.str236, i64 0, i64 0)) nounwind
  %4 = tail call i8* @libintl_gettext(i8* getelementptr inbounds ([7 x i8]* @.str237, i64 0, i64 0)) nounwind
  %5 = tail call i8* @libintl_gettext(i8* getelementptr inbounds ([27 x i8]* @.str238, i64 0, i64 0)) nounwind
  %6 = load i8** @version_string, align 8, !tbaa !0
  %7 = tail call i32 (i8*, ...)* @printf(i8* %5, i8* %6, i8* getelementptr inbounds ([11 x i8]* @.str24182, i64 0, i64 0)) nounwind
  %8 = load i8** getelementptr inbounds ([0 x i8*]* @compiled_features, i64 0, i64 0), align 8, !tbaa !0
  %9 = icmp eq i8* %8, null
  br i1 %9, label %._crit_edge, label %.preheader

.preheader:                                       ; preds = %.critedge, %0
  %i.04 = phi i32 [ %i.1, %.critedge ], [ 0, %0 ]
  %10 = sext i32 %i.04 to i64
  br label %11

; <label>:11                                      ; preds = %17, %.preheader
  %indvars.iv = phi i64 [ %10, %.preheader ], [ %indvars.iv.next, %17 ]
  %i.1 = phi i32 [ %i.04, %.preheader ], [ %24, %17 ]
  %line_length.0 = phi i32 [ 72, %.preheader ], [ %23, %17 ]
  %12 = icmp sgt i32 %line_length.0, 0
  br i1 %12, label %13, label %.critedge

; <label>:13                                      ; preds = %11
  %14 = getelementptr inbounds [0 x i8*]* @compiled_features, i64 0, i64 %indvars.iv
  %15 = load i8** %14, align 8, !tbaa !0
  %16 = icmp eq i8* %15, null
  br i1 %16, label %.critedge, label %17

; <label>:17                                      ; preds = %13
  %18 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str239, i64 0, i64 0), i8* %15) nounwind
  %19 = load i8** %14, align 8, !tbaa !0
  %20 = tail call i64 @strlen(i8* %19) nounwind readonly
  %21 = zext i32 %line_length.0 to i64
  %.neg3 = add i64 %21, 4294967294
  %22 = sub i64 %.neg3, %20
  %23 = trunc i64 %22 to i32
  %indvars.iv.next = add i64 %indvars.iv, 1
  %24 = add nsw i32 %i.1, 1
  br label %11

.critedge:                                        ; preds = %13, %11
  %putchar = tail call i32 @putchar(i32 10) nounwind
  %25 = sext i32 %i.1 to i64
  %26 = getelementptr inbounds [0 x i8*]* @compiled_features, i64 0, i64 %25
  %27 = load i8** %26, align 8, !tbaa !0
  %28 = icmp eq i8* %27, null
  br i1 %28, label %._crit_edge, label %.preheader

._crit_edge:                                      ; preds = %.critedge, %0
  %putchar1 = tail call i32 @putchar(i32 10) nounwind
  %puts = tail call i32 @puts(i8* %1)
  %29 = tail call i8* @wgetrc_env_file_name() nounwind
  %30 = icmp eq i8* %29, null
  br i1 %30, label %37, label %31

; <label>:31                                      ; preds = %._crit_edge
  %32 = load i8* %29, align 1, !tbaa !1
  %33 = icmp eq i8 %32, 0
  br i1 %33, label %37, label %34

; <label>:34                                      ; preds = %31
  %35 = tail call i8* @libintl_gettext(i8* getelementptr inbounds ([14 x i8]* @.str241, i64 0, i64 0)) nounwind
  %36 = tail call i32 (i8*, ...)* @printf(i8* %35, i8* %29) nounwind
  tail call void @free(i8* %29)
  br label %37

; <label>:37                                      ; preds = %34, %31, %._crit_edge
  %38 = tail call i8* @wgetrc_user_file_name() nounwind
  %39 = icmp eq i8* %38, null
  br i1 %39, label %43, label %40

; <label>:40                                      ; preds = %37
  %41 = tail call i8* @libintl_gettext(i8* getelementptr inbounds ([15 x i8]* @.str242, i64 0, i64 0)) nounwind
  %42 = tail call i32 (i8*, ...)* @printf(i8* %41, i8* %38) nounwind
  tail call void @free(i8* %38)
  br label %43

; <label>:43                                      ; preds = %40, %37
  %44 = tail call i8* @libintl_gettext(i8* getelementptr inbounds ([17 x i8]* @.str243, i64 0, i64 0)) nounwind
  %45 = tail call i32 (i8*, ...)* @printf(i8* %44, i8* getelementptr inbounds ([22 x i8]* @.str244, i64 0, i64 0)) nounwind
  tail call fastcc void @format_and_print_line(i8* %2, i8* getelementptr inbounds ([24 x i8]* @.str245, i64 0, i64 0))
  %46 = load i8** @compilation_string, align 8, !tbaa !0
  tail call fastcc void @format_and_print_line(i8* %3, i8* %46)
  %47 = load i8** @link_string, align 8, !tbaa !0
  tail call fastcc void @format_and_print_line(i8* %4, i8* %47)
  %putchar2 = tail call i32 @putchar(i32 10) nounwind
  %48 = tail call i8* @libintl_gettext(i8* getelementptr inbounds ([51 x i8]* @.str246, i64 0, i64 0)) nounwind
  %49 = load %struct.__sFILE** @__stdoutp, align 8, !tbaa !0
  %50 = tail call i32 @fputs(i8* %48, %struct.__sFILE* %49) nounwind
  %51 = tail call i8* @libintl_gettext(i8* getelementptr inbounds ([205 x i8]* @.str247, i64 0, i64 0)) nounwind
  %52 = load %struct.__sFILE** @__stdoutp, align 8, !tbaa !0
  %53 = tail call i32 @fputs(i8* %51, %struct.__sFILE* %52) nounwind
  %54 = tail call i8* @libintl_gettext(i8* getelementptr inbounds ([60 x i8]* @.str248, i64 0, i64 0)) nounwind
  %55 = load %struct.__sFILE** @__stdoutp, align 8, !tbaa !0
  %56 = tail call i32 @fputs(i8* %54, %struct.__sFILE* %55) nounwind
  %57 = tail call i8* @libintl_gettext(i8* getelementptr inbounds ([57 x i8]* @.str249, i64 0, i64 0)) nounwind
  %58 = load %struct.__sFILE** @__stdoutp, align 8, !tbaa !0
  %59 = tail call i32 @fputs(i8* %57, %struct.__sFILE* %58) nounwind
  %60 = tail call i8* @libintl_gettext(i8* getelementptr inbounds ([62 x i8]* @.str250, i64 0, i64 0)) nounwind
  %61 = load %struct.__sFILE** @__stdoutp, align 8, !tbaa !0
  %62 = tail call i32 @fputs(i8* %60, %struct.__sFILE* %61) nounwind
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare i8* @wgetrc_env_file_name()

declare i8* @wgetrc_user_file_name()

define internal fastcc void @format_and_print_line(i8* %prefix, i8* %line) nounwind uwtable {
  %1 = icmp eq i8* %prefix, null
  br i1 %1, label %2, label %3

; <label>:2                                       ; preds = %0
  tail call void @__assert(i8* getelementptr inbounds ([22 x i8]* @__func__.format_and_print_line, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8]* @.str251, i64 0, i64 0), i32 745, i8* getelementptr inbounds ([15 x i8]* @.str252, i64 0, i64 0)) nounwind
  br label %3

; <label>:3                                       ; preds = %2, %0
  %4 = icmp eq i8* %line, null
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %3
  tail call void @__assert(i8* getelementptr inbounds ([22 x i8]* @__func__.format_and_print_line, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8]* @.str251, i64 0, i64 0), i32 746, i8* getelementptr inbounds ([13 x i8]* @.str253, i64 0, i64 0)) nounwind
  br label %6

; <label>:6                                       ; preds = %5, %3
  %7 = tail call noalias i8* @xstrdup(i8* %line) nounwind
  %8 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str16174, i64 0, i64 0), i8* %prefix) nounwind
  %9 = tail call i8* @strtok(i8* %7, i8* getelementptr inbounds ([2 x i8]* @.str254, i64 0, i64 0)) nounwind
  %10 = icmp eq i8* %9, null
  br i1 %10, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %16, %6
  %token.03 = phi i8* [ %22, %16 ], [ %9, %6 ]
  %remaining_chars.02 = phi i32 [ %21, %16 ], [ 72, %6 ]
  %11 = sext i32 %remaining_chars.02 to i64
  %12 = tail call i64 @strlen(i8* %token.03) nounwind readonly
  %13 = icmp ugt i64 %11, %12
  br i1 %13, label %16, label %14

; <label>:14                                      ; preds = %.lr.ph
  %15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str255, i64 0, i64 0), i32 4, i32 32) nounwind
  br label %16

; <label>:16                                      ; preds = %14, %.lr.ph
  %remaining_chars.1 = phi i32 [ 68, %14 ], [ %remaining_chars.02, %.lr.ph ]
  %17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str239, i64 0, i64 0), i8* %token.03) nounwind
  %18 = tail call i64 @strlen(i8* %token.03) nounwind readonly
  %19 = zext i32 %remaining_chars.1 to i64
  %.neg1 = add i64 %19, 4294967295
  %20 = sub i64 %.neg1, %18
  %21 = trunc i64 %20 to i32
  %22 = tail call i8* @strtok(i8* null, i8* getelementptr inbounds ([2 x i8]* @.str254, i64 0, i64 0)) nounwind
  %23 = icmp eq i8* %22, null
  br i1 %23, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %16, %6
  %putchar = tail call i32 @putchar(i32 10) nounwind
  tail call void @free(i8* %7)
  ret void
}

declare i8* @strtok(i8*, i8* nocapture) nounwind

define internal fastcc i8* @no_prefix(i8* nocapture %s) nounwind uwtable {
  %1 = load i8** @no_prefix.p, align 8, !tbaa !0
  %2 = tail call i64 @strlen(i8* %s) nounwind readonly
  %3 = shl i64 %2, 32
  %sext = add i64 %3, 17179869184
  %4 = ashr exact i64 %sext, 32
  %5 = getelementptr inbounds i8* %1, i64 %4
  %6 = icmp ult i8* %5, getelementptr inbounds ([1024 x i8]* @no_prefix.buffer, i64 1, i64 0)
  br i1 %6, label %8, label %7

; <label>:7                                       ; preds = %0
  tail call void @abort() noreturn nounwind
  unreachable

; <label>:8                                       ; preds = %0
  store i8 110, i8* %1, align 1, !tbaa !1
  %9 = getelementptr inbounds i8* %1, i64 1
  store i8 111, i8* %9, align 1, !tbaa !1
  %10 = getelementptr inbounds i8* %1, i64 2
  store i8 45, i8* %10, align 1, !tbaa !1
  %11 = getelementptr inbounds i8* %1, i64 3
  %12 = tail call i8* @strcpy(i8* %11, i8* %s) nounwind
  %13 = load i8** @no_prefix.p, align 8, !tbaa !0
  %14 = getelementptr inbounds i8* %13, i64 %4
  store i8* %14, i8** @no_prefix.p, align 8, !tbaa !0
  ret i8* %1
}

declare i8* @libintl_bindtextdomain(i8*, i8*)

declare i8* @libintl_textdomain(i8*)

declare i32 @putchar(i32)

declare i32 @puts(i8* nocapture) nounwind

declare i32 @virt_fstat(i32, %struct.stat*)

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA"}
!3 = metadata !{metadata !"_Bool", metadata !1}
!4 = metadata !{i8 0, i8 2}                       
!5 = metadata !{metadata !"int", metadata !1}
!6 = metadata !{metadata !"short", metadata !1}
!7 = metadata !{metadata !"long", metadata !1}
!8 = metadata !{metadata !"long long", metadata !1}
!9 = metadata !{metadata !"double", metadata !1}
!10 = metadata !{metadata !"_ZTS10url_scheme", metadata !1}
!11 = metadata !{metadata !"branch_weights", i32 64, i32 4}
!12 = metadata !{metadata !"_ZTS2rp", metadata !1}
!13 = metadata !{metadata !"_ZTSN14cmdline_option3$_0E", metadata !1}

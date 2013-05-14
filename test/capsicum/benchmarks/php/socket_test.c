/* socket_test: open a socket, connect it to an HTTP website, and
 * perform a successful operation on it. */
#define PORT 80

int create_tcp_socket();

int main()
{
  // sock: the socket.
  int sock = create_tcp_socket();

  // remote: a record of an input socket address.
  struct sockaddr_in* remote =
    (struct sockaddr_in *)malloc(sizeof(struct sockaddr_in *));
  remote->sin_family = AF_INET;
  host = argv[1];
  char* ip = get_ip(host);
  int tmp_res = inet_pton(AF_INET, ip, (void*) (&(remote->sin_addr.s_addr)));
  if (tmp_res < 0) {
    fprintf(stderr, "inet_pton failed\n");
    exit(1);
  }
  remote->sin_port = htons(PORT);

  // Connect the socket to the remote host.
  if (connect(sock, (struct sockaddr*) remote, sizeof(struct sockaddr)) < 0) {
    fprintf(stderr, "connect failed\n");
    exit(0);
  }

  printf("connected successfully to remote host\n");
  return;
}

// create_tcp_socket: create a TCP socket.
int create_tcp_socket()
{
  int sock;
  if((sock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0){
    perror("Can't create TCP socket");
    exit(1);
  }
  return sock;
}

// get_ip: takes the name of a host, gets an IP address as a byte string.
char *get_ip(char *host)
{
  struct hostent *hent;
  int iplen = 15; //XXX.XXX.XXX.XXX
  char *ip = (char *)malloc(iplen+1);
  memset(ip, 0, iplen+1);
  if((hent = gethostbyname(host)) == NULL)
  {
    herror("Can't get IP");
    exit(1);
  }
  if(inet_ntop(AF_INET, (void *)hent->h_addr_list[0], ip, iplen) == NULL)
  {
    perror("Can't resolve host");
    exit(1);
  }
  return ip;
}

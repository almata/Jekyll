---
layout: post
title:  "Create C program from curl command"
date:   2018-01-17
---
It's well known that `curl` is a tool to transfer data from or to a server, using one of the many supported protocols. For instance:

```bash
$ curl https://raw.githubusercontent.com/almata/almata.github.io/master/CNAME
albertmata.net
```

What's awesome and not so well known is that we can create a C program from a `curl` command:

```bash
$ curl https://raw.githubusercontent.com/almata/almata.github.io/master/CNAME --libcurl myfile.c
```

This will create a `myfile.c` file with this content (comments removed):

```c
#include <curl/curl.h>

int main(int argc, char *argv[])
{
  CURLcode ret;
  CURL *hnd;

  hnd = curl_easy_init();
  curl_easy_setopt(hnd, CURLOPT_BUFFERSIZE, 102400L);
  curl_easy_setopt(hnd, CURLOPT_URL, "https://raw.githubusercontent.com/almata/almata.github.io/master/CNAME");
  curl_easy_setopt(hnd, CURLOPT_NOPROGRESS, 1L);
  curl_easy_setopt(hnd, CURLOPT_USERAGENT, "curl/7.64.1");
  curl_easy_setopt(hnd, CURLOPT_MAXREDIRS, 50L);
  curl_easy_setopt(hnd, CURLOPT_HTTP_VERSION, (long)CURL_HTTP_VERSION_2TLS);
  curl_easy_setopt(hnd, CURLOPT_HTTP09_ALLOWED, 1L);
  curl_easy_setopt(hnd, CURLOPT_TCP_KEEPALIVE, 1L);

  ret = curl_easy_perform(hnd);

  curl_easy_cleanup(hnd);
  hnd = NULL;

  return (int)ret;
}
```

Which now can be compiled as usual with `gcc`, except we need to add the `-lcurl` option:

```bash
$ gcc myfile.c -lcurl -o myfile
```

And the resulting executable will work as expected, in this case downloading data from GitHub server:

```bash
$ ./myfile
albertmata.net
```

This can be a handy starting point when creating C or C++ programs that need to transfer data from or to a server.

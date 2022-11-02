
_spin:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "user.h"

int main(int argc, char *argv[]) {
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
   f:	83 ec 10             	sub    $0x10,%esp
  12:	89 cb                	mov    %ecx,%ebx
    int i;
    int x = 0;
  14:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)

    if (argc != 2)
  1b:	83 3b 02             	cmpl   $0x2,(%ebx)
  1e:	74 05                	je     25 <main+0x25>
        exit();
  20:	e8 a8 02 00 00       	call   2cd <exit>
    
    for (i = 1; i < atoi(argv[1]); i++)
  25:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  2c:	eb 08                	jmp    36 <main+0x36>
        x++;
  2e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    int x = 0;

    if (argc != 2)
        exit();
    
    for (i = 1; i < atoi(argv[1]); i++)
  32:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  36:	8b 43 04             	mov    0x4(%ebx),%eax
  39:	83 c0 04             	add    $0x4,%eax
  3c:	8b 00                	mov    (%eax),%eax
  3e:	83 ec 0c             	sub    $0xc,%esp
  41:	50                   	push   %eax
  42:	e8 f4 01 00 00       	call   23b <atoi>
  47:	83 c4 10             	add    $0x10,%esp
  4a:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  4d:	7f df                	jg     2e <main+0x2e>
        x++;
    
    printf(1, "pid(%d): x = %d\n", getpid(), x);
  4f:	e8 f9 02 00 00       	call   34d <getpid>
  54:	ff 75 f0             	pushl  -0x10(%ebp)
  57:	50                   	push   %eax
  58:	68 fa 07 00 00       	push   $0x7fa
  5d:	6a 01                	push   $0x1
  5f:	e8 e0 03 00 00       	call   444 <printf>
  64:	83 c4 10             	add    $0x10,%esp
  67:	b8 00 00 00 00       	mov    $0x0,%eax
    //exit();
  6c:	8d 65 f8             	lea    -0x8(%ebp),%esp
  6f:	59                   	pop    %ecx
  70:	5b                   	pop    %ebx
  71:	5d                   	pop    %ebp
  72:	8d 61 fc             	lea    -0x4(%ecx),%esp
  75:	c3                   	ret    

00000076 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  76:	55                   	push   %ebp
  77:	89 e5                	mov    %esp,%ebp
  79:	57                   	push   %edi
  7a:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  7b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  7e:	8b 55 10             	mov    0x10(%ebp),%edx
  81:	8b 45 0c             	mov    0xc(%ebp),%eax
  84:	89 cb                	mov    %ecx,%ebx
  86:	89 df                	mov    %ebx,%edi
  88:	89 d1                	mov    %edx,%ecx
  8a:	fc                   	cld    
  8b:	f3 aa                	rep stos %al,%es:(%edi)
  8d:	89 ca                	mov    %ecx,%edx
  8f:	89 fb                	mov    %edi,%ebx
  91:	89 5d 08             	mov    %ebx,0x8(%ebp)
  94:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  97:	90                   	nop
  98:	5b                   	pop    %ebx
  99:	5f                   	pop    %edi
  9a:	5d                   	pop    %ebp
  9b:	c3                   	ret    

0000009c <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  9c:	55                   	push   %ebp
  9d:	89 e5                	mov    %esp,%ebp
  9f:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  a2:	8b 45 08             	mov    0x8(%ebp),%eax
  a5:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  a8:	90                   	nop
  a9:	8b 45 08             	mov    0x8(%ebp),%eax
  ac:	8d 50 01             	lea    0x1(%eax),%edx
  af:	89 55 08             	mov    %edx,0x8(%ebp)
  b2:	8b 55 0c             	mov    0xc(%ebp),%edx
  b5:	8d 4a 01             	lea    0x1(%edx),%ecx
  b8:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  bb:	0f b6 12             	movzbl (%edx),%edx
  be:	88 10                	mov    %dl,(%eax)
  c0:	0f b6 00             	movzbl (%eax),%eax
  c3:	84 c0                	test   %al,%al
  c5:	75 e2                	jne    a9 <strcpy+0xd>
    ;
  return os;
  c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  ca:	c9                   	leave  
  cb:	c3                   	ret    

000000cc <strcmp>:

int
strcmp(const char *p, const char *q)
{
  cc:	55                   	push   %ebp
  cd:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  cf:	eb 08                	jmp    d9 <strcmp+0xd>
    p++, q++;
  d1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  d5:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  d9:	8b 45 08             	mov    0x8(%ebp),%eax
  dc:	0f b6 00             	movzbl (%eax),%eax
  df:	84 c0                	test   %al,%al
  e1:	74 10                	je     f3 <strcmp+0x27>
  e3:	8b 45 08             	mov    0x8(%ebp),%eax
  e6:	0f b6 10             	movzbl (%eax),%edx
  e9:	8b 45 0c             	mov    0xc(%ebp),%eax
  ec:	0f b6 00             	movzbl (%eax),%eax
  ef:	38 c2                	cmp    %al,%dl
  f1:	74 de                	je     d1 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  f3:	8b 45 08             	mov    0x8(%ebp),%eax
  f6:	0f b6 00             	movzbl (%eax),%eax
  f9:	0f b6 d0             	movzbl %al,%edx
  fc:	8b 45 0c             	mov    0xc(%ebp),%eax
  ff:	0f b6 00             	movzbl (%eax),%eax
 102:	0f b6 c0             	movzbl %al,%eax
 105:	29 c2                	sub    %eax,%edx
 107:	89 d0                	mov    %edx,%eax
}
 109:	5d                   	pop    %ebp
 10a:	c3                   	ret    

0000010b <strlen>:

uint
strlen(char *s)
{
 10b:	55                   	push   %ebp
 10c:	89 e5                	mov    %esp,%ebp
 10e:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 111:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 118:	eb 04                	jmp    11e <strlen+0x13>
 11a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 11e:	8b 55 fc             	mov    -0x4(%ebp),%edx
 121:	8b 45 08             	mov    0x8(%ebp),%eax
 124:	01 d0                	add    %edx,%eax
 126:	0f b6 00             	movzbl (%eax),%eax
 129:	84 c0                	test   %al,%al
 12b:	75 ed                	jne    11a <strlen+0xf>
    ;
  return n;
 12d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 130:	c9                   	leave  
 131:	c3                   	ret    

00000132 <memset>:

void*
memset(void *dst, int c, uint n)
{
 132:	55                   	push   %ebp
 133:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 135:	8b 45 10             	mov    0x10(%ebp),%eax
 138:	50                   	push   %eax
 139:	ff 75 0c             	pushl  0xc(%ebp)
 13c:	ff 75 08             	pushl  0x8(%ebp)
 13f:	e8 32 ff ff ff       	call   76 <stosb>
 144:	83 c4 0c             	add    $0xc,%esp
  return dst;
 147:	8b 45 08             	mov    0x8(%ebp),%eax
}
 14a:	c9                   	leave  
 14b:	c3                   	ret    

0000014c <strchr>:

char*
strchr(const char *s, char c)
{
 14c:	55                   	push   %ebp
 14d:	89 e5                	mov    %esp,%ebp
 14f:	83 ec 04             	sub    $0x4,%esp
 152:	8b 45 0c             	mov    0xc(%ebp),%eax
 155:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 158:	eb 14                	jmp    16e <strchr+0x22>
    if(*s == c)
 15a:	8b 45 08             	mov    0x8(%ebp),%eax
 15d:	0f b6 00             	movzbl (%eax),%eax
 160:	3a 45 fc             	cmp    -0x4(%ebp),%al
 163:	75 05                	jne    16a <strchr+0x1e>
      return (char*)s;
 165:	8b 45 08             	mov    0x8(%ebp),%eax
 168:	eb 13                	jmp    17d <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 16a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 16e:	8b 45 08             	mov    0x8(%ebp),%eax
 171:	0f b6 00             	movzbl (%eax),%eax
 174:	84 c0                	test   %al,%al
 176:	75 e2                	jne    15a <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 178:	b8 00 00 00 00       	mov    $0x0,%eax
}
 17d:	c9                   	leave  
 17e:	c3                   	ret    

0000017f <gets>:

char*
gets(char *buf, int max)
{
 17f:	55                   	push   %ebp
 180:	89 e5                	mov    %esp,%ebp
 182:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 185:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 18c:	eb 42                	jmp    1d0 <gets+0x51>
    cc = read(0, &c, 1);
 18e:	83 ec 04             	sub    $0x4,%esp
 191:	6a 01                	push   $0x1
 193:	8d 45 ef             	lea    -0x11(%ebp),%eax
 196:	50                   	push   %eax
 197:	6a 00                	push   $0x0
 199:	e8 47 01 00 00       	call   2e5 <read>
 19e:	83 c4 10             	add    $0x10,%esp
 1a1:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1a4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1a8:	7e 33                	jle    1dd <gets+0x5e>
      break;
    buf[i++] = c;
 1aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1ad:	8d 50 01             	lea    0x1(%eax),%edx
 1b0:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1b3:	89 c2                	mov    %eax,%edx
 1b5:	8b 45 08             	mov    0x8(%ebp),%eax
 1b8:	01 c2                	add    %eax,%edx
 1ba:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1be:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1c0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1c4:	3c 0a                	cmp    $0xa,%al
 1c6:	74 16                	je     1de <gets+0x5f>
 1c8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1cc:	3c 0d                	cmp    $0xd,%al
 1ce:	74 0e                	je     1de <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1d3:	83 c0 01             	add    $0x1,%eax
 1d6:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1d9:	7c b3                	jl     18e <gets+0xf>
 1db:	eb 01                	jmp    1de <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 1dd:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1de:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1e1:	8b 45 08             	mov    0x8(%ebp),%eax
 1e4:	01 d0                	add    %edx,%eax
 1e6:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1e9:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1ec:	c9                   	leave  
 1ed:	c3                   	ret    

000001ee <stat>:

int
stat(char *n, struct stat *st)
{
 1ee:	55                   	push   %ebp
 1ef:	89 e5                	mov    %esp,%ebp
 1f1:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f4:	83 ec 08             	sub    $0x8,%esp
 1f7:	6a 00                	push   $0x0
 1f9:	ff 75 08             	pushl  0x8(%ebp)
 1fc:	e8 0c 01 00 00       	call   30d <open>
 201:	83 c4 10             	add    $0x10,%esp
 204:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 207:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 20b:	79 07                	jns    214 <stat+0x26>
    return -1;
 20d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 212:	eb 25                	jmp    239 <stat+0x4b>
  r = fstat(fd, st);
 214:	83 ec 08             	sub    $0x8,%esp
 217:	ff 75 0c             	pushl  0xc(%ebp)
 21a:	ff 75 f4             	pushl  -0xc(%ebp)
 21d:	e8 03 01 00 00       	call   325 <fstat>
 222:	83 c4 10             	add    $0x10,%esp
 225:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 228:	83 ec 0c             	sub    $0xc,%esp
 22b:	ff 75 f4             	pushl  -0xc(%ebp)
 22e:	e8 c2 00 00 00       	call   2f5 <close>
 233:	83 c4 10             	add    $0x10,%esp
  return r;
 236:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 239:	c9                   	leave  
 23a:	c3                   	ret    

0000023b <atoi>:

int
atoi(const char *s)
{
 23b:	55                   	push   %ebp
 23c:	89 e5                	mov    %esp,%ebp
 23e:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 241:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 248:	eb 25                	jmp    26f <atoi+0x34>
    n = n*10 + *s++ - '0';
 24a:	8b 55 fc             	mov    -0x4(%ebp),%edx
 24d:	89 d0                	mov    %edx,%eax
 24f:	c1 e0 02             	shl    $0x2,%eax
 252:	01 d0                	add    %edx,%eax
 254:	01 c0                	add    %eax,%eax
 256:	89 c1                	mov    %eax,%ecx
 258:	8b 45 08             	mov    0x8(%ebp),%eax
 25b:	8d 50 01             	lea    0x1(%eax),%edx
 25e:	89 55 08             	mov    %edx,0x8(%ebp)
 261:	0f b6 00             	movzbl (%eax),%eax
 264:	0f be c0             	movsbl %al,%eax
 267:	01 c8                	add    %ecx,%eax
 269:	83 e8 30             	sub    $0x30,%eax
 26c:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 26f:	8b 45 08             	mov    0x8(%ebp),%eax
 272:	0f b6 00             	movzbl (%eax),%eax
 275:	3c 2f                	cmp    $0x2f,%al
 277:	7e 0a                	jle    283 <atoi+0x48>
 279:	8b 45 08             	mov    0x8(%ebp),%eax
 27c:	0f b6 00             	movzbl (%eax),%eax
 27f:	3c 39                	cmp    $0x39,%al
 281:	7e c7                	jle    24a <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 283:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 286:	c9                   	leave  
 287:	c3                   	ret    

00000288 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 288:	55                   	push   %ebp
 289:	89 e5                	mov    %esp,%ebp
 28b:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 28e:	8b 45 08             	mov    0x8(%ebp),%eax
 291:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 294:	8b 45 0c             	mov    0xc(%ebp),%eax
 297:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 29a:	eb 17                	jmp    2b3 <memmove+0x2b>
    *dst++ = *src++;
 29c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 29f:	8d 50 01             	lea    0x1(%eax),%edx
 2a2:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2a5:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2a8:	8d 4a 01             	lea    0x1(%edx),%ecx
 2ab:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2ae:	0f b6 12             	movzbl (%edx),%edx
 2b1:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2b3:	8b 45 10             	mov    0x10(%ebp),%eax
 2b6:	8d 50 ff             	lea    -0x1(%eax),%edx
 2b9:	89 55 10             	mov    %edx,0x10(%ebp)
 2bc:	85 c0                	test   %eax,%eax
 2be:	7f dc                	jg     29c <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 2c0:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2c3:	c9                   	leave  
 2c4:	c3                   	ret    

000002c5 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2c5:	b8 01 00 00 00       	mov    $0x1,%eax
 2ca:	cd 40                	int    $0x40
 2cc:	c3                   	ret    

000002cd <exit>:
SYSCALL(exit)
 2cd:	b8 02 00 00 00       	mov    $0x2,%eax
 2d2:	cd 40                	int    $0x40
 2d4:	c3                   	ret    

000002d5 <wait>:
SYSCALL(wait)
 2d5:	b8 03 00 00 00       	mov    $0x3,%eax
 2da:	cd 40                	int    $0x40
 2dc:	c3                   	ret    

000002dd <pipe>:
SYSCALL(pipe)
 2dd:	b8 04 00 00 00       	mov    $0x4,%eax
 2e2:	cd 40                	int    $0x40
 2e4:	c3                   	ret    

000002e5 <read>:
SYSCALL(read)
 2e5:	b8 05 00 00 00       	mov    $0x5,%eax
 2ea:	cd 40                	int    $0x40
 2ec:	c3                   	ret    

000002ed <write>:
SYSCALL(write)
 2ed:	b8 10 00 00 00       	mov    $0x10,%eax
 2f2:	cd 40                	int    $0x40
 2f4:	c3                   	ret    

000002f5 <close>:
SYSCALL(close)
 2f5:	b8 15 00 00 00       	mov    $0x15,%eax
 2fa:	cd 40                	int    $0x40
 2fc:	c3                   	ret    

000002fd <kill>:
SYSCALL(kill)
 2fd:	b8 06 00 00 00       	mov    $0x6,%eax
 302:	cd 40                	int    $0x40
 304:	c3                   	ret    

00000305 <exec>:
SYSCALL(exec)
 305:	b8 07 00 00 00       	mov    $0x7,%eax
 30a:	cd 40                	int    $0x40
 30c:	c3                   	ret    

0000030d <open>:
SYSCALL(open)
 30d:	b8 0f 00 00 00       	mov    $0xf,%eax
 312:	cd 40                	int    $0x40
 314:	c3                   	ret    

00000315 <mknod>:
SYSCALL(mknod)
 315:	b8 11 00 00 00       	mov    $0x11,%eax
 31a:	cd 40                	int    $0x40
 31c:	c3                   	ret    

0000031d <unlink>:
SYSCALL(unlink)
 31d:	b8 12 00 00 00       	mov    $0x12,%eax
 322:	cd 40                	int    $0x40
 324:	c3                   	ret    

00000325 <fstat>:
SYSCALL(fstat)
 325:	b8 08 00 00 00       	mov    $0x8,%eax
 32a:	cd 40                	int    $0x40
 32c:	c3                   	ret    

0000032d <link>:
SYSCALL(link)
 32d:	b8 13 00 00 00       	mov    $0x13,%eax
 332:	cd 40                	int    $0x40
 334:	c3                   	ret    

00000335 <mkdir>:
SYSCALL(mkdir)
 335:	b8 14 00 00 00       	mov    $0x14,%eax
 33a:	cd 40                	int    $0x40
 33c:	c3                   	ret    

0000033d <chdir>:
SYSCALL(chdir)
 33d:	b8 09 00 00 00       	mov    $0x9,%eax
 342:	cd 40                	int    $0x40
 344:	c3                   	ret    

00000345 <dup>:
SYSCALL(dup)
 345:	b8 0a 00 00 00       	mov    $0xa,%eax
 34a:	cd 40                	int    $0x40
 34c:	c3                   	ret    

0000034d <getpid>:
SYSCALL(getpid)
 34d:	b8 0b 00 00 00       	mov    $0xb,%eax
 352:	cd 40                	int    $0x40
 354:	c3                   	ret    

00000355 <sbrk>:
SYSCALL(sbrk)
 355:	b8 0c 00 00 00       	mov    $0xc,%eax
 35a:	cd 40                	int    $0x40
 35c:	c3                   	ret    

0000035d <sleep>:
SYSCALL(sleep)
 35d:	b8 0d 00 00 00       	mov    $0xd,%eax
 362:	cd 40                	int    $0x40
 364:	c3                   	ret    

00000365 <uptime>:
SYSCALL(uptime)
 365:	b8 0e 00 00 00       	mov    $0xe,%eax
 36a:	cd 40                	int    $0x40
 36c:	c3                   	ret    

0000036d <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 36d:	55                   	push   %ebp
 36e:	89 e5                	mov    %esp,%ebp
 370:	83 ec 18             	sub    $0x18,%esp
 373:	8b 45 0c             	mov    0xc(%ebp),%eax
 376:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 379:	83 ec 04             	sub    $0x4,%esp
 37c:	6a 01                	push   $0x1
 37e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 381:	50                   	push   %eax
 382:	ff 75 08             	pushl  0x8(%ebp)
 385:	e8 63 ff ff ff       	call   2ed <write>
 38a:	83 c4 10             	add    $0x10,%esp
}
 38d:	90                   	nop
 38e:	c9                   	leave  
 38f:	c3                   	ret    

00000390 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	53                   	push   %ebx
 394:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 397:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 39e:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3a2:	74 17                	je     3bb <printint+0x2b>
 3a4:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3a8:	79 11                	jns    3bb <printint+0x2b>
    neg = 1;
 3aa:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 3b1:	8b 45 0c             	mov    0xc(%ebp),%eax
 3b4:	f7 d8                	neg    %eax
 3b6:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3b9:	eb 06                	jmp    3c1 <printint+0x31>
  } else {
    x = xx;
 3bb:	8b 45 0c             	mov    0xc(%ebp),%eax
 3be:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 3c1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 3c8:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 3cb:	8d 41 01             	lea    0x1(%ecx),%eax
 3ce:	89 45 f4             	mov    %eax,-0xc(%ebp)
 3d1:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3d4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3d7:	ba 00 00 00 00       	mov    $0x0,%edx
 3dc:	f7 f3                	div    %ebx
 3de:	89 d0                	mov    %edx,%eax
 3e0:	0f b6 80 6c 0a 00 00 	movzbl 0xa6c(%eax),%eax
 3e7:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 3eb:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3ee:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3f1:	ba 00 00 00 00       	mov    $0x0,%edx
 3f6:	f7 f3                	div    %ebx
 3f8:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3fb:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 3ff:	75 c7                	jne    3c8 <printint+0x38>
  if(neg)
 401:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 405:	74 2d                	je     434 <printint+0xa4>
    buf[i++] = '-';
 407:	8b 45 f4             	mov    -0xc(%ebp),%eax
 40a:	8d 50 01             	lea    0x1(%eax),%edx
 40d:	89 55 f4             	mov    %edx,-0xc(%ebp)
 410:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 415:	eb 1d                	jmp    434 <printint+0xa4>
    putc(fd, buf[i]);
 417:	8d 55 dc             	lea    -0x24(%ebp),%edx
 41a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 41d:	01 d0                	add    %edx,%eax
 41f:	0f b6 00             	movzbl (%eax),%eax
 422:	0f be c0             	movsbl %al,%eax
 425:	83 ec 08             	sub    $0x8,%esp
 428:	50                   	push   %eax
 429:	ff 75 08             	pushl  0x8(%ebp)
 42c:	e8 3c ff ff ff       	call   36d <putc>
 431:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 434:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 438:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 43c:	79 d9                	jns    417 <printint+0x87>
    putc(fd, buf[i]);
}
 43e:	90                   	nop
 43f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 442:	c9                   	leave  
 443:	c3                   	ret    

00000444 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 444:	55                   	push   %ebp
 445:	89 e5                	mov    %esp,%ebp
 447:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 44a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 451:	8d 45 0c             	lea    0xc(%ebp),%eax
 454:	83 c0 04             	add    $0x4,%eax
 457:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 45a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 461:	e9 59 01 00 00       	jmp    5bf <printf+0x17b>
    c = fmt[i] & 0xff;
 466:	8b 55 0c             	mov    0xc(%ebp),%edx
 469:	8b 45 f0             	mov    -0x10(%ebp),%eax
 46c:	01 d0                	add    %edx,%eax
 46e:	0f b6 00             	movzbl (%eax),%eax
 471:	0f be c0             	movsbl %al,%eax
 474:	25 ff 00 00 00       	and    $0xff,%eax
 479:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 47c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 480:	75 2c                	jne    4ae <printf+0x6a>
      if(c == '%'){
 482:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 486:	75 0c                	jne    494 <printf+0x50>
        state = '%';
 488:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 48f:	e9 27 01 00 00       	jmp    5bb <printf+0x177>
      } else {
        putc(fd, c);
 494:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 497:	0f be c0             	movsbl %al,%eax
 49a:	83 ec 08             	sub    $0x8,%esp
 49d:	50                   	push   %eax
 49e:	ff 75 08             	pushl  0x8(%ebp)
 4a1:	e8 c7 fe ff ff       	call   36d <putc>
 4a6:	83 c4 10             	add    $0x10,%esp
 4a9:	e9 0d 01 00 00       	jmp    5bb <printf+0x177>
      }
    } else if(state == '%'){
 4ae:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 4b2:	0f 85 03 01 00 00    	jne    5bb <printf+0x177>
      if(c == 'd'){
 4b8:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 4bc:	75 1e                	jne    4dc <printf+0x98>
        printint(fd, *ap, 10, 1);
 4be:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4c1:	8b 00                	mov    (%eax),%eax
 4c3:	6a 01                	push   $0x1
 4c5:	6a 0a                	push   $0xa
 4c7:	50                   	push   %eax
 4c8:	ff 75 08             	pushl  0x8(%ebp)
 4cb:	e8 c0 fe ff ff       	call   390 <printint>
 4d0:	83 c4 10             	add    $0x10,%esp
        ap++;
 4d3:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4d7:	e9 d8 00 00 00       	jmp    5b4 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 4dc:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 4e0:	74 06                	je     4e8 <printf+0xa4>
 4e2:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 4e6:	75 1e                	jne    506 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 4e8:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4eb:	8b 00                	mov    (%eax),%eax
 4ed:	6a 00                	push   $0x0
 4ef:	6a 10                	push   $0x10
 4f1:	50                   	push   %eax
 4f2:	ff 75 08             	pushl  0x8(%ebp)
 4f5:	e8 96 fe ff ff       	call   390 <printint>
 4fa:	83 c4 10             	add    $0x10,%esp
        ap++;
 4fd:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 501:	e9 ae 00 00 00       	jmp    5b4 <printf+0x170>
      } else if(c == 's'){
 506:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 50a:	75 43                	jne    54f <printf+0x10b>
        s = (char*)*ap;
 50c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 50f:	8b 00                	mov    (%eax),%eax
 511:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 514:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 518:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 51c:	75 25                	jne    543 <printf+0xff>
          s = "(null)";
 51e:	c7 45 f4 0b 08 00 00 	movl   $0x80b,-0xc(%ebp)
        while(*s != 0){
 525:	eb 1c                	jmp    543 <printf+0xff>
          putc(fd, *s);
 527:	8b 45 f4             	mov    -0xc(%ebp),%eax
 52a:	0f b6 00             	movzbl (%eax),%eax
 52d:	0f be c0             	movsbl %al,%eax
 530:	83 ec 08             	sub    $0x8,%esp
 533:	50                   	push   %eax
 534:	ff 75 08             	pushl  0x8(%ebp)
 537:	e8 31 fe ff ff       	call   36d <putc>
 53c:	83 c4 10             	add    $0x10,%esp
          s++;
 53f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 543:	8b 45 f4             	mov    -0xc(%ebp),%eax
 546:	0f b6 00             	movzbl (%eax),%eax
 549:	84 c0                	test   %al,%al
 54b:	75 da                	jne    527 <printf+0xe3>
 54d:	eb 65                	jmp    5b4 <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 54f:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 553:	75 1d                	jne    572 <printf+0x12e>
        putc(fd, *ap);
 555:	8b 45 e8             	mov    -0x18(%ebp),%eax
 558:	8b 00                	mov    (%eax),%eax
 55a:	0f be c0             	movsbl %al,%eax
 55d:	83 ec 08             	sub    $0x8,%esp
 560:	50                   	push   %eax
 561:	ff 75 08             	pushl  0x8(%ebp)
 564:	e8 04 fe ff ff       	call   36d <putc>
 569:	83 c4 10             	add    $0x10,%esp
        ap++;
 56c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 570:	eb 42                	jmp    5b4 <printf+0x170>
      } else if(c == '%'){
 572:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 576:	75 17                	jne    58f <printf+0x14b>
        putc(fd, c);
 578:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 57b:	0f be c0             	movsbl %al,%eax
 57e:	83 ec 08             	sub    $0x8,%esp
 581:	50                   	push   %eax
 582:	ff 75 08             	pushl  0x8(%ebp)
 585:	e8 e3 fd ff ff       	call   36d <putc>
 58a:	83 c4 10             	add    $0x10,%esp
 58d:	eb 25                	jmp    5b4 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 58f:	83 ec 08             	sub    $0x8,%esp
 592:	6a 25                	push   $0x25
 594:	ff 75 08             	pushl  0x8(%ebp)
 597:	e8 d1 fd ff ff       	call   36d <putc>
 59c:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 59f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5a2:	0f be c0             	movsbl %al,%eax
 5a5:	83 ec 08             	sub    $0x8,%esp
 5a8:	50                   	push   %eax
 5a9:	ff 75 08             	pushl  0x8(%ebp)
 5ac:	e8 bc fd ff ff       	call   36d <putc>
 5b1:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 5b4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5bb:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 5bf:	8b 55 0c             	mov    0xc(%ebp),%edx
 5c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5c5:	01 d0                	add    %edx,%eax
 5c7:	0f b6 00             	movzbl (%eax),%eax
 5ca:	84 c0                	test   %al,%al
 5cc:	0f 85 94 fe ff ff    	jne    466 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5d2:	90                   	nop
 5d3:	c9                   	leave  
 5d4:	c3                   	ret    

000005d5 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5d5:	55                   	push   %ebp
 5d6:	89 e5                	mov    %esp,%ebp
 5d8:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5db:	8b 45 08             	mov    0x8(%ebp),%eax
 5de:	83 e8 08             	sub    $0x8,%eax
 5e1:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5e4:	a1 88 0a 00 00       	mov    0xa88,%eax
 5e9:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5ec:	eb 24                	jmp    612 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5ee:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5f1:	8b 00                	mov    (%eax),%eax
 5f3:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5f6:	77 12                	ja     60a <free+0x35>
 5f8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5fb:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5fe:	77 24                	ja     624 <free+0x4f>
 600:	8b 45 fc             	mov    -0x4(%ebp),%eax
 603:	8b 00                	mov    (%eax),%eax
 605:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 608:	77 1a                	ja     624 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 60a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 60d:	8b 00                	mov    (%eax),%eax
 60f:	89 45 fc             	mov    %eax,-0x4(%ebp)
 612:	8b 45 f8             	mov    -0x8(%ebp),%eax
 615:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 618:	76 d4                	jbe    5ee <free+0x19>
 61a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 61d:	8b 00                	mov    (%eax),%eax
 61f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 622:	76 ca                	jbe    5ee <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 624:	8b 45 f8             	mov    -0x8(%ebp),%eax
 627:	8b 40 04             	mov    0x4(%eax),%eax
 62a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 631:	8b 45 f8             	mov    -0x8(%ebp),%eax
 634:	01 c2                	add    %eax,%edx
 636:	8b 45 fc             	mov    -0x4(%ebp),%eax
 639:	8b 00                	mov    (%eax),%eax
 63b:	39 c2                	cmp    %eax,%edx
 63d:	75 24                	jne    663 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 63f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 642:	8b 50 04             	mov    0x4(%eax),%edx
 645:	8b 45 fc             	mov    -0x4(%ebp),%eax
 648:	8b 00                	mov    (%eax),%eax
 64a:	8b 40 04             	mov    0x4(%eax),%eax
 64d:	01 c2                	add    %eax,%edx
 64f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 652:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 655:	8b 45 fc             	mov    -0x4(%ebp),%eax
 658:	8b 00                	mov    (%eax),%eax
 65a:	8b 10                	mov    (%eax),%edx
 65c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 65f:	89 10                	mov    %edx,(%eax)
 661:	eb 0a                	jmp    66d <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 663:	8b 45 fc             	mov    -0x4(%ebp),%eax
 666:	8b 10                	mov    (%eax),%edx
 668:	8b 45 f8             	mov    -0x8(%ebp),%eax
 66b:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 66d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 670:	8b 40 04             	mov    0x4(%eax),%eax
 673:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 67a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 67d:	01 d0                	add    %edx,%eax
 67f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 682:	75 20                	jne    6a4 <free+0xcf>
    p->s.size += bp->s.size;
 684:	8b 45 fc             	mov    -0x4(%ebp),%eax
 687:	8b 50 04             	mov    0x4(%eax),%edx
 68a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 68d:	8b 40 04             	mov    0x4(%eax),%eax
 690:	01 c2                	add    %eax,%edx
 692:	8b 45 fc             	mov    -0x4(%ebp),%eax
 695:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 698:	8b 45 f8             	mov    -0x8(%ebp),%eax
 69b:	8b 10                	mov    (%eax),%edx
 69d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a0:	89 10                	mov    %edx,(%eax)
 6a2:	eb 08                	jmp    6ac <free+0xd7>
  } else
    p->s.ptr = bp;
 6a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a7:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6aa:	89 10                	mov    %edx,(%eax)
  freep = p;
 6ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6af:	a3 88 0a 00 00       	mov    %eax,0xa88
}
 6b4:	90                   	nop
 6b5:	c9                   	leave  
 6b6:	c3                   	ret    

000006b7 <morecore>:

static Header*
morecore(uint nu)
{
 6b7:	55                   	push   %ebp
 6b8:	89 e5                	mov    %esp,%ebp
 6ba:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6bd:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6c4:	77 07                	ja     6cd <morecore+0x16>
    nu = 4096;
 6c6:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 6cd:	8b 45 08             	mov    0x8(%ebp),%eax
 6d0:	c1 e0 03             	shl    $0x3,%eax
 6d3:	83 ec 0c             	sub    $0xc,%esp
 6d6:	50                   	push   %eax
 6d7:	e8 79 fc ff ff       	call   355 <sbrk>
 6dc:	83 c4 10             	add    $0x10,%esp
 6df:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 6e2:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 6e6:	75 07                	jne    6ef <morecore+0x38>
    return 0;
 6e8:	b8 00 00 00 00       	mov    $0x0,%eax
 6ed:	eb 26                	jmp    715 <morecore+0x5e>
  hp = (Header*)p;
 6ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6f2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 6f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6f8:	8b 55 08             	mov    0x8(%ebp),%edx
 6fb:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 6fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
 701:	83 c0 08             	add    $0x8,%eax
 704:	83 ec 0c             	sub    $0xc,%esp
 707:	50                   	push   %eax
 708:	e8 c8 fe ff ff       	call   5d5 <free>
 70d:	83 c4 10             	add    $0x10,%esp
  return freep;
 710:	a1 88 0a 00 00       	mov    0xa88,%eax
}
 715:	c9                   	leave  
 716:	c3                   	ret    

00000717 <malloc>:

void*
malloc(uint nbytes)
{
 717:	55                   	push   %ebp
 718:	89 e5                	mov    %esp,%ebp
 71a:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 71d:	8b 45 08             	mov    0x8(%ebp),%eax
 720:	83 c0 07             	add    $0x7,%eax
 723:	c1 e8 03             	shr    $0x3,%eax
 726:	83 c0 01             	add    $0x1,%eax
 729:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 72c:	a1 88 0a 00 00       	mov    0xa88,%eax
 731:	89 45 f0             	mov    %eax,-0x10(%ebp)
 734:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 738:	75 23                	jne    75d <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 73a:	c7 45 f0 80 0a 00 00 	movl   $0xa80,-0x10(%ebp)
 741:	8b 45 f0             	mov    -0x10(%ebp),%eax
 744:	a3 88 0a 00 00       	mov    %eax,0xa88
 749:	a1 88 0a 00 00       	mov    0xa88,%eax
 74e:	a3 80 0a 00 00       	mov    %eax,0xa80
    base.s.size = 0;
 753:	c7 05 84 0a 00 00 00 	movl   $0x0,0xa84
 75a:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 75d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 760:	8b 00                	mov    (%eax),%eax
 762:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 765:	8b 45 f4             	mov    -0xc(%ebp),%eax
 768:	8b 40 04             	mov    0x4(%eax),%eax
 76b:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 76e:	72 4d                	jb     7bd <malloc+0xa6>
      if(p->s.size == nunits)
 770:	8b 45 f4             	mov    -0xc(%ebp),%eax
 773:	8b 40 04             	mov    0x4(%eax),%eax
 776:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 779:	75 0c                	jne    787 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 77b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 77e:	8b 10                	mov    (%eax),%edx
 780:	8b 45 f0             	mov    -0x10(%ebp),%eax
 783:	89 10                	mov    %edx,(%eax)
 785:	eb 26                	jmp    7ad <malloc+0x96>
      else {
        p->s.size -= nunits;
 787:	8b 45 f4             	mov    -0xc(%ebp),%eax
 78a:	8b 40 04             	mov    0x4(%eax),%eax
 78d:	2b 45 ec             	sub    -0x14(%ebp),%eax
 790:	89 c2                	mov    %eax,%edx
 792:	8b 45 f4             	mov    -0xc(%ebp),%eax
 795:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 798:	8b 45 f4             	mov    -0xc(%ebp),%eax
 79b:	8b 40 04             	mov    0x4(%eax),%eax
 79e:	c1 e0 03             	shl    $0x3,%eax
 7a1:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 7a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a7:	8b 55 ec             	mov    -0x14(%ebp),%edx
 7aa:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7b0:	a3 88 0a 00 00       	mov    %eax,0xa88
      return (void*)(p + 1);
 7b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7b8:	83 c0 08             	add    $0x8,%eax
 7bb:	eb 3b                	jmp    7f8 <malloc+0xe1>
    }
    if(p == freep)
 7bd:	a1 88 0a 00 00       	mov    0xa88,%eax
 7c2:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 7c5:	75 1e                	jne    7e5 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 7c7:	83 ec 0c             	sub    $0xc,%esp
 7ca:	ff 75 ec             	pushl  -0x14(%ebp)
 7cd:	e8 e5 fe ff ff       	call   6b7 <morecore>
 7d2:	83 c4 10             	add    $0x10,%esp
 7d5:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7d8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7dc:	75 07                	jne    7e5 <malloc+0xce>
        return 0;
 7de:	b8 00 00 00 00       	mov    $0x0,%eax
 7e3:	eb 13                	jmp    7f8 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e8:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ee:	8b 00                	mov    (%eax),%eax
 7f0:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 7f3:	e9 6d ff ff ff       	jmp    765 <malloc+0x4e>
}
 7f8:	c9                   	leave  
 7f9:	c3                   	ret    

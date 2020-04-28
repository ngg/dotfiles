#define _GNU_SOURCE
#include <alsa/asoundlib.h>
#include <dlfcn.h>
static void *(*real_dlsym)(void *, const char *) = NULL;
void *alsa_handle;

typedef int (*fun)(snd_pcm_t **pcmp, const char *name, snd_pcm_stream_t stream,
                   int mode);

int snd_pcm_open(snd_pcm_t **pcmp, const char *name, snd_pcm_stream_t stream,
                 int mode) {
  printf("OPEN: %s\n", name);
  if (strcmp(name, "sysdefault:CARD=PCH") == 0)
    name = "default";
  fun f = (fun)real_dlsym(alsa_handle, "snd_pcm_open");
  return f(pcmp, name, stream, mode);
}

extern void *_dl_sym(void *, const char *, void *);

extern void *dlsym(void *handle, const char *name) {
  if (real_dlsym == NULL)
    real_dlsym = _dl_sym(RTLD_NEXT, "dlsym", dlsym);
  /* my target binary is even asking for dlsym() via dlsym()... */
  if (!strcmp(name, "dlsym"))
    return (void *)dlsym;
  if (handle != RTLD_NEXT && strcmp(name, "snd_pcm_open") == 0) {
    alsa_handle = handle;
    return (void *)snd_pcm_open;
  }
  return real_dlsym(handle, name);
}

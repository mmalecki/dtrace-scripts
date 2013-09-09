#!/usr/sbin/dtrace -s

pid$target::malloc:entry
{
    self->bytes = arg0;
}

pid$target::malloc:return
/self->bytes/
{
    printf("malloc: %d bytes at %lx\n", self->bytes, arg1);
    self->bytes = 0;
}

pid$target::free:entry
{
    printf("free: at %lx\n", arg0);
}

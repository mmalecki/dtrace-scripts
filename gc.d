node*:::gc-start
{
    self->ts = timestamp;
}

node*:::gc-done
/self->ts/
{
    printf("gc: %d ns\n", timestamp - self->ts);
    self->ts = 0;
}

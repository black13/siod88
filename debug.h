#ifdef _DEBUG
#define call() TRACE("%s:(%d) %s\n",__FILE__,__NUMBER__,__FUNCTION__)
#else
#define call() (void)0
#endif

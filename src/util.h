#include <stdexcept>
#include <cstdio>

#define CAT_(t1, t2) t1 ## t2
#define CAT(t1, t2) CAT_(t1, t2)
#define GENSYM(pre) CAT(pre, __COUNTER__)

#define MAIN_(gRet, gStr, gErr, gSubmain, argc, argv) \
    int gSubmain(int argc, char** argv); \
    int main(int argc, char** argv) \
    { \
        int gRet = -1; \
        try { \
            gRet = gSubmain(argc, argv); \
        } \
        catch(char* gStr) { \
            printf("uncaught message: %s\n", gStr); \
        } \
        catch(std::exception const& gErr) { \
            printf("uncaught exception: %s\n", gErr.what()); \
        } \
        catch(...) { \
            printf("something was thrown which couldn't be caught here...\n"); \
        } \
        return gRet; \
    } \
    int gSubmain(int argc, char** argv)

#define MAIN(argc, argv) MAIN_(GENSYM(ret_), GENSYM(str_), GENSYM(err_), GENSYM(submain_), argc, argv)

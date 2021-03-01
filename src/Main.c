#include "Main.h"
#define PY_SSIZE_T_CLEAN
#include <Python.h>
PURS_FFI_FUNC_1(Main_doSomePython, _)
{
  wchar_t *program = Py_DecodeLocale("myprog", NULL);
  if (program == NULL)
  {
    fprintf(stderr, "Fatal error: cannot decode argv[0]\n");
    exit(1);
  }
  Py_SetProgramName(program); /* optional but recommended */
  Py_Initialize();
  PyRun_SimpleString("from time import time,ctime\n"
                     "print('Today is', ctime(time()))\n");
  if (Py_FinalizeEx() < 0)
  {
    exit(120);
  }
  PyMem_RawFree(program);
  return purs_any_null;
}

PURS_FFI_FUNC_2(Main_putStrLn, s_, _)
{
  const purs_str_t *s = purs_any_force_string(s_);
  printf("%s\n", s->data);
  PURS_RC_RELEASE(s);
  return purs_any_int_zero;
}
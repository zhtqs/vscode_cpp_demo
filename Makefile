CFLAGS=
CPPFLAGS=/D "_WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_CRT_SECURE_NO_WARNINGS" /D "_UNICODE" /D "UNICODE" 
LDFLAGS=/LIBPATH:debug/
LIBS=user32.lib kernel32.lib comctl32.lib 

OBJS=main.obj

default: TEST_EXE TEST_DLL

TEST_EXE: $(OBJS)
    @if not exist debug ( mkdir debug )
    @link /nologo /DEBUG /MACHINE:X64 /MANIFEST:NO /OUT:debug\test.exe /PDB:debug\test.pdb /SUBSYSTEM:CONSOLE $(LDFLAGS) $(OBJS) $(LIBS)
	@echo generate executable files finished.

TEST_DLL: $(OBJS)
    @if not exist debug ( mkdir debug )
    @link /nologo /DEBUG /DLL /MACHINE:X64 /MANIFEST:NO /OUT:debug\libtest.dll /IMPLIB:debug\libtest.lib /PDB:debug\libtest.pdb /SUBSYSTEM:WINDOWS $(LDFLAGS) $(OBJS) $(LIBS)
	@echo generate dynamic library finished.

.cpp.obj:
    @if not exist debug ( mkdir debug )
    @cl /nologo /ZI /EHsc /W3 /MDd /W3 /c $(CPPFLAGS) /Fd:debug\ /Fo:debug\ $*.cpp
	@echo compile $@ finished.

clean:
    @del /f /s /q *.obj
	@del /f /s /q *.res
	@del /f /s /q *.ilk
	@del /f /s /q *.idb
	@del /f /s /q *.dll
	@del /f /s /q *.exe
	@del /f /s /q *.pdb
	@del /f /s /q *.exp
	@del /f /s /q *.lib
	@if exist debug ( rd /s /q debug )
select * from emp
connect by empno = prior mgr;

select * from emp
start with empno = 7566
connect by empno = prior mgr;

select * from emp
start with mgr is null
connect by empno = prior mgr;

select emp.*, level from emp
start with mgr is null
connect by prior empno = mgr;

select emp.*, level from emp
start with empno = 7698
connect by prior empno = mgr;

select emp.*, level from emp
start with empno = 7566
connect by prior empno = mgr;

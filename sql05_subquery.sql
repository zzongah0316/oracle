-- Sub Query: 쿼리의 일부로 다른 쿼리 문이 사용되는 것.

-- (1) 전체 직원의 급여 평균:
select avg(sal) from emp;

-- (2) 전체 직원의 급여 평균보다 더 많은 급여를 받는 직원의 레코드:
select *
from emp
where sal > 2073.21;

select *
from emp
where sal > (
    select avg(sal) from emp
);    

-- ALLEN보다 적은 급여를 받는 직원들의 사번, 이름, 급여를 검색
select empno, ename, sal
from emp 
where sal < (
    select sal from emp where ename='ALLEN'
); 

-- ALLEN과 같은 직무의 직원들의 사번, 이름, 부서번호, 직무, 급여를 검색
select empno, ename, deptno, job, sal
from emp
where job = (
    select job from emp where ename='ALLEN'
); 

-- SALESMAN의 급여 최댓값보다 더 많은 급여를 받는 직원들의 이름, 급여, 직무를 검색
select ename, sal, job
from emp
where sal>(
    select max(sal) from emp where job='SALESMAN'
);

-- WARD의 연봉보다 더 많은 연봉을 받는 직원들의 이름, 급여, 수당, 연봉을 검색.
-- 연봉 = sal * 12 + comm, comm이 null인 경우는 0으로 계산.
-- 연봉 내림차순으로 정렬
select ename, sal, comm, (sal*12+nvl(comm, 0)) as "ANNUAL_SAL" 
from emp
where sal*12+nvl(comm, 0)>(
    select (sal*12+nvl(comm, 0))   
    from emp 
    where ename='WARD'
)
order by ANNUAL_SAL desc;

-- SCOTT과 같은 급여를 받는 직원들의 이름과 급여를 검색.
select ename, sal
from emp
where sal=(
    select sal from emp where ename='SCOTT'
);

-- 위 결과에서  SCOTT은 제외하고 검색.
select ename, sal
from emp
where sal=( select sal from emp where ename='SCOTT') 
    and ename != 'SCOTT';

-- ALLEN보다 늦게 입사한 직원들의 이름, 입사날짜를 최근입사일부터 출력.
select ename, hiredate
from emp
where hiredate > (select hiredate from emp where ename='ALLEN')
order by hiredate desc;

-- 매니저가 KING인 직원들의 사번, 이름, 매니저 사번을 검색.
select empno, ename, mgr
from emp
where mgr=(select empno from emp where ename='KING');

-- ACCOUNTING 부서에 일하는 직원들의 이름, 급여, 부서번호를 검색.
select ename, sal, deptno
from emp
where deptno=(select deptno from dept where dname='ACCOUNTING');

-- CHICAGO에서 근무하는 직원들의 이름, 급여, 부서 번호를 검색.
select ename, sal, deptno
from emp
where deptno = (select deptno from dept where loc='CHICAGO');

-- 단일행 서브쿼리: 서브쿼리의 결과가 행이 1개 이하인 경우.
-- 다중행 서브쿼리: 서브쿼리의 결과가 2개 이상의 행인 경우.
-- 다중행 서브쿼리에서는 한 개의 값과 단순 비교(=, !=, >, <, ...)를 할 수 없음!
-- 다중행 서브쿼리에서는 in, any, all과 같은 키워드를 함께 사용해야 함!

-- 각 부서에서 급여를 가장 많이 받는 직원의 모든 정보(사번, 이름, 급여, ...)을 검색.
select *
from emp
where deptno=10 and sal=(select max(sal) from emp where deptno=10);

select deptno, max(sal)
from emp
group by deptno;

select *
from emp
where (deptno, sal) in ( -- 또는 이기 때문에 in 사용함.
    select deptno, max(sal)
    from emp 
    group by deptno
)
order by deptno;

-- 각 부서에서 급여가 가장 적은 직원들의 모든 정보 출력.
select *
from emp
where (deptno, sal) in (
    select deptno, min(sal)
    from emp
    group by deptno
)
order by deptno;

-- 다중행 서브쿼리에서 any와 all:
--  any: 여러개 중에서 적어도 하나.
--  all: 여러개 모두

select *
from emp
where sal < all ( -- all은 and와 같다고 생각하면 됨.
    select sal from emp where deptno=10
);
-- sal<2450 and sal<5000 and sal<1300

select *
from emp
where sal < any ( -- any는 아무거나 하나이므로 or과 같다고 생각하면 됨.
    select sal from emp where deptno=10
);
-- sal<2450 or sal<5000 or sal<1300
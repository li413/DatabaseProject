

create or replace trigger too_many_core_courses
    
    before insert
    on degree_course 
    for each row

declare
      num_core_courses natural;
     
begin

      select count(*) into num_core_courses 
      from degree_course
	    where Deg_code = :new.Deg_code and Type = 'Core';
   if num_core_courses >= 6 then
          raise_application_error(-20001, ('Course' || :new.Deg_code || 'cannot be inserted'));
   end if; 
end;

First trigger statement which can be inserted:

insert into degree_course
values('1','535', 'Core');

Cannot be inserted:

insert into degree_course
values('2','779', 'Core');



create or replace trigger no_prerequisite_course
    before insert
    on transcript
    for each row

declare
      num_pre_course natural;

begin
   
      select count(*) into num_pre_course
      from transcript, course, prerequisite
      where :new.Course_no = course.Course_no and :new.Course_no = prerequisite.Course and :new.Student_ID = transcript.Student_ID
      and transcript.Course_no = prerequisite.Prereq;
    if num_pre_course = 0 then
          raise_application_error(-20001, ('Student' || :new.Student_ID || 'cannot take class'|| :new.Course_no));

    end if;

end;

can be inserted:

insert into transcript
values('123456789','699','Spring','2015',NULL);

cannot be inserted:

insert into transcript
values('123456788','699','Spring','2015',NULL);




create or replace trigger too_many_concentrations
    
    before insert
    on student_concentration 
    for each row

declare
      num_concentrations natural;
     
begin

      select count(*) into num_concentrations
      from student_concentration, student, concentration
      where student.Student_ID = :new.Student_ID and concentration.Conc_code = :new.Conc_code;
   if num_concentrations >= 2 then
          raise_application_error(-20001, ('Student' || :new.Student_ID || 'cannot have more concentration'));
   end if; 
end;

can be inserted:

insert into student_concentration
values('123456789','1');

cannot be inserted:



create or replace function get_gpa(v_Student_ID in transcript.Student_ID%type) 

    return transcript.Grade%type as

    GPA FLOAT;
    check_grade FLOAT;
    num_courses natural; 
    sum_Grade FLOAT;
    i natural;
begin
    select count(*) into num_courses
    from transcript
    where Student_ID = v_Student_ID;
    i := 1;
    sum_Grade := 0.0;
    while (i <= num_courses) 
  LOOP
    select grade into check_grade from
      (select grade,Student_ID, 
        rownum as rn from transcript 
        where Student_ID=v_Student_ID) 
    where rn=i;


    sum_Grade := sum_Grade + check_grade;
    i := i + 1;
  END LOOP;
    GPA := sum_Grade/num_courses;
    return (GPA);
end;

begin
dbms_output.put_line(get_gpa(123456789));

end;




















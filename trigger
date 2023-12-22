-----------------
--------trigeger----


--وقت ما انفذ حاجه يعملي حاجه معاها

-------------
create trigger insOf on employee
instead of delete 
as 
select *from employee

deltee from employee
--وقت ما يمسح يعرض البيانات
--------------------

create trigger updateDateFor on project
for update
as 
print "Updating occure on project table"
update project set projectname ="AAA" where id =9
--وقت ما يعمل ابديت يطبع الجمله
--------------------------
-- after with logData

create table LogDAta(
    id int identity,
    tablenName varchar(50),
    acationType varchar(50),
    actionDateTime datetime,
    columnName varchar(50),
    oldVAlue varchar(50),
    newVAlue varchar(50),
    primary key(id)
)

create trigger logDataTable on porject 
after insert
as 
declare @pName varchar(50)=(select projectName from inserted)
declare @pLocation varchar(50)=(select projectLocation from inserted)
insert into logData(tableName,actionType,columnName,newValue)values
("project",'insert','projectName',@pName)
("prject",'insert','projectName',@pLocation)

insert into prject (projectName,projectLocation)values("name","location")
---------------------------------------------------------    -------------------- --------------
--after update

create trigger upLogDate on project
after update 
as
declare @oldpName varchar(50)=(select projectName from deleted)
declare @oldpLocation varchar(50)=(select projectLocation from deleted)
declare @newpName varchar(50)=(select projectName from inserted)
declare @newpLocation varchar(50)=(select projectLocation from inserted)

insert into logData(tableName,action,columnName,newValue,oldValue) values
("prject",'update','prjectName',@newpName,@oldpName)
("prject",'update','prjectLocation',@newpLocation,@oldpLocation)

update project
set prjectName="ML", prjectLocation="cairo"
where id =2


 program example
    character(len=25) :: string
    character(50)::add
    integer::a=20,b=10  
    type::person
        character(10)::name
        integer::age
    end type person
    type(person)::c,d

    c=person("peter",23)
    d%name="swa"
    string = "hello,fortran."
   add=string//"hello"


   write(*,*)string
   write(*,*)add
   write(*,*)len(string)
   write(*,*)len_trim(string)

   write(*,*)a,b
   write(*,100)a
   100 format(I4)
   write(*,'(I4)')a
   write(*,'(2I4)')a,b
   write(*,'(I4,A25)')a,string

   write(*,*)c
   write(*,*)d%name
    stop
end program example
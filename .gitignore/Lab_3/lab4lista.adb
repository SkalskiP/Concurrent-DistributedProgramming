with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Numerics.Discrete_Random;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Lab4Lista is

type Element is
  record
    Data : Integer := 0;
    Next : access Element := Null;
  end record;

type Elem_Ptr is access all Element;

 procedure Print(List : access Element) is
  L : access Element := List;
begin
  if List = Null then
    Put_Line("List EMPTY!");
  else
    Put_Line("List:");
  end if;
  while L /= Null loop
    Put(L.Data, 4); -- z pakietu Ada.Integer_Text_IO
    New_Line;
    L := L.Next;
  end loop;
end Print;

procedure Insert(List : in out Elem_Ptr; D : in Integer) is
  E : Elem_Ptr := new Element;
begin
  E.Data := D;
  E.Next := List;
  -- lub E.all := (D, List);
  List := E;
end Insert;

-- wstawianie jako funkcja - wersja krótka
function Insert(List : access Element; D : in Integer) return access Element is
  ( new Element'(D,List) );

-- procedura wstawiająca element zachowując posortowanie rosnące danych

procedure Insert_Sort(List: in out Elem_Ptr; D : in Integer) is
  L : access Element := List;
  New_Element : access Element;
begin
  L := List;
  if List = Null then
		L := new Element'(D, Null);
  elsif L.Data > D then
	  List := new Element'(D, L);
  else
	  while  L.Next /= Null and then L.Next.Data < D loop
		  L := L.Next;
	  end loop;
	  New_Element := new Element'(D,L.Next);
	  L.Next := New_Element;
  end if;
end Insert_Sort;

procedure Insert_Random(List: in out Elem_Ptr; N : in Integer; M : in Integer) is
  subtype Liczby is Integer range 0..M;
  package Los_Liczby is new Ada.Numerics.Discrete_Random(Liczby);
  use Los_Liczby;
  Gen: Generator;
	Number : Integer;
begin
 	Reset(Gen);
	for I in 1..N loop
		Number := Random(Gen);
		Insert_Sort(List, Number);
	end loop;
end Insert_Random;

Lista : Elem_Ptr := Null;

begin
  Print(Lista);
  Lista := Insert(Lista, 21);
  Print(Lista);
  Insert(Lista, 20);
  Print(Lista);
  for I in reverse 1..12 loop
  Insert(Lista, I);
  end loop;
  Print(Lista);
  Insert_Sort(Lista, 5);
  Insert_Sort(Lista, 17);
  Insert_Sort(Lista, 0);
  Insert_Sort(Lista, 30);
  Print(Lista);
  Insert_Random(Lista, 2, 11000);
  Print(Lista);
end Lab4Lista;

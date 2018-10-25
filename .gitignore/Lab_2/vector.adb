with Ada.Text_IO, Ada.Numerics.Float_Random;
use Ada.Text_IO, Ada.Numerics.Float_Random;

procedure Vector is

  type Vec is array(Integer range <>) of Float;
  V1 : Vec(1..10) := (others => 0.0);

  procedure fillVector(V1: in out Vec) is
    Gen: Generator;
  begin
    Reset(Gen);
    for El of V1 loop
      El := Random(Gen);
    end loop;
  end fillVector;

  procedure printVector(V1: in out Vec) is
  begin
    for I in V1'Range loop
      Put_Line("VECTOR(" & I'Img & ")=" & V1(I)'Img);
    end loop;
  end printVector;

  function isVectorSorted(V1 : Vec) return Boolean is
		(for all I in V1'First..(V1'Last-1) => V1(I)<=V1(I+1) );

  procedure sortVector(V1 : in out Vector) is
  minIndex : Integer;
  temp : Float;
  begin
  	for i in V1'First..V1'Last-1 loop
  		minIndex := i;

  		for j in i..V1'Last loop
  			if V1(j) < V1(minIndex) then
  				minIndex := j;
  			end if;
  		end loop;

  		temp := V1(minIndex);
  		V1(minIndex) := V1(i);
			V1(i) := temp;

  	end loop;
	end sortVector;

begin
  Put_Line("Initiation of a vector...");
  fillVector(V1);
  Put_Line("Printing vector...");
  printVector(V1);
end Vector;

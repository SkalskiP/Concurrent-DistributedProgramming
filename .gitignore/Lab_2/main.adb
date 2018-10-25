with Ada.Text_IO, Ada.Numerics.Float_Random;
use Ada.Text_IO;

procedure Main is

   type Vector is array (Integer range <>) of Float;
   w1: Vector(1..20) := (others => 1.2);


   Wart: Float;
   Gen: Generator;

   procedure PrintVector(w1: in Vector) is
   begin
      for el in w1'First..w1'Last loop
         Put_Line(w1(el)'Img);
      end loop;
   end PrintVector;

   procedure RandomVector(w: in out Vector) is
   begin
      Reset(Gen);
      for el in w'First..w'Last loop
         Wart := Random(Gen);
         w(el) := Wart;
      end loop;
   end RandomVector;
begin
  PrintWektor(w1);
end Main;

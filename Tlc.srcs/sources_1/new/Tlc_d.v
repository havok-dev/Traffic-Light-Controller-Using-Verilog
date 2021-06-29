`timescale 1ns / 1ps

module traffic_control(M1,M2,MT,S,state,clk,rst_a);

   output reg [2:0] M1,M2,MT,S; 
   input      clk;
   input      rst_a;
 
   output reg [2:0] state;
 
   parameter [2:0] S1=3'b001;
   parameter [2:0] S2=3'b010;
   parameter [2:0] S3=3'b011;
   parameter [2:0] S4=3'b100;
   parameter [2:0] S5=3'b101;
   parameter [2:0] S6=3'b110;
   reg [2:0] count;
 

   always @(posedge clk, posedge rst_a)
     begin
        if (rst_a)
            begin
                state=S1;
                count =3'b000;
            end
        else
            begin
                case (state)
                S1 :
                    begin
                        if (count==3'b111)
                            begin
                            count=3'b000;
                            state=S2;
                            end
                        else
                            begin
                            count=count+3'b001;
                            state=S1;
                            end
                    end

                S2 :
                    begin
                        if (count==3'b011)
                            begin
                            count=3'b000;
                            state=S3;
                            end
                        else
                            begin
                            count=count+3'b001;
                            state=S2;
                        end
                    end

               S3 :
                    begin
                        if (count==3'b111)
                            begin
                            count=3'b0;
                            state=S4;
                            end
                        else
                            begin
                            count=count+3'b001;
                            state=S3;
                        end
                    end

            S4 :
                begin
                    if (count==3'b011)
                        begin
                        count=3'b0;
                        state=S5;
                        end
                    else
                        begin
                        count=count+3'b001;
                        state=S4;
                        end
                    end

            S5 :
                begin
                    if (count==3'b111)
                        begin
                        count=3'b0;
                        state=S6;
                        end
                    else
                        begin
                        count=count+3'b001;
                        state=S5;
                        end
                    end

            S6 :
                begin
                    if (count==3'b011)
                        begin
                        count=3'b0;
                        state=S1;
                        end
                    else
                        begin
                        count=count+3'b001;
                        state=S6;
                        end
                    end
            endcase // case (state)
        end // always @ (state)
    end 


always @(state)
     begin
         case (state)
            S1 :
                begin
                    M1 = 3'b001;
                    M2 = 3'b001;
                    MT = 3'b100;
                    S = 3'b100;
                end

            S2 :
                begin
                    M1 = 3'b001;
                    M2 = 3'b010;
                    MT = 3'b100;
                    S = 3'b100;
                end 

            S3 :
                begin
                    M1 = 3'b001;
                    M2 = 3'b100;
                    MT = 3'b001;
                    S = 3'b100;
                end 

            S4 :
                begin
                    M1 = 3'b010;
                    M2 = 3'b100;
                    MT = 3'b010;
                    S = 3'b100;
                end 

            S5 :
                begin
                    M1 = 3'b100;
                    M2 = 3'b100;
                    MT = 3'b100;
                    S = 3'b001;
                end 

            S6 :
                begin
                    M1 = 3'b100;
                    M2 = 3'b100;
                    MT = 3'b10;
                    S = 3'b010;
                end 
            endcase // case (state)
     end // always @ (state)
endmodule

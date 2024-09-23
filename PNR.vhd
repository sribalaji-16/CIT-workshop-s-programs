library ieee;
    use ieee.std_logic_1164.all;
    entity pnr is
        port(clk,reset,load:in std_logic; 
            dout:out std_logic_vector(7 downto 0);
            din:in std_logic_vector(7 downto 0));
        end pnr;
        architecture behave of pnr is
            signal temp:std_logic_vector(7 downto 0); 
            signal x:std_logic;
            begin 
                shift_block:process(clk,reset,load)
                begin
                    if reset='1' then 
                        temp<="00000000";
                        elsif rising_edge(clk) then
                            if load='1' then
                                temp<=din;
                                else
                                temp(0)<=temp(1);
                                temp(1)<=temp(2);
                                temp(2)<=temp(3);
                                temp(3)<=temp(4);
                                temp(4)<=temp(5);
                                temp(5)<=temp(6);
                                temp(6)<=temp(7);
                                temp(7)<=x;
                            end if;
                            end if;
                        end process shift_block;
                        x<=((((temp(0)xor temp(2))xor temp(4))xor temp(6)));
    
                        dout<=temp;
                    end behave;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/03/2017 12:15:09 AM
-- Design Name: 
-- Module Name: lab5 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY VALID IS
 PORT(a: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
     
      v: OUT STD_LOGIC);
END ENTITY VALID;

ARCHITECTURE Behavioral OF VALID IS
BEGIN
 
        v <= (NOT a(3)) OR ((NOT a(2)) AND (NOT a(1)));
   
END Behavioral;

library ieee;
use IEEE.STD_LOGIC_1164.ALL;

entity selector is
    port(a,b,p,q:in std_logic_vector(7 downto 0);
        sel:in std_logic;
        push_i:in std_logic;
        en:in std_logic;
        c:out std_logic_vector(15 downto 0));
end entity selector;

architecture behavioral of selector is
begin 
    process(sel,en,a,b)
    begin
        if en='1' then
            if sel='0' then 
                c(15 downto 8)<=a;
                c(7 downto 0)<=b;
            else 
                c(15 downto 8)<=p;
                c(7 downto 0)<=q;
            end if;
        end if;
    end process;
end architecture;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity subtractor is
    port(a,b: in std_logic_vector(7 downto 0);
         s:in std_logic;
         ss: out std_logic;
        c,d:out std_logic_vector(7 downto 0));
end entity subtractor;

architecture behavioural of subtractor is
begin 
    process(a,b)
    begin
        if s='1' then
                if a=b then 
                    c<=a;
                    d<=b;
                
                elsif a(7 downto 4)>b(7 downto 4) or (a(7 downto 4)=b(7 downto 4) and a(3 downto 0)>b(3 downto 0)) then
                    d<=b;
                    if a(3 downto 0)>=b(3 downto 0) then
                       c(3 downto 0)<=a(3 downto 0)-b(3 downto 0);
                       c(7 downto 4)<=a(7 downto 4)-b(7 downto 4);
                    else
                       c(3 downto 0)<=a(3 downto 0)-b(3 downto 0)+10;
                       c(7 downto 4)<=a(7 downto 4)-b(7 downto 4)+1;
                    end if;
                else
                    c<=a;
                    if b(3 downto 0)>=a(3 downto 0) then
                       d(7 downto 4)<=b(7 downto 4)-a(7 downto 4);
                       d(3 downto 0)<=b(3 downto 0)-a(3 downto 0);
                    else
                        d(7 downto 4)<=b(7 downto 4)-a(7 downto 4)-1;
                        d(3 downto 0)<=10+b(3 downto 0)-a(3 downto 0);
                    end if;
                end if;
        end if;
    end process;
end architecture;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--------------------------------------------lab4 components--------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FTP_HXILINX_lab4_seven_segment_display is
generic(
    INIT : bit := '1'
    );

  port (
    Q   : out STD_LOGIC := '1';
    C   : in STD_LOGIC;
    PRE : in STD_LOGIC;
    T   : in STD_LOGIC
    );
end FTP_HXILINX_lab4_seven_segment_display;

architecture Behavioral of FTP_HXILINX_lab4_seven_segment_display is
signal q_tmp : std_logic := TO_X01(INIT);
begin

process(C, PRE)
begin
  if (PRE='1') then
    q_tmp <= '1';
  elsif (C'event and C = '1') then
    if(T='1') then
      q_tmp <= not q_tmp;
    end if;
  end if;  
end process;

Q <= q_tmp;

end Behavioral;

----- CELL M16_1E_HXILINX_lab4_seven_segment_display -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity M16_1E_HXILINX_lab4_seven_segment_display is
  
port(
    O    : out std_logic;

    D0   : in std_logic;
    D1   : in std_logic;
    D2   : in std_logic;
    D3   : in std_logic;
    D4   : in std_logic;
    D5   : in std_logic;
    D6   : in std_logic;
    D7   : in std_logic;
    D8   : in std_logic;
    D9   : in std_logic;
    D10  : in std_logic;
    D11  : in std_logic;
    D12  : in std_logic;
    D13  : in std_logic;
    D14  : in std_logic;
    D15  : in std_logic;
    E    : in std_logic;
    S0   : in std_logic;
    S1   : in std_logic;
    S2   : in std_logic;
    S3   : in std_logic
  );
end M16_1E_HXILINX_lab4_seven_segment_display;

architecture M16_1E_HXILINX_lab4_seven_segment_display_V of M16_1E_HXILINX_lab4_seven_segment_display is
begin
  process (D0, D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, D14, D15, E, S0, S1, S2, S3)
  variable sel : std_logic_vector(3 downto 0);
  begin
    sel := S3&S2&S1&S0;
    if( E = '0') then
    O <= '0';
    else
      case sel is
      when "0000" => O <= D0;
      when "0001" => O <= D1;
      when "0010" => O <= D2;
      when "0011" => O <= D3;
      when "0100" => O <= D4;
      when "0101" => O <= D5;
      when "0110" => O <= D6;
      when "0111" => O <= D7;
      when "1000" => O <= D8;
      when "1001" => O <= D9;
      when "1010" => O <= D10;
      when "1011" => O <= D11;
      when "1100" => O <= D12;
      when "1101" => O <= D13;
      when "1110" => O <= D14;
      when "1111" => O <= D15;
      when others => NULL;
      end case;
    end if;
    end process; 
end M16_1E_HXILINX_lab4_seven_segment_display_V;
----- CELL D2_4E_HXILINX_lab4_seven_segment_display -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity D2_4E_HXILINX_lab4_seven_segment_display is
  
port(
    D0  : out std_logic;
    D1  : out std_logic;
    D2  : out std_logic;
    D3  : out std_logic;

    A0  : in std_logic;
    A1  : in std_logic;
    E   : in std_logic
  );
end D2_4E_HXILINX_lab4_seven_segment_display;

architecture D2_4E_HXILINX_lab4_seven_segment_display_V of D2_4E_HXILINX_lab4_seven_segment_display is
  signal d_tmp : std_logic_vector(3 downto 0);
begin
  process (A0, A1, E)
  variable sel   : std_logic_vector(1 downto 0);
  begin
    sel := A1&A0;
    if( E = '0') then
    d_tmp <= "0000";
    else
      case sel is
      when "00" => d_tmp <= "0001";
      when "01" => d_tmp <= "0010";
      when "10" => d_tmp <= "0100";
      when "11" => d_tmp <= "1000";
      when others => NULL;
      end case;
    end if;
  end process; 

    D3 <= d_tmp(3);
    D2 <= d_tmp(2);
    D1 <= d_tmp(1);
    D0 <= d_tmp(0);

end D2_4E_HXILINX_lab4_seven_segment_display_V;
----- CELL M2_1_HXILINX_lab4_seven_segment_display -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity M2_1_HXILINX_lab4_seven_segment_display is
  
port(
    O   : out std_logic;

    D0  : in std_logic;
    D1  : in std_logic;
    S0  : in std_logic
  );
end M2_1_HXILINX_lab4_seven_segment_display;

architecture M2_1_HXILINX_lab4_seven_segment_display_V of M2_1_HXILINX_lab4_seven_segment_display is
begin
  process (D0, D1, S0)
  begin
    case S0 is
    when '0' => O <= D0;
    when '1' => O <= D1;
    when others => NULL;
    end case;
    end process; 
end M2_1_HXILINX_lab4_seven_segment_display_V;

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity My_newcounter_MUSER_lab4_seven_segment_display is
   port ( clk   : in    std_logic; 
          anode : out   std_logic_vector (3 downto 0));
end My_newcounter_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of My_newcounter_MUSER_lab4_seven_segment_display is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_10               : std_logic;
   signal XLXN_15               : std_logic;
   signal XLXN_17               : std_logic;
   signal XLXN_18               : std_logic;
   signal XLXN_19               : std_logic;
   signal XLXN_21               : std_logic;
   signal XLXN_39               : std_logic;
   signal XLXN_43               : std_logic;
   signal XLXI_1_PRE_openSignal : std_logic;
   signal XLXI_2_PRE_openSignal : std_logic;
   component FTP_HXILINX_lab4_seven_segment_display
      port ( C   : in    std_logic; 
             PRE : in    std_logic; 
             T   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component D2_4E_HXILINX_lab4_seven_segment_display
      port ( A0 : in    std_logic; 
             A1 : in    std_logic; 
             E  : in    std_logic; 
             D0 : out   std_logic; 
             D1 : out   std_logic; 
             D2 : out   std_logic; 
             D3 : out   std_logic);
   end component;
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_1 : label is "XLXI_1_0";
   attribute HU_SET of XLXI_2 : label is "XLXI_2_1";
   attribute HU_SET of XLXI_4 : label is "XLXI_4_2";
begin
   XLXI_1 : FTP_HXILINX_lab4_seven_segment_display
      port map (C=>clk,
                PRE=>XLXI_1_PRE_openSignal,
                T=>XLXN_10,
                Q=>XLXN_39);
   
   XLXI_2 : FTP_HXILINX_lab4_seven_segment_display
      port map (C=>clk,
                PRE=>XLXI_2_PRE_openSignal,
                T=>XLXN_39,
                Q=>XLXN_43);
   
   XLXI_3 : VCC
      port map (P=>XLXN_10);
   
   XLXI_4 : D2_4E_HXILINX_lab4_seven_segment_display
      port map (A0=>XLXN_39,
                A1=>XLXN_43,
                E=>XLXN_15,
                D0=>XLXN_17,
                D1=>XLXN_18,
                D2=>XLXN_19,
                D3=>XLXN_21);
   
   XLXI_5 : VCC
      port map (P=>XLXN_15);
   
   XLXI_6 : INV
      port map (I=>XLXN_17,
                O=>anode(3));
   
   XLXI_7 : INV
      port map (I=>XLXN_18,
                O=>anode(2));
   
   XLXI_8 : INV
      port map (I=>XLXN_19,
                O=>anode(1));
   
   XLXI_9 : INV
      port map (I=>XLXN_21,
                O=>anode(0));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity freqdiv_MUSER_lab4_seven_segment_display is
   port ( clk  : in    std_logic; 
          outt : out   std_logic);
end freqdiv_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of freqdiv_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_2     : std_logic;
   signal XLXN_4     : std_logic;
   signal XLXN_5     : std_logic;
   signal XLXN_6     : std_logic;
   signal XLXN_12    : std_logic;
   signal XLXN_13    : std_logic;
   signal XLXN_14    : std_logic;
   signal outt_DUMMY : std_logic;
   component FD
      generic( INIT : bit :=  '0');
      port ( C : in    std_logic; 
             D : in    std_logic; 
             Q : out   std_logic);
   end component;
   attribute BOX_TYPE of FD : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
begin
   outt <= outt_DUMMY;
   XLXI_1 : FD
      port map (C=>clk,
                D=>XLXN_2,
                Q=>XLXN_4);
   
   XLXI_3 : INV
      port map (I=>XLXN_4,
                O=>XLXN_2);
   
   XLXI_4 : FD
      port map (C=>XLXN_6,
                D=>XLXN_12,
                Q=>outt_DUMMY);
   
   XLXI_5 : FD
      port map (C=>XLXN_4,
                D=>XLXN_14,
                Q=>XLXN_5);
   
   XLXI_6 : FD
      port map (C=>XLXN_5,
                D=>XLXN_13,
                Q=>XLXN_6);
   
   XLXI_9 : INV
      port map (I=>XLXN_5,
                O=>XLXN_14);
   
   XLXI_10 : INV
      port map (I=>XLXN_6,
                O=>XLXN_13);
   
   XLXI_12 : INV
      port map (I=>outt_DUMMY,
                O=>XLXN_12);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity clock_MUSER_lab4_seven_segment_display is
   port ( clk        : in    std_logic; 
          pushbotton : in    std_logic; 
          anode      : out   std_logic_vector (3 downto 0);
           clock      : out   std_logic);
         
end clock_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of clock_MUSER_lab4_seven_segment_display is
   attribute HU_SET     : string ;
   signal XLXN_48    : std_logic;
   signal XLXN_83    : std_logic;
   signal XLXN_84    : std_logic;
   signal XLXN_85    : std_logic;
   signal XLXN_86    : std_logic;
   signal XLXN_87    : std_logic;
   component M2_1_HXILINX_lab4_seven_segment_display
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component freqdiv_MUSER_lab4_seven_segment_display
      port ( clk  : in    std_logic; 
             outt : out   std_logic);
   end component;
   
   component My_newcounter_MUSER_lab4_seven_segment_display
      port ( anode : out   std_logic_vector (3 downto 0); 
             clk   : in    std_logic);
   end component;
   
   attribute HU_SET of XLXI_9 : label is "XLXI_9_3";
begin
   XLXI_9 : M2_1_HXILINX_lab4_seven_segment_display
      port map (D0=>XLXN_87,
                D1=>clk,
                S0=>pushbotton,
                O=>XLXN_48);
   
   XLXI_45 : freqdiv_MUSER_lab4_seven_segment_display
      port map (clk=>clk,
                outt=>XLXN_83);
   
   XLXI_46 : freqdiv_MUSER_lab4_seven_segment_display
      port map (clk=>XLXN_83,
                outt=>XLXN_84);
   
   XLXI_47 : freqdiv_MUSER_lab4_seven_segment_display
      port map (clk=>XLXN_84,
                outt=>XLXN_85);
   
   XLXI_48 : freqdiv_MUSER_lab4_seven_segment_display
      port map (clk=>XLXN_85,
                outt=>XLXN_86);
   
   XLXI_49 : freqdiv_MUSER_lab4_seven_segment_display
      port map (clk=>XLXN_86,
                outt=>XLXN_87);
        process(XLXN_87)
        begin
        clock<=XLXN_87;
        end process;
   
   XLXI_61 : My_newcounter_MUSER_lab4_seven_segment_display
      port map (clk=>XLXN_48,
                anode(3 downto 0)=>anode(3 downto 0));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity binary_to_hexa_MUSER_lab4_seven_segment_display is
   port ( inn     : in    std_logic_vector (3 downto 0); 
          cathode : out   std_logic_vector (6 downto 0); 
          ground  : inout std_logic; 
          highk   : inout std_logic);
end binary_to_hexa_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of binary_to_hexa_MUSER_lab4_seven_segment_display is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_10 : std_logic;
   signal XLXN_17 : std_logic;
   signal XLXN_44 : std_logic;
   signal XLXN_45 : std_logic;
   signal XLXN_52 : std_logic;
   component M16_1E_HXILINX_lab4_seven_segment_display
      port ( D0  : in    std_logic; 
             D1  : in    std_logic; 
             D10 : in    std_logic; 
             D11 : in    std_logic; 
             D12 : in    std_logic; 
             D13 : in    std_logic; 
             D14 : in    std_logic; 
             D15 : in    std_logic; 
             D2  : in    std_logic; 
             D3  : in    std_logic; 
             D4  : in    std_logic; 
             D5  : in    std_logic; 
             D6  : in    std_logic; 
             D7  : in    std_logic; 
             D8  : in    std_logic; 
             D9  : in    std_logic; 
             E   : in    std_logic; 
             S0  : in    std_logic; 
             S1  : in    std_logic; 
             S2  : in    std_logic; 
             S3  : in    std_logic; 
             O   : out   std_logic);
   end component;
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_2 : label is "XLXI_2_4";
   attribute HU_SET of XLXI_3 : label is "XLXI_3_5";
   attribute HU_SET of XLXI_4 : label is "XLXI_4_6";
   attribute HU_SET of XLXI_5 : label is "XLXI_5_7";
   attribute HU_SET of XLXI_6 : label is "XLXI_6_8";
   attribute HU_SET of XLXI_7 : label is "XLXI_7_9";
   attribute HU_SET of XLXI_8 : label is "XLXI_8_10";
begin
   XLXI_2 : M16_1E_HXILINX_lab4_seven_segment_display
      port map (D0=>highk,
                D1=>highk,
                D2=>ground,
                D3=>ground,
                D4=>ground,
                D5=>ground,
                D6=>ground,
                D7=>highk,
                D8=>ground,
                D9=>ground,
                D10=>ground,
                D11=>ground,
                D12=>highk,
                D13=>ground,
                D14=>ground,
                D15=>ground,
                E=>XLXN_10,
                S0=>inn(0),
                S1=>inn(1),
                S2=>inn(2),
                S3=>inn(3),
                O=>cathode(6));
   
   XLXI_3 : M16_1E_HXILINX_lab4_seven_segment_display
      port map (D0=>ground,
                D1=>highk,
                D2=>highk,
                D3=>highk,
                D4=>ground,
                D5=>ground,
                D6=>ground,
                D7=>highk,
                D8=>ground,
                D9=>ground,
                D10=>ground,
                D11=>ground,
                D12=>ground,
                D13=>highk,
                D14=>ground,
                D15=>ground,
                E=>highk,
                S0=>inn(0),
                S1=>inn(1),
                S2=>inn(2),
                S3=>inn(3),
                O=>cathode(5));
   
   XLXI_4 : M16_1E_HXILINX_lab4_seven_segment_display
      port map (D0=>ground,
                D1=>highk,
                D2=>ground,
                D3=>highk,
                D4=>highk,
                D5=>highk,
                D6=>ground,
                D7=>highk,
                D8=>ground,
                D9=>highk,
                D10=>ground,
                D11=>ground,
                D12=>ground,
                D13=>ground,
                D14=>ground,
                D15=>ground,
                E=>highk,
                S0=>inn(0),
                S1=>inn(1),
                S2=>inn(2),
                S3=>inn(3),
                O=>cathode(4));
   
   XLXI_5 : M16_1E_HXILINX_lab4_seven_segment_display
      port map (D0=>ground,
                D1=>highk,
                D2=>ground,
                D3=>ground,
                D4=>highk,
                D5=>ground,
                D6=>ground,
                D7=>highk,
                D8=>ground,
                D9=>ground,
                D10=>highk,
                D11=>ground,
                D12=>ground,
                D13=>ground,
                D14=>ground,
                D15=>highk,
                E=>XLXN_52,
                S0=>inn(0),
                S1=>inn(1),
                S2=>inn(2),
                S3=>inn(3),
                O=>cathode(3));
   
   XLXI_6 : M16_1E_HXILINX_lab4_seven_segment_display
      port map (D0=>ground,
                D1=>ground,
                D2=>highk,
                D3=>ground,
                D4=>ground,
                D5=>ground,
                D6=>ground,
                D7=>ground,
                D8=>ground,
                D9=>ground,
                D10=>ground,
                D11=>ground,
                D12=>highk,
                D13=>ground,
                D14=>highk,
                D15=>highk,
                E=>XLXN_17,
                S0=>inn(0),
                S1=>inn(1),
                S2=>inn(2),
                S3=>inn(3),
                O=>cathode(2));
   
   XLXI_7 : M16_1E_HXILINX_lab4_seven_segment_display
      port map (D0=>ground,
                D1=>ground,
                D2=>ground,
                D3=>ground,
                D4=>ground,
                D5=>highk,
                D6=>highk,
                D7=>ground,
                D8=>ground,
                D9=>ground,
                D10=>ground,
                D11=>highk,
                D12=>highk,
                D13=>ground,
                D14=>highk,
                D15=>highk,
                E=>XLXN_44,
                S0=>inn(0),
                S1=>inn(1),
                S2=>inn(2),
                S3=>inn(3),
                O=>cathode(1));
   
   XLXI_8 : M16_1E_HXILINX_lab4_seven_segment_display
      port map (D0=>ground,
                D1=>highk,
                D2=>ground,
                D3=>ground,
                D4=>highk,
                D5=>ground,
                D6=>ground,
                D7=>ground,
                D8=>ground,
                D9=>ground,
                D10=>ground,
                D11=>highk,
                D12=>ground,
                D13=>highk,
                D14=>ground,
                D15=>ground,
                E=>XLXN_45,
                S0=>inn(0),
                S1=>inn(1),
                S2=>inn(2),
                S3=>inn(3),
                O=>cathode(0));
   
   XLXI_14 : VCC
      port map (P=>XLXN_10);
   
   XLXI_15 : VCC
      port map (P=>XLXN_17);
   
   XLXI_16 : VCC
      port map (P=>XLXN_44);
   
   XLXI_17 : VCC
      port map (P=>XLXN_45);
   
   XLXI_19 : VCC
      port map (P=>XLXN_52);
   
   XLXI_20 : VCC
      port map (P=>highk);
   
   XLXI_21 : GND
      port map (G=>ground);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity mux_MUSER_lab4_seven_segment_display is
   port ( anode : in    std_logic_vector (3 downto 0); 
          b     : in    std_logic_vector (15 downto 0); 
          rout  : out   std_logic_vector (3 downto 0); 
          a0    : inout std_logic; 
          a1    : inout std_logic; 
          a2    : inout std_logic; 
          a3    : inout std_logic; 
          bit0  : inout std_logic_vector (3 downto 0); 
          bit1  : inout std_logic_vector (3 downto 0); 
          bit2  : inout std_logic_vector (3 downto 0); 
          bit3  : inout std_logic_vector (3 downto 0));
end mux_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of mux_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component OR4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR4 : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
begin
   XLXI_1 : AND2
      port map (I0=>a0,
                I1=>b(0),
                O=>bit0(0));
   
   XLXI_2 : AND2
      port map (I0=>a0,
                I1=>b(2),
                O=>bit0(2));
   
   XLXI_3 : AND2
      port map (I0=>a0,
                I1=>b(3),
                O=>bit0(3));
   
   XLXI_4 : AND2
      port map (I0=>a1,
                I1=>b(4),
                O=>bit1(0));
   
   XLXI_5 : AND2
      port map (I0=>a1,
                I1=>b(5),
                O=>bit1(1));
   
   XLXI_6 : AND2
      port map (I0=>a1,
                I1=>b(6),
                O=>bit1(2));
   
   XLXI_7 : AND2
      port map (I0=>a1,
                I1=>b(7),
                O=>bit1(3));
   
   XLXI_8 : AND2
      port map (I0=>a2,
                I1=>b(8),
                O=>bit2(0));
   
   XLXI_9 : AND2
      port map (I0=>a2,
                I1=>b(10),
                O=>bit2(2));
   
   XLXI_10 : AND2
      port map (I0=>a0,
                I1=>b(1),
                O=>bit0(1));
   
   XLXI_11 : AND2
      port map (I0=>a3,
                I1=>b(15),
                O=>bit3(3));
   
   XLXI_12 : AND2
      port map (I0=>a3,
                I1=>b(13),
                O=>bit3(1));
   
   XLXI_13 : AND2
      port map (I0=>a3,
                I1=>b(12),
                O=>bit3(0));
   
   XLXI_14 : AND2
      port map (I0=>a2,
                I1=>b(11),
                O=>bit2(3));
   
   XLXI_15 : AND2
      port map (I0=>a3,
                I1=>b(14),
                O=>bit3(2));
   
   XLXI_16 : AND2
      port map (I0=>a2,
                I1=>b(9),
                O=>bit2(1));
   
   XLXI_22 : OR4
      port map (I0=>bit3(0),
                I1=>bit2(0),
                I2=>bit1(0),
                I3=>bit0(0),
                O=>rout(0));
   
   XLXI_23 : OR4
      port map (I0=>bit3(1),
                I1=>bit2(1),
                I2=>bit1(1),
                I3=>bit0(1),
                O=>rout(1));
   
   XLXI_24 : OR4
      port map (I0=>bit3(2),
                I1=>bit2(2),
                I2=>bit1(2),
                I3=>bit0(2),
                O=>rout(2));
   
   XLXI_25 : OR4
      port map (I0=>bit3(3),
                I1=>bit2(3),
                I2=>bit1(3),
                I3=>bit0(3),
                O=>rout(3));
   
   XLXI_26 : INV
      port map (I=>anode(0),
                O=>a0);
   
   XLXI_27 : INV
      port map (I=>anode(1),
                O=>a1);
   
   XLXI_28 : INV
      port map (I=>anode(2),
                O=>a2);
   
   XLXI_29 : INV
      port map (I=>anode(3),
                O=>a3);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity lab4_seven_segment_display is
   port ( b          : in    std_logic_vector (15 downto 0); 
          clk        : in    std_logic; 
          pushbutton : in    std_logic; 
          clock      : out   std_logic;
          anode      : out   std_logic_vector (3 downto 0); 
          cathode    : out   std_logic_vector (6 downto 0));
end lab4_seven_segment_display;

architecture BEHAVIORAL of lab4_seven_segment_display is
   signal XLXN_1      : std_logic_vector (3 downto 0);
   signal anode_DUMMY : std_logic_vector (3 downto 0);
   component mux_MUSER_lab4_seven_segment_display
      port ( a0    : inout std_logic; 
             a1    : inout std_logic; 
             a2    : inout std_logic; 
             a3    : inout std_logic; 
             anode : in    std_logic_vector (3 downto 0); 
             b     : in    std_logic_vector (15 downto 0); 
             bit0  : inout std_logic_vector (3 downto 0); 
             bit1  : inout std_logic_vector (3 downto 0); 
             bit2  : inout std_logic_vector (3 downto 0); 
             bit3  : inout std_logic_vector (3 downto 0); 
             rout  : out   std_logic_vector (3 downto 0));
   end component;
   
   component binary_to_hexa_MUSER_lab4_seven_segment_display
      port ( cathode : out   std_logic_vector (6 downto 0); 
             ground  : inout std_logic; 
             highk   : inout std_logic; 
             inn     : in    std_logic_vector (3 downto 0));
   end component;
   
   component clock_MUSER_lab4_seven_segment_display
      port ( anode      : out   std_logic_vector (3 downto 0); 
             clk        : in    std_logic; 
             pushbotton : in    std_logic);
   end component;
   
begin
   anode(3 downto 0) <= anode_DUMMY(3 downto 0);
   XLXI_1 : mux_MUSER_lab4_seven_segment_display
      port map (anode(3 downto 0)=>anode_DUMMY(3 downto 0),
                b(15 downto 0)=>b(15 downto 0),
                rout(3 downto 0)=>XLXN_1(3 downto 0),
                a0=>open,
                a1=>open,
                a2=>open,
                a3=>open,
                bit0=>open,
                bit1=>open,
                bit2=>open,
                bit3=>open);
   
   XLXI_4 : binary_to_hexa_MUSER_lab4_seven_segment_display
      port map (inn(3 downto 0)=>XLXN_1(3 downto 0),
                cathode(6 downto 0)=>cathode(6 downto 0),
                ground=>open,
                highk=>open);
   
   XLXI_16 : clock_MUSER_lab4_seven_segment_display
      port map (clk=>clk,
                pushbotton=>pushbutton,
                anode(3 downto 0)=>anode_DUMMY(3 downto 0));
   
end BEHAVIORAL;

-------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity D_FF is
	PORT(D,clk: in std_logic;
	     Q: out std_logic);
end entity D_FF;
	 
architecture behavioral of D_FF is
begin
	process(clk)
	begin
	   if clk='1' and clk'EVENT  then
	       Q <= D;
	   end if;
	end process;
end behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity register8 is
 port(a:in std_logic_vector(7 downto 0);
      clk:in std_logic;
      k:out std_logic_vector(7 downto 0));
end entity register8;

architecture reg of register8 is
component D_FF
    PORT(D,clk: in std_logic;
	     Q: out std_logic);
end component;
begin
  D_FF0: D_FF
        port map(D=>a(0),clk=>clk,Q=>k(0));
  D_FF1:D_FF
        port map(D=>a(1),clk=>clk,Q=>k(1));
  D_FF2: D_FF
        port map(D=>a(2),clk=>clk,Q=>k(2));
  D_FF3: D_FF
        port map(D=>a(3),clk=>clk,Q=>k(3));
  D_FF4: D_FF
        port map(D=>a(4),clk=>clk,Q=>k(4));
  D_FF5:D_FF
        port map(D=>a(5),clk=>clk,Q=>k(5));
  D_FF6:D_FF
        port map(D=>a(6),clk=>clk,Q=>k(6));
  D_FF7:D_FF
        port map(D=>a(7),clk=>clk,Q=>k(7));
end architecture reg;
-------------rahul's clock-----
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d2_4 is
    port(t1,t2:in std_logic;
         o:out std_logic_vector(3 downto 0));
end entity;
architecture behavioral of d2_4 is
begin
    process(t1,t2)
    variable s:std_logic_vector(1 downto 0);
    begin
        s:=t1&t2;
        case s is
            when "00" => o <="1110";
            when "01" => o <="1101";
            when "10" => o <="1011";
            when "11" => o <="0111";
            when others => null;
        end case;
    end process;
end architecture;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ftp  is
  port (Q:out STD_LOGIC := '1';
        C:in STD_LOGIC;
        PRE:in STD_LOGIC;
        T:in STD_LOGIC);
end ftp;

architecture behavioral of ftp is
signal q_tmp : std_logic := '1';
begin
    process(C, PRE)
    begin
        if (PRE='1') then
            q_tmp <= '1';
        elsif (C'event and C = '1') then
            if(T='1') then
                q_tmp <= not q_tmp;
            end if;
        end if;  
    end process;
    Q <= q_tmp;
end Behavioral; 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity counter is
    port(clk:in std_logic;
         anode:out std_logic_vector(3 downto 0));
end entity;

architecture behavioral of counter is
component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
signal XLXI_1_PRE_openSignal : std_logic;
signal XLXI_2_PRE_openSignal : std_logic;
signal q1,q2:std_logic;
begin
    f1 : 
    entity WORK.ftp(behavioral)
      port map (C=>clk,
                PRE=>XLXI_1_PRE_openSignal,
                T=>'1',
                Q=>q1);
   
   f2 : 
   entity WORK.ftp(behavioral)
      port map (C=>clk,
                PRE=>XLXI_2_PRE_openSignal,
                T=>q1,
                Q=>q2);
   
   decoder :
   entity WORK.d2_4(behavioral)
      port map (t1=>q1,
                t2=>q2,
                o=>anode);
                
end architecture;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock5 is
    port(clk:in std_logic;
         pushbutton:in std_logic;
         clock: out std_logic);
end entity;

architecture behavioral of clock5 is
    signal counter:integer range 0 to 200000000:=0;
    signal c:std_logic:='0';
begin
    process(clk)
    begin
        if pushbutton='1' then c<=clk;
        else
            if rising_edge(clk) then
                if counter=200000000 then
                    c<=not(c);
                    counter<=0;
                else 
                    counter<=counter+1;
                end if;
            end if;
        end if;
        clock<=c;
    end process;
end architecture behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity display_digit is
    port(a:in std_logic_vector(3 downto 0);
         cathode:out std_logic_vector(6 downto 0));
end entity;

architecture behavioral of display_digit is
begin 
    process(a)
    begin
        case a is
              when "0000" => cathode <= "1000000";
              when "0001" => cathode <= "1111001";
              when "0010" => cathode <= "0100100";
              when "0011" => cathode <= "0110000";
              when "0100" => cathode <= "0011001";
              when "0101" => cathode <= "0010010";
              when "0110" => cathode <= "0000010";
              when "0111" => cathode <= "1111000";
              when "1000" => cathode <= "0000000";
              when "1001" => cathode <= "0010000";
              when "1010" => cathode <= "0001000";
              when "1011" => cathode <= "0000011";
              when "1100" => cathode <= "1000110";
              when "1101" => cathode <= "0100001";
              when "1110" => cathode <= "0000110";
              when "1111" => cathode <= "0001110";
              when others => NULL;
          end case;
     end process;
  
end architecture behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity select_digit is
    port(a,b:in std_logic_vector(7 downto 0);
         ano:in std_logic_vector(3 downto 0);
         o:out std_logic_vector(3 downto 0));
end entity;

architecture behavioral of select_digit is
begin
    process(ano)
    begin
        case ano is
            when "1110" => o <= b(3 downto 0);
            when "1101" => o <= b(7 downto 4);
            when "1011" => o <= a(3 downto 0);
            when "0111" => o <= a(7 downto 4);
            when others =>null;
        end case;
    end process;
end architecture;

------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lns is
    port(valid,push_i:in std_logic;
         a,b:in std_logic_vector(7 downto 0);
         load,sub: out std_logic);
end entity;

architecture behavioral of lns is
begin
process(valid,push_i)
begin
    if valid='1' then
        if a/=b then 
            load<=push_i;
            sub<=not(push_i);
        else
            load<='0';
            sub<='0';
        end if;
    else
        load<='0';
        sub<='0';
    end if;
end process;
end architecture;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lab5_gcd is
    Port ( a_i,b_i: in STD_LOGIC_VECTOR (7 downto 0);
           push_i,pushbutton,clk : in STD_LOGIC;
           load,sub,op_valid: out STD_LOGIC;
           cathode: out STD_LOGIC_VECTOR (6 downto 0);
           k1:out std_logic_vector(7 downto 0);
           k2:out STD_LOGIC_VECTOR(7 downto 0);
           anode: out STD_LOGIC_VECTOR (3 downto 0));
end lab5_gcd;

architecture main of lab5_gcd is
signal clock,v,v1,v2,v3,v4,s: std_logic;
signal l:std_logic;
signal m:std_logic:='0';
signal an_dummy,digit,dummy: std_logic_vector(3 downto 0);
signal s1:std_logic_vector(7 downto 0):="00010000";
signal s2:std_logic_vector(7 downto 0):="00001111";
signal n1,n2,p,q: std_logic_vector(7 downto 0);
signal anode_dummy:std_logic_vector(3 downto 0);
signal k:std_logic;
signal d_reg:std_logic_vector(15 downto 0):="0101001000010011";
signal co,j: std_logic_vector(15 downto 0);
begin

 VALID1:
    entity WORK.VALID(Behavioral)
        port map(a=>b_i(3 downto 0),
                 
                 v=>v1);
 VALID2:
    entity WORK.VALID(Behavioral)
        port map(a=>b_i(7 downto 4),
                 
                 v=>v2);
 VALID3:
    entity WORK.VALID(Behavioral)
        port map(a=>a_i(3 downto 0),
                 
                 v=>v3);
 VALID4:
    entity WORK.VALID(Behavioral)
        port map(a=>a_i(7 downto 4),
                 
                 v=>v4);

 process(a_i,b_i,v1,v2,v3,v4)
 begin
    if(a_i="00000000" or b_i="00000000") then
     v<='0';
    else
       v<=v1 and v2 and v3 and v4;
    end if;
 end process;
 op_valid<=v;
 
 process(push_i,s1,s2)
   begin
    if(v='1')then
     --if(push_i='1') then
     if(a_i=b_i)then
       l<='0';
       s<='0';
      else
       --if() then
       if(m='0') then
         l<=push_i;
         s<=not(push_i);
         m<='1';
       end if;      
     end if;
    else
      l<='0';
      s<='0'; 
    end if;
    
    if(l='1') then
           p<=a_i;
           q<=b_i;
           l<='0';
           s<='1';
    elsif(s='1' )then  
         if(s1/=s2)then
           p<=s1;
           q<=s2;
         else
           p<=s1;
           q<=s2;
           l<='0';
           s<='0';
           m<='0';
         end if;
    end if;
   end process;
   
  
  load<=l;
  sub<=s;
 
 REGISb:
       entity work.register8(reg)
           port map(a=>q,
                    clk=>clk,
                    k=>n2);
 REGISa:
      entity work.register8(reg)
         port map(a=>p,
                   clk=>clk,
                   --l=>l,
                   k=>n1); 
 subt:
      entity work.subtractor(behavioural)
          port map(a=>n1,
                   b=>n2,
                   s=>s,
                   c=>s1,
                   d=>s2);
 k1<=p;
 k2<=q;
 
 Displaying:
    entity work.lab4_seven_segment_display(BEHAVIORAL)
                 port map( b(7 downto 0)=>n2,
                           b(15 downto 8)=>n1, 
                        clk=>clk, 
                        pushbutton=>pushbutton, 
                        anode=>anode, 
                        cathode=>cathode,
                        clock=>clock);
     
   
end architecture;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity tutorial_led_blink is
  port (
    i_clock      : in  std_logic;
    o_led_drive  : out std_logic
    );
end tutorial_led_blink;
 
architecture rtl of tutorial_led_blink is

  -- Constants to create the frequencies needed:
  -- Formula is: (25 MHz / 100 Hz * 50% duty cycle)
  -- So for 100 Hz: 25,000,000 / 100 * 0.5 = 125,000
  constant c_CNT_100HZ : natural := 12000000;

  signal r_CNT_100HZ : natural range 0 to c_CNT_100HZ;

  signal r_TOGGLE_100HZ : std_logic := '0';
   
begin
   
  p_100_HZ : process (i_clock) is
  begin
    if rising_edge(i_clock) then
      if r_CNT_100HZ = c_CNT_100HZ-1 then  -- -1, since counter starts at 0
        r_TOGGLE_100HZ <= not r_TOGGLE_100HZ;
        r_CNT_100HZ    <= 0;
      else
        r_CNT_100HZ <= r_CNT_100HZ + 1;
      end if;
    end if;
  end process p_100_HZ;

  o_led_drive <= r_TOGGLE_100HZ;
 
end rtl;
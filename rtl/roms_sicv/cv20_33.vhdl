library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity cv20_33 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(10 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of cv20_33 is
	type rom is array(0 to  2047) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"16",X"30",X"0E",X"04",X"CD",X"82",X"0A",X"CD",X"A0",X"0A",X"AF",X"32",X"9A",X"20",X"32",X"93",
		X"20",X"C3",X"DC",X"16",X"21",X"84",X"20",X"7E",X"A7",X"CA",X"F2",X"06",X"23",X"7E",X"A7",X"C0",
		X"06",X"01",X"C3",X"F0",X"18",X"21",X"10",X"28",X"11",X"A3",X"1C",X"0E",X"15",X"CD",X"DF",X"08",
		X"3E",X"0A",X"32",X"6C",X"20",X"01",X"BE",X"1D",X"CD",X"63",X"18",X"DA",X"44",X"18",X"CD",X"51",
		X"18",X"C3",X"38",X"18",X"01",X"CF",X"1D",X"CD",X"63",X"18",X"D8",X"CD",X"59",X"18",X"C3",X"47",
		X"18",X"C5",X"06",X"10",X"CD",X"15",X"14",X"C1",X"C9",X"C5",X"3A",X"6C",X"20",X"4F",X"CD",X"82",
		X"0A",X"C1",X"C9",X"0A",X"FE",X"FF",X"37",X"C8",X"6F",X"03",X"0A",X"67",X"03",X"0A",X"5F",X"03",
		X"0A",X"57",X"03",X"A7",X"C9",X"21",X"C2",X"20",X"34",X"23",X"4E",X"CD",X"C1",X"01",X"47",X"3A",
		X"CA",X"20",X"B8",X"CA",X"A2",X"18",X"3A",X"C2",X"20",X"E6",X"04",X"2A",X"CC",X"20",X"C2",X"95",
		X"18",X"11",X"30",X"00",X"19",X"22",X"C7",X"20",X"21",X"C5",X"20",X"CD",X"1D",X"1A",X"EB",X"C3",
		X"F5",X"15",X"3E",X"01",X"32",X"CB",X"20",X"C9",X"21",X"50",X"20",X"11",X"C0",X"1B",X"06",X"10",
		X"CD",X"14",X"1A",X"3E",X"02",X"32",X"80",X"20",X"3E",X"FF",X"32",X"7E",X"20",X"3E",X"04",X"32",
		X"C1",X"20",X"3A",X"55",X"20",X"E6",X"01",X"CA",X"C2",X"18",X"3A",X"55",X"20",X"E6",X"01",X"C2",
		X"CA",X"18",X"21",X"11",X"33",X"3E",X"26",X"CD",X"EB",X"08",X"C3",X"A5",X"0A",X"3A",X"67",X"20",
		X"21",X"E7",X"20",X"0F",X"D0",X"23",X"C9",X"06",X"02",X"3A",X"82",X"20",X"3D",X"C0",X"04",X"C9",
		X"3A",X"94",X"20",X"B0",X"32",X"94",X"20",X"D3",X"03",X"C9",X"21",X"E7",X"20",X"3A",X"67",X"20",
		X"0F",X"D8",X"23",X"C9",X"0E",X"1C",X"21",X"1E",X"24",X"11",X"E4",X"1A",X"C3",X"DF",X"08",X"21",
		X"F8",X"20",X"C3",X"18",X"19",X"21",X"FC",X"20",X"5E",X"23",X"56",X"23",X"7E",X"23",X"66",X"6F",
		X"C3",X"72",X"09",X"0E",X"07",X"21",X"01",X"35",X"11",X"A9",X"1F",X"C3",X"DF",X"08",X"3A",X"EB",
		X"20",X"21",X"01",X"3C",X"C3",X"A1",X"09",X"21",X"F4",X"20",X"C3",X"18",X"19",X"CD",X"42",X"1A",
		X"CD",X"04",X"19",X"CD",X"0F",X"19",X"CD",X"15",X"19",X"CD",X"37",X"19",X"CD",X"23",X"19",X"C3",
		X"2E",X"19",X"CD",X"BE",X"19",X"C3",X"84",X"16",X"3E",X"01",X"32",X"6D",X"20",X"C3",X"F9",X"16",
		X"CD",X"BA",X"19",X"CD",X"2E",X"19",X"C3",X"23",X"19",X"32",X"C1",X"20",X"C3",X"72",X"19",X"CD",
		X"C5",X"09",X"21",X"03",X"28",X"11",X"A1",X"19",X"0E",X"13",X"C3",X"DF",X"08",X"3A",X"1E",X"20",
		X"A7",X"C2",X"8F",X"19",X"DB",X"01",X"E6",X"76",X"D6",X"72",X"C0",X"3C",X"32",X"1E",X"20",X"DB",
		X"01",X"E6",X"76",X"FE",X"34",X"C0",X"21",X"1B",X"2E",X"11",X"F6",X"0B",X"0E",X"09",X"C3",X"DF",
		X"08",X"28",X"13",X"00",X"08",X"13",X"0E",X"26",X"02",X"0E",X"11",X"0F",X"0E",X"11",X"00",X"13",
		X"08",X"0E",X"0D",X"28",X"3E",X"01",X"32",X"E9",X"20",X"C9",X"AF",X"C3",X"B6",X"19",X"3A",X"94",
		X"20",X"A0",X"32",X"94",X"20",X"D3",X"03",X"C9",X"21",X"01",X"27",X"CA",X"DC",X"19",X"11",X"60",
		X"1C",X"06",X"10",X"4F",X"CD",X"15",X"14",X"79",X"3D",X"C2",X"CE",X"19",X"06",X"10",X"CD",X"84",
		X"14",X"7C",X"FE",X"35",X"C2",X"DC",X"19",X"C9",X"21",X"72",X"20",X"46",X"1A",X"E6",X"80",X"A8",
		X"C0",X"37",X"C9",X"32",X"2B",X"24",X"1C",X"16",X"11",X"0D",X"0A",X"08",X"07",X"06",X"05",X"04",
		X"03",X"02",X"01",X"34",X"2E",X"27",X"22",X"1C",X"18",X"15",X"13",X"10",X"0E",X"0D",X"0C",X"0B",
		X"09",X"07",X"05",X"FF",X"1A",X"77",X"23",X"13",X"05",X"C2",X"14",X"1A",X"C9",X"5E",X"23",X"56",
		X"23",X"7E",X"23",X"4E",X"23",X"46",X"61",X"6F",X"C9",X"7D",X"E6",X"07",X"4F",X"C5",X"06",X"03",
		X"7C",X"1F",X"67",X"7D",X"1F",X"6F",X"05",X"C2",X"30",X"1A",X"7C",X"E6",X"3F",X"F6",X"20",X"67",
		X"C1",X"C9",X"21",X"00",X"24",X"36",X"00",X"23",X"7C",X"FE",X"40",X"C2",X"45",X"1A",X"C9",X"C5",
		X"E5",X"1A",X"B6",X"77",X"13",X"23",X"0D",X"C2",X"51",X"1A",X"E1",X"01",X"20",X"00",X"09",X"C1",
		X"05",X"C2",X"4F",X"1A",X"C9",X"CD",X"1A",X"09",X"A7",X"C8",X"F5",X"3D",X"77",X"CD",X"C8",X"19",
		X"F1",X"21",X"01",X"25",X"E6",X"0F",X"C3",X"B4",X"09",X"50",X"D2",X"CF",X"44",X"C3",X"D4",X"C5",
		X"44",X"A0",X"42",X"59",X"A0",X"22",X"48",X"C5",X"D8",X"41",X"A0",X"44",X"41",X"D4",X"41",X"22",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"00",X"00",X"FF",X"B8",X"FE",X"20",X"1C",X"10",X"9E",X"00",X"20",
		X"1C",X"30",X"10",X"0B",X"08",X"07",X"06",X"00",X"0C",X"04",X"26",X"0E",X"15",X"04",X"11",X"26",
		X"26",X"0F",X"0B",X"00",X"18",X"04",X"11",X"24",X"26",X"25",X"1B",X"26",X"0E",X"11",X"26",X"1C",
		X"0F",X"0B",X"00",X"18",X"04",X"11",X"12",X"26",X"01",X"14",X"13",X"13",X"0E",X"0D",X"26",X"0E",
		X"0D",X"0B",X"18",X"26",X"1B",X"0F",X"0B",X"00",X"18",X"04",X"11",X"26",X"26",X"01",X"14",X"13",
		X"13",X"0E",X"0D",X"26",X"26",X"12",X"02",X"0E",X"11",X"04",X"24",X"1B",X"25",X"26",X"07",X"08",
		X"3F",X"12",X"02",X"0E",X"11",X"04",X"26",X"12",X"02",X"0E",X"11",X"04",X"24",X"1C",X"25",X"26",
		X"01",X"00",X"00",X"10",X"00",X"00",X"00",X"00",X"02",X"78",X"38",X"78",X"38",X"00",X"F8",X"00",
		X"00",X"80",X"00",X"76",X"02",X"FF",X"05",X"0C",X"60",X"1C",X"20",X"30",X"10",X"01",X"00",X"00",
		X"00",X"00",X"00",X"AB",X"03",X"00",X"10",X"90",X"1C",X"28",X"30",X"01",X"04",X"00",X"FF",X"FF",
		X"00",X"00",X"02",X"66",X"04",X"00",X"00",X"00",X"00",X"00",X"04",X"EE",X"1C",X"00",X"00",X"03",
		X"00",X"00",X"00",X"A6",X"04",X"00",X"00",X"01",X"00",X"1D",X"04",X"E2",X"1C",X"00",X"00",X"03",
		X"00",X"00",X"00",X"70",X"06",X"00",X"00",X"01",X"06",X"1D",X"04",X"D0",X"1C",X"00",X"00",X"03",
		X"FF",X"00",X"C0",X"1C",X"00",X"00",X"10",X"21",X"01",X"00",X"30",X"00",X"12",X"00",X"00",X"00",
		X"0F",X"0B",X"00",X"18",X"26",X"0F",X"0B",X"00",X"18",X"04",X"11",X"24",X"1B",X"25",X"FC",X"00",
		X"01",X"FF",X"FF",X"00",X"00",X"00",X"20",X"64",X"1D",X"D0",X"29",X"18",X"02",X"54",X"1D",X"00",
		X"08",X"00",X"06",X"00",X"00",X"01",X"40",X"00",X"01",X"00",X"00",X"10",X"9E",X"00",X"20",X"1C",
		X"00",X"03",X"04",X"78",X"14",X"13",X"08",X"1A",X"3D",X"68",X"FC",X"FC",X"68",X"3D",X"1A",X"00",
		X"00",X"00",X"01",X"B8",X"98",X"A0",X"1B",X"10",X"FF",X"00",X"A0",X"1B",X"00",X"00",X"00",X"00",
		X"00",X"10",X"00",X"FE",X"04",X"00",X"00",X"00",X"00",X"00",X"07",X"D0",X"1C",X"C8",X"9B",X"03",
		X"00",X"00",X"03",X"04",X"78",X"14",X"0B",X"19",X"3A",X"6D",X"FA",X"FA",X"6D",X"3A",X"19",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"00",X"00",X"01",X"74",X"1F",X"00",
		X"80",X"00",X"00",X"00",X"00",X"00",X"1C",X"2F",X"00",X"00",X"1C",X"27",X"00",X"00",X"1C",X"39",
		X"00",X"00",X"39",X"79",X"7A",X"6E",X"EC",X"FA",X"FA",X"EC",X"6E",X"7A",X"79",X"39",X"00",X"00",
		X"00",X"00",X"00",X"78",X"1D",X"BE",X"6C",X"3C",X"3C",X"3C",X"6C",X"BE",X"1D",X"78",X"00",X"00",
		X"00",X"00",X"00",X"00",X"19",X"3A",X"6D",X"FA",X"FA",X"6D",X"3A",X"19",X"00",X"00",X"00",X"00",
		X"00",X"00",X"38",X"7A",X"7F",X"6D",X"EC",X"FA",X"FA",X"EC",X"6D",X"7F",X"7A",X"38",X"00",X"00",
		X"00",X"00",X"00",X"0E",X"18",X"BE",X"6D",X"3D",X"3C",X"3D",X"6D",X"BE",X"18",X"0E",X"00",X"00",
		X"00",X"00",X"00",X"00",X"1A",X"3D",X"68",X"FC",X"FC",X"68",X"3D",X"1A",X"00",X"00",X"00",X"00",
		X"00",X"00",X"0F",X"1F",X"1F",X"1F",X"1F",X"7F",X"FF",X"7F",X"1F",X"1F",X"1F",X"1F",X"0F",X"00",
		X"00",X"04",X"01",X"13",X"03",X"07",X"B3",X"0F",X"2F",X"03",X"2F",X"49",X"04",X"03",X"00",X"01",
		X"40",X"08",X"05",X"A3",X"0A",X"03",X"5B",X"0F",X"27",X"27",X"0B",X"4B",X"40",X"84",X"11",X"48",
		X"0F",X"99",X"3C",X"7E",X"3D",X"BC",X"3E",X"7C",X"99",X"27",X"1B",X"1A",X"26",X"0F",X"0E",X"08",
		X"0D",X"13",X"12",X"28",X"12",X"02",X"0E",X"11",X"04",X"26",X"00",X"03",X"15",X"00",X"0D",X"02",
		X"04",X"26",X"13",X"00",X"01",X"0B",X"04",X"28",X"02",X"10",X"20",X"30",X"13",X"08",X"0B",X"13",
		X"00",X"08",X"49",X"22",X"14",X"81",X"42",X"00",X"42",X"81",X"14",X"22",X"49",X"08",X"00",X"00",
		X"44",X"AA",X"10",X"88",X"54",X"22",X"10",X"AA",X"44",X"22",X"54",X"88",X"4A",X"15",X"BE",X"3F",
		X"5E",X"25",X"04",X"FC",X"04",X"10",X"FC",X"10",X"20",X"FC",X"20",X"80",X"FC",X"80",X"00",X"FE",
		X"00",X"24",X"FE",X"12",X"00",X"FE",X"00",X"48",X"FE",X"90",X"0F",X"0B",X"00",X"29",X"00",X"00",
		X"01",X"07",X"01",X"01",X"01",X"04",X"0B",X"01",X"06",X"03",X"01",X"01",X"0B",X"09",X"02",X"08",
		X"02",X"0B",X"04",X"07",X"0A",X"05",X"02",X"05",X"04",X"06",X"07",X"08",X"0A",X"06",X"0A",X"03",
		X"FF",X"0F",X"FF",X"1F",X"FF",X"3F",X"FF",X"7F",X"FF",X"FF",X"FC",X"FF",X"F8",X"FF",X"F0",X"FF",
		X"F0",X"FF",X"F0",X"FF",X"F0",X"FF",X"F0",X"FF",X"F0",X"FF",X"F0",X"FF",X"F8",X"FF",X"FC",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"7F",X"FF",X"3F",X"FF",X"1F",X"FF",X"0F",X"05",X"10",X"15",X"30",
		X"94",X"97",X"9A",X"9D",X"10",X"05",X"05",X"10",X"15",X"10",X"10",X"05",X"30",X"10",X"10",X"10",
		X"05",X"15",X"10",X"05",X"00",X"00",X"00",X"00",X"04",X"0C",X"1E",X"37",X"3E",X"7C",X"74",X"7E",
		X"7E",X"74",X"7C",X"3E",X"37",X"1E",X"0C",X"04",X"00",X"00",X"00",X"00",X"00",X"22",X"00",X"A5",
		X"40",X"08",X"98",X"3D",X"B6",X"3C",X"36",X"1D",X"10",X"48",X"62",X"B6",X"1D",X"98",X"08",X"42",
		X"90",X"08",X"00",X"00",X"26",X"1F",X"1A",X"1B",X"1A",X"1A",X"1B",X"1F",X"1A",X"1D",X"1A",X"1A",
		X"01",X"02",X"03",X"60",X"50",X"48",X"48",X"48",X"40",X"40",X"40",X"0F",X"0B",X"00",X"18",X"12",
		X"0F",X"00",X"02",X"04",X"26",X"26",X"08",X"0D",X"15",X"00",X"03",X"04",X"11",X"12",X"0E",X"2C",
		X"68",X"1D",X"0C",X"2C",X"20",X"1C",X"0A",X"2C",X"40",X"1C",X"08",X"2C",X"00",X"1C",X"FF",X"0E",
		X"2E",X"E0",X"1D",X"0C",X"2E",X"EA",X"1D",X"0A",X"2E",X"F4",X"1D",X"08",X"2E",X"99",X"1C",X"FF",
		X"27",X"38",X"26",X"0C",X"18",X"12",X"13",X"04",X"11",X"18",X"27",X"1D",X"1A",X"26",X"0F",X"0E",
		X"08",X"0D",X"13",X"12",X"27",X"1C",X"1A",X"26",X"0F",X"0E",X"08",X"0D",X"13",X"12",X"00",X"00",
		X"00",X"1F",X"24",X"44",X"24",X"1F",X"00",X"00",X"00",X"7F",X"49",X"49",X"49",X"36",X"00",X"00",
		X"00",X"3E",X"41",X"41",X"41",X"22",X"00",X"00",X"00",X"7F",X"41",X"41",X"41",X"3E",X"00",X"00",
		X"00",X"7F",X"49",X"49",X"49",X"41",X"00",X"00",X"00",X"7F",X"48",X"48",X"48",X"40",X"00",X"00",
		X"00",X"3E",X"41",X"41",X"45",X"47",X"00",X"00",X"00",X"7F",X"08",X"08",X"08",X"7F",X"00",X"00",
		X"00",X"00",X"41",X"7F",X"41",X"00",X"00",X"00",X"00",X"02",X"01",X"01",X"01",X"7E",X"00",X"00",
		X"00",X"7F",X"08",X"14",X"22",X"41",X"00",X"00",X"00",X"7F",X"01",X"01",X"01",X"01",X"00",X"00",
		X"00",X"7F",X"20",X"18",X"20",X"7F",X"00",X"00",X"00",X"7F",X"10",X"08",X"04",X"7F",X"00",X"00",
		X"00",X"3E",X"41",X"41",X"41",X"3E",X"00",X"00",X"00",X"7F",X"48",X"48",X"48",X"30",X"00",X"00",
		X"00",X"3E",X"41",X"45",X"42",X"3D",X"00",X"00",X"00",X"7F",X"48",X"4C",X"4A",X"31",X"00",X"00",
		X"00",X"32",X"49",X"49",X"49",X"26",X"00",X"00",X"00",X"40",X"40",X"7F",X"40",X"40",X"00",X"00",
		X"00",X"7E",X"01",X"01",X"01",X"7E",X"00",X"00",X"00",X"7C",X"02",X"01",X"02",X"7C",X"00",X"00",
		X"00",X"7F",X"02",X"0C",X"02",X"7F",X"00",X"00",X"00",X"63",X"14",X"08",X"14",X"63",X"00",X"00",
		X"00",X"60",X"10",X"0F",X"10",X"60",X"00",X"00",X"00",X"43",X"45",X"49",X"51",X"61",X"00",X"00",
		X"00",X"3E",X"45",X"49",X"51",X"3E",X"00",X"00",X"00",X"00",X"21",X"7F",X"01",X"00",X"00",X"00",
		X"00",X"23",X"45",X"49",X"49",X"31",X"00",X"00",X"00",X"42",X"41",X"49",X"59",X"66",X"00",X"00",
		X"00",X"0C",X"14",X"24",X"7F",X"04",X"00",X"00",X"00",X"72",X"51",X"51",X"51",X"4E",X"00",X"00",
		X"00",X"1E",X"29",X"49",X"49",X"46",X"00",X"00",X"00",X"40",X"47",X"48",X"50",X"60",X"00",X"00",
		X"00",X"36",X"49",X"49",X"49",X"36",X"00",X"00",X"00",X"31",X"49",X"49",X"4A",X"3C",X"00",X"00",
		X"00",X"08",X"14",X"22",X"41",X"00",X"00",X"00",X"00",X"00",X"41",X"22",X"14",X"08",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"14",X"14",X"14",X"14",X"14",X"00",X"00",
		X"00",X"22",X"14",X"7F",X"14",X"22",X"00",X"00",X"00",X"03",X"04",X"78",X"04",X"03",X"00",X"00",
		X"24",X"1B",X"26",X"0E",X"11",X"26",X"1C",X"26",X"0F",X"0B",X"00",X"18",X"04",X"11",X"12",X"25",
		X"26",X"26",X"28",X"1B",X"26",X"0F",X"0B",X"00",X"18",X"04",X"11",X"26",X"26",X"1B",X"26",X"02",
		X"0E",X"08",X"0D",X"26",X"01",X"01",X"00",X"00",X"01",X"00",X"02",X"01",X"00",X"02",X"01",X"00",
		X"60",X"10",X"0F",X"10",X"60",X"30",X"18",X"1A",X"3D",X"68",X"FC",X"FC",X"68",X"3D",X"1A",X"00",
		X"08",X"0D",X"12",X"04",X"11",X"13",X"26",X"26",X"02",X"0E",X"08",X"0D",X"0D",X"2A",X"50",X"1F",
		X"0A",X"2A",X"62",X"1F",X"07",X"2A",X"E1",X"1F",X"FF",X"02",X"11",X"04",X"03",X"08",X"13",X"26",
		X"00",X"60",X"10",X"0F",X"10",X"60",X"38",X"19",X"3A",X"6D",X"FA",X"FA",X"6D",X"3A",X"19",X"00",
		X"00",X"20",X"40",X"4D",X"50",X"20",X"00",X"00",X"00",X"00",X"00",X"FF",X"B8",X"FF",X"80",X"1F",
		X"10",X"99",X"00",X"80",X"1F",X"00",X"00",X"01",X"D0",X"22",X"20",X"1C",X"10",X"94",X"00",X"20",
		X"1C",X"28",X"1C",X"26",X"0F",X"0B",X"00",X"18",X"04",X"11",X"12",X"26",X"1C",X"26",X"02",X"0E",
		X"08",X"0D",X"12",X"0F",X"14",X"12",X"07",X"26",X"00",X"08",X"08",X"08",X"08",X"08",X"00",X"00");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;

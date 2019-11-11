state("Tiki Trials") {
	byte level : "mono.dll", 0x00265110, 0x678, 0x24;
}

startup {
	
	settings.Add("STAGE", true, "Split for every stage");
	settings.Add("CHAPTER", false, "Split for every chapter");
	
}

start {
	if (current.level > old.level) {
		return (old.level == 0);
	}
}

split {
	if (current.level > old.level) {
	
		if (settings["CHAPTER"]) {
		
			switch(old.level) {
			
				case 10:
				case 20:
				case 30:
				case 40:
				case 50:
				case 60:
				case 70:
				case 80:
				case 90:
					return true;
				default:
					break;
			}
		}
		else {
			return settings["STAGE"];
		}
	}
}

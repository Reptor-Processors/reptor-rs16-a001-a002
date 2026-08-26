launch_vivado:
	@echo "Launching Vivado..."
	sh ./script/vivado.sh


clean:
	rm -rf sim/vivado/proj/*
	mkdir -p sim/vivado/proj/logs
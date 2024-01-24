.DEFAULT_GOAL := gen

gen:
	@echo "╠ -------------------------- START -----------------------------"
	@echo "╠ ---------------------- Create files --------------------------"
	fvm flutter packages pub run build_runner build
	fvm flutter pub run easy_localization:generate -S assets/translations -f keys -o app_strings.g.dart
	@echo "╠ -------------------------- FINISH ----------------------------"

gen-force:
	@echo "╠ ------------------------- START ------------------------------"
	@echo "╠ ------------------- Force-Create files -----------------------"
	fvm flutter packages pub run build_runner build --delete-conflicting-outputs
	fvm flutter pub run easy_localization:generate -S assets/translations -f keys -o app_strings.g.dart
	@echo "╠ -------------------------- FINISH ----------------------------"

gen-lang:
	@echo "╠ ------------------------- START ------------------------------"
	@echo "╠ ------------------- Generate strings -------------------------"
	fvm flutter pub run easy_localization:generate -S assets/translations -f keys -o app_strings.g.dart
	@echo "╠ -------------------------- FINISH ----------------------------"

bootstrap:
	@echo "╠ -------------------------- START -----------------------------"
	@echo "╠ ------------------------ Bootstrap ---------------------------"
	sh ./.scripts/bootstrap.sh -fv 3.16.5
	@echo "╠ -------------------------- FINISH ----------------------------"

clean:
	@echo "╠ -------------------------- START -----------------------------"
	@echo "╠ -------------------------- Clean -----------------------------"
	sh ./.scripts/clean.sh
	@echo "╠ -------------------------- FINISH ----------------------------"

deploy:
	@echo "╠ -------------------------- START -----------------------------"
	@echo "╠ ---------------- Deploy $(env): Preparing... -----------------"
	make gen-force
	@echo "╠ ------------------------ Deploy $(env) -----------------------"
	cd .ci && sh ./deploy.sh -s $(env)
	@echo "╠ -------------------------- FINISH ----------------------------"

add-feature:
	@echo "╠ -------------------------- START -----------------------------"
	@echo "╠ --------------------- Add feature $(name)---------------------"
	mason make feature --name $(name) -o ./lib/feature
	make gen
	@echo "╠ -------------------------- FINISH ----------------------------"

add-dto:
	@echo "╠ -------------------------- START -----------------------------"
	@echo "╠ ----------------------- Add dto $(name)-----------------------"
	mason make dto --name $(name) -o ./lib/common/network/dto
	make gen
	@echo "╠ -------------------------- FINISH ----------------------------"

add-api:
	@echo "╠ -------------------------- START -----------------------------"
	@echo "╠ ----------------------- Add api $(name)-----------------------"
	mason make api --name $(name) -o ./lib/common/network/api
	make gen
	@echo "╠ -------------------------- FINISH ----------------------------"
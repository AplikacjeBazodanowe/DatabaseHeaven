<span class="baseFont"><h1>List of articles in the [warehouse_name] warehouse:</h1></span><?php	echo '<form action="?action=unload&done=unload&id=' . $_GET['id'] . '" method="post">';?>	<table class="stuff_info_wider">	<tr>		<td class="stuff_no" colspan="4">			nr ladunku albo cos		</td>	</tr>	<tr>		<td colspan="2">			data zaladunku		</td>		<td style="width: 240px" class="unload_to_label">			Unload to...		</td>		<td style="width: 200px" class="unload_to_label">			Remarks		</td>	</tr>	<tr>		<td class="cargo_name">			nazwa towaru		</td>		<td>			szczegoly towaru		</td>		<td class="unload_to">			<!-- pierwszy argument showTarget to kolejne numery towarow (dla atrybutu name select'a ponizej), a drugi i trzeci Cie w sumie nie interesuje -->			<input id="butt1_0" style="border: 2px solid RGB( 84, 122, 150 )" class="button" type="button" value="Ships" onClick="showTarget( 0, 0, this )">			<input id="butt2_0" class="button" type="button" value="Warehouses" onClick="showTarget( 0, 1, this )">			<input id="butt3_0" class="button" type="button" value="Contractors" onClick="showTarget( 0, 2, this )">			<hr>			<select class="baseFont" name="to0">				<option>Don't unload				<option>statki			</select>			<select class="baseFont" name="to0" style="display: none" disabled="true">				<option>Don't unload				<option>magazyny			</select>			<select class="baseFont" name="to0" style="display: none" disabled="true">				<option>Don't unload				<option>kontrahenci			</select>		</td>		<td>			<textarea name="remarks0" cols="35" rows="3" placeholder="Remarks will be ignored if 'Don't unload' is selected"></textarea>		</td>	</tr>	<tr>		<td class="cargo_name">			nazwa towaru		</td>		<td>			szczegoly towaru		</td>		<td class="unload_to">			<!-- pierwszy argument showTarget to kolejne numery towarow (dla atrybutu name select'a ponizej), a drugi i trzeci Cie w sumie nie interesuje -->			<input id="butt1_1" style="border: 2px solid RGB( 84, 122, 150 )" class="button" type="button" value="Ships" onClick="showTarget( 1, 0, this )">			<input id="butt2_1" class="button" type="button" value="Warehouses" onClick="showTarget( 1, 1, this )">			<input id="butt3_1" class="button" type="button" value="Contractors" onClick="showTarget( 1, 2, this )">			<hr>			<select class="baseFont" name="to1">				<option>Don't unload				<option>statki			</select>			<select class="baseFont" name="to1" style="display: none" disabled="true">				<option>Don't unload				<option>magazyny			</select>			<select class="baseFont" name="to1" style="display: none" disabled="true">				<option>Don't unload				<option>kontrahenci			</select>		</td>		<td>			<textarea name="remarks0" cols="35" rows="3" placeholder="Remarks will be ignored if 'Don't unload' is selected"></textarea>		</td>	</tr>		<tr>		<td class="cargo_name">			nazwa towaru		</td>		<td>			szczegoly towaru		</td>		<td class="unload_to">			Duty control required		</td>		<td>			<textarea name="remarks1" cols="35" rows="3" placeholder="Remarks will be ignored if 'Don't unload' is selected"></textarea>		</td>	</tr>	</table>	<br><input type="submit" class="button baseFont add" value="Unload"></form>
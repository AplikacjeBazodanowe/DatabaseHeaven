<span class="baseFont"><h1>List of articles in the [warehouse_name] warehouse:</h1></span><?php	echo '<form action="?action=unload&done=unload&id=' . $_GET['id'] . '" method="post">';?>	<table class="stuff_info_wider">	<tr>		<td class="stuff_no" colspan="4">			nr ladunku albo cos		</td>	</tr>	<tr>		<td colspan="2">			data zaladunku		</td>		<td style="width: 170px" class="unload_to_label">			Unload to...		</td>		<td style="width: 200px" class="unload_to_label">			Remarks		</td>	</tr>	<tr>		<td class="cargo_name">			nazwa towaru		</td>		<td>			szczegoly towaru		</td>		<td class="unload_to">			<select name="to0">				<option>Don't unload				<option>statki				<option>i				<option>magazyny				<option>i				<option>kontrahenci			</select>		</td>		<td>			<textarea name="remarks0" cols="35" rows="3" placeholder="Remarks will be ignored if 'Don't unload' is selected"></textarea>		</td>	</tr>	<tr>		<td class="cargo_name">			nazwa towaru		</td>		<td>			szczegoly towaru		</td>		<td class="unload_to">			Duty control required		</td>		<td>			<textarea name="remarks1" cols="35" rows="3" placeholder="Remarks will be ignored if 'Don't unload' is selected"></textarea>		</td>	</tr>	</table>	<br><input type="submit" class="button baseFont add" value="Unload"></form>
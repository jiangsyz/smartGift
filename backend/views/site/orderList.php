<table border="8">
	<?php
	foreach($data as $row){
	?>
		<tr>
			<td><?php echo $row['id'];?></td>
			<td><?php echo $row['uniqueId'];?></td>
			<td><?php echo $row['title'];?></td>
			<td><?php echo $row['name'];?></td>
			<td><?php echo $row['phone'];?></td>
			<td><?php echo $row['areaName'];?></td>
			<td><?php echo $row['address'];?></td>
			<td><?php echo $row['dateMemo'];?></td>
			<td><?php echo $row['memo'];?></td>
			<td><?php echo date("Y-m-d",$row['createTime']);?></td>
		</tr>
	<?php
	}
	?>
</table>
<?php 
exit; 
?>
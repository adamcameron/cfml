<table>
	<thead>
	<tr><th>Operator</th><th>Purpose</th><th>Examples/observations</th></tr>
	</thead>
	<tbody>
	<tr>
		<td>-</td>
		<td>Switches the sign of a numeric operand</td>
		<td>
<pre><code>x=1;
y = -x; // -1
x=-1;
y = -x; // 1</code></pre>
</td></tr>
	<tr>
		<td>!</td>
		<td>Performs a boolean inverse on the operation</td>
		<td>
<pre><code>!true // false
!false // true</code></pre>

</td></tr>
	<tr>
		<td>++, --</td>
		<td>Short hand increment / decrement</td>
		<td>These either increment (++) or decrement (--) the operand.<br>Unlike other operators, they can be applied either as a suffix (or to linguistically challenged people: "postfix") (i++) or a prefix (++i).<br>The difference is the prefix version applies the operation and then returns the result; whereas the suffix returns the value then applies the operation. See examples for the difference. If one considers the earlier notion that an expression ought not have side effects, then the suffix versions are less than ideal, in a way, as they return one value, but the operand they act on ends up with a different value.<br>Using the suffix version is so ubiquitous that I'd not worry about this too much<br>
<pre><code>
x = 1;
y = ++x; // y=2, x=2
z = x++; // z=2, x=3
</pre></code>
		</td>
	</tr>
	</tbody>
</table>
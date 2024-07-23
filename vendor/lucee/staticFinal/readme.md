# Repro case for Lucee static final bug

1. Grab the files from this directory, stick them somewhere (doesn't matter where)
2. Run a Lucee container in that directory, eg:

```
docker run \
    --publish 8888:8888 \
    --volume ${PWD}/:/var/www/ \
    --name lucee-static-final-bug \
    --detach \
    lucee/lucee:5.3.10.97-nginx
```
3. Browse to http://localhost:8888/test.cfm. You should see a `<cfdump>` of the C object.
4. Rename `include.cfm` to be anything else, eg: `include2.cfm`. Change the reference to it in `Base.cfc` as well.
5. Reload the page. I am seeing this:
```
Cannot update key [MAORI_NUMBERS] in static scope from component [C], that member is set to final
The Error Occurred in
/var/www/C.cfc: line 5
	3: static {
	4: final static.MAORI_NUMBERS = ["tahi", "rua", "toru", "wha"]
	5: }
	6: }
```
6. Revert to `include.cfm`. Refresh. Problem goes away.

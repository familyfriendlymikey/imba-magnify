import '../../magnify'

tag app
	<self>

		css self
			d:flex fld:column jc:flex-start ai:center gap:100px

		css svg
			w:200px h:auto

		<magnify> <img src='https://placedog.net/640/400'>
		<magnify> <img src='https://placedog.net/640/300'>
		<magnify> <img src='https://placedog.net/640/200'>
		<magnify> <img src='https://placedog.net/640/100'>

		<magnify> <img src='https://placedog.net/400/640'>
		<magnify> <img src='https://placedog.net/300/640'>
		<magnify> <img src='https://placedog.net/200/640'>
		<magnify> <img src='https://placedog.net/100/640'>

imba.mount <app>

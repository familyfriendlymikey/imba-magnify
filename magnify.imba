tag magnify

	get zoomed_in?
		$container.style.transform !== ""

	def mount
		global.window.addEventListener 'resize', zoom_out.bind(this)
		global.window.addEventListener 'scroll', zoom_out.bind(this)

	def zoom_out
		$container.style.transform = ""
		self.style.cursor = "zoom-in"
		imba.commit!

	def zoom_in
		let { x, y, width, height } = $container.getBoundingClientRect!
		let scale_by_height = (global.window.innerWidth/global.window.innerHeight) > (width/height)
		let ds = scale_by_height ? global.window.innerHeight/height : global.window.innerWidth/width
		let dx = global.window.innerWidth/2 - width/2 - x
		let dy = global.window.innerHeight/2 - height/2 - y
		$container.style.transform = "translate({dx}px, {dy}px) scale({ds})"
		self.style.cursor = "zoom-out"

	def handle_click
		if zoomed_in?
			zoom_out!
		else
			zoom_in!

	def render
		<self@click=handle_click>
			css self cursor:zoom-in
			css $container d:inline-block transition:transform 700ms cubic-bezier(.19,1,.22,1)
			css .bg transition:background 700ms
			css .active bg:blue4/50 pos:fixed top:0 left:0 bottom:0 right:0
			<.bg .active=zoomed_in?>
			<$container>
				<slot>

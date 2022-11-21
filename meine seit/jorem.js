latin = ["dictum", "faucibus", "feugiat", "fermentum", "enim", "quisque", "pharetra", "ornare", "egestas", "est", "habitasse", "urna", "suspendisse", "donec", "arcu", "tristique", "cras", "sed", "montes", "massa", "facilisis", "taciti", "nibh", "dignissim", "felis", "integer", "commodo", "quam", "etiam", "lectus", "consectetur", "vitae", "ultrices", "non", "sagittis", "fames", "tempus", "a", "eros", "nec", "aliquam", "cursus", "primis", "curabitur", "odio", "suscipit", "inceptos", "condimentum", "sollicitudin", "gravida", "ut", "adipiscing", "leo", "lacinia", "dis", "tellus", "himenaeos", "rutrum", "eget", "imperdiet", "maecenas", "tempor", "tincidunt", "id", "dictumst", "mus", "facilisi", "velit", "convallis", "scelerisque", "augue", "dapibus", "hac", "dui", "elit", "sem", "ex", "aptent", "nisi", "penatibus", "ante", "maximus", "magna", "nostra", "neque", "ullamcorper", "torquent", "ultricies", "sit", "platea", "vestibulum", "ac", "mattis", "mollis", "natoque", "auctor", "orci", "potenti", "ridiculus", "conubia", "quis", "pretium", "diam", "porttitor", "pulvinar", "duis", "nullam", "morbi", "et", "nisl", "luctus", "amet", "metus", "fusce", "bibendum", "fringilla", "aenean", "lacus", "euismod", "efficitur", "justo", "nascetur", "vel", "sodales", "nam", "risus", "magnis", "class", "nulla", "porta", "posuere", "molestie", "sociosqu", "volutpat", "semper", "netus", "nunc", "proin", "lobortis", "iaculis", "parturient", "senectus", "ligula", "cubilia", "litora", "malesuada", "per", "laoreet", "at", "hendrerit", "vulputate", "venenatis", "finibus", "ad", "purus", "pellentesque", "vivamus", "congue", "dolor", "habitant", "lorem", "consequat", "in", "rhoncus", "libero", "varius", "eu", "erat", "sapien", "tortor", "placerat", "interdum", "eleifend", "mauris", "mi", "vehicula", "blandit", "ipsum", "aliquet", "turpis", "accumsan", "phasellus", "viverra", "praesent", "elementum", "curae"];

function randint(min, max) {
	return Math.floor(Math.random() * (max - min + 1)) + min;
}

function words(n) {
	if (n < 0) return null;
	let arr = [];
	for (let i = 0; i < n; ++i) {
		arr.push(latin[randint(0, latin.length - 1)]);
	}
	return arr;
}
function sentence(min, max) {
	if (min < 0 || max < 0 || min > max) return null;
	const len = this.randint(min, max);
	let sentence = [];
	for (let j = 0; j < len; ++j) {
		sentence.push(latin[randint(0, latin.length - 1)]);
	}
	sentence = sentence.join(" ");
	sentence += ".";
	sentence = sentence.charAt(0).toUpperCase() + sentence.slice(1);
	return sentence;
}
function paragraph(min, max, sentence_min, sentence_max, as_array=false) {
	const len = randint(min, max);
	let paragraph = [];
	for (let i = 0; i < len; ++i) {
		paragraph.push(sentence(sentence_min, sentence_max));
	}
	if (!as_array) paragraph = paragraph.join(" ");
	return paragraph;
}
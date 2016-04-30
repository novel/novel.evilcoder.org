var novel = {
        numposts: 10,

	recentBlogPosts: function(json) {
		for (var i = 0; i < novel.numposts; i++) {
			var post = json.feed.entry[i];
			var postTitle = post.title.$t;
			var tags = '';
			var postLink;
			var j = 0;

			// create command-separated link of tags
			while (j < post.category.length - 1) {
				tags += post.category[j].term + ", ";
				j++;
			}
			tags += post.category[j].term;

			// fetch post link
			for (var k = 0; k < post.link.length; k++) {
				if (post.link[k].rel == 'alternate') {
					postLink = post.link[k].href;
					break;
				}
			}

			$("<li><a href='" + postLink + "'>" + postTitle + "</a> (" + tags + ")</li>").appendTo("#recentblogposts");
		}
	}
};

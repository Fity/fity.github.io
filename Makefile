

new:
	@read -p "Post Slug: " slug; hugo new posts/$${slug}.md; code content/posts/$${slug}.md
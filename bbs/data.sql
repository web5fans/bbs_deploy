-- Auto-generated SQL script
UPDATE public."section"
	SET description='Web5 技术是什么，可以详细和我说说吗？Web5 技术是什么，可以详细和我说说吗？Web5 技术是什么，可以详细和我说说吗？Web5 技术是什么，可以详细和我说说吗？Web5 技术是什么，可以详细和我说说吗？Web5 技术是什么，可以详细和我说说吗？Web5 技术是什么，可以详细和我说说吗？Web5 技术是什么，可以详细和我说说吗？
Web5 技术是什么，可以详细和我说说吗？Web5 技术是什么，可以详细和我说说吗？Web5 技术是什么，可以详细和我说说吗？Web5 技术是什么，可以详细和我说说吗？Web5 技术是什么，可以详细和我说说吗？Web5 技术是什么，可以详细和我说说吗？Web5 技术是什么，可以详细和我说说吗？Web5 技术是什么，可以详细和我说说吗？Web5 技术是什么，可以详细和我说说吗？可以详细和我说说吗？可以详细和我说说吗？'
	WHERE id=1;
UPDATE public."section"
	SET description='CKB RFC 讨论 '
	WHERE id=2;
UPDATE public."reply"
	SET section_id=1
	WHERE section_id IS NULL;
UPDATE public."post"
	SET visited=current_timestamp()
	WHERE visited IS NULL;
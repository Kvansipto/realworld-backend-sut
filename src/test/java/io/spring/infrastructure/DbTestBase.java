package io.spring.infrastructure;

import org.springframework.test.context.ActiveProfiles;

@ActiveProfiles("test")
public abstract class DbTestBase extends AbstractPostgresContainerTest {}

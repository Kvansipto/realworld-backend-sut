package io.spring;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Disabled("Not compatible with Testcontainers setup")
public class RealworldApplicationTests {

  @Test
  public void contextLoads() {}
}

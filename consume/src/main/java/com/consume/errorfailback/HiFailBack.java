package com.consume.errorfailback;

import com.consume.feignInterface.SchedualServiceHi;
import org.springframework.stereotype.Component;

@Component
public class HiFailBack implements SchedualServiceHi {
    @Override
    public String sayHi(String name) {
        return "测试啊啊啊啊";
    }
}

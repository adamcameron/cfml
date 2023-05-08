component{
    private numeric function f_private(){
        return 12345;
    }

    public struct function f_public(){
        local['s_test']={
            'v_test':f_private()+9876
        };
        return local['s_test'];
    }
}

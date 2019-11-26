package model;

import exceptions.ContaInvalida;
import exceptions.SaldoInsuficiente;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class Banco implements IBank {
    private static int nids = 0;
    private Map<Integer, Conta> contas;
    private Lock lockBanco;

    public Banco() {
        this.contas = new HashMap<>();
        this.lockBanco = new ReentrantLock();
    }

    @Override
    public double consultar(int id) throws ContaInvalida {
        this.lockBanco.lock();
        if (contas.containsKey(id)) {
            Conta c = this.contas.get(id);
            c.lock();
            double saldo = c.consultar();
            c.unlock();
            this.lockBanco.unlock();
            return saldo;
        } else {
            this.lockBanco.unlock();
            throw new ContaInvalida(id);
        }
    }

    @Override
    public void levantar(int id, double valor) throws ContaInvalida {
        this.lockBanco.lock();
        if (contas.containsKey(id)) {
            Conta c = this.contas.get(id);
            c.lock();
            c.levantar(valor);
            this.contas.remove(id);
            c.unlock();
            this.lockBanco.unlock();
        } else {
            this.lockBanco.unlock();
            throw new ContaInvalida(id);
        }
    }

    @Override
    public int criarConta(double saldo) {
        this.lockBanco.lock();
        int id = ++Banco.nids;
        this.contas.put(id, new Conta(id, saldo));
        this.lockBanco.unlock();

        return id;
    }

    @Override
    public double fecharConta(int id) throws ContaInvalida {
        this.lockBanco.lock();
        if (contas.containsKey(id)) {
            Conta c = this.contas.get(id);
            c.lock();
            double saldo = c.consultar();
            this.contas.remove(id);
            c.unlock();
            this.lockBanco.unlock();
            return saldo;
        } else {
            this.lockBanco.unlock();
            throw new ContaInvalida(id);
        }
    }

    @Override
    public double consultarTotal(int[] contasInput) {
        double saldoTotal = 0;
        List<Integer> contasLocked = new ArrayList(contasInput.length);
        this.lockBanco.lock();
        for (int i = 0; i < contasInput.length; i++) {
            int id = contasInput[i];
            if (contas.containsKey(id)) {
                this.contas.get(id).lock();
                contasLocked.add(id);
            }
        }
        this.lockBanco.unlock();
        for (int id : contasLocked) {
            saldoTotal += contas.get(id).consultar();
            contas.get(id).unlock();
        }
        return saldoTotal;
    }

    @Override
    public void depositar(int id, double valor) throws ContaInvalida {
        this.lockBanco.lock();
        if (contas.containsKey(id)) {
            Conta c = this.contas.get(id);
            c.lock();
            c.depositar(valor);
            this.contas.remove(id);
            c.unlock();
            this.lockBanco.unlock();
        } else {
            this.lockBanco.unlock();
            throw new ContaInvalida(id);
        }
    }

    @Override
    public void transferir(int conta_origem, int conta_destino, double valor) throws SaldoInsuficiente, ContaInvalida {
        this.lockBanco.lock();

        if (!this.contas.containsKey(conta_origem)) {
            this.lockBanco.unlock();
            throw new ContaInvalida(conta_origem);
        }
        if (!this.contas.containsKey(conta_destino)) {
            this.lockBanco.unlock();
            throw new ContaInvalida(conta_destino);
        }

        Conta c_origem = this.contas.get(conta_origem);
        Conta c_destino = this.contas.get(conta_destino);

        c_origem.lock();
        c_destino.lock();
        this.lockBanco.unlock();

        c_origem.levantar(valor);
        c_destino.depositar(valor);

        c_origem.unlock();
        c_destino.unlock();
    }

    @Override
    public List<Movimento> movimentos(int id) throws ContaInvalida {
        return null;
    }
}


